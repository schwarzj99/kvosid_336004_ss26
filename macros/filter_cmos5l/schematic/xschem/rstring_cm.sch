v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {32k} 110 140 0 0 0.4 0.4 {}
T {32k} 200 140 0 0 0.4 0.4 {}
T {32k} 320 140 0 0 0.4 0.4 {}
T {32k} 410 140 0 0 0.4 0.4 {}
N 160 80 200 80 {
lab=#net1}
N 280 80 300 80 {
lab=VR_M}
N 360 80 400 80 {
lab=#net2}
N 460 80 500 80 {
lab=VR_N}
N 70 80 100 80 {
lab=VR_P}
N 280 120 280 140 {
lab=VSS}
N 280 60 280 80 {
lab=VR_M}
N 260 80 280 80 {
lab=VR_M}
C {devices/iopin.sym} 280 140 1 0 {name=p1 lab=VSS}
C {devices/ipin.sym} 70 80 0 0 {name=p2 lab=VR_P}
C {devices/ipin.sym} 500 80 0 1 {name=p3 lab=VR_N}
C {devices/opin.sym} 280 60 3 0 {name=p4 lab=VR_M}
C {/foss/pdks/ihp-sg13cmos5l/libs.tech/xschem/sg13cmos5l_pr/rhigh.sym} 130 80 3 0 {name=R1
w=0.5e-6
l=0.96e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {/foss/pdks/ihp-sg13cmos5l/libs.tech/xschem/sg13cmos5l_pr/rhigh.sym} 230 80 3 0 {name=R2
w=0.5e-6
l=0.96e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {/foss/pdks/ihp-sg13cmos5l/libs.tech/xschem/sg13cmos5l_pr/rhigh.sym} 330 80 3 0 {name=R3
w=0.5e-6
l=0.96e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {/foss/pdks/ihp-sg13cmos5l/libs.tech/xschem/sg13cmos5l_pr/rhigh.sym} 430 80 3 0 {name=R4
w=0.5e-6
l=0.96e-6
model=rhigh
body=VSS
spiceprefix=X
b=0
m=1
mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
