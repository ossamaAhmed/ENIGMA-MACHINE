library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.all;     

LIBRARY work;

ENTITY g22_rotor_stepper_FSM IS 
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
END g22_rotor_stepper_FSM;

ARCHITECTURE g22_rotor_stepper_FSM_behavior OF g22_rotor_stepper_FSM IS 

type state_t is (s0, s1, s2, s3, s4, s5, s6, s7);
signal state_number : state_t ;

BEGIN

sate_machine : process(init, clk)
	BEGIN
		if init ='1' then 
			state_number <= s0;
		elsif (rising_edge(clk)) then 
			case state_number is 
				when s0=>
					state_number  <= s1;
				when s1=>
					if keyPress = '0' then 
						state_number<= s2;
					 else 
						state_number <= s1;
					end if;
				when s2=>
					if keyPress = '1' then 
						state_number<= s3;
					else 
						state_number <= s2;
					end if;
				when s3=> 
					if knock_m = '0' and knock_r ='0' then 
						state_number <= s4;
					elsif knock_m = '0' and knock_r ='1' then 
						state_number <= s5;
					elsif knock_m = '1'  and knock_r ='0' then 
						state_number <= s6;
					else 
						state_number <= s7;
					end if;
				when s4=>
					state_number <= s1;
				when s5=>
					state_number <= s1;
				when s6=>
					state_number <= s1;
				when s7=>
					state_number <= s1;
			end case;
		end if;
end process;

enabling_signals : process(state_number)
	BEGIN 
			case state_number is 
				when s0=>
					load <= '1';
					enable_r <= '0';
					enable_m <= '0';
					enable_l<='0';
				when s1=>
					load <= '0';
					enable_r <= '0';
					enable_m <= '0';
					enable_l<='0';
				when s2=>
					load <= '0';
					enable_r <= '0';
					enable_m <= '0';
					enable_l<='0';
				when s3=>
					load <= '0';
					enable_r <= '0';
					enable_m <= '0';
					enable_l<='0';
				when s4=>
					load <= '0';
					enable_r <= '1';
					enable_m <= '0';
					enable_l<='0';
				when s5=>
					load <= '0';
					enable_r <= '1';
					enable_m <= '1';
					enable_l <='0';
				when s6=>
					load <= '0';
					enable_r <= '1';
					enable_m <= '1';
					enable_l<='1';
				when s7=>
					load <= '0';
					enable_r <= '1';
					enable_m <= '1';
					enable_l<='1';
			end case;
end process;
END g22_rotor_stepper_FSM_behavior;