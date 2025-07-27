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
-- Generated on "05/09/2025 13:20:16"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          CIRCUITO_11
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY CIRCUITO_11_vhd_vec_tst IS
END CIRCUITO_11_vhd_vec_tst;
ARCHITECTURE CIRCUITO_11_arch OF CIRCUITO_11_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL rs : STD_LOGIC;
COMPONENT CIRCUITO_11
	PORT (
	clk : IN STD_LOGIC;
	count : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	rs : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : CIRCUITO_11
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	count => count,
	rs => rs
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 500000 ps;
	clk <= '1';
	WAIT FOR 500000 ps;
	IF (NOW >= 16000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- rs
t_prcs_rs: PROCESS
BEGIN
	rs <= '0';
WAIT;
END PROCESS t_prcs_rs;
END CIRCUITO_11_arch;
