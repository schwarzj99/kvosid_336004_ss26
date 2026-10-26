# Notizen

## Offen

- [ ] **THD-Spec klären (Frage ins Moodle):** gefordert sind ≤ −60 dBc bei Vfs, aber ohne Testfrequenz. Offen: Grundton f0, Bezug der Amplitude (Vfs = 1 Vpp differentiell am Ausgang?), welche Harmonischen zählen. Liegt f0 nahe fpass, fallen die Harmonischen schon ins Übergangsband; dann muss die Spec sagen, ob sie mitzählen. f0 bestimmt außerdem die Schleifenverstärkung, die die Verzerrung drückt (T ≈ GBW/(f0·NG)). Zweite Frage: Zählen die Filterwiderstände zur Noise-Spec? (113 µV = Vqn/10, also 20 dB unter dem Quantisierungsrauschen.)

## Filter und OTA (filter_cmos5l)

- MFB-Biquad 1 (a0=10, fp=1 MHz, Q=1, k_c=50): Noise Gain 11 bei DC, Peak ≈ 20 bei 0,9 MHz, → 1 ab ~10 MHz. Der OTA muss deshalb unity-gain-stabil sein; die Phasenreserve zählt beim vollen GBW.
- OTA-Ausgang sieht pro Seite bei DC R2 + R1‖R3 ≈ 111 kΩ (mit 2×50k-CM-String ≈ 53 kΩ); oberhalb des RC-Pols (~1 MHz) liegt R4 parallel, dann ≈ 65 kΩ (≈ 40 kΩ). Der Filter hat nur einen OTA, danach den passiven RC-Abschnitt R4/C3; `schematic/xschem/filter.sch` mit xota2 und R6 ist eine ältere Variante. Bei kleinen Strömen begrenzt das A2 auf ≈ (gm/ID)·I_D·R_L. Die CM-Strings xr1/xr2 stehen noch auf den sky130-Werten.
- Lookup (techsweep, deckt sich 1:1 mit der Simulation): lv_nmos gm/gds ≈ 25–37 bei L = 1 µm, lv_pmos 126–249. Laut Professor ist die PMOS-Modellierung fragwürdig, die PMOS-Werte also nicht als belastbar nehmen. Einfacher Zweistufer: max. ~60 dB; alles, was der PMOS begrenzt (z. B. eine Kaskode nur auf der NMOS-Seite), ist in der Simulation zu optimistisch.
- Entscheidung 2026-10-11: vorerst keine Kaskode (Fläche 200×200 µm, Einfachheit). Erst ausreizen, was der einfache Zweistufer schafft. Ziel nach Angabe: fug = 30·fpass/β = 330 MHz, A0 > 330 (50 dB).
- Rauschen (Notebook-Abschnitt "Noise Budget"; ideale OTA, 130 °C, 100 Hz–9 MHz, diff.): Die Filterwiderstände allein geben ≈ 543 µV (R3 481, R1 220, R4 102, R2 70) bei einem Budget von 113 µV. Mit C2 = 0,5 pF ist das nicht erfüllbar, egal wie der OTA aussieht; R4 allein liegt schon nahe kT/C3. Mit dem echten NG(f)·H_RC(f) braucht der OTA ≈ 1,3 mS bei vollem Budget (2,5 mS bei 50 %) statt der flach geschätzten 5 mS.
- Gain-Fehler: R2/R1 aus Einheitswiderständen bauen. Die gerundeten Längen im Notebook geben 5 % Verhältnisfehler, der feste rhigh-Endwiderstand (1,6e-4/w ≈ 320 Ω) weitere 1,7 %.

## Chipify

- Chipify rendert die gesamte Netzliste durch Jinja2, auch die expandierten Subcircuits des DUT. Ein `{{` irgendwo in einem DUT-Schaltplan (z. B. `{{RO}/2}` in `ota_fd_2pole.sch`) bricht jeden Lauf mit `TEMPLATE_RENDER_ERROR: unexpected '}'` ab. Parameterausdrücke deshalb einfach klammern (`{RO/2}`), das ist für ngspice gleichwertig.
