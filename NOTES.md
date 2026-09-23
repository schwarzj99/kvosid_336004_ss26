# Notizen

## Offen

- [ ] **Chipify-Issue upstream anlegen** (Jinja-Fallstrick unten). Kern: Chipify rendert die ganze Netzliste statt nur des Testbench-Codes, deshalb scheitern DUTs mit `{{...}}` in Parameterausdrücken, obwohl die für ngspice gültig sind. Mögliche Lösungen: nur die Top-Level-Blöcke rendern, oder die Subcircuit-Teile in `{% raw %}` einschließen. Minimalbeispiel: `ota_fd_2pole.sch` mit `\{\{RO\}/2\}` vor dem Fix. Erst Issue, dann eventuell PR.

## Chipify

- Chipify rendert die gesamte Netzliste durch Jinja2, auch die expandierten Subcircuits des DUT. Ein `{{` irgendwo in einem DUT-Schaltplan (z. B. `{{RO}/2}` in `ota_fd_2pole.sch`) bricht jeden Lauf mit `TEMPLATE_RENDER_ERROR: unexpected '}'` ab. Parameterausdrücke deshalb einfach klammern (`{RO/2}`), das ist für ngspice gleichwertig.
