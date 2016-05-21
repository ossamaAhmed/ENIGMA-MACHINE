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
-- CREATED		"Mon Jan 25 14:44:32 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_5_bit_comparator IS 
	PORT
	(
		A :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		B :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		AeqB :  OUT  STD_LOGIC
	);
END g22_5_bit_comparator;

ARCHITECTURE behavior_g22_5_bit_comparator OF g22_5_bit_comparator IS 

SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_2 <= NOT(A(0) XOR B(0));


SYNTHESIZED_WIRE_3 <= NOT(A(1) XOR B(1));


SYNTHESIZED_WIRE_4 <= NOT(A(2) XOR B(2));


SYNTHESIZED_WIRE_5 <= NOT(A(3) XOR B(3));


SYNTHESIZED_WIRE_6 <= NOT(A(4) XOR B(4));



AeqB <= SYNTHESIZED_WIRE_2 AND SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4 AND SYNTHESIZED_WIRE_5 AND SYNTHESIZED_WIRE_6;


END behavior_g22_5_bit_comparator;