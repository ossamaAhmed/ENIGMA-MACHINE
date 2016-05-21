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

ENTITY g22_Enigma_vhd_tst IS
END g22_Enigma_vhd_tst;
ARCHITECTURE g22_Enigma_arch OF g22_Enigma_vhd_tst IS
-- constants  
CONSTANT CLOCKPERIOD : time := 0.2 ns;                                               
-- signals                                                   
SIGNAL clk : STD_LOGIC := '0';
SIGNAL dipswitches : std_logic_vector (4 downto 0);
SIGNAL leddisplay : std_logic_vector(6 downto 0);

COMPONENT g22_test_bed
	PORT
	(
		clk: in std_logic;
		dipswitches : in std_logic_vector (4 downto 0);
		leddisplay: out std_logic_vector(6 downto 0)
	);
END COMPONENT;
BEGIN
	i1 : g22_test_bed
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	dipswitches => dipswitches,
	leddisplay => leddisplay
);

generate_test : process                                               
-- variable declarations                                     
BEGIN  
		dipswitches <= "00000";
		clk <= not clk;
		
WAIT for (CLOCKPERIOD/2);		
END PROCESS generate_test;                                                                                              
END g22_Enigma_arch;
