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
SIGNAL direction_0 : STD_LOGIC;
SIGNAL direction_1 : STD_LOGIC;
SIGNAL	enable : STD_LOGIC;
SIGNAL	load : STD_LOGIC;
SIGNAL	reset : STD_LOGIC;
SIGNAL	clk :  STD_LOGIC:= '0';
SIGNAL	data : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	input_code :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	ring_setting : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	rotor_type : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL	count : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	output_code : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	output_code_inverted : STD_LOGIC_VECTOR(4 DOWNTO 0);    
constant clock_period : time := 20 ns;                                               
COMPONENT g22_rotor_R
port(
		direction_0 :  IN  STD_LOGIC;
		direction_1 :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		load :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		data :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		input_code :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ring_setting :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rotor_type :  IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
		count :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		output_code :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		output_code_inverted :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0));
END COMPONENT;
BEGIN
	i1 : g22_rotor_R
	PORT MAP (
-- list connections between master ports and signals
	direction_0 => direction_0,
	direction_1 => direction_1,
	enable => enable,
	load => load,
	reset => reset,
	clk => clk,
	data => data,
	input_code => input_code,
	ring_setting => ring_setting,
	rotor_type => rotor_type,
	count => count,
	output_code => output_code,
	output_code_inverted => output_code_inverted
);
simulated_clock : process
   begin
      wait for clock_period/2; clk  <= not clk;
end process simulated_clock;

generate_test : PROCESS                                               
-- variable declarations                                     
BEGIN
		direction_0 <= '0'; 
		direction_1 <= '0';
		enable <= '1';
		load <= '1';
		reset <= '0';
		data <= "00000";
		input_code <= "00111";
		ring_setting <= "00100";
		rotor_type <= "00";
	  wait for 200 ns;  
END PROCESS generate_test;                                                                                     
END g22_Enigma_arch;
