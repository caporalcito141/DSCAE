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
-- Generated on "07/14/2025 20:52:59"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Registro_Acumulador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Registro_Acumulador_vhd_vec_tst IS
END Registro_Acumulador_vhd_vec_tst;
ARCHITECTURE Registro_Acumulador_arch OF Registro_Acumulador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Ai : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Ao : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Bi : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Bo : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Ci : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL Co : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL E : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL N : STD_LOGIC;
SIGNAL V : STD_LOGIC;
SIGNAL w : STD_LOGIC;
SIGNAL Z : STD_LOGIC;
COMPONENT Registro_Acumulador
	PORT (
	Ai : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Ao : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Bi : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Bo : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Ci : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	clk : IN STD_LOGIC;
	Co : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	E : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	N : OUT STD_LOGIC;
	V : OUT STD_LOGIC;
	w : IN STD_LOGIC;
	Z : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Registro_Acumulador
	PORT MAP (
-- list connections between master ports and signals
	Ai => Ai,
	Ao => Ao,
	Bi => Bi,
	Bo => Bo,
	Ci => Ci,
	clk => clk,
	Co => Co,
	E => E,
	N => N,
	V => V,
	w => w,
	Z => Z
	);
-- Ai[7]
t_prcs_Ai_7: PROCESS
BEGIN
	Ai(7) <= '0';
WAIT;
END PROCESS t_prcs_Ai_7;
-- Ai[6]
t_prcs_Ai_6: PROCESS
BEGIN
	Ai(6) <= '1';
WAIT;
END PROCESS t_prcs_Ai_6;
-- Ai[5]
t_prcs_Ai_5: PROCESS
BEGIN
	Ai(5) <= '0';
WAIT;
END PROCESS t_prcs_Ai_5;
-- Ai[4]
t_prcs_Ai_4: PROCESS
BEGIN
	Ai(4) <= '0';
WAIT;
END PROCESS t_prcs_Ai_4;
-- Ai[3]
t_prcs_Ai_3: PROCESS
BEGIN
	Ai(3) <= '0';
WAIT;
END PROCESS t_prcs_Ai_3;
-- Ai[2]
t_prcs_Ai_2: PROCESS
BEGIN
	Ai(2) <= '1';
WAIT;
END PROCESS t_prcs_Ai_2;
-- Ai[1]
t_prcs_Ai_1: PROCESS
BEGIN
	Ai(1) <= '1';
WAIT;
END PROCESS t_prcs_Ai_1;
-- Ai[0]
t_prcs_Ai_0: PROCESS
BEGIN
	Ai(0) <= '1';
WAIT;
END PROCESS t_prcs_Ai_0;
-- Bi[7]
t_prcs_Bi_7: PROCESS
BEGIN
	Bi(7) <= '0';
WAIT;
END PROCESS t_prcs_Bi_7;
-- Bi[6]
t_prcs_Bi_6: PROCESS
BEGIN
	Bi(6) <= '0';
WAIT;
END PROCESS t_prcs_Bi_6;
-- Bi[5]
t_prcs_Bi_5: PROCESS
BEGIN
	Bi(5) <= '0';
WAIT;
END PROCESS t_prcs_Bi_5;
-- Bi[4]
t_prcs_Bi_4: PROCESS
BEGIN
	Bi(4) <= '0';
WAIT;
END PROCESS t_prcs_Bi_4;
-- Bi[3]
t_prcs_Bi_3: PROCESS
BEGIN
	Bi(3) <= '0';
WAIT;
END PROCESS t_prcs_Bi_3;
-- Bi[2]
t_prcs_Bi_2: PROCESS
BEGIN
	Bi(2) <= '0';
WAIT;
END PROCESS t_prcs_Bi_2;
-- Bi[1]
t_prcs_Bi_1: PROCESS
BEGIN
	Bi(1) <= '0';
WAIT;
END PROCESS t_prcs_Bi_1;
-- Bi[0]
t_prcs_Bi_0: PROCESS
BEGIN
	Bi(0) <= '0';
WAIT;
END PROCESS t_prcs_Bi_0;
-- Ci[7]
t_prcs_Ci_7: PROCESS
BEGIN
	Ci(7) <= '1';
WAIT;
END PROCESS t_prcs_Ci_7;
-- Ci[6]
t_prcs_Ci_6: PROCESS
BEGIN
	Ci(6) <= '1';
WAIT;
END PROCESS t_prcs_Ci_6;
-- Ci[5]
t_prcs_Ci_5: PROCESS
BEGIN
	Ci(5) <= '1';
WAIT;
END PROCESS t_prcs_Ci_5;
-- Ci[4]
t_prcs_Ci_4: PROCESS
BEGIN
	Ci(4) <= '1';
WAIT;
END PROCESS t_prcs_Ci_4;
-- Ci[3]
t_prcs_Ci_3: PROCESS
BEGIN
	Ci(3) <= '1';
WAIT;
END PROCESS t_prcs_Ci_3;
-- Ci[2]
t_prcs_Ci_2: PROCESS
BEGIN
	Ci(2) <= '1';
WAIT;
END PROCESS t_prcs_Ci_2;
-- Ci[1]
t_prcs_Ci_1: PROCESS
BEGIN
	Ci(1) <= '1';
WAIT;
END PROCESS t_prcs_Ci_1;
-- Ci[0]
t_prcs_Ci_0: PROCESS
BEGIN
	Ci(0) <= '1';
WAIT;
END PROCESS t_prcs_Ci_0;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 20000 ps;
	clk <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 360000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- E[1]
t_prcs_E_1: PROCESS
BEGIN
	E(1) <= '0';
	WAIT FOR 100000 ps;
	E(1) <= '1';
	WAIT FOR 180000 ps;
	E(1) <= '0';
WAIT;
END PROCESS t_prcs_E_1;
-- E[0]
t_prcs_E_0: PROCESS
BEGIN
	E(0) <= '1';
	WAIT FOR 100000 ps;
	E(0) <= '0';
	WAIT FOR 120000 ps;
	E(0) <= '1';
	WAIT FOR 60000 ps;
	E(0) <= '0';
WAIT;
END PROCESS t_prcs_E_0;

-- w
t_prcs_w: PROCESS
BEGIN
	w <= '0';
	WAIT FOR 40000 ps;
	w <= '1';
	WAIT FOR 60000 ps;
	w <= '0';
	WAIT FOR 60000 ps;
	w <= '1';
	WAIT FOR 60000 ps;
	w <= '0';
	WAIT FOR 80000 ps;
	w <= '1';
WAIT;
END PROCESS t_prcs_w;
END Registro_Acumulador_arch;
