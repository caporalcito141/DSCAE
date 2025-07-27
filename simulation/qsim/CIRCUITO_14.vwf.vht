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
-- Generated on "05/17/2025 09:15:14"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          alu
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alu_vhd_vec_tst IS
END alu_vhd_vec_tst;
ARCHITECTURE alu_arch OF alu_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL b : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL cs : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL operacion : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL rc : STD_LOGIC_VECTOR(3 DOWNTO 0);
COMPONENT alu
	PORT (
	a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	clk : IN STD_LOGIC;
	cs : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	operacion : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	rc : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : alu
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	clk => clk,
	cs => cs,
	operacion => operacion,
	rc => rc
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;
END alu_arch;
