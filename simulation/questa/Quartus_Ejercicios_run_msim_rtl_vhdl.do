transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -2008 -work work {D:/Users/ASUS/Quartus_ejercicios/src/LAB1/ALU.vhd}

