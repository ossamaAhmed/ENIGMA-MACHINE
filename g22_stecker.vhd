  library IEEE;
use ieee.std_logic_1164.all;

entity g22_stecker is
port(
	 input_code : in std_logic_vector(4 downto 0);
	 output_code : out std_logic_vector(4 downto 0));
end g22_stecker;

architecture g22_stecker_behavior of g22_stecker is

begin
process (input_code)
begin
			case input_code is
				when "00000" =>
					output_code <= "00001";--A --F
				when "00001" =>
					output_code <=  "00000";--B
				when  "00010" =>
					output_code <=  "00011";--C
				when  "00011" =>
					output_code <=  "00010";--D
				when  "00100" =>
					output_code <=  "00101";--E
				when  "00101" =>
					output_code <=  "00100";--F
				when  "00110" =>
					output_code <=  "00111";--G
				when  "00111" =>
					output_code <=  "00110";--H
				when  "01000" =>
					output_code <=  "01001";--I
				when  "01001" =>
					output_code <= "01000";--J
				when  "01010" =>
					output_code <=  "01011";--K
				when  "01011" =>
					output_code <=  "01010";--L
				when  "01100" =>
					output_code <=  "01101";--M
				when  "01101" =>
					output_code <=  "01100";--N
				when  "01110" =>
					output_code <=  "01111";--O
				when  "01111" =>
					output_code <=  "01110";--P
				when  "10000" =>
					output_code <=  "10001";--Q
				when  "10001" =>
					output_code <=  "10000";--R
				when  "10010" =>
					output_code <= "10011";--S
				when  "10011" =>
					output_code <=  "10010";--T
				when  "10100" =>
					output_code <=  "10101";--U
				when  "10101" =>
					output_code <= "10100";--V
				when  "10110" =>
					output_code <=  "10111";--W
				when "10111" =>
					output_code <=  "10110";--X
				when "11000" =>
					output_code <=  "11001";--Y
				when "11001" =>
					output_code <=  "11000";--Z --L
				when others =>
					output_code <= "11111";
			end case;
end process;

end g22_stecker_behavior;