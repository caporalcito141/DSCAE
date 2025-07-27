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
-- Generated on "07/14/2025 21:20:59"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Address_Register
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Address_Register_vhd_vec_tst IS
END Address_Register_vhd_vec_tst;
ARCHITECTURE Address_Register_arch OF Address_Register_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cbd : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL dout : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL ln : STD_LOGIC_VECTOR(15 DOWNTO 0);
COMPONENT Address_Register
	PORT (
	cbd : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	ln : IN STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Address_Register
	PORT MAP (
-- list connections between master ports and signals
	cbd => cbd,
	clk => clk,
	dout => dout,
	ln => ln
	);

-- cbd
t_prcs_cbd: PROCESS
BEGIN
	cbd <= '0';
	WAIT FOR 40000 ps;
	cbd <= '1';
	WAIT FOR 40000 ps;
	cbd <= '0';
WAIT;
END PROCESS t_prcs_cbd;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 20000 ps;
	clk <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- ln[15]
t_prcs_ln_15: PROCESS
BEGIN
	ln(15) <= '0';
WAIT;
END PROCESS t_prcs_ln_15;
-- ln[14]
t_prcs_ln_14: PROCESS
BEGIN
	ln(14) <= '0';
WAIT;
END PROCESS t_prcs_ln_14;
-- ln[13]
t_prcs_ln_13: PROCESS
BEGIN
	ln(13) <= '0';
WAIT;
END PROCESS t_prcs_ln_13;
-- ln[12]
t_prcs_ln_12: PROCESS
BEGIN
	ln(12) <= '0';
WAIT;
END PROCESS t_prcs_ln_12;
-- ln[11]
t_prcs_ln_11: PROCESS
BEGIN
	ln(11) <= '0';
WAIT;
END PROCESS t_prcs_ln_11;
-- ln[10]
t_prcs_ln_10: PROCESS
BEGIN
	ln(10) <= '0';
WAIT;
END PROCESS t_prcs_ln_10;
-- ln[9]
t_prcs_ln_9: PROCESS
BEGIN
	ln(9) <= '0';
WAIT;
END PROCESS t_prcs_ln_9;
-- ln[8]
t_prcs_ln_8: PROCESS
BEGIN
	ln(8) <= '0';
WAIT;
END PROCESS t_prcs_ln_8;
-- ln[7]
t_prcs_ln_7: PROCESS
BEGIN
	ln(7) <= '1';
WAIT;
END PROCESS t_prcs_ln_7;
-- ln[6]
t_prcs_ln_6: PROCESS
BEGIN
	ln(6) <= '1';
WAIT;
END PROCESS t_prcs_ln_6;
-- ln[5]
t_prcs_ln_5: PROCESS
BEGIN
	ln(5) <= '1';
WAIT;
END PROCESS t_prcs_ln_5;
-- ln[4]
t_prcs_ln_4: PROCESS
BEGIN
	ln(4) <= '1';
WAIT;
END PROCESS t_prcs_ln_4;
-- ln[3]
t_prcs_ln_3: PROCESS
BEGIN
	ln(3) <= '0';
WAIT;
END PROCESS t_prcs_ln_3;
-- ln[2]
t_prcs_ln_2: PROCESS
BEGIN
	ln(2) <= '1';
WAIT;
END PROCESS t_prcs_ln_2;
-- ln[1]
t_prcs_ln_1: PROCESS
BEGIN
	ln(1) <= '0';
WAIT;
END PROCESS t_prcs_ln_1;
-- ln[0]
t_prcs_ln_0: PROCESS
BEGIN
	ln(0) <= '0';
WAIT;
END PROCESS t_prcs_ln_0;
END Address_Register_arch;
