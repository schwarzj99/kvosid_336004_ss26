# KV Open Source IC Design (336.004)
# JKU IIC
#
# Description: Read and write SPICE parameter files ('.param NAME=VALUE' lines).
#              Shared by python/filter_design.py (writes the passives) and the
#              sizing notebooks (read them, write device sizes).

import re
from pathlib import Path

# Descending, so the first scale not larger than |x| is picked when writing.
# SPICE reads 'M' as milli, so mega is written as 'Meg'.
SPICE_SUFFIXES = [(1e12, 'T'), (1e9, 'G'), (1e6, 'Meg'), (1e3, 'k'), (1, ''),
                  (1e-3, 'm'), (1e-6, 'u'), (1e-9, 'n'), (1e-12, 'p'), (1e-15, 'f')]

SPICE_SCALE = {'t': 1e12, 'g': 1e9, 'meg': 1e6, 'k': 1e3, 'm': 1e-3,
               'u': 1e-6, 'n': 1e-9, 'p': 1e-12, 'f': 1e-15}


def spice_value(x, decimals=4):
    """ Format a number with a SPICE scale suffix, e.g. 10714.4 -> '10.7144k' """
    if x == 0:
        return '0'
    for scale, suffix in SPICE_SUFFIXES:
        if abs(x) >= scale:
            break
    num = ('%.*f' % (decimals, x / scale)).rstrip('0').rstrip('.')
    return num + suffix


def parse_spice_value(s):
    """ Parse a SPICE number, e.g. '10.7144k' -> 10714.4, '1.5Meg' -> 1.5e6.
        Case-insensitive like SPICE, trailing units are ignored ('2pF', '10kOhm').
    """
    m = re.fullmatch(r'([-+]?[\d.]+(?:e[-+]?\d+)?)(meg|[tgkmunpf])?[a-z]*', s.strip().lower())
    if m is None:
        raise ValueError("Not a SPICE number: %r" % s)
    return float(m.group(1)) * SPICE_SCALE.get(m.group(2), 1.0)


def write_spice_params(params, path):
    """ Write a dict {name: value} as '.param NAME=VALUE' lines, keeping the dict order """
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    lines = ['.param %s=%s' % (name, spice_value(value)) for name, value in params.items()]
    path.write_text('\n'.join(lines) + '\n')
    print("Wrote %d parameters to %s" % (len(lines), path))


def read_spice_params(path):
    """ Read '.param NAME=VALUE' lines into a dict {name: float}, other lines are skipped """
    params = {}
    for line in Path(path).read_text().splitlines():
        m = re.match(r'\s*\.param\s+(\w+)\s*=\s*(\S+)', line, re.IGNORECASE)
        if m:
            params[m.group(1)] = parse_spice_value(m.group(2))
    return params
