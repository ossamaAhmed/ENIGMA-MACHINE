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
-- CREATED		"Thu Mar 24 13:48:27 2016"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_FSM_test_bed IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		init :  IN  STD_LOGIC;
--		reset :  IN  STD_LOGIC;
--		init_l :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
--		init_m :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
--		init_r :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
--		knock_pt_m :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
--		knock_pt_r :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		disp_l :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		disp_m :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0);
		disp_r :  OUT  STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END g22_FSM_test_bed;

ARCHITECTURE bdf_type OF g22_FSM_test_bed IS 

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

COMPONENT g22_0_25_counter
	PORT(count_enable : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 load : IN STD_LOGIC;
		 input : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 count : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_7_segment_decoder
	PORT(code : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 segments : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
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

SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;


BEGIN 



b2v_inst : g22_pulse_gen
PORT MAP(clk => clk,
		 EPULSE => SYNTHESIZED_WIRE_10);


--right rotor
b2v_inst10 : g22_5_bit_comparator
PORT MAP(A => SYNTHESIZED_WIRE_15,
		 B => "00100",
		 AeqB => SYNTHESIZED_WIRE_13);


SYNTHESIZED_WIRE_11 <= NOT(init);


--right
b2v_inst2 : g22_0_25_counter
PORT MAP(count_enable => SYNTHESIZED_WIRE_1,
		 clk => clk,
		 reset => '0',
		 load => SYNTHESIZED_WIRE_16,
		 input => "00000",
		 count => SYNTHESIZED_WIRE_15);

--middle
b2v_inst3 : g22_0_25_counter
PORT MAP(count_enable => SYNTHESIZED_WIRE_3,
		 clk => clk,
		 reset => '0',
		 load => SYNTHESIZED_WIRE_16,
		 input => "00001",
		 count => SYNTHESIZED_WIRE_17);


--left
b2v_inst4 : g22_0_25_counter
PORT MAP(count_enable => SYNTHESIZED_WIRE_5,
		 clk => clk,
		 reset => '0',
		 load => SYNTHESIZED_WIRE_16,
		 input => "00010",
		 count => SYNTHESIZED_WIRE_9);


b2v_inst5 : g22_7_segment_decoder
PORT MAP(code => SYNTHESIZED_WIRE_15,
		 segments => disp_r);


b2v_inst6 : g22_7_segment_decoder
PORT MAP(code => SYNTHESIZED_WIRE_17,
		 segments => disp_m);


b2v_inst7 : g22_7_segment_decoder
PORT MAP(code => SYNTHESIZED_WIRE_9,
		 segments => disp_l);


b2v_inst8 : g22_rotor_stepper_fsm
PORT MAP(clk => clk,
		 keyPress => SYNTHESIZED_WIRE_10,
		 init => SYNTHESIZED_WIRE_11,
		 knock_m => SYNTHESIZED_WIRE_12,
		 knock_r => SYNTHESIZED_WIRE_13,
		 enable_r => SYNTHESIZED_WIRE_1,
		 enable_l => SYNTHESIZED_WIRE_5,
		 enable_m => SYNTHESIZED_WIRE_3,
		 load => SYNTHESIZED_WIRE_16);


-- middle rotor
b2v_inst9 : g22_5_bit_comparator
PORT MAP(A => SYNTHESIZED_WIRE_17,
		 B => "00010",
		 AeqB => SYNTHESIZED_WIRE_12);


END bdf_type;