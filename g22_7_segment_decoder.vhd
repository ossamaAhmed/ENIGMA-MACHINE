LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_7_segment_decoder IS 
	PORT
	(
		code: in std_logic_vector (4 downto 0);
		segments : out std_logic_vector (6 downto 0)
	);
END g22_7_segment_decoder;

ARCHITECTURE g22_7_segment_decoder_behavior OF g22_7_segment_decoder IS 


BEGIN

with code select 
segments <= "0001000" when "00000"  ,
				"0000011" when "00001"  ,
				"1000110" when "00010"  ,
				"0100001" when "00011"  ,
				"0000110" when "00100"  ,
				"0001110" when "00101"  ,
				"1000010" when "00110"  ,
				"0001011" when "00111"  ,
				"1001111" when "01000"  ,
				"1100001" when "01001"  ,
				"0001111" when "01010"  ,
				"1000111" when "01011"  ,
				"1001000" when "01100"  ,
				"0101011" when "01101"  ,
				"1000000" when "01110"  ,
				"0001100" when "01111"  ,
				"0100011" when "10000"  ,
				"1001110" when "10001"  ,
				"0010010" when "10010"  ,
				"0000111" when "10011"  ,
				"1000001" when "10100"  ,
				"1011001" when "10101"  ,
				"1100011" when "10110"  ,
				"0001001" when "10111"  ,
				"0010001" when "11000"  ,
				"0100100" when "11001"  ,
				"1111111" when others;
						


				


END g22_7_segment_decoder_behavior;