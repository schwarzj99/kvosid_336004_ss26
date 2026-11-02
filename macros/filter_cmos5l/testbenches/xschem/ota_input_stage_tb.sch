v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {OTA Macro Model:
A0 = Gm*Ro = 4mS*2MOhm/2 = 4000
GBW=fug = Gm/(Co+CL)/2/PI = 4mS/(1pF+5pF)/2/PI = 106MHz
BW = fug/A0 = 26.5kHz} 840 -180 0 1 0.3 0.3 {}
N 290 -490 290 -450 {
lab=vid}
N 290 -390 290 -320 {
lab=GND}
N 1030 -220 1030 -200 {
lab=vout}
N 1030 -140 1030 -110 {
lab=GND}
N 950 -150 990 -150 {
lab=voutn1}
N 950 -190 990 -190 {
lab=voutp1}
N 390 -410 390 -320 {lab=GND}
N 500 -520 600 -520 {lab=vip}
N 500 -440 600 -440 {lab=vin}
N 290 -490 340 -490 {lab=vid}
N 660 -520 740 -520 {
lab=vipp}
N 660 -440 740 -440 {
lab=vinn}
N 500 -480 520 -480 {lab=vcmi}
N 1120 -220 1120 -200 {lab=vcmi}
N 1120 -140 1120 -110 {lab=GND}
N 1200 -220 1200 -200 {lab=VDD}
N 1200 -140 1200 -110 {lab=GND}
N 880 -370 880 -320 {lab=GND}
N 880 -600 880 -580 {lab=VDD}
N 1100 -520 1130 -520 {lab=voutn1}
N 1100 -440 1130 -440 {lab=voutp1}
N 1010 -520 1040 -520 {lab=#net1}
N 1010 -440 1040 -440 {lab=#net2}
C {devices/vsource.sym} 1120 -170 0 0 {name=V2 value=0.75
}
C {devices/vsource.sym} 290 -420 0 0 {name=VIN value="0 AC 1"
}
C {devices/lab_wire.sym} 560 -520 0 0 {name=l1 sig_type=std_logic lab=vip}
C {devices/lab_wire.sym} 560 -440 0 0 {name=l1 sig_type=std_logic lab=vin
}
C {devices/launcher.sym} 130 -120 0 0 {name=h1
descr="Annotate OP"
tclcommand="set show_hidden_texts 1; xschem annotate_op"}
C {devices/lab_wire.sym} 290 -490 1 0 {name=l1 sig_type=std_logic lab=vid}
C {devices/gnd.sym} 290 -320 0 0 {name=l1 lab=GND}
C {devices/code.sym} 40 -310 0 0 {name=STIMULI
only_toplevel=false
value="
.include ota_input_stage_tb.save
.options savecurrents
.options method=gear reltol=.005 
.options sparse
.control
save all

let f_sig = 100
let f_min = 10
let f_max = 1000Meg
let f_stop = 5Meg
let tper_sig = 1/f_sig
let tfr_sig = tper_sig/2
let Adc = 4000
let v_step_o = 0.75
let v_step_i = v_step_o/Adc

let t_rf = 0.1u
let t_step = 50u
let t_delay = 0
let t_per = 2*t_step

let tstep = 0.1*t_rf
let tstop = 2*t_per
let tstart = t_delay

alter @VIN[PULSE] = [ 0 $&v_step_i $&t_delay $&t_rf $&t_rf $&t_step $&t_per 0 ]

set wr_singlescale
set wr_vecnames
option numdgt=3


** Main Simulations
	op
	ac dec 100 $&const.f_min $&const.f_max
	tran $&tstep $&tstop $&tstart
		
	setplot ac1
	let A = v(vout)/v(vid)

	let Amag_dB = vdb(A)
	settype decibel Amag_dB
	let Aarg = 180/PI*cphase(A)

	let fdc = const.f_min+1
	meas ac Adc find Amag_dB when frequency = fdc
	let Amag_fc = Adc-3
	meas ac fc find frequency when Amag_dB = Amag_fc
	meas ac Amax max Amag_dB
	meas ac fug find frequency when Amag_dB=0
	
	let Adc_lin = 10^(Adc/20)
	let GBW = Adc_lin*fc
	print Adc_lin
	print GBW

	plot Amag_dB Aarg ylabel 'Magnitude, Phase'

	setplot tran1
	let vid = v(vid)
	let iop = viop#branch
	let ion = vion#branch
	let vcmo = (voutp1+voutn1)/2

	*plot iop ion
	plot vid vout vcmo
	plot v(vip) v(vin) v(voutp1) v(voutn1) vcmo


alter @VIN[DC] = 0
op

remzerovec
write ota_input_stage_tb.raw
.endc"}
C {devices/gnd.sym} 1120 -110 0 0 {name=l14 lab=GND}
C {devices/gnd.sym} 390 -320 0 0 {name=l15 lab=GND}
C {devices/title.sym} 160 -40 0 0 {name=l22 author="Michael Koefinger"}
C {devices/lab_wire.sym} 710 -520 0 0 {name=p3 sig_type=std_logic lab=vipp}
C {devices/lab_wire.sym} 710 -440 0 0 {name=p4 sig_type=std_logic lab=vinn}
C {devices/vsource.sym} 630 -520 3 0 {name=VIINP value=0
}
C {devices/vsource.sym} 630 -440 3 1 {name=VIINN value=0
}
C {devices/lab_pin.sym} 1130 -440 2 0 {name=l10 sig_type=std_logic lab=voutp1
}
C {devices/lab_pin.sym} 1130 -520 0 1 {name=l11 sig_type=std_logic lab=voutn1
}
C {devices/lab_pin.sym} 1030 -220 3 1 {name=l12 sig_type=std_logic lab=vout}
C {devices/vcvs.sym} 1030 -170 0 0 {name=E5 value=1}
C {devices/gnd.sym} 1030 -110 0 0 {name=l13 lab=GND}
C {devices/vsource.sym} 1070 -520 3 0 {name=VIOP value=0
}
C {devices/vsource.sym} 1070 -440 3 1 {name=VION value=0
}
C {devices/lab_pin.sym} 950 -150 2 1 {name=l2 sig_type=std_logic lab=voutn1
}
C {devices/lab_pin.sym} 950 -190 0 0 {name=l4 sig_type=std_logic lab=voutp1
}
C {single2dm.sym} 420 -480 0 0 {name=x1 gain=1}
C {devices/lab_pin.sym} 520 -480 2 0 {name=l5 sig_type=std_logic lab=vcmi}
C {devices/lab_pin.sym} 1120 -220 1 0 {name=l6 sig_type=std_logic lab=vcmi}
C {amp_input_stage.sym} 700 -660 0 0 {name=xamp1}
C {devices/vsource.sym} 1200 -170 0 0 {name=VDD value=1.5
}
C {devices/gnd.sym} 1200 -110 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 1200 -220 1 0 {name=l7 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 880 -320 0 0 {name=l8 lab=GND}
C {devices/lab_pin.sym} 880 -600 1 0 {name=l9 sig_type=std_logic lab=VDD}
C {simulator_commands_shown.sym} -40 -440 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerRES.lib res_typ
.lib cornerDIO.lib dio_tt
"
      }
C {launcher.sym} 130 -155 0 0 {name=h3
descr=SimulateNGSPICE
tclcommand="
# Setup the default simulation commands if not already set up
# for example by already launched simulations.
set_sim_defaults
puts $sim(spice,1,cmd) 

# Change the Xyce command. In the spice category there are currently
# 5 commands (0, 1, 2, 3, 4). Command 3 is the Xyce batch
# you can get the number by querying $sim(spice,n)
set sim(spice,1,cmd) \{ngspice  \\"$N\\" -a\}

# change the simulator to be used (Xyce)
set sim(spice,default) 0

# Create FET and BIP .save file
file mkdir $netlist_dir
write_data [save_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save

# run netlist and simulation
xschem save; xschem netlist
simulate
"}
