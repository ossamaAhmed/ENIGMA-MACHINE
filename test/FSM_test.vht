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
SIGNAL clk : STD_LOGIC:= '0';
SIGNAL keyPress : STD_LOGIC:= '0';
SIGNAL init : STD_LOGIC:= '1';
SIGNAL knock_m : STD_LOGIC:= '0';
SIGNAL knock_r : STD_LOGIC:= '0';
SIGNAL enable_r : STD_LOGIC;
SIGNAL enable_l : STD_LOGIC;
SIGNAL enable_m : STD_LOGIC;
SIGNAL load :  STD_LOGIC;
constant clock_period : time := 20 ns;
COMPONENT g22_rotor_stepper_FSM
	PORT
	(
		clk : IN STD_LOGIC;
		keyPress :  IN  STD_LOGIC;
		init : IN STD_LOGIC;
		knock_m :  IN  STD_LOGIC;
		knock_r : IN STD_LOGIC;
		enable_r : OUT STD_LOGIC;
		enable_l : OUT STD_LOGIC;
		enable_m : OUT STD_LOGIC;
		load : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : g22_rotor_stepper_FSM
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	keyPress => keyPress,
	init => init,
	knock_m => knock_m,
	knock_r => knock_r,
	enable_r => enable_r,
	enable_l => enable_l,
	enable_m => enable_m,
	load => load
);

simulated_clock : process
   begin
      wait for clock_period/2; clk  <= not clk;
end process simulated_clock;


generate_test : PROCESS                                               
-- variable declarations                                     
		BEGIN
		knock_r <= '0'; 
		knock_m <= '0';
		keyPress <= '1';
	  wait for 250 ns; init  <= '0';
	  wait for 100 ns; keypress  <= '0';
     wait for 200 ns; keypress  <= '1'; 
	   wait for 100 ns; keypress  <= '0';
		wait for 200 ns; knock_m <= '1';
     wait for 200 ns; keypress  <= '1'; 
	  wait for 100 ns; keypress  <= '0';
	   wait for 50 ns; knock_r <= '1'; knock_m <= '0';
     wait for 200 ns; keypress  <= '1'; 
	  wait for 100 ns; keypress  <= '0';
	  wait for 50 ns; knock_r <= '1'; knock_m <= '1';
     wait for 200 ns; keypress  <= '1';  
	  wait for 200 ns;
END PROCESS generate_test;                                                                                     
END g22_Enigma_arch;
