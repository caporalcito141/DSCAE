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
-- Generated on "07/14/2025 22:02:23"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          UPA_A
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY UPA_A_vhd_vec_tst IS
END UPA_A_vhd_vec_tst;
ARCHITECTURE UPA_A_arch OF UPA_A_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Calu : STD_LOGIC;
SIGNAL Ccor : STD_LOGIC;
SIGNAL Cin : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL D : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Dec : STD_LOGIC;
SIGNAL FC : STD_LOGIC;
SIGNAL Hab : STD_LOGIC;
SIGNAL Haba : STD_LOGIC;
SIGNAL Halu : STD_LOGIC;
SIGNAL Inc : STD_LOGIC;
SIGNAL Log : STD_LOGIC;
SIGNAL Nalu : STD_LOGIC;
SIGNAL Ncor : STD_LOGIC;
SIGNAL Neg : STD_LOGIC;
SIGNAL Qi0 : STD_LOGIC;
SIGNAL Qi7 : STD_LOGIC;
SIGNAL Rot : STD_LOGIC;
SIGNAL UPA : STD_LOGIC_VECTOR(9 DOWNTO 0);
SIGNAL Valu : STD_LOGIC;
SIGNAL Vcor : STD_LOGIC;
SIGNAL Yi : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Zalu : STD_LOGIC;
SIGNAL Zcor : STD_LOGIC;
COMPONENT UPA_A
	PORT (
	A : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Calu : OUT STD_LOGIC;
	Ccor : OUT STD_LOGIC;
	Cin : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	D : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Dec : IN STD_LOGIC;
	FC : OUT STD_LOGIC;
	Hab : IN STD_LOGIC;
	Haba : IN STD_LOGIC;
	Halu : OUT STD_LOGIC;
	Inc : IN STD_LOGIC;
	Log : IN STD_LOGIC;
	Nalu : OUT STD_LOGIC;
	Ncor : OUT STD_LOGIC;
	Neg : IN STD_LOGIC;
	Qi0 : OUT STD_LOGIC;
	Qi7 : OUT STD_LOGIC;
	Rot : IN STD_LOGIC;
	UPA : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	Valu : OUT STD_LOGIC;
	Vcor : OUT STD_LOGIC;
	Yi : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	Zalu : OUT STD_LOGIC;
	Zcor : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : UPA_A
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	Calu => Calu,
	Ccor => Ccor,
	Cin => Cin,
	clk => clk,
	D => D,
	Dec => Dec,
	FC => FC,
	Hab => Hab,
	Haba => Haba,
	Halu => Halu,
	Inc => Inc,
	Log => Log,
	Nalu => Nalu,
	Ncor => Ncor,
	Neg => Neg,
	Qi0 => Qi0,
	Qi7 => Qi7,
	Rot => Rot,
	UPA => UPA,
	Valu => Valu,
	Vcor => Vcor,
	Yi => Yi,
	Zalu => Zalu,
	Zcor => Zcor
	);

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
END UPA_A_arch;
