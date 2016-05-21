library IEEE;
use ieee.std_logic_1164.all;

entity g22_reflector is
port(
	 input_code : in std_logic_vector(4 downto 0);
	 reflector_code : in std_logic;
	 output_code : out std_logic_vector(4 downto 0));
end g22_reflector;

architecture g22_reflector_behavior of g22_reflector is

begin
process (input_code, reflector_code)
begin
   -- Rotor Number A
	if reflector_code = '0' then
			case input_code is
				when "00000" =>
					output_code <=  "11000";
				when "00001" =>
					output_code <=  "10001";
				when  "00010" =>
					output_code <=  "00111";
				when  "00011" =>
					output_code <=  "00101";
				when  "00100" =>
					output_code <=  "10000";
				when  "00101" =>
					output_code <=  "10010"; --F 
				when  "00110" =>
					output_code <=  "01011";
				when  "00111" =>
					output_code <=  "00011";
				when  "01000" =>
					output_code <=  "01111";--I
				when  "01001" =>
					output_code <= "10111";--J
				when  "01010" =>
					output_code <=  "01101";--K
				when  "01011" =>
					output_code <=  "00110";
				when  "01100" =>
					output_code <=  "01110";--M
				when  "01101" =>
					output_code <=  "01010";--N
				when  "01110" =>
					output_code <= "01100";--O
				when  "01111" =>
					output_code <=  "01000";
				when  "10000" =>
					output_code <= "00010";
				when  "10001" =>
					output_code <=  "00001";
				when  "10010" =>
					output_code <=  "00101";
				when  "10011" =>
					output_code <=  "11001";
				when  "10100" =>
					output_code <= "00010";
				when  "10101" =>
					output_code <=  "10110";
				when  "10110" =>
					output_code <= "10101";
				when "10111" =>
					output_code <=  "01001";
				when "11000" =>
					output_code <=  "00000";
				when "11001" =>
					output_code <=  "10011";
				when others =>
					output_code <= "11111";
			end case;
			-- Rotor Number B
		elsif reflector_code = '1' then
			case input_code is
				when "00000" =>
					output_code <= "00101";--A
				when "00001" =>
					output_code <=  "10101";--B
				when  "00010" =>
					output_code <=  "01111";--C
				when  "00011" =>
					output_code <=  "01001";--D
				when  "00100" =>
					output_code <=  "01000";--E
				when  "00101" =>
					output_code <=  "00000";--F
				when  "00110" =>
					output_code <=  "01110";--G
				when  "00111" =>
					output_code <=  "11000";--H
				when  "01000" =>
					output_code <= "00100";--I
				when  "01001" =>
					output_code <= "00011";--J
				when  "01010" =>
					output_code <=  "10001";--K
				when  "01011" =>
					output_code <=  "11001";--L
				when  "01100" =>
					output_code <=  "10111";--M
				when  "01101" =>
					output_code <=  "10110";--N
				when  "01110" =>
					output_code <=  "00110";--O
				when  "01111" =>
					output_code <=  "00010";--P
				when  "10000" =>
					output_code <=  "10011";--Q
				when  "10001" =>
					output_code <=  "01010";--R
				when  "10010" =>
					output_code <= "10100";--S
				when  "10011" =>
					output_code <=  "10000";--T
				when  "10100" =>
					output_code <=  "10010";--U
				when  "10101" =>
					output_code <= "00001";--V
				when  "10110" =>
					output_code <=  "01101";--W
				when "10111" =>
					output_code <=  "01100";--X
				when "11000" =>
					output_code <=  "00111";--Y
				when "11001" =>
					output_code <=  "01011";--Z
				when others =>
					output_code <= "11111";
			end case;
		end if;
end process;

end g22_reflector_behavior;