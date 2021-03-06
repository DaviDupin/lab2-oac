transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/davic/Documents/UnB/OAC/Lab2/reg.vhd}
vcom -93 -work work {C:/Users/davic/Documents/UnB/OAC/Lab2/half_adder.vhd}
vcom -93 -work work {C:/Users/davic/Documents/UnB/OAC/Lab2/full_adder.vhd}
vcom -93 -work work {C:/Users/davic/Documents/UnB/OAC/Lab2/adder32b.vhd}
vcom -93 -work work {C:/Users/davic/Documents/UnB/OAC/Lab2/processador.vhd}

vcom -93 -work work {C:/Users/davic/Documents/UnB/OAC/Lab2/processador_tb.vhd}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cyclonev -L rtl_work -L work -voptargs="+acc"  processador_tb

add wave *
view structure
view signals
run 5 us
