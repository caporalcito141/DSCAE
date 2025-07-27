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
-- Generated on "06/09/2025 23:13:17"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Acumulador
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Acumulador_vhd_vec_tst IS
END Acumulador_vhd_vec_tst;
ARCHITECTURE Acumulador_arch OF Acumulador_vhd_vec_tst IS
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
COMPONENT Acumulador
	PORT (
	Ai : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Ao : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	Bi : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Bo : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	Ci : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	clk : IN STD_LOGIC;
	Co : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	E : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	N : BUFFER STD_LOGIC;
	V : BUFFER STD_LOGIC;
	w : IN STD_LOGIC;
	Z : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Acumulador
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

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 480000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

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
END Acumulador_arch;
