-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
-- CREATED		"Fri Apr 15 13:50:49 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_Enigma_Final IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		key_press :  IN  STD_LOGIC;
		input :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		output :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END g22_Enigma_Final;

ARCHITECTURE bdf_type OF g22_Enigma_Final IS 

COMPONENT g22_enigma_ui
	PORT(clk : IN STD_LOGIC;
		 keyPress : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 reflector_code : OUT STD_LOGIC;
		 direction_0 : OUT STD_LOGIC;
		 direction_1 : OUT STD_LOGIC;
		 init : OUT STD_LOGIC;
		 reset_out : OUT STD_LOGIC;
		 data : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 input_code : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 knock_pt_m : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 knock_pt_r : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ring_setting_l : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ring_setting_m : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ring_setting_r : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rotor_tyoe_r : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rotor_type_l : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rotor_type_m : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_full_enigma
	PORT(clk : IN STD_LOGIC;
		 init : IN STD_LOGIC;
		 keyPress : IN STD_LOGIC;
		 reflector_code : IN STD_LOGIC;
		 direction_0 : IN STD_LOGIC;
		 direction_1 : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 input_code : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 knock_pt_m : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 knock_pt_r : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ring_setting_l : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ring_setting_m : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ring_setting_r : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rotor_tyoe_r : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rotor_type_l : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 rotor_type_m : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 output_code : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(1 DOWNTO 0);


BEGIN 



b2v_inst : g22_enigma_ui
PORT MAP(clk => clk,
		 keyPress => key_press,
		 reset => reset,
		 input => input,
		 reflector_code => SYNTHESIZED_WIRE_1,
		 direction_0 => SYNTHESIZED_WIRE_2,
		 direction_1 => SYNTHESIZED_WIRE_3,
		 init => SYNTHESIZED_WIRE_0,
		 reset_out => SYNTHESIZED_WIRE_4,
		 data => SYNTHESIZED_WIRE_5,
		 input_code => SYNTHESIZED_WIRE_6,
		 knock_pt_m => SYNTHESIZED_WIRE_7,
		 knock_pt_r => SYNTHESIZED_WIRE_8,
		 ring_setting_l => SYNTHESIZED_WIRE_9,
		 ring_setting_m => SYNTHESIZED_WIRE_10,
		 ring_setting_r => SYNTHESIZED_WIRE_11,
		 rotor_tyoe_r => SYNTHESIZED_WIRE_12,
		 rotor_type_l => SYNTHESIZED_WIRE_13,
		 rotor_type_m => SYNTHESIZED_WIRE_14);


b2v_inst2 : g22_full_enigma
PORT MAP(clk => clk,
		 init => SYNTHESIZED_WIRE_0,
		 keyPress => key_press,
		 reflector_code => SYNTHESIZED_WIRE_1,
		 direction_0 => SYNTHESIZED_WIRE_2,
		 direction_1 => SYNTHESIZED_WIRE_3,
		 reset => SYNTHESIZED_WIRE_4,
		 data => SYNTHESIZED_WIRE_5,
		 input_code => SYNTHESIZED_WIRE_6,
		 knock_pt_m => SYNTHESIZED_WIRE_7,
		 knock_pt_r => SYNTHESIZED_WIRE_8,
		 ring_setting_l => SYNTHESIZED_WIRE_9,
		 ring_setting_m => SYNTHESIZED_WIRE_10,
		 ring_setting_r => SYNTHESIZED_WIRE_11,
		 rotor_tyoe_r => SYNTHESIZED_WIRE_12,
		 rotor_type_l => SYNTHESIZED_WIRE_13,
		 rotor_type_m => SYNTHESIZED_WIRE_14,
		 output_code => output);


END bdf_type;