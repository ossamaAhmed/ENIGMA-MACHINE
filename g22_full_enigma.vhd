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
-- CREATED		"Wed Apr 13 22:00:46 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_full_enigma IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		init :  IN  STD_LOGIC;
		keyPress : IN STD_LOGIC;
		reflector_code :  IN  STD_LOGIC;
		direction_0 :  IN  STD_LOGIC;
		direction_1 :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		data :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		input_code :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		knock_pt_m :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		knock_pt_r :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);  
		ring_setting_l :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ring_setting_m :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ring_setting_r :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rotor_tyoe_r :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		rotor_type_l :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		rotor_type_m :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		output_code :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)	);
END g22_full_enigma;

ARCHITECTURE bdf_type OF g22_full_enigma IS 

COMPONENT g22_pulse_gen
	PORT(clk : IN STD_LOGIC;
		 EPULSE : OUT STD_LOGIC;
		 Q : OUT STD_LOGIC_VECTOR(24 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_5_bit_comparator
	PORT(A : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 B : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 AeqB : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT g22_rotor_r
	PORT(direction_0 : IN STD_LOGIC;
		 direction_1 : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 input_code : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 input_code_inv1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 ring_setting : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rotor_type : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 count : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 output_code : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 output_code_inverted : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_reflector
	PORT(reflector_code : IN STD_LOGIC;
		 input_code : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 output_code : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_stecker
	PORT(input_code : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 output_code : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_rotor_stepper_fsm
	PORT(clk : IN STD_LOGIC;
		 keyPress : IN STD_LOGIC;
		 init : IN STD_LOGIC;
		 knock_m : IN STD_LOGIC;
		 knock_r : IN STD_LOGIC;
		 enable_r : OUT STD_LOGIC;
		 enable_l : OUT STD_LOGIC;
		 enable_m : OUT STD_LOGIC;
		 load : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(4 DOWNTO 0);


BEGIN 



b2v_inst : g22_pulse_gen
PORT MAP(clk => clk,
		 EPULSE => SYNTHESIZED_WIRE_12);


b2v_inst10 : g22_5_bit_comparator
PORT MAP(A => SYNTHESIZED_WIRE_0,
		 B => knock_pt_m,
		 AeqB => SYNTHESIZED_WIRE_14);


b2v_inst100 : g22_rotor_r
PORT MAP(direction_0 => direction_0,
		 direction_1 => direction_1,
		 enable => SYNTHESIZED_WIRE_1,
		 load => SYNTHESIZED_WIRE_20,
		 reset => reset,
		 clk => clk,
		 data => data,
		 input_code => SYNTHESIZED_WIRE_3,
		 input_code_inv1 => SYNTHESIZED_WIRE_4,
		 ring_setting => ring_setting_r,
		 rotor_type => rotor_tyoe_r,
		 count => SYNTHESIZED_WIRE_6,
		 output_code => SYNTHESIZED_WIRE_18,
		 output_code_inverted => SYNTHESIZED_WIRE_7);


b2v_inst11 : g22_reflector
PORT MAP(reflector_code => reflector_code,
		 input_code => SYNTHESIZED_WIRE_5,
		 output_code => SYNTHESIZED_WIRE_11);


b2v_inst12 : g22_5_bit_comparator
PORT MAP(A => SYNTHESIZED_WIRE_6,
		 B => knock_pt_r,
		 AeqB => SYNTHESIZED_WIRE_15);


b2v_inst120 : g22_stecker
PORT MAP(input_code => SYNTHESIZED_WIRE_7,
		 output_code => output_code);


SYNTHESIZED_WIRE_13 <= NOT(init);



b2v_inst34 : g22_stecker
PORT MAP(input_code => input_code,
		 output_code => SYNTHESIZED_WIRE_3);


b2v_inst8 : g22_rotor_r
PORT MAP(direction_0 => direction_0,
		 direction_1 => direction_1,
		 enable => SYNTHESIZED_WIRE_8,
		 load => SYNTHESIZED_WIRE_20,
		 reset => reset,
		 clk => clk,
		 data => data,
		 input_code => SYNTHESIZED_WIRE_10,
		 input_code_inv1 => SYNTHESIZED_WIRE_11,
		 ring_setting => ring_setting_l,
		 rotor_type => rotor_type_l,
		 output_code => SYNTHESIZED_WIRE_5,
		 output_code_inverted => SYNTHESIZED_WIRE_19);


b2v_inst9 : g22_rotor_stepper_fsm
PORT MAP(clk => clk,
		 keyPress => KeyPress,
		 init => SYNTHESIZED_WIRE_13,
		 knock_m => SYNTHESIZED_WIRE_14,
		 knock_r => SYNTHESIZED_WIRE_15,
		 enable_r => SYNTHESIZED_WIRE_1,
		 enable_l => SYNTHESIZED_WIRE_8,
		 enable_m => SYNTHESIZED_WIRE_16,
		 load => SYNTHESIZED_WIRE_20);


b2v_inst91 : g22_rotor_r
PORT MAP(direction_0 => direction_0,
		 direction_1 => direction_1,
		 enable => SYNTHESIZED_WIRE_16,
		 load => SYNTHESIZED_WIRE_20,
		 reset => reset,
		 clk => clk,
		 data => data,
		 input_code => SYNTHESIZED_WIRE_18,
		 input_code_inv1 => SYNTHESIZED_WIRE_19,
		 ring_setting => ring_setting_m,
		 rotor_type => rotor_type_m,
		 count => SYNTHESIZED_WIRE_0,
		 output_code => SYNTHESIZED_WIRE_10,
		 output_code_inverted => SYNTHESIZED_WIRE_4);


END bdf_type;