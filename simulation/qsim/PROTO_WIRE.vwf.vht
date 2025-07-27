-- Copyright (C) 2025  Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Altera and sold by Altera or its authorized distributors.  Please
-- refer to the Altera Software License Subscription Agreements 
-- on the Quartus Prime software download page.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "07/14/2025 19:50:55"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          RegisterInstruction
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegisterInstruction_vhd_vec_tst IS
END RegisterInstruction_vhd_vec_tst;
ARCHITECTURE RegisterInstruction_arch OF RegisterInstruction_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CRI : STD_LOGIC;
SIGNAL ln : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Q : STD_LOGIC_VECTOR(11 DOWNTO 0);
COMPONENT RegisterInstruction
	PORT (
	CRI : IN STD_LOGIC;
	ln : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Q : BUFFER STD_LOGIC_VECTOR(11 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : RegisterInstruction
	PORT MAP (
-- list connections between master ports and signals
	CRI => CRI,
	ln => ln,
	Q => Q
	);
END RegisterInstruction_arch;
