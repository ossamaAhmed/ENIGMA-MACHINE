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
-- signals                                                   
SIGNAL count_enable : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL count : STD_LOGIC_VECTOR(4 downto 0);
COMPONENT g22_0_25_counter
	PORT (
	count_enable : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	reset : IN STD_LOGIC;
	count : OUT STD_LOGIC_VECTOR(4 downto 0)
	);
END COMPONENT;
BEGIN
	i1 : g22_0_25_counter
	PORT MAP (
-- list connections between master ports and signals
	count_enable => count_enable,
	clk => clk,
	reset => reset,
	count => count
);

clk_process : process                                               
-- variable declarations                                     
BEGIN  
		clk <= '0';
      WAIT FOR 50 ns;
		clk <= '1';
      WAIT FOR 50 ns;
END PROCESS clk_process;
generate_test : process                                               
-- variable declarations                                     
BEGIN                                                                     
		reset <= '1';
		count_enable <= '1';
		wait for 100 ns;
		reset <= '0';
		count_enable <= '1';
      WAIT;  
END PROCESS generate_test;                                                                                              
END g22_Enigma_arch;
