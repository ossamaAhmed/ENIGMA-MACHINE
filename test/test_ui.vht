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
SIGNAL keyPress : STD_LOGIC := '0';
SIGNAL input : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL clk :  STD_LOGIC:= '0';
SIGNAL init : STD_LOGIC;
SIGNAL reflector_code : STD_LOGIC;
SIGNAL reset : STD_LOGIC := '1';
SIGNAL data : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL input_code :  STD_LOGIC_VECTOR(4 DOWNTO 0) := "00100";
SIGNAL knock_pt_m :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL knock_pt_r : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL ring_setting_l :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL ring_setting_m :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL ring_setting_r :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL rotor_tyoe_r : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL rotor_type_l :  STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL rotor_type_m :  STD_LOGIC_VECTOR(1 DOWNTO 0);

constant clock_period : time := 20 ns;    
                                           
COMPONENT g22_enigma_UI
PORT
	(
		clk :  IN  STD_LOGIC;
		keyPress : IN STD_LOGIC;
		reset :  IN  STD_LOGIC;
		input : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		reflector_code :  OUT  STD_LOGIC;
		direction_0 :  OUT  STD_LOGIC;
		direction_1 :  OUT  STD_LOGIC;
		init :  OUT  STD_LOGIC;
		data :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		input_code :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		knock_pt_m :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		knock_pt_r :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);  
		ring_setting_l :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ring_setting_m :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ring_setting_r :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		rotor_tyoe_r :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		rotor_type_l :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0);
		rotor_type_m :  OUT  STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;

BEGIN
	i1 : g22_enigma_UI
	PORT MAP (
-- list connections between master ports and signals
	direction_0 => direction_0,
	direction_1 => direction_1,
	reset => reset,
	clk => clk,
	init => init,
	reflector_code => reflector_code,
	data => data,
	input_code => input_code,
	knock_pt_m => knock_pt_m,
	knock_pt_r => knock_pt_r,
	ring_setting_l => ring_setting_l,
	ring_setting_m => ring_setting_m,
	ring_setting_r => ring_setting_r,
	rotor_tyoe_r => rotor_tyoe_r,
	rotor_type_l => rotor_type_l,
	rotor_type_m => rotor_type_m,
	keyPress =>keyPress,
	input => input
	
);
simulated_clock : process
   begin
      wait for clock_period/2; clk  <= not clk;
end process simulated_clock;

generate_test : PROCESS                                               
-- variable declarations                                     
BEGIN
		keyPress <= '0';
		reset <= '1';
		input <= "00011";
	wait for 250 ns; reset  <= '0';
	wait for 100 ns; keypress  <= '0';
   wait for 200 ns; keypress  <= '1';
	wait for 100 ns; keypress  <= '0';
   wait for 200 ns; keypress  <= '1'; 
	wait for 100 ns; keypress  <= '0';
   wait for 200 ns; keypress  <= '1';
	wait for 100 ns; keypress  <= '0';
   wait for 200 ns; keypress  <= '1';
END PROCESS generate_test;                                                                                     
END g22_Enigma_arch;
