v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 280 80 320 80 {
lab=VR_M}
N 380 80 420 80 {
lab=VR_N}
N 150 80 180 80 {
lab=VR_P}
N 280 120 280 140 {
lab=VSS}
N 280 60 280 80 {
lab=VR_M}
N 240 80 280 80 {lab=VR_M}
C {devices/iopin.sym} 280 140 1 0 {name=p1 lab=VSS}
C {devices/ipin.sym} 150 80 0 0 {name=p2 lab=VR_P}
C {devices/ipin.sym} 420 80 0 1 {name=p3 lab=VR_N}
C {devices/opin.sym} 280 60 3 0 {name=p4 lab=VR_M}
C {res.sym} 210 80 3 0 {name=R1
value=1Meg
footprint=1206
device=resistor
m=1}
C {res.sym} 350 80 3 0 {name=R4
value=1Meg
footprint=1206
device=resistor
m=1}
