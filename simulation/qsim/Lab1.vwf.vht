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
-- Generated on "06/09/2025 00:55:58"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ALU
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ALU_vhd_vec_tst IS
END ALU_vhd_vec_tst;
ARCHITECTURE ALU_arch OF ALU_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL B : STD_LOGIC;
SIGNAL C : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL carry : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL OP : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL Q : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL RD : STD_LOGIC_VECTOR(2 DOWNTO 0);
COMPONENT ALU
	PORT (
	B : IN STD_LOGIC;
	C : BUFFER STD_LOGIC_VECTOR(2 DOWNTO 0);
	carry : BUFFER STD_LOGIC;
	clk : IN STD_LOGIC;
	OP : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	Q : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	RD : IN STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ALU
	PORT MAP (
-- list connections between master ports and signals
	B => B,
	C => C,
	carry => carry,
	clk => clk,
	OP => OP,
	Q => Q,
	RD => RD
	);

-- B
t_prcs_B: PROCESS
BEGIN
	B <= '1';
WAIT;
END PROCESS t_prcs_B;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- OP[3]
t_prcs_OP_3: PROCESS
BEGIN
	OP(3) <= '0';
WAIT;
END PROCESS t_prcs_OP_3;
-- OP[2]
t_prcs_OP_2: PROCESS
BEGIN
	OP(2) <= '0';
WAIT;
END PROCESS t_prcs_OP_2;
-- OP[1]
t_prcs_OP_1: PROCESS
BEGIN
	OP(1) <= '0';
	WAIT FOR 50000 ps;
	OP(1) <= '1';
	WAIT FOR 50000 ps;
	OP(1) <= '0';
WAIT;
END PROCESS t_prcs_OP_1;
-- OP[0]
t_prcs_OP_0: PROCESS
BEGIN
	OP(0) <= '1';
	WAIT FOR 100000 ps;
	OP(0) <= '0';
WAIT;
END PROCESS t_prcs_OP_0;
-- Q[2]
t_prcs_Q_2: PROCESS
BEGIN
	Q(2) <= '0';
	WAIT FOR 50000 ps;
	Q(2) <= '1';
	WAIT FOR 50000 ps;
	Q(2) <= '0';
WAIT;
END PROCESS t_prcs_Q_2;
-- Q[1]
t_prcs_Q_1: PROCESS
BEGIN
	Q(1) <= '0';
	WAIT FOR 50000 ps;
	Q(1) <= '1';
	WAIT FOR 50000 ps;
	Q(1) <= '0';
WAIT;
END PROCESS t_prcs_Q_1;
-- Q[0]
t_prcs_Q_0: PROCESS
BEGIN
	Q(0) <= '1';
	WAIT FOR 50000 ps;
	Q(0) <= '0';
WAIT;
END PROCESS t_prcs_Q_0;
-- RD[2]
t_prcs_RD_2: PROCESS
BEGIN
	RD(2) <= '0';
WAIT;
END PROCESS t_prcs_RD_2;
-- RD[1]
t_prcs_RD_1: PROCESS
BEGIN
	RD(1) <= '0';
	WAIT FOR 50000 ps;
	RD(1) <= '1';
	WAIT FOR 50000 ps;
	RD(1) <= '0';
WAIT;
END PROCESS t_prcs_RD_1;
-- RD[0]
t_prcs_RD_0: PROCESS
BEGIN
	RD(0) <= '1';
	WAIT FOR 50000 ps;
	RD(0) <= '0';
WAIT;
END PROCESS t_prcs_RD_0;
END ALU_arch;
