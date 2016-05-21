LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_26_5_Encoder IS 
	PORT
	(
		letter :  IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		INDEX :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ERROR :  OUT  STD_LOGIC
	);
END g22_26_5_Encoder;

ARCHITECTURE g22_26_5_Encoder_behavior OF g22_26_5_Encoder IS 


BEGIN

	INDEX <= "11001" when letter(25)='1' else
				"11000" when letter(24)='1' else
				"10111" when letter(23)='1' else
				"10110" when letter(22)='1' else
				"10101" when letter(21)='1' else
				"10100" when letter(20)='1' else
				"10011" when letter(19)='1' else
				"10010" when letter(18)='1' else
				"10001" when letter(17)='1' else
				"10000" when letter(16)='1' else
				"01111" when letter(15)='1' else
				"01110" when letter(14)='1' else
				"01101" when letter(13)='1' else
				"01100" when letter(12)='1' else
				"01011" when letter(11)='1' else
				"01010" when letter(10)='1' else
				"01001" when letter(9)='1' else
				"01000" when letter(8)='1' else
				"00111" when letter(7)='1' else
				"00110" when letter(6)='1' else
				"00101" when letter(5)='1' else
				"00100" when letter(4)='1' else
				"00011" when letter(3)='1' else
				"00010" when letter(2)='1' else
				"00001" when letter(1)='1' else
				"00000" when letter(0)='1' else
				"-----";
	
	ERROR <='1' when letter="00000000000000000000000000" else
				'0';
	

				


END g22_26_5_Encoder_behavior;