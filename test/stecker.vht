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
-- Generated on "02/08/2016 14:28:45"
                                                            
-- Vhdl Test Bench template for design  :  g22_Enigma
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;    
USE ieee.numeric_std.all;     
USE ieee.std_logic_arith.all;                        

ENTITY g22_Enigma_vhd_tst IS
END g22_Enigma_vhd_tst;
ARCHITECTURE g22_Enigma_arch OF g22_Enigma_vhd_tst IS
-- constants                                              
-- signals                                                   
SIGNAL input_code : std_logic_vector(4 downto 0);
SIGNAL output_code : std_logic_vector(4 downto 0);
COMPONENT g22_stecker
port(
	 input_code : in std_logic_vector(4 downto 0);
	 output_code : out std_logic_vector(4 downto 0));
END COMPONENT;
BEGIN
	i1 : g22_stecker
	PORT MAP (
-- list connections between master ports and signals
	input_code => input_code,
	output_code => output_code
);
generate_test : PROCESS                                               
-- variable declarations                                     
BEGIN
			FOR j IN 0 to 26 LOOP
			input_code <= std_logic_vector(to_unsigned(j,5));
			WAIT FOR 10 ns;
			END LOOP;            
      WAIT;  
END PROCESS generate_test;                                                                                     
END g22_Enigma_arch;
