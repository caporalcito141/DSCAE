# Copyright (C) 2025  Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License 
# Subscription Agreement, the Altera Quartus Prime License Agreement,
# the Altera IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Altera and sold by Altera or its authorized distributors.  Please
# refer to the Altera Software License Subscription Agreements 
# on the Quartus Prime software download page.

# Quartus Prime: Generate Tcl File for Project
# File: setup.tcl
# Generated on: Sun Apr  6 19:36:49 2025

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "Quartus_Ejercicios"]} {
		puts "Project Quartus_Ejercicios is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists Quartus_Ejercicios]} {
		project_open -revision Quartus_Ejercicios Quartus_Ejercicios
	} else {
		project_new -revision Quartus_Ejercicios Quartus_Ejercicios
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "MAX 10"
	set_global_assignment -name DEVICE 10M50SCE144C8G
	set_global_assignment -name TOP_LEVEL_ENTITY ejercicio1
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 24.1STD.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "19:18:44  APRIL 06, 2025"
	set_global_assignment -name LAST_QUARTUS_VERSION "24.1std.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name ERROR_CHECK_FREQUENCY_DIVISOR 256
	set_global_assignment -name EDA_SIMULATION_TOOL "Questa Intel FPGA (Verilog)"
	set_global_assignment -name EDA_TIME_SCALE "1 ps" -section_id eda_simulation
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "VERILOG HDL" -section_id eda_simulation
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_timing
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_symbol
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_signal_integrity
	set_global_assignment -name EDA_GENERATE_FUNCTIONAL_NETLIST OFF -section_id eda_board_design_boundary_scan
	set_global_assignment -name VHDL_FILE src/ejerccio1.vhd
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name FLOW_ENABLE_POWER_ANALYZER ON
	set_global_assignment -name POWER_DEFAULT_INPUT_IO_TOGGLE_RATE "12.5 %"

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
