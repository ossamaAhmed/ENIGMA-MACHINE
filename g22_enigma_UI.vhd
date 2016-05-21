library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.all;     

LIBRARY work;

ENTITY g22_enigma_UI IS 
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
		reset_out :  OUT  STD_LOGIC;
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
END g22_enigma_UI;

ARCHITECTURE g22_enigma_UI_behavior OF g22_enigma_UI IS



type state_t is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
signal state_number : state_t ;
signal key_delayed : STD_LOGIC;

BEGIN

sate_machine : process(reset, clk)
	BEGIN
		if reset ='1' then 
			state_number <= s0;
		elsif (rising_edge(clk)) then 
			key_delayed <= keyPress;
			case state_number is 
				when s0=>
					state_number  <= s1;
				when s1=>
					if (keyPress = '1' and key_delayed= '0' ) then 
						state_number<= s2;
					 else 
						state_number <= s1;
					end if;
				when s2=>
					if (keyPress = '1' and key_delayed= '0' ) then 
						state_number<= s3;
					else 
						state_number <= s2;
					end if;
				when s3=> 
					if (keyPress = '1' and key_delayed= '0' ) then 
						state_number <= s4;
					else 
						state_number <= s3;
					end if;
				when s4=> 
					if (keyPress = '1' and key_delayed= '0' ) then 
						state_number <= s5;
					else 
						state_number <= s4;
					end if;
				when s5=> 
					if (keyPress = '1' and key_delayed= '0' ) then 
						state_number <= s6;
					else 
						state_number <= s5;
					end if;
				when s6=>
					if (keyPress = '1' and key_delayed= '0' ) then 
						state_number <= s7;
					else 
						state_number <= s6;
					end if;
				when s7=>
					state_number <= s8;
				when s8 =>
					state_number <= s8;
			end case;
		end if;
end process;

enabling_signals : process(state_number)
	BEGIN 
			case state_number is 
				when s0=>
					reset_out <= '0';
					reflector_code <= '0';
					direction_0 <= '0';
					direction_1 <= '0';
					init <= '0';
					data <= "00000";
					input_code <= "00000";
					knock_pt_m <= "00000"; -- hard coded
					knock_pt_r <= "00000";   -- hard coded
					ring_setting_l<= "00000";  -- hard coded
					ring_setting_m <= "00000";  -- hard coded
					ring_setting_r <= "00000";  -- hard coded
					rotor_tyoe_r <= "00";
					rotor_type_l <= "00";
					rotor_type_m <= "00";
					
					--direction setting
				when s1=>
					init <= '0';
					reset_out <= '0';
					direction_0 <= input(0);
					direction_1 <=  input(1);
					--reflector setting
				when s2=>
					init <= '0';
					reflector_code <= input(0);
					--data setting
				when s3=>
					init <= '0';
					data <= input;
					--rotor type r
				when s4=>
					init <= '0';
					rotor_tyoe_r <= input(1 downto 0);
					--rotor type m
				when s5=>
					init <= '0';
					rotor_type_m <= input(1 downto 0);
					--rotor type l 
				when s6=>
					 init <= '0';
				    rotor_type_l <= input(1 downto 0);

				when s7=>
					init <= '0';
					input_code <= input;
				when s8 => 
					init <= '1';
			end case;
end process;
END g22_enigma_UI_behavior;