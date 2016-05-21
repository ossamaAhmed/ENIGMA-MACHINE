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
-- CREATED		"Wed Apr 13 19:04:43 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_rotor_R IS 
	PORT
	(
		direction_0 :  IN  STD_LOGIC;
		direction_1 :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		load :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		data :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		input_code :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		input_code_inv1 :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ring_setting :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rotor_type :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		count :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		output_code :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		output_code_inverted :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END g22_rotor_R;

ARCHITECTURE bdf_type OF g22_rotor_R IS 

COMPONENT g22_0_25_counter
	PORT(count_enable : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 count : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_5_26_decoder
	PORT(INDEX : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 Error : OUT STD_LOGIC;
		 D : OUT STD_LOGIC_VECTOR(25 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_26_5_encoder
	PORT(letter : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
		 ERROR : OUT STD_LOGIC;
		 INDEX : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_barrel_shifter
	PORT(direction : IN STD_LOGIC;
		 letter : IN STD_LOGIC_VECTOR(25 DOWNTO 0);
		 shift : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 lettershifted : OUT STD_LOGIC_VECTOR(25 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_permutation
	PORT(input_code : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 rotor_type : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		 inv_output_code : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 output_code : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_20 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_21 :  STD_LOGIC_VECTOR(25 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_23 :  STD_LOGIC_VECTOR(4 DOWNTO 0);


BEGIN 
count <= SYNTHESIZED_WIRE_24;



b2v_inst : g22_0_25_counter
PORT MAP(count_enable => enable,
		 clk => clk,
		 reset => reset,
		 load => load,
		 input => data,
		 count => SYNTHESIZED_WIRE_24);


b2v_inst1 : g22_5_26_decoder
PORT MAP(INDEX => input_code,
		 D => SYNTHESIZED_WIRE_21);


SYNTHESIZED_WIRE_19 <= NOT(direction_1);



SYNTHESIZED_WIRE_16 <= NOT(direction_0);



b2v_inst12 : g22_5_26_decoder
PORT MAP(INDEX => input_code_inv1,
		 D => SYNTHESIZED_WIRE_3);


b2v_inst14 : g22_5_26_decoder
PORT MAP(INDEX => SYNTHESIZED_WIRE_0,
		 D => SYNTHESIZED_WIRE_7);


b2v_inst15 : g22_26_5_encoder
PORT MAP(letter => SYNTHESIZED_WIRE_1,
		 INDEX => SYNTHESIZED_WIRE_5);


b2v_inst16 : g22_barrel_shifter
PORT MAP(direction => direction_1,
		 letter => SYNTHESIZED_WIRE_2,
		 shift => ring_setting,
		 lettershifted => SYNTHESIZED_WIRE_1);


b2v_inst17 : g22_barrel_shifter
PORT MAP(direction => direction_0,
		 letter => SYNTHESIZED_WIRE_3,
		 shift => SYNTHESIZED_WIRE_24,
		 lettershifted => SYNTHESIZED_WIRE_2);


b2v_inst18 : g22_permutation
PORT MAP(input_code => SYNTHESIZED_WIRE_5,
		 rotor_type => rotor_type,
		 inv_output_code => SYNTHESIZED_WIRE_0);


b2v_inst19 : g22_barrel_shifter
PORT MAP(direction => SYNTHESIZED_WIRE_6,
		 letter => SYNTHESIZED_WIRE_7,
		 shift => ring_setting,
		 lettershifted => SYNTHESIZED_WIRE_10);


b2v_inst2 : g22_5_26_decoder
PORT MAP(INDEX => SYNTHESIZED_WIRE_8,
		 D => SYNTHESIZED_WIRE_20);


b2v_inst20 : g22_barrel_shifter
PORT MAP(direction => SYNTHESIZED_WIRE_9,
		 letter => SYNTHESIZED_WIRE_10,
		 shift => SYNTHESIZED_WIRE_24,
		 lettershifted => SYNTHESIZED_WIRE_12);


b2v_inst21 : g22_26_5_encoder
PORT MAP(letter => SYNTHESIZED_WIRE_12,
		 INDEX => output_code_inverted);


SYNTHESIZED_WIRE_6 <= NOT(direction_1);



SYNTHESIZED_WIRE_9 <= NOT(direction_0);



b2v_inst3 : g22_26_5_encoder
PORT MAP(letter => SYNTHESIZED_WIRE_13,
		 INDEX => SYNTHESIZED_WIRE_23);


b2v_inst4 : g22_26_5_encoder
PORT MAP(letter => SYNTHESIZED_WIRE_14,
		 INDEX => output_code);


b2v_inst5 : g22_barrel_shifter
PORT MAP(direction => direction_1,
		 letter => SYNTHESIZED_WIRE_15,
		 shift => ring_setting,
		 lettershifted => SYNTHESIZED_WIRE_13);


b2v_inst6 : g22_barrel_shifter
PORT MAP(direction => SYNTHESIZED_WIRE_16,
		 letter => SYNTHESIZED_WIRE_17,
		 shift => SYNTHESIZED_WIRE_24,
		 lettershifted => SYNTHESIZED_WIRE_14);


b2v_inst7 : g22_barrel_shifter
PORT MAP(direction => SYNTHESIZED_WIRE_19,
		 letter => SYNTHESIZED_WIRE_20,
		 shift => ring_setting,
		 lettershifted => SYNTHESIZED_WIRE_17);


b2v_inst8 : g22_barrel_shifter
PORT MAP(direction => direction_0,
		 letter => SYNTHESIZED_WIRE_21,
		 shift => SYNTHESIZED_WIRE_24,
		 lettershifted => SYNTHESIZED_WIRE_15);


b2v_inst9 : g22_permutation
PORT MAP(input_code => SYNTHESIZED_WIRE_23,
		 rotor_type => rotor_type,
		 output_code => SYNTHESIZED_WIRE_8);


END bdf_type;