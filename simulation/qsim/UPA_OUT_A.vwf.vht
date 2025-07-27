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
-- Generated on "06/29/2025 23:08:17"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          UPA_OUT_A
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY UPA_OUT_A_vhd_vec_tst IS
END UPA_OUT_A_vhd_vec_tst;
ARCHITECTURE UPA_OUT_A_arch OF UPA_OUT_A_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Ccor : STD_LOGIC;
SIGNAL Cin : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL F : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Hab : STD_LOGIC;
SIGNAL Log : STD_LOGIC;
SIGNAL Ncor : STD_LOGIC;
SIGNAL Qi : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Rot : STD_LOGIC;
SIGNAL UPA : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL Vcor : STD_LOGIC;
SIGNAL Yi : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Zcor : STD_LOGIC;
COMPONENT UPA_OUT_A
	PORT (
	A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Ccor : BUFFER STD_LOGIC;
	Cin : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	F : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Hab : IN STD_LOGIC;
	Log : IN STD_LOGIC;
	Ncor : BUFFER STD_LOGIC;
	Qi : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	Rot : IN STD_LOGIC;
	UPA : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	Vcor : BUFFER STD_LOGIC;
	Yi : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	Zcor : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : UPA_OUT_A
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	Ccor => Ccor,
	Cin => Cin,
	clk => clk,
	F => F,
	Hab => Hab,
	Log => Log,
	Ncor => Ncor,
	Qi => Qi,
	Rot => Rot,
	UPA => UPA,
	Vcor => Vcor,
	Yi => Yi,
	Zcor => Zcor
	);

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
-- F[7]
t_prcs_F_7: PROCESS
BEGIN
	F(7) <= '1';
WAIT;
END PROCESS t_prcs_F_7;
-- F[6]
t_prcs_F_6: PROCESS
BEGIN
	F(6) <= '1';
WAIT;
END PROCESS t_prcs_F_6;
-- F[5]
t_prcs_F_5: PROCESS
BEGIN
	F(5) <= '1';
WAIT;
END PROCESS t_prcs_F_5;
-- F[4]
t_prcs_F_4: PROCESS
BEGIN
	F(4) <= '0';
WAIT;
END PROCESS t_prcs_F_4;
-- F[3]
t_prcs_F_3: PROCESS
BEGIN
	F(3) <= '1';
WAIT;
END PROCESS t_prcs_F_3;
-- F[2]
t_prcs_F_2: PROCESS
BEGIN
	F(2) <= '1';
WAIT;
END PROCESS t_prcs_F_2;
-- F[1]
t_prcs_F_1: PROCESS
BEGIN
	F(1) <= '0';
WAIT;
END PROCESS t_prcs_F_1;
-- F[0]
t_prcs_F_0: PROCESS
BEGIN
	F(0) <= '0';
WAIT;
END PROCESS t_prcs_F_0;
-- A[7]
t_prcs_A_7: PROCESS
BEGIN
	A(7) <= '1';
WAIT;
END PROCESS t_prcs_A_7;
-- A[6]
t_prcs_A_6: PROCESS
BEGIN
	A(6) <= '1';
WAIT;
END PROCESS t_prcs_A_6;
-- A[5]
t_prcs_A_5: PROCESS
BEGIN
	A(5) <= '1';
WAIT;
END PROCESS t_prcs_A_5;
-- A[4]
t_prcs_A_4: PROCESS
BEGIN
	A(4) <= '1';
WAIT;
END PROCESS t_prcs_A_4;
-- A[3]
t_prcs_A_3: PROCESS
BEGIN
	A(3) <= '0';
WAIT;
END PROCESS t_prcs_A_3;
-- A[2]
t_prcs_A_2: PROCESS
BEGIN
	A(2) <= '0';
WAIT;
END PROCESS t_prcs_A_2;
-- A[1]
t_prcs_A_1: PROCESS
BEGIN
	A(1) <= '0';
WAIT;
END PROCESS t_prcs_A_1;
-- A[0]
t_prcs_A_0: PROCESS
BEGIN
	A(0) <= '0';
WAIT;
END PROCESS t_prcs_A_0;
-- B[7]
t_prcs_B_7: PROCESS
BEGIN
	B(7) <= '0';
WAIT;
END PROCESS t_prcs_B_7;
-- B[6]
t_prcs_B_6: PROCESS
BEGIN
	B(6) <= '0';
WAIT;
END PROCESS t_prcs_B_6;
-- B[5]
t_prcs_B_5: PROCESS
BEGIN
	B(5) <= '1';
WAIT;
END PROCESS t_prcs_B_5;
-- B[4]
t_prcs_B_4: PROCESS
BEGIN
	B(4) <= '1';
WAIT;
END PROCESS t_prcs_B_4;
-- B[3]
t_prcs_B_3: PROCESS
BEGIN
	B(3) <= '0';
WAIT;
END PROCESS t_prcs_B_3;
-- B[2]
t_prcs_B_2: PROCESS
BEGIN
	B(2) <= '0';
WAIT;
END PROCESS t_prcs_B_2;
-- B[1]
t_prcs_B_1: PROCESS
BEGIN
	B(1) <= '1';
WAIT;
END PROCESS t_prcs_B_1;
-- B[0]
t_prcs_B_0: PROCESS
BEGIN
	B(0) <= '1';
WAIT;
END PROCESS t_prcs_B_0;

-- Hab
t_prcs_Hab: PROCESS
BEGIN
	Hab <= '1';
WAIT;
END PROCESS t_prcs_Hab;

-- Log
t_prcs_Log: PROCESS
BEGIN
	Log <= '0';
WAIT;
END PROCESS t_prcs_Log;

-- Rot
t_prcs_Rot: PROCESS
BEGIN
	Rot <= '0';
WAIT;
END PROCESS t_prcs_Rot;
-- UPA[2]
t_prcs_UPA_2: PROCESS
BEGIN
	UPA(2) <= '0';
	WAIT FOR 80000 ps;
	UPA(2) <= '1';
	WAIT FOR 120000 ps;
	UPA(2) <= '0';
	WAIT FOR 80000 ps;
	UPA(2) <= '1';
	WAIT FOR 80000 ps;
	UPA(2) <= '0';
	WAIT FOR 160000 ps;
	UPA(2) <= '1';
	WAIT FOR 40000 ps;
	UPA(2) <= '0';
	WAIT FOR 160000 ps;
	UPA(2) <= '1';
	WAIT FOR 160000 ps;
	UPA(2) <= '0';
	WAIT FOR 40000 ps;
	UPA(2) <= '1';
	WAIT FOR 40000 ps;
	UPA(2) <= '0';
WAIT;
END PROCESS t_prcs_UPA_2;
-- UPA[1]
t_prcs_UPA_1: PROCESS
BEGIN
	UPA(1) <= '0';
	WAIT FOR 200000 ps;
	UPA(1) <= '1';
	WAIT FOR 40000 ps;
	UPA(1) <= '0';
	WAIT FOR 200000 ps;
	UPA(1) <= '1';
	WAIT FOR 80000 ps;
	UPA(1) <= '0';
	WAIT FOR 40000 ps;
	UPA(1) <= '1';
	WAIT FOR 240000 ps;
	UPA(1) <= '0';
	WAIT FOR 40000 ps;
	UPA(1) <= '1';
	WAIT FOR 40000 ps;
	UPA(1) <= '0';
	WAIT FOR 40000 ps;
	UPA(1) <= '1';
	WAIT FOR 40000 ps;
	UPA(1) <= '0';
WAIT;
END PROCESS t_prcs_UPA_1;
-- UPA[0]
t_prcs_UPA_0: PROCESS
BEGIN
	UPA(0) <= '0';
	WAIT FOR 40000 ps;
	UPA(0) <= '1';
	WAIT FOR 80000 ps;
	UPA(0) <= '0';
	WAIT FOR 80000 ps;
	UPA(0) <= '1';
	WAIT FOR 40000 ps;
	UPA(0) <= '0';
	WAIT FOR 80000 ps;
	UPA(0) <= '1';
	WAIT FOR 40000 ps;
	UPA(0) <= '0';
	WAIT FOR 40000 ps;
	UPA(0) <= '1';
	WAIT FOR 80000 ps;
	UPA(0) <= '0';
	WAIT FOR 40000 ps;
	UPA(0) <= '1';
	WAIT FOR 40000 ps;
	UPA(0) <= '0';
	WAIT FOR 40000 ps;
	UPA(0) <= '1';
	WAIT FOR 40000 ps;
	UPA(0) <= '0';
	WAIT FOR 40000 ps;
	UPA(0) <= '1';
	WAIT FOR 40000 ps;
	UPA(0) <= '0';
	WAIT FOR 40000 ps;
	UPA(0) <= '1';
	WAIT FOR 40000 ps;
	UPA(0) <= '0';
	WAIT FOR 40000 ps;
	UPA(0) <= '1';
	WAIT FOR 40000 ps;
	UPA(0) <= '0';
	WAIT FOR 80000 ps;
	UPA(0) <= '1';
WAIT;
END PROCESS t_prcs_UPA_0;

-- Cin
t_prcs_Cin: PROCESS
BEGIN
	Cin <= '1';
WAIT;
END PROCESS t_prcs_Cin;
END UPA_OUT_A_arch;
