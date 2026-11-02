v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {200u} 490 -920 0 0 0.4 0.4 {}
T {Diff-Pair} 460 -140 0 0 0.4 0.4 {}
T {IREF} 170 -140 0 0 0.4 0.4 {}
N 420 -630 420 -610 {
lab=viref1}
N 520 -630 600 -630 {
lab=viref1}
N 600 -630 600 -610 {
lab=viref1}
N 510 -580 600 -580 {
lab=viref1}
N 510 -620 510 -580 {
lab=viref1}
N 510 -620 520 -630 {
lab=viref1}
N 330 -580 380 -580 {
lab=VI_P}
N 640 -580 700 -580 {
lab=VI_N}
N 520 -290 560 -290 {
lab=vfb1}
N 500 -290 520 -290 {
lab=vfb1}
N 400 -290 420 -290 {
lab=VSS}
N 400 -290 400 -160 {
lab=VSS}
N 600 -290 620 -290 {
lab=VSS}
N 620 -290 620 -160 {
lab=VSS}
N 510 -280 510 -260 {
lab=vfb1}
N 510 -280 520 -290 {
lab=vfb1}
N 510 -760 510 -640 {
lab=viref1}
N 500 -630 510 -640 {
lab=viref1}
N 500 -290 510 -300 {
lab=vfb1}
N 400 -160 420 -160 {
lab=VSS}
N 420 -160 600 -160 {
lab=VSS}
N 420 -550 420 -500 {
lab=VO_N}
N 420 -390 420 -320 {
lab=VO_N}
N 600 -500 640 -500 {
lab=VO_P}
N 370 -500 420 -500 {
lab=VO_N}
N 420 -470 430 -470 {
lab=VO_N}
N 590 -470 600 -470 {
lab=VO_P}
N 510 -880 510 -820 {
lab=VDD}
N 420 -580 510 -580 {
lab=viref1}
N 500 -630 520 -630 {
lab=viref1}
N 420 -260 420 -160 {
lab=VSS}
N 600 -260 600 -160 {
lab=VSS}
N 420 -630 500 -630 {
lab=viref1}
N 460 -290 500 -290 {
lab=vfb1}
N 600 -550 600 -500 {
lab=VO_P}
N 600 -390 600 -320 {
lab=VO_P}
N 420 -500 420 -470 {
lab=VO_N}
N 600 -500 600 -470 {
lab=VO_P}
N 140 -880 510 -880 {
lab=VDD}
N 220 -160 400 -160 {
lab=VSS}
N 600 -160 620 -160 {
lab=VSS}
N 510 -340 510 -300 {lab=vfb1}
N 590 -390 600 -390 {lab=VO_P}
N 600 -470 600 -390 {
lab=VO_P}
N 420 -390 430 -390 {lab=VO_N}
N 420 -470 420 -390 {
lab=VO_N}
N 510 -450 510 -440 {lab=VSS}
N 220 -450 510 -450 {lab=VSS}
N 220 -450 220 -160 {lab=VSS}
N 120 -160 220 -160 {
lab=VSS}
C {devices/title.sym} 200 -60 0 0 {name=l3 author="Michael Koefinger"}
C {devices/lab_pin.sym} 510 -670 0 1 {name=p1 sig_type=std_logic lab=viref1}
C {devices/iopin.sym} 120 -160 2 0 {name=p2 lab=VSS}
C {devices/iopin.sym} 140 -880 2 0 {name=p1 lab=VDD}
C {devices/ipin.sym} 330 -580 0 0 {name=p4 lab=VI_P}
C {devices/ipin.sym} 700 -580 2 0 {name=p5 lab=VI_N}
C {devices/lab_pin.sym} 510 -260 3 0 {name=p2 sig_type=std_logic lab=vfb1}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 440 -290 0 1 {name=M12
l=0.5u
w=4u
ng=8
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 580 -290 0 0 {name=M13
l=0.5u
w=4u
ng=8
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 400 -580 0 0 {name=M18
l=0.13u
w=48.5u
ng=10
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 620 -580 0 1 {name=M19
l=0.13u
w=48.5u
ng=10
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {devices/opin.sym} 370 -500 2 0 {name=p3 lab=VO_N}
C {devices/opin.sym} 640 -500 0 0 {name=p6 lab=VO_P}
C {isource.sym} 510 -790 0 0 {name=I0 value=520u}
C {sg13g2_pr/annotate_fet_params.sym} 300 -770 0 0 {name=annot1 ref=M18}
C {sg13g2_pr/annotate_fet_params.sym} 610 -770 0 0 {name=annot2 ref=M19}
C {sg13g2_pr/annotate_fet_params.sym} 240 -330 0 0 {name=annot3 ref=M12}
C {sg13g2_pr/annotate_fet_params.sym} 690 -330 0 0 {name=annot4 ref=M13}
C {rstring_cm.sym} 630 -330 2 0 {name=xr1}
