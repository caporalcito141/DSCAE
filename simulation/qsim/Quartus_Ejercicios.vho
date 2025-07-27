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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 24.1std.0 Build 1077 03/04/2025 SC Lite Edition"

-- DATE "07/14/2025 22:04:11"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Registro_Contador IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	C : IN std_logic_vector(2 DOWNTO 0);
	E : IN std_logic_vector(2 DOWNTO 0);
	ln : IN std_logic_vector(15 DOWNTO 0);
	N : OUT std_logic;
	Z : OUT std_logic;
	Q : OUT std_logic_vector(15 DOWNTO 0);
	Y : OUT std_logic_vector(15 DOWNTO 0)
	);
END Registro_Contador;

-- Design Ports Information
-- N	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Z	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[0]	=>  Location: PIN_V9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[2]	=>  Location: PIN_Y10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[3]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[4]	=>  Location: PIN_AB6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[5]	=>  Location: PIN_V12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[6]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[7]	=>  Location: PIN_AB9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[8]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[9]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[10]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[11]	=>  Location: PIN_B2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[12]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[13]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[14]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[15]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[0]	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[1]	=>  Location: PIN_Y11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[2]	=>  Location: PIN_AB8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[3]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[4]	=>  Location: PIN_AA7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[5]	=>  Location: PIN_V11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[6]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[7]	=>  Location: PIN_W11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[8]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[9]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[10]	=>  Location: PIN_C4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[11]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[12]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[13]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[14]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Y[15]	=>  Location: PIN_C5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C[0]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C[2]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- C[1]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[15]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[0]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[1]	=>  Location: PIN_H11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[2]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[3]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[4]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[5]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[6]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[7]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[8]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[9]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[10]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[11]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[12]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[13]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ln[14]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[0]	=>  Location: PIN_AB7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[1]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- E[2]	=>  Location: PIN_AB5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Registro_Contador IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_C : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_E : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_ln : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_N : std_logic;
SIGNAL ww_Z : std_logic;
SIGNAL ww_Q : std_logic_vector(15 DOWNTO 0);
SIGNAL ww_Y : std_logic_vector(15 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \Q[3]~output_o\ : std_logic;
SIGNAL \Q[4]~output_o\ : std_logic;
SIGNAL \Q[5]~output_o\ : std_logic;
SIGNAL \Q[6]~output_o\ : std_logic;
SIGNAL \Q[7]~output_o\ : std_logic;
SIGNAL \Q[8]~output_o\ : std_logic;
SIGNAL \Q[9]~output_o\ : std_logic;
SIGNAL \Q[10]~output_o\ : std_logic;
SIGNAL \Q[11]~output_o\ : std_logic;
SIGNAL \Q[12]~output_o\ : std_logic;
SIGNAL \Q[13]~output_o\ : std_logic;
SIGNAL \Q[14]~output_o\ : std_logic;
SIGNAL \Q[15]~output_o\ : std_logic;
SIGNAL \Y[0]~output_o\ : std_logic;
SIGNAL \Y[1]~output_o\ : std_logic;
SIGNAL \Y[2]~output_o\ : std_logic;
SIGNAL \Y[3]~output_o\ : std_logic;
SIGNAL \Y[4]~output_o\ : std_logic;
SIGNAL \Y[5]~output_o\ : std_logic;
SIGNAL \Y[6]~output_o\ : std_logic;
SIGNAL \Y[7]~output_o\ : std_logic;
SIGNAL \Y[8]~output_o\ : std_logic;
SIGNAL \Y[9]~output_o\ : std_logic;
SIGNAL \Y[10]~output_o\ : std_logic;
SIGNAL \Y[11]~output_o\ : std_logic;
SIGNAL \Y[12]~output_o\ : std_logic;
SIGNAL \Y[13]~output_o\ : std_logic;
SIGNAL \Y[14]~output_o\ : std_logic;
SIGNAL \Y[15]~output_o\ : std_logic;
SIGNAL \N~output_o\ : std_logic;
SIGNAL \Z~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \C[0]~input_o\ : std_logic;
SIGNAL \C[1]~input_o\ : std_logic;
SIGNAL \C[2]~input_o\ : std_logic;
SIGNAL \temp[5]~3_combout\ : std_logic;
SIGNAL \ln[1]~input_o\ : std_logic;
SIGNAL \temp[5]~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \ln[2]~input_o\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \ln[3]~input_o\ : std_logic;
SIGNAL \ln[4]~input_o\ : std_logic;
SIGNAL \ln[5]~input_o\ : std_logic;
SIGNAL \ln[6]~input_o\ : std_logic;
SIGNAL \ln[7]~input_o\ : std_logic;
SIGNAL \temp[8]~23_combout\ : std_logic;
SIGNAL \temp[5]~24_combout\ : std_logic;
SIGNAL \ln[14]~input_o\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \ln[15]~input_o\ : std_logic;
SIGNAL \Mux0~0_combout\ : std_logic;
SIGNAL \Mux0~1_combout\ : std_logic;
SIGNAL \Mux0~2_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \temp~38_combout\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \temp~39_combout\ : std_logic;
SIGNAL \temp~27_combout\ : std_logic;
SIGNAL \ln[13]~input_o\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \temp~36_combout\ : std_logic;
SIGNAL \temp~37_combout\ : std_logic;
SIGNAL \ln[12]~input_o\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \temp~34_combout\ : std_logic;
SIGNAL \temp~35_combout\ : std_logic;
SIGNAL \ln[11]~input_o\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \temp~32_combout\ : std_logic;
SIGNAL \temp~33_combout\ : std_logic;
SIGNAL \ln[10]~input_o\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \temp~30_combout\ : std_logic;
SIGNAL \temp~31_combout\ : std_logic;
SIGNAL \ln[9]~input_o\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \temp~28_combout\ : std_logic;
SIGNAL \temp~29_combout\ : std_logic;
SIGNAL \ln[8]~input_o\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \temp~25_combout\ : std_logic;
SIGNAL \temp~26_combout\ : std_logic;
SIGNAL \temp~20_combout\ : std_logic;
SIGNAL \temp~21_combout\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \temp~22_combout\ : std_logic;
SIGNAL \temp~17_combout\ : std_logic;
SIGNAL \temp~18_combout\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \temp~19_combout\ : std_logic;
SIGNAL \temp~14_combout\ : std_logic;
SIGNAL \temp~15_combout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \temp~16_combout\ : std_logic;
SIGNAL \temp~11_combout\ : std_logic;
SIGNAL \temp~12_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \temp~13_combout\ : std_logic;
SIGNAL \temp~8_combout\ : std_logic;
SIGNAL \temp~9_combout\ : std_logic;
SIGNAL \temp~10_combout\ : std_logic;
SIGNAL \temp~5_combout\ : std_logic;
SIGNAL \temp~6_combout\ : std_logic;
SIGNAL \temp~7_combout\ : std_logic;
SIGNAL \temp~1_combout\ : std_logic;
SIGNAL \temp~2_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \temp~4_combout\ : std_logic;
SIGNAL \Mux15~1_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Mux15~0_combout\ : std_logic;
SIGNAL \ln[0]~input_o\ : std_logic;
SIGNAL \Mux15~2_combout\ : std_logic;
SIGNAL \Mux15~3_combout\ : std_logic;
SIGNAL \E[0]~input_o\ : std_logic;
SIGNAL \E[1]~input_o\ : std_logic;
SIGNAL \E[2]~input_o\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL temp : std_logic_vector(15 DOWNTO 0);
SIGNAL \ALT_INV_E[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_E[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_E[2]~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_C <= C;
ww_E <= E;
ww_ln <= ln;
N <= ww_N;
Z <= ww_Z;
Q <= ww_Q;
Y <= ww_Y;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_E[0]~input_o\ <= NOT \E[0]~input_o\;
\ALT_INV_E[1]~input_o\ <= NOT \E[1]~input_o\;
\ALT_INV_E[2]~input_o\ <= NOT \E[2]~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y44_N20
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X31_Y0_N30
\Q[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(0),
	oe => \ALT_INV_E[0]~input_o\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\Q[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(1),
	oe => \ALT_INV_E[0]~input_o\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

-- Location: IOOBUF_X34_Y0_N9
\Q[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(2),
	oe => \ALT_INV_E[0]~input_o\,
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

-- Location: IOOBUF_X38_Y0_N16
\Q[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(3),
	oe => \ALT_INV_E[0]~input_o\,
	devoe => ww_devoe,
	o => \Q[3]~output_o\);

-- Location: IOOBUF_X29_Y0_N9
\Q[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(4),
	oe => \ALT_INV_E[0]~input_o\,
	devoe => ww_devoe,
	o => \Q[4]~output_o\);

-- Location: IOOBUF_X38_Y0_N23
\Q[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(5),
	oe => \ALT_INV_E[0]~input_o\,
	devoe => ww_devoe,
	o => \Q[5]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\Q[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(6),
	oe => \ALT_INV_E[0]~input_o\,
	devoe => ww_devoe,
	o => \Q[6]~output_o\);

-- Location: IOOBUF_X34_Y0_N16
\Q[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(7),
	oe => \ALT_INV_E[0]~input_o\,
	devoe => ww_devoe,
	o => \Q[7]~output_o\);

-- Location: IOOBUF_X49_Y54_N30
\Q[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(8),
	oe => \ALT_INV_E[1]~input_o\,
	devoe => ww_devoe,
	o => \Q[8]~output_o\);

-- Location: IOOBUF_X26_Y39_N9
\Q[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(9),
	oe => \ALT_INV_E[1]~input_o\,
	devoe => ww_devoe,
	o => \Q[9]~output_o\);

-- Location: IOOBUF_X26_Y39_N30
\Q[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(10),
	oe => \ALT_INV_E[1]~input_o\,
	devoe => ww_devoe,
	o => \Q[10]~output_o\);

-- Location: IOOBUF_X22_Y39_N16
\Q[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(11),
	oe => \ALT_INV_E[1]~input_o\,
	devoe => ww_devoe,
	o => \Q[11]~output_o\);

-- Location: IOOBUF_X49_Y54_N2
\Q[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(12),
	oe => \ALT_INV_E[1]~input_o\,
	devoe => ww_devoe,
	o => \Q[12]~output_o\);

-- Location: IOOBUF_X26_Y39_N16
\Q[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(13),
	oe => \ALT_INV_E[1]~input_o\,
	devoe => ww_devoe,
	o => \Q[13]~output_o\);

-- Location: IOOBUF_X26_Y39_N23
\Q[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(14),
	oe => \ALT_INV_E[1]~input_o\,
	devoe => ww_devoe,
	o => \Q[14]~output_o\);

-- Location: IOOBUF_X22_Y39_N30
\Q[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(15),
	oe => \ALT_INV_E[1]~input_o\,
	devoe => ww_devoe,
	o => \Q[15]~output_o\);

-- Location: IOOBUF_X31_Y0_N23
\Y[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(0),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[0]~output_o\);

-- Location: IOOBUF_X36_Y0_N2
\Y[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(1),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[1]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\Y[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(2),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[2]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\Y[3]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(3),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[3]~output_o\);

-- Location: IOOBUF_X29_Y0_N16
\Y[4]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(4),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[4]~output_o\);

-- Location: IOOBUF_X38_Y0_N30
\Y[5]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(5),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[5]~output_o\);

-- Location: IOOBUF_X31_Y0_N16
\Y[6]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(6),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[6]~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\Y[7]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(7),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[7]~output_o\);

-- Location: IOOBUF_X49_Y54_N9
\Y[8]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(8),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[8]~output_o\);

-- Location: IOOBUF_X24_Y39_N9
\Y[9]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(9),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[9]~output_o\);

-- Location: IOOBUF_X24_Y39_N2
\Y[10]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(10),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[10]~output_o\);

-- Location: IOOBUF_X24_Y39_N16
\Y[11]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(11),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[11]~output_o\);

-- Location: IOOBUF_X49_Y54_N16
\Y[12]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(12),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[12]~output_o\);

-- Location: IOOBUF_X26_Y39_N2
\Y[13]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(13),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[13]~output_o\);

-- Location: IOOBUF_X24_Y39_N30
\Y[14]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(14),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[14]~output_o\);

-- Location: IOOBUF_X24_Y39_N23
\Y[15]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(15),
	oe => \ALT_INV_E[2]~input_o\,
	devoe => ww_devoe,
	o => \Y[15]~output_o\);

-- Location: IOOBUF_X22_Y39_N23
\N~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => temp(15),
	devoe => ww_devoe,
	o => \N~output_o\);

-- Location: IOOBUF_X46_Y54_N30
\Z~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~4_combout\,
	devoe => ww_devoe,
	o => \Z~output_o\);

-- Location: IOIBUF_X0_Y18_N15
\clk~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G3
\clk~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X34_Y39_N1
\C[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C(0),
	o => \C[0]~input_o\);

-- Location: IOIBUF_X29_Y39_N15
\C[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C(1),
	o => \C[1]~input_o\);

-- Location: IOIBUF_X34_Y39_N29
\C[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_C(2),
	o => \C[2]~input_o\);

-- Location: LCCOMB_X34_Y37_N0
\temp[5]~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp[5]~3_combout\ = (\C[2]~input_o\) # (\C[0]~input_o\ $ (!\C[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C[0]~input_o\,
	datac => \C[1]~input_o\,
	datad => \C[2]~input_o\,
	combout => \temp[5]~3_combout\);

-- Location: IOIBUF_X34_Y39_N15
\ln[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(1),
	o => \ln[1]~input_o\);

-- Location: LCCOMB_X34_Y37_N30
\temp[5]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp[5]~0_combout\ = (\C[0]~input_o\ & ((!\C[2]~input_o\) # (!\C[1]~input_o\))) # (!\C[0]~input_o\ & (\C[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C[0]~input_o\,
	datac => \C[1]~input_o\,
	datad => \C[2]~input_o\,
	combout => \temp[5]~0_combout\);

-- Location: LCCOMB_X36_Y37_N0
\Add0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = temp(0) $ (VCC)
-- \Add0~1\ = CARRY(temp(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => temp(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X36_Y37_N2
\Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (temp(1) & ((\C[0]~input_o\ & (!\Add0~1\)) # (!\C[0]~input_o\ & (\Add0~1\ & VCC)))) # (!temp(1) & ((\C[0]~input_o\ & ((\Add0~1\) # (GND))) # (!\C[0]~input_o\ & (!\Add0~1\))))
-- \Add0~3\ = CARRY((temp(1) & (\C[0]~input_o\ & !\Add0~1\)) # (!temp(1) & ((\C[0]~input_o\) # (!\Add0~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => temp(1),
	datab => \C[0]~input_o\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X36_Y37_N4
\Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((\C[0]~input_o\ $ (temp(2) $ (\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((\C[0]~input_o\ & (temp(2) & !\Add0~3\)) # (!\C[0]~input_o\ & ((temp(2)) # (!\Add0~3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~input_o\,
	datab => temp(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: IOIBUF_X36_Y39_N29
\ln[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(2),
	o => \ln[2]~input_o\);

-- Location: LCCOMB_X36_Y37_N6
\Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\C[0]~input_o\ & ((temp(3) & (!\Add0~5\)) # (!temp(3) & ((\Add0~5\) # (GND))))) # (!\C[0]~input_o\ & ((temp(3) & (\Add0~5\ & VCC)) # (!temp(3) & (!\Add0~5\))))
-- \Add0~7\ = CARRY((\C[0]~input_o\ & ((!\Add0~5\) # (!temp(3)))) # (!\C[0]~input_o\ & (!temp(3) & !\Add0~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~input_o\,
	datab => temp(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: IOIBUF_X46_Y54_N15
\ln[3]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(3),
	o => \ln[3]~input_o\);

-- Location: IOIBUF_X36_Y39_N15
\ln[4]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(4),
	o => \ln[4]~input_o\);

-- Location: IOIBUF_X36_Y39_N22
\ln[5]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(5),
	o => \ln[5]~input_o\);

-- Location: IOIBUF_X46_Y54_N1
\ln[6]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(6),
	o => \ln[6]~input_o\);

-- Location: IOIBUF_X46_Y54_N8
\ln[7]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(7),
	o => \ln[7]~input_o\);

-- Location: LCCOMB_X34_Y37_N14
\temp[8]~23\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp[8]~23_combout\ = (\C[2]~input_o\ & ((\C[0]~input_o\) # (!\C[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \C[0]~input_o\,
	datac => \C[1]~input_o\,
	datad => \C[2]~input_o\,
	combout => \temp[8]~23_combout\);

-- Location: LCCOMB_X34_Y37_N12
\temp[5]~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp[5]~24_combout\ = (!\C[2]~input_o\) # (!\C[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \C[1]~input_o\,
	datad => \C[2]~input_o\,
	combout => \temp[5]~24_combout\);

-- Location: IOIBUF_X29_Y39_N1
\ln[14]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(14),
	o => \ln[14]~input_o\);

-- Location: LCCOMB_X36_Y37_N8
\Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = ((\C[0]~input_o\ $ (temp(4) $ (\Add0~7\)))) # (GND)
-- \Add0~9\ = CARRY((\C[0]~input_o\ & (temp(4) & !\Add0~7\)) # (!\C[0]~input_o\ & ((temp(4)) # (!\Add0~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~input_o\,
	datab => temp(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X36_Y37_N10
\Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (temp(5) & ((\C[0]~input_o\ & (!\Add0~9\)) # (!\C[0]~input_o\ & (\Add0~9\ & VCC)))) # (!temp(5) & ((\C[0]~input_o\ & ((\Add0~9\) # (GND))) # (!\C[0]~input_o\ & (!\Add0~9\))))
-- \Add0~11\ = CARRY((temp(5) & (\C[0]~input_o\ & !\Add0~9\)) # (!temp(5) & ((\C[0]~input_o\) # (!\Add0~9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => temp(5),
	datab => \C[0]~input_o\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X36_Y37_N12
\Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = ((temp(6) $ (\C[0]~input_o\ $ (\Add0~11\)))) # (GND)
-- \Add0~13\ = CARRY((temp(6) & ((!\Add0~11\) # (!\C[0]~input_o\))) # (!temp(6) & (!\C[0]~input_o\ & !\Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => temp(6),
	datab => \C[0]~input_o\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X36_Y37_N14
\Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (temp(7) & ((\C[0]~input_o\ & (!\Add0~13\)) # (!\C[0]~input_o\ & (\Add0~13\ & VCC)))) # (!temp(7) & ((\C[0]~input_o\ & ((\Add0~13\) # (GND))) # (!\C[0]~input_o\ & (!\Add0~13\))))
-- \Add0~15\ = CARRY((temp(7) & (\C[0]~input_o\ & !\Add0~13\)) # (!temp(7) & ((\C[0]~input_o\) # (!\Add0~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => temp(7),
	datab => \C[0]~input_o\,
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X36_Y37_N16
\Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = ((\C[0]~input_o\ $ (temp(8) $ (\Add0~15\)))) # (GND)
-- \Add0~17\ = CARRY((\C[0]~input_o\ & (temp(8) & !\Add0~15\)) # (!\C[0]~input_o\ & ((temp(8)) # (!\Add0~15\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~input_o\,
	datab => temp(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X36_Y37_N18
\Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (temp(9) & ((\C[0]~input_o\ & (!\Add0~17\)) # (!\C[0]~input_o\ & (\Add0~17\ & VCC)))) # (!temp(9) & ((\C[0]~input_o\ & ((\Add0~17\) # (GND))) # (!\C[0]~input_o\ & (!\Add0~17\))))
-- \Add0~19\ = CARRY((temp(9) & (\C[0]~input_o\ & !\Add0~17\)) # (!temp(9) & ((\C[0]~input_o\) # (!\Add0~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => temp(9),
	datab => \C[0]~input_o\,
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X36_Y37_N20
\Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = ((temp(10) $ (\C[0]~input_o\ $ (\Add0~19\)))) # (GND)
-- \Add0~21\ = CARRY((temp(10) & ((!\Add0~19\) # (!\C[0]~input_o\))) # (!temp(10) & (!\C[0]~input_o\ & !\Add0~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => temp(10),
	datab => \C[0]~input_o\,
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X36_Y37_N22
\Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\C[0]~input_o\ & ((temp(11) & (!\Add0~21\)) # (!temp(11) & ((\Add0~21\) # (GND))))) # (!\C[0]~input_o\ & ((temp(11) & (\Add0~21\ & VCC)) # (!temp(11) & (!\Add0~21\))))
-- \Add0~23\ = CARRY((\C[0]~input_o\ & ((!\Add0~21\) # (!temp(11)))) # (!\C[0]~input_o\ & (!temp(11) & !\Add0~21\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~input_o\,
	datab => temp(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X36_Y37_N24
\Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = ((\C[0]~input_o\ $ (temp(12) $ (\Add0~23\)))) # (GND)
-- \Add0~25\ = CARRY((\C[0]~input_o\ & (temp(12) & !\Add0~23\)) # (!\C[0]~input_o\ & ((temp(12)) # (!\Add0~23\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~input_o\,
	datab => temp(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X36_Y37_N26
\Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (temp(13) & ((\C[0]~input_o\ & (!\Add0~25\)) # (!\C[0]~input_o\ & (\Add0~25\ & VCC)))) # (!temp(13) & ((\C[0]~input_o\ & ((\Add0~25\) # (GND))) # (!\C[0]~input_o\ & (!\Add0~25\))))
-- \Add0~27\ = CARRY((temp(13) & (\C[0]~input_o\ & !\Add0~25\)) # (!temp(13) & ((\C[0]~input_o\) # (!\Add0~25\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => temp(13),
	datab => \C[0]~input_o\,
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X36_Y37_N28
\Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = ((\C[0]~input_o\ $ (temp(14) $ (\Add0~27\)))) # (GND)
-- \Add0~29\ = CARRY((\C[0]~input_o\ & (temp(14) & !\Add0~27\)) # (!\C[0]~input_o\ & ((temp(14)) # (!\Add0~27\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~input_o\,
	datab => temp(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X36_Y37_N30
\Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = \C[0]~input_o\ $ (\Add0~29\ $ (!temp(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \C[0]~input_o\,
	datad => temp(15),
	cin => \Add0~29\,
	combout => \Add0~30_combout\);

-- Location: IOIBUF_X29_Y39_N8
\ln[15]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(15),
	o => \ln[15]~input_o\);

-- Location: LCCOMB_X34_Y37_N2
\Mux0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~0_combout\ = (\C[1]~input_o\ & ((temp(14)))) # (!\C[1]~input_o\ & (\ln[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C[1]~input_o\,
	datac => \ln[15]~input_o\,
	datad => temp(14),
	combout => \Mux0~0_combout\);

-- Location: LCCOMB_X34_Y37_N24
\Mux0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~1_combout\ = (\C[2]~input_o\ & (\Mux0~0_combout\ & ((!\C[1]~input_o\) # (!\C[0]~input_o\)))) # (!\C[2]~input_o\ & (\C[0]~input_o\ $ ((\C[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C[2]~input_o\,
	datab => \C[0]~input_o\,
	datac => \C[1]~input_o\,
	datad => \Mux0~0_combout\,
	combout => \Mux0~1_combout\);

-- Location: LCCOMB_X35_Y37_N8
\Mux0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux0~2_combout\ = (\C[2]~input_o\ & (((\Mux0~1_combout\)))) # (!\C[2]~input_o\ & ((\Mux0~1_combout\ & (\Add0~30_combout\)) # (!\Mux0~1_combout\ & ((temp(15))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~30_combout\,
	datab => \C[2]~input_o\,
	datac => temp(15),
	datad => \Mux0~1_combout\,
	combout => \Mux0~2_combout\);

-- Location: IOIBUF_X34_Y39_N22
\rst~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X35_Y37_N9
\temp[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Mux0~2_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(15));

-- Location: LCCOMB_X34_Y37_N16
\temp~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~38_combout\ = (\temp[5]~24_combout\ & (((\ln[14]~input_o\)) # (!\temp[8]~23_combout\))) # (!\temp[5]~24_combout\ & (\temp[8]~23_combout\ & ((temp(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~24_combout\,
	datab => \temp[8]~23_combout\,
	datac => \ln[14]~input_o\,
	datad => temp(15),
	combout => \temp~38_combout\);

-- Location: LCCOMB_X35_Y37_N22
\temp~39\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~39_combout\ = (\temp[8]~23_combout\ & (((\temp~38_combout\)))) # (!\temp[8]~23_combout\ & ((\temp~38_combout\ & ((\Add0~28_combout\))) # (!\temp~38_combout\ & (temp(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => temp(13),
	datac => \temp~38_combout\,
	datad => \Add0~28_combout\,
	combout => \temp~39_combout\);

-- Location: LCCOMB_X34_Y37_N6
\temp~27\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~27_combout\ = (\rst~input_o\) # ((\C[2]~input_o\) # (\C[0]~input_o\ $ (\C[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rst~input_o\,
	datab => \C[0]~input_o\,
	datac => \C[1]~input_o\,
	datad => \C[2]~input_o\,
	combout => \temp~27_combout\);

-- Location: FF_X35_Y37_N23
\temp[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~39_combout\,
	sclr => \rst~input_o\,
	ena => \temp~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(14));

-- Location: IOIBUF_X31_Y39_N1
\ln[13]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(13),
	o => \ln[13]~input_o\);

-- Location: LCCOMB_X35_Y37_N10
\temp~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~36_combout\ = (\temp[8]~23_combout\ & (((\ln[13]~input_o\)) # (!\temp[5]~24_combout\))) # (!\temp[8]~23_combout\ & (\temp[5]~24_combout\ & ((\Add0~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => \temp[5]~24_combout\,
	datac => \ln[13]~input_o\,
	datad => \Add0~26_combout\,
	combout => \temp~36_combout\);

-- Location: LCCOMB_X35_Y37_N16
\temp~37\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~37_combout\ = (\temp[5]~24_combout\ & (((\temp~36_combout\)))) # (!\temp[5]~24_combout\ & ((\temp~36_combout\ & (temp(14))) # (!\temp~36_combout\ & ((temp(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~24_combout\,
	datab => temp(14),
	datac => temp(12),
	datad => \temp~36_combout\,
	combout => \temp~37_combout\);

-- Location: FF_X35_Y37_N17
\temp[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~37_combout\,
	sclr => \rst~input_o\,
	ena => \temp~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(13));

-- Location: IOIBUF_X34_Y39_N8
\ln[12]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(12),
	o => \ln[12]~input_o\);

-- Location: LCCOMB_X35_Y37_N20
\temp~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~34_combout\ = (\temp[8]~23_combout\ & (((!\temp[5]~24_combout\)))) # (!\temp[8]~23_combout\ & ((\temp[5]~24_combout\ & ((\Add0~24_combout\))) # (!\temp[5]~24_combout\ & (temp(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => temp(11),
	datac => \temp[5]~24_combout\,
	datad => \Add0~24_combout\,
	combout => \temp~34_combout\);

-- Location: LCCOMB_X35_Y37_N30
\temp~35\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~35_combout\ = (\temp[8]~23_combout\ & ((\temp~34_combout\ & (temp(13))) # (!\temp~34_combout\ & ((\ln[12]~input_o\))))) # (!\temp[8]~23_combout\ & (((\temp~34_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => temp(13),
	datac => \ln[12]~input_o\,
	datad => \temp~34_combout\,
	combout => \temp~35_combout\);

-- Location: FF_X35_Y37_N31
\temp[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~35_combout\,
	sclr => \rst~input_o\,
	ena => \temp~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(12));

-- Location: IOIBUF_X31_Y39_N29
\ln[11]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(11),
	o => \ln[11]~input_o\);

-- Location: LCCOMB_X35_Y37_N2
\temp~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~32_combout\ = (\temp[8]~23_combout\ & (((\ln[11]~input_o\)) # (!\temp[5]~24_combout\))) # (!\temp[8]~23_combout\ & (\temp[5]~24_combout\ & ((\Add0~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => \temp[5]~24_combout\,
	datac => \ln[11]~input_o\,
	datad => \Add0~22_combout\,
	combout => \temp~32_combout\);

-- Location: LCCOMB_X35_Y37_N24
\temp~33\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~33_combout\ = (\temp[5]~24_combout\ & (((\temp~32_combout\)))) # (!\temp[5]~24_combout\ & ((\temp~32_combout\ & ((temp(12)))) # (!\temp~32_combout\ & (temp(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~24_combout\,
	datab => temp(10),
	datac => temp(12),
	datad => \temp~32_combout\,
	combout => \temp~33_combout\);

-- Location: FF_X35_Y37_N25
\temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~33_combout\,
	sclr => \rst~input_o\,
	ena => \temp~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(11));

-- Location: IOIBUF_X31_Y39_N22
\ln[10]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(10),
	o => \ln[10]~input_o\);

-- Location: LCCOMB_X35_Y37_N28
\temp~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~30_combout\ = (\temp[5]~24_combout\ & (((\Add0~20_combout\ & !\temp[8]~23_combout\)))) # (!\temp[5]~24_combout\ & ((temp(9)) # ((\temp[8]~23_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~24_combout\,
	datab => temp(9),
	datac => \Add0~20_combout\,
	datad => \temp[8]~23_combout\,
	combout => \temp~30_combout\);

-- Location: LCCOMB_X35_Y37_N14
\temp~31\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~31_combout\ = (\temp[8]~23_combout\ & ((\temp~30_combout\ & (temp(11))) # (!\temp~30_combout\ & ((\ln[10]~input_o\))))) # (!\temp[8]~23_combout\ & (((\temp~30_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => temp(11),
	datac => \ln[10]~input_o\,
	datad => \temp~30_combout\,
	combout => \temp~31_combout\);

-- Location: FF_X35_Y37_N15
\temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~31_combout\,
	sclr => \rst~input_o\,
	ena => \temp~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(10));

-- Location: IOIBUF_X31_Y39_N8
\ln[9]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(9),
	o => \ln[9]~input_o\);

-- Location: LCCOMB_X35_Y37_N18
\temp~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~28_combout\ = (\temp[8]~23_combout\ & (((\ln[9]~input_o\)) # (!\temp[5]~24_combout\))) # (!\temp[8]~23_combout\ & (\temp[5]~24_combout\ & ((\Add0~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => \temp[5]~24_combout\,
	datac => \ln[9]~input_o\,
	datad => \Add0~18_combout\,
	combout => \temp~28_combout\);

-- Location: LCCOMB_X35_Y37_N0
\temp~29\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~29_combout\ = (\temp[5]~24_combout\ & (((\temp~28_combout\)))) # (!\temp[5]~24_combout\ & ((\temp~28_combout\ & ((temp(10)))) # (!\temp~28_combout\ & (temp(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~24_combout\,
	datab => temp(8),
	datac => temp(10),
	datad => \temp~28_combout\,
	combout => \temp~29_combout\);

-- Location: FF_X35_Y37_N1
\temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~29_combout\,
	sclr => \rst~input_o\,
	ena => \temp~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(9));

-- Location: IOIBUF_X31_Y39_N15
\ln[8]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(8),
	o => \ln[8]~input_o\);

-- Location: LCCOMB_X35_Y37_N12
\temp~25\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~25_combout\ = (\temp[8]~23_combout\ & (!\temp[5]~24_combout\)) # (!\temp[8]~23_combout\ & ((\temp[5]~24_combout\ & ((\Add0~16_combout\))) # (!\temp[5]~24_combout\ & (temp(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => \temp[5]~24_combout\,
	datac => temp(7),
	datad => \Add0~16_combout\,
	combout => \temp~25_combout\);

-- Location: LCCOMB_X35_Y37_N6
\temp~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~26_combout\ = (\temp[8]~23_combout\ & ((\temp~25_combout\ & (temp(9))) # (!\temp~25_combout\ & ((\ln[8]~input_o\))))) # (!\temp[8]~23_combout\ & (((\temp~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[8]~23_combout\,
	datab => temp(9),
	datac => \ln[8]~input_o\,
	datad => \temp~25_combout\,
	combout => \temp~26_combout\);

-- Location: FF_X35_Y37_N7
\temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~26_combout\,
	sclr => \rst~input_o\,
	ena => \temp~27_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(8));

-- Location: LCCOMB_X38_Y37_N18
\temp~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~20_combout\ = (\temp[5]~0_combout\ & (((\C[0]~input_o\)))) # (!\temp[5]~0_combout\ & ((\C[0]~input_o\ & ((temp(8)))) # (!\C[0]~input_o\ & (temp(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => temp(7),
	datac => \C[0]~input_o\,
	datad => temp(8),
	combout => \temp~20_combout\);

-- Location: LCCOMB_X38_Y37_N24
\temp~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~21_combout\ = (\temp[5]~0_combout\ & ((\temp~20_combout\ & (\ln[7]~input_o\)) # (!\temp~20_combout\ & ((temp(6)))))) # (!\temp[5]~0_combout\ & (((\temp~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \ln[7]~input_o\,
	datac => temp(6),
	datad => \temp~20_combout\,
	combout => \temp~21_combout\);

-- Location: LCCOMB_X37_Y37_N20
\temp~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~22_combout\ = (\temp[5]~3_combout\ & (\temp~21_combout\)) # (!\temp[5]~3_combout\ & ((\Add0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \temp~21_combout\,
	datac => \temp[5]~3_combout\,
	datad => \Add0~14_combout\,
	combout => \temp~22_combout\);

-- Location: FF_X37_Y37_N21
\temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~22_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(7));

-- Location: LCCOMB_X38_Y37_N28
\temp~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~17_combout\ = (\temp[5]~0_combout\ & (\C[0]~input_o\)) # (!\temp[5]~0_combout\ & ((\C[0]~input_o\ & ((temp(7)))) # (!\C[0]~input_o\ & (temp(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \C[0]~input_o\,
	datac => temp(6),
	datad => temp(7),
	combout => \temp~17_combout\);

-- Location: LCCOMB_X37_Y37_N22
\temp~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~18_combout\ = (\temp[5]~0_combout\ & ((\temp~17_combout\ & ((\ln[6]~input_o\))) # (!\temp~17_combout\ & (temp(5))))) # (!\temp[5]~0_combout\ & (((\temp~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => temp(5),
	datac => \ln[6]~input_o\,
	datad => \temp~17_combout\,
	combout => \temp~18_combout\);

-- Location: LCCOMB_X37_Y37_N6
\temp~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~19_combout\ = (\temp[5]~3_combout\ & (\temp~18_combout\)) # (!\temp[5]~3_combout\ & ((\Add0~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \temp[5]~3_combout\,
	datac => \temp~18_combout\,
	datad => \Add0~12_combout\,
	combout => \temp~19_combout\);

-- Location: FF_X37_Y37_N7
\temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~19_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(6));

-- Location: LCCOMB_X37_Y37_N26
\temp~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~14_combout\ = (\temp[5]~0_combout\ & (((\C[0]~input_o\)))) # (!\temp[5]~0_combout\ & ((\C[0]~input_o\ & ((temp(6)))) # (!\C[0]~input_o\ & (temp(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => temp(5),
	datac => \C[0]~input_o\,
	datad => temp(6),
	combout => \temp~14_combout\);

-- Location: LCCOMB_X37_Y37_N24
\temp~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~15_combout\ = (\temp[5]~0_combout\ & ((\temp~14_combout\ & (\ln[5]~input_o\)) # (!\temp~14_combout\ & ((temp(4)))))) # (!\temp[5]~0_combout\ & (((\temp~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \ln[5]~input_o\,
	datac => \temp~14_combout\,
	datad => temp(4),
	combout => \temp~15_combout\);

-- Location: LCCOMB_X37_Y37_N4
\temp~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~16_combout\ = (\temp[5]~3_combout\ & (\temp~15_combout\)) # (!\temp[5]~3_combout\ & ((\Add0~10_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \temp~15_combout\,
	datac => \temp[5]~3_combout\,
	datad => \Add0~10_combout\,
	combout => \temp~16_combout\);

-- Location: FF_X37_Y37_N5
\temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \temp~16_combout\,
	sclr => \rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(5));

-- Location: LCCOMB_X37_Y37_N16
\temp~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~11_combout\ = (\temp[5]~0_combout\ & (\C[0]~input_o\)) # (!\temp[5]~0_combout\ & ((\C[0]~input_o\ & (temp(5))) # (!\C[0]~input_o\ & ((temp(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \C[0]~input_o\,
	datac => temp(5),
	datad => temp(4),
	combout => \temp~11_combout\);

-- Location: LCCOMB_X37_Y37_N30
\temp~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~12_combout\ = (\temp[5]~0_combout\ & ((\temp~11_combout\ & (\ln[4]~input_o\)) # (!\temp~11_combout\ & ((temp(3)))))) # (!\temp[5]~0_combout\ & (((\temp~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \ln[4]~input_o\,
	datac => temp(3),
	datad => \temp~11_combout\,
	combout => \temp~12_combout\);

-- Location: LCCOMB_X37_Y37_N12
\temp~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~13_combout\ = (\temp[5]~3_combout\ & (\temp~12_combout\)) # (!\temp[5]~3_combout\ & ((\Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \temp[5]~3_combout\,
	datac => \temp~12_combout\,
	datad => \Add0~8_combout\,
	combout => \temp~13_combout\);

-- Location: FF_X36_Y37_N3
\temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \temp~13_combout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(4));

-- Location: LCCOMB_X37_Y37_N2
\temp~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~8_combout\ = (\temp[5]~0_combout\ & (\C[0]~input_o\)) # (!\temp[5]~0_combout\ & ((\C[0]~input_o\ & ((temp(4)))) # (!\C[0]~input_o\ & (temp(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \C[0]~input_o\,
	datac => temp(3),
	datad => temp(4),
	combout => \temp~8_combout\);

-- Location: LCCOMB_X37_Y37_N28
\temp~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~9_combout\ = (\temp[5]~0_combout\ & ((\temp~8_combout\ & ((\ln[3]~input_o\))) # (!\temp~8_combout\ & (temp(2))))) # (!\temp[5]~0_combout\ & (((\temp~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp(2),
	datab => \ln[3]~input_o\,
	datac => \temp[5]~0_combout\,
	datad => \temp~8_combout\,
	combout => \temp~9_combout\);

-- Location: LCCOMB_X37_Y37_N10
\temp~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~10_combout\ = (\temp[5]~3_combout\ & ((\temp~9_combout\))) # (!\temp[5]~3_combout\ & (\Add0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \temp[5]~3_combout\,
	datac => \Add0~6_combout\,
	datad => \temp~9_combout\,
	combout => \temp~10_combout\);

-- Location: FF_X36_Y37_N17
\temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \temp~10_combout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(3));

-- Location: LCCOMB_X37_Y37_N0
\temp~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~5_combout\ = (\temp[5]~0_combout\ & (\C[0]~input_o\)) # (!\temp[5]~0_combout\ & ((\C[0]~input_o\ & (temp(3))) # (!\C[0]~input_o\ & ((temp(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \C[0]~input_o\,
	datac => temp(3),
	datad => temp(2),
	combout => \temp~5_combout\);

-- Location: LCCOMB_X37_Y37_N18
\temp~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~6_combout\ = (\temp[5]~0_combout\ & ((\temp~5_combout\ & (\ln[2]~input_o\)) # (!\temp~5_combout\ & ((temp(1)))))) # (!\temp[5]~0_combout\ & (((\temp~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \ln[2]~input_o\,
	datac => temp(1),
	datad => \temp~5_combout\,
	combout => \temp~6_combout\);

-- Location: LCCOMB_X37_Y37_N8
\temp~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~7_combout\ = (\temp[5]~3_combout\ & ((\temp~6_combout\))) # (!\temp[5]~3_combout\ & (\Add0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \temp[5]~3_combout\,
	datac => \Add0~4_combout\,
	datad => \temp~6_combout\,
	combout => \temp~7_combout\);

-- Location: FF_X36_Y37_N5
\temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \temp~7_combout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(2));

-- Location: LCCOMB_X34_Y37_N28
\temp~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~1_combout\ = (\temp[5]~0_combout\ & (\C[0]~input_o\)) # (!\temp[5]~0_combout\ & ((\C[0]~input_o\ & ((temp(2)))) # (!\C[0]~input_o\ & (temp(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~0_combout\,
	datab => \C[0]~input_o\,
	datac => temp(1),
	datad => temp(2),
	combout => \temp~1_combout\);

-- Location: LCCOMB_X34_Y37_N26
\temp~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~2_combout\ = (\temp[5]~0_combout\ & ((\temp~1_combout\ & ((\ln[1]~input_o\))) # (!\temp~1_combout\ & (temp(0))))) # (!\temp[5]~0_combout\ & (((\temp~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp(0),
	datab => \ln[1]~input_o\,
	datac => \temp[5]~0_combout\,
	datad => \temp~1_combout\,
	combout => \temp~2_combout\);

-- Location: LCCOMB_X35_Y37_N26
\temp~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \temp~4_combout\ = (\temp[5]~3_combout\ & (\temp~2_combout\)) # (!\temp[5]~3_combout\ & ((\Add0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \temp[5]~3_combout\,
	datac => \temp~2_combout\,
	datad => \Add0~2_combout\,
	combout => \temp~4_combout\);

-- Location: FF_X36_Y37_N7
\temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \temp~4_combout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(1));

-- Location: LCCOMB_X34_Y37_N4
\Mux15~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~1_combout\ = (\C[1]~input_o\ & (temp(1) & \C[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C[1]~input_o\,
	datac => temp(1),
	datad => \C[2]~input_o\,
	combout => \Mux15~1_combout\);

-- Location: LCCOMB_X34_Y37_N22
\Mux15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~0_combout\ = (\C[1]~input_o\ & (((!\C[2]~input_o\ & \Add0~0_combout\)))) # (!\C[1]~input_o\ & (temp(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp(0),
	datab => \C[2]~input_o\,
	datac => \C[1]~input_o\,
	datad => \Add0~0_combout\,
	combout => \Mux15~0_combout\);

-- Location: IOIBUF_X20_Y39_N8
\ln[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ln(0),
	o => \ln[0]~input_o\);

-- Location: LCCOMB_X34_Y37_N10
\Mux15~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~2_combout\ = (\C[2]~input_o\ & (\ln[0]~input_o\ & (!\C[1]~input_o\))) # (!\C[2]~input_o\ & ((\C[1]~input_o\ & (\ln[0]~input_o\)) # (!\C[1]~input_o\ & ((\Add0~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C[2]~input_o\,
	datab => \ln[0]~input_o\,
	datac => \C[1]~input_o\,
	datad => \Add0~0_combout\,
	combout => \Mux15~2_combout\);

-- Location: LCCOMB_X34_Y37_N20
\Mux15~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Mux15~3_combout\ = (\C[0]~input_o\ & ((\Mux15~1_combout\) # ((\Mux15~2_combout\)))) # (!\C[0]~input_o\ & (((\Mux15~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \C[0]~input_o\,
	datab => \Mux15~1_combout\,
	datac => \Mux15~0_combout\,
	datad => \Mux15~2_combout\,
	combout => \Mux15~3_combout\);

-- Location: FF_X36_Y37_N19
\temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \Mux15~3_combout\,
	sclr => \rst~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(0));

-- Location: IOIBUF_X29_Y0_N1
\E[0]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E(0),
	o => \E[0]~input_o\);

-- Location: IOIBUF_X46_Y54_N22
\E[1]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E(1),
	o => \E[1]~input_o\);

-- Location: IOIBUF_X29_Y0_N29
\E[2]~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_E(2),
	o => \E[2]~input_o\);

-- Location: LCCOMB_X37_Y37_N14
\Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!temp(6) & (!temp(5) & (!temp(3) & !temp(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp(6),
	datab => temp(5),
	datac => temp(3),
	datad => temp(4),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X34_Y37_N8
\Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!temp(0) & (!temp(1) & (!temp(2) & !temp(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp(0),
	datab => temp(1),
	datac => temp(2),
	datad => temp(15),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X35_Y37_N4
\Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!temp(12) & (!temp(13) & (!temp(14) & !temp(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp(12),
	datab => temp(13),
	datac => temp(14),
	datad => temp(11),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X38_Y37_N12
\Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!temp(9) & (!temp(7) & (!temp(10) & !temp(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => temp(9),
	datab => temp(7),
	datac => temp(10),
	datad => temp(8),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X38_Y37_N14
\Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~1_combout\ & (\Equal0~0_combout\ & (\Equal0~3_combout\ & \Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~3_combout\,
	datad => \Equal0~2_combout\,
	combout => \Equal0~4_combout\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_end_addr => -1,
	addr_range2_offset => -1,
	addr_range3_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_N <= \N~output_o\;

ww_Z <= \Z~output_o\;

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;

ww_Q(3) <= \Q[3]~output_o\;

ww_Q(4) <= \Q[4]~output_o\;

ww_Q(5) <= \Q[5]~output_o\;

ww_Q(6) <= \Q[6]~output_o\;

ww_Q(7) <= \Q[7]~output_o\;

ww_Q(8) <= \Q[8]~output_o\;

ww_Q(9) <= \Q[9]~output_o\;

ww_Q(10) <= \Q[10]~output_o\;

ww_Q(11) <= \Q[11]~output_o\;

ww_Q(12) <= \Q[12]~output_o\;

ww_Q(13) <= \Q[13]~output_o\;

ww_Q(14) <= \Q[14]~output_o\;

ww_Q(15) <= \Q[15]~output_o\;

ww_Y(0) <= \Y[0]~output_o\;

ww_Y(1) <= \Y[1]~output_o\;

ww_Y(2) <= \Y[2]~output_o\;

ww_Y(3) <= \Y[3]~output_o\;

ww_Y(4) <= \Y[4]~output_o\;

ww_Y(5) <= \Y[5]~output_o\;

ww_Y(6) <= \Y[6]~output_o\;

ww_Y(7) <= \Y[7]~output_o\;

ww_Y(8) <= \Y[8]~output_o\;

ww_Y(9) <= \Y[9]~output_o\;

ww_Y(10) <= \Y[10]~output_o\;

ww_Y(11) <= \Y[11]~output_o\;

ww_Y(12) <= \Y[12]~output_o\;

ww_Y(13) <= \Y[13]~output_o\;

ww_Y(14) <= \Y[14]~output_o\;

ww_Y(15) <= \Y[15]~output_o\;
END structure;


