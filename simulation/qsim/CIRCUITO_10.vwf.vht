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
-- Generated on "05/07/2025 11:21:20"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          CIRCUITO_10
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CIRCUITO_10_vhd_vec_tst IS
END CIRCUITO_10_vhd_vec_tst;
ARCHITECTURE CIRCUITO_10_arch OF CIRCUITO_10_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL q : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT CIRCUITO_10
	PORT (
	clk : IN STD_LOGIC;
	q : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : CIRCUITO_10
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	q => q
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 1000000 ps;
	clk <= '1';
	WAIT FOR 1000000 ps;
	IF (NOW >= 16000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
END CIRCUITO_10_arch;
