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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "01/25/2016 15:18:48"
                                                            
-- Vhdl Test Bench template for design  :  g22_5_26_Decoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_5_26_Decoder IS 
	PORT
	(
		INDEX :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		D :  OUT  STD_LOGIC_VECTOR(25 DOWNTO 0);
		Error :  OUT  STD_LOGIC
	);
END g22_5_26_Decoder;

ARCHITECTURE g22_5_26_Decoder_behavior OF g22_5_26_Decoder IS 


BEGIN

D(0) <= NOT INDEX(0) AND NOT INDEX(1) AND NOT INDEX(2) AND NOT INDEX(3) AND NOT INDEX(4);
D(1) <= INDEX(0) AND NOT INDEX(1) AND NOT INDEX(2) AND NOT INDEX(3) AND NOT INDEX(4);
D(2) <= NOT INDEX(0) AND INDEX(1) AND NOT INDEX(2) AND NOT INDEX(3) AND NOT INDEX(4);
D(3) <= INDEX(0) AND INDEX(1) AND NOT INDEX(2) AND NOT INDEX(3) AND NOT INDEX(4);
D(4) <= NOT INDEX(0) AND NOT INDEX(1) AND INDEX(2) AND NOT INDEX(3) AND NOT INDEX(4);
D(5) <= INDEX(0) AND NOT INDEX(1) AND INDEX(2) AND NOT INDEX(3) AND NOT INDEX(4);
D(6) <= NOT INDEX(0) AND INDEX(1) AND INDEX(2) AND NOT INDEX(3) AND NOT INDEX(4);
D(7) <= INDEX(0) AND INDEX(1) AND INDEX(2) AND NOT INDEX(3) AND NOT INDEX(4);
D(8) <= NOT INDEX(0) AND NOT INDEX(1) AND NOT INDEX(2) AND INDEX(3) AND NOT INDEX(4);
D(9) <= INDEX(0) AND NOT INDEX(1) AND NOT INDEX(2) AND INDEX(3) AND NOT INDEX(4);
D(10) <= NOT INDEX(0) AND INDEX(1) AND NOT INDEX(2) AND INDEX(3) AND NOT INDEX(4);
D(11) <= INDEX(0) AND INDEX(1) AND NOT INDEX(2) AND INDEX(3) AND NOT INDEX(4);
D(12) <= NOT INDEX(0) AND NOT INDEX(1) AND INDEX(2) AND INDEX(3) AND NOT INDEX(4);
D(13) <= INDEX(0) AND NOT INDEX(1) AND INDEX(2) AND INDEX(3) AND NOT INDEX(4);
D(14) <= NOT INDEX(0) AND INDEX(1) AND INDEX(2) AND INDEX(3) AND NOT INDEX(4);
D(15) <= INDEX(0) AND INDEX(1) AND INDEX(2) AND INDEX(3) AND NOT INDEX(4);
D(16) <= NOT INDEX(0) AND NOT INDEX(1) AND NOT INDEX(2) AND NOT INDEX(3) AND INDEX(4);
D(17) <= INDEX(0) AND NOT INDEX(1) AND NOT INDEX(2) AND NOT INDEX(3) AND INDEX(4);
D(18) <= NOT INDEX(0) AND INDEX(1) AND NOT INDEX(2) AND NOT INDEX(3) AND INDEX(4);
D(19) <= INDEX(0) AND INDEX(1) AND NOT INDEX(2) AND NOT INDEX(3) AND INDEX(4);
D(20) <= NOT INDEX(0) AND NOT INDEX(1) AND INDEX(2) AND NOT INDEX(3) AND INDEX(4);
D(21) <= INDEX(0) AND NOT INDEX(1) AND INDEX(2) AND NOT INDEX(3) AND INDEX(4);
D(22) <= NOT INDEX(0) AND INDEX(1) AND INDEX(2) AND NOT INDEX(3) AND INDEX(4);
D(23) <= INDEX(0) AND INDEX(1) AND INDEX(2) AND NOT INDEX(3) AND INDEX(4);
D(24) <= NOT INDEX(0) AND NOT INDEX(1) AND NOT INDEX(2) AND INDEX(3) AND INDEX(4);
D(25) <= INDEX(0) AND NOT INDEX(1) AND NOT INDEX(2) AND INDEX(3) AND INDEX(4);

Error <= INDEX(4) AND INDEX(3) AND (INDEX(1) OR INDEX(2));


END g22_5_26_Decoder_behavior;