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
-- Generated on "07/14/2025 21:25:01"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Registro_Contador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Registro_Contador_vhd_vec_tst IS
END Registro_Contador_vhd_vec_tst;
ARCHITECTURE Registro_Contador_arch OF Registro_Contador_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL C : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL E : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL ln : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL N : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL Z : STD_LOGIC;
COMPONENT Registro_Contador
	PORT (
	C : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	clk : IN STD_LOGIC;
	E : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
	ln : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
	N : OUT STD_LOGIC;
	Q : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	rst : IN STD_LOGIC;
	Y : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	Z : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Registro_Contador
	PORT MAP (
-- list connections between master ports and signals
	C => C,
	clk => clk,
	E => E,
	ln => ln,
	N => N,
	Q => Q,
	rst => rst,
	Y => Y,
	Z => Z
	);

-- rst
t_prcs_rst: PROCESS
BEGIN
	rst <= '1';
	WAIT FOR 10000 ps;
	rst <= '0';
	WAIT FOR 280000 ps;
	rst <= '1';
	WAIT FOR 20000 ps;
	rst <= '0';
WAIT;
END PROCESS t_prcs_rst;
-- C[2]
t_prcs_C_2: PROCESS
BEGIN
	C(2) <= '0';
	WAIT FOR 40000 ps;
	C(2) <= '1';
	WAIT FOR 110000 ps;
	C(2) <= '0';
	WAIT FOR 10000 ps;
	C(2) <= '1';
	WAIT FOR 130000 ps;
	C(2) <= '0';
WAIT;
END PROCESS t_prcs_C_2;
-- C[1]
t_prcs_C_1: PROCESS
BEGIN
	C(1) <= '0';
	WAIT FOR 60000 ps;
	C(1) <= '1';
	WAIT FOR 230000 ps;
	C(1) <= '0';
	WAIT FOR 100000 ps;
	C(1) <= '1';
WAIT;
END PROCESS t_prcs_C_1;
-- C[0]
t_prcs_C_0: PROCESS
BEGIN
	C(0) <= '0';
	WAIT FOR 40000 ps;
	C(0) <= '1';
	WAIT FOR 20000 ps;
	C(0) <= '0';
	WAIT FOR 90000 ps;
	C(0) <= '1';
	WAIT FOR 240000 ps;
	C(0) <= '0';
WAIT;
END PROCESS t_prcs_C_0;

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 2500 ps;
	clk <= '1';
	WAIT FOR 2500 ps;
	IF (NOW >= 480000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
-- E[2]
t_prcs_E_2: PROCESS
BEGIN
	E(2) <= '0';
WAIT;
END PROCESS t_prcs_E_2;
-- E[1]
t_prcs_E_1: PROCESS
BEGIN
	E(1) <= '0';
WAIT;
END PROCESS t_prcs_E_1;
-- E[0]
t_prcs_E_0: PROCESS
BEGIN
	E(0) <= '0';
WAIT;
END PROCESS t_prcs_E_0;
END Registro_Contador_arch;
