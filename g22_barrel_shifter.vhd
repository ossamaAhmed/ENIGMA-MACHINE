LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY g22_barrel_shifter IS 
	PORT
	(
		letter :  IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		direction: IN STD_LOGIC;
		shift :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		lettershifted :  OUT  STD_LOGIC_VECTOR(25 DOWNTO 0)
	);
END g22_barrel_shifter;

ARCHITECTURE g22_barrel_shifter_behavior OF g22_barrel_shifter IS 


BEGIN
process (shift, letter,direction)
begin
	if direction='0' then --shift left
		case shift is
		 when "00000" =>
			lettershifted <= letter(25 downto 0);
		 when "00001" => 
			lettershifted <= letter(24 downto 0) & letter(25);
		 when "00010" =>
			lettershifted <=   letter(23 downto 0) & letter(25 downto 24);
		when "00011" =>
		lettershifted <=   letter(22 downto 0) & letter(25 downto 23); 
		when "00100" =>
		lettershifted <=   letter(21 downto 0) & letter(25 downto 22); 
		when "00101" =>
		lettershifted <=   letter(20 downto 0) & letter(25 downto 21); 
		when "00110" =>
		lettershifted <=   letter(19 downto 0)& letter(25 downto 20);
		when "00111"=>
		lettershifted <=   letter(18 downto 0) & letter(25 downto 19); 
		when "01000"=>
		lettershifted <=   letter(17 downto 0) & letter(25 downto 18); 
		when "01001"=>
		lettershifted <=   letter(16 downto 0) & letter(25 downto 17); 
		when "01010"=>
		lettershifted <=   letter(15 downto 0) & letter(25 downto 16); 
		when "01011"=>
		lettershifted <=   letter(14 downto 0) & letter(25 downto 15);
		when "01100"=>
		lettershifted <=   letter(13 downto 0) & letter(25 downto 14); 
		when "01101"=>
		lettershifted <=   letter(12 downto 0) & letter(25 downto 13); 
		when "01110"=>
		lettershifted <=   letter(11 downto 0) & letter(25 downto 12); 
		when "01111"=>
		lettershifted <=   letter(10 downto 0) & letter(25 downto 11); 
		when "10000"=>
		lettershifted <=   letter(9 downto 0) & letter(25 downto 10); 
		when "10001"=>
		lettershifted <=   letter(8 downto 0) & letter(25 downto 9);
		when "10010"=>
		lettershifted <=   letter(7 downto 0) & letter(25 downto 8);
		when "10011"=>
		lettershifted <=   letter(6 downto 0) & letter(25 downto 7);
		 when "10100"=>
		 lettershifted <=   letter(5 downto 0) & letter(25 downto 6);
		 when "10101"=>
		 lettershifted <=   letter(4 downto 0) & letter(25 downto 5);
		when "10110"=>
		lettershifted <=   letter(3 downto 0) & letter(25 downto 4);
		when "10111"=>
		lettershifted <=   letter(2 downto 0) & letter(25 downto 3);
		when "11000"=>
		lettershifted <=   letter(1 downto 0) & letter(25 downto 2);
		when "11001"=>
		lettershifted <=  letter(0) & letter(25 downto 1);
		when others =>
			lettershifted <= letter;
			end case;

	elsif direction = '1' then 
		case shift is 
		when "00000" => 
			lettershifted <= letter(25 downto 0);
			when "00001"=>
			lettershifted <= letter(0) & letter(25 downto 1);
			when "00010"=>
			lettershifted <=  letter (1 downto 0) & letter (25 downto 2);
			when "00011"=>
			lettershifted <=  letter (2 downto 0) & letter (25 downto 3);
			when "00100"=>
			lettershifted <=  letter (3 downto 0) & letter (25 downto 4);
			when "00101"=>
			lettershifted <=  letter (4 downto 0) & letter (25 downto 5);
			when "00110"=>
			lettershifted <=  letter (5 downto 0) & letter (25 downto 6);
			 when "00111"=>
			 lettershifted <= letter (6 downto 0) & letter (25 downto 7);
			when "01000"=>
			lettershifted <=letter (7 downto 0) & letter (25 downto 8);
			when "01001"=>
			lettershifted <=letter (8 downto 0) & letter (25 downto 9);
			when "01010"=>
			lettershifted <=letter (9 downto 0) & letter (25 downto 10);
			when "01011"=>
			lettershifted <=letter (10 downto 0) & letter (25 downto 11);
			when "01100"=>
			lettershifted <=letter (11 downto 0) & letter (25 downto 12);
			when "01101"=>
			lettershifted <=letter (12 downto 0) & letter (25 downto 13);
			when "01110"=>
			lettershifted <=letter (13 downto 0) & letter (25 downto 14);
			when "01111"=>
			lettershifted <=letter (14 downto 0) & letter (25 downto 15);
			when "10000"=>
			lettershifted <=letter (15 downto 0) & letter (25 downto 16);
			when "10001"=>
			lettershifted <=letter (16 downto 0) & letter (25 downto 17);
			when "10010"=>
			lettershifted <=letter (17 downto 0) & letter (25 downto 18);
			when "10011"=>
			lettershifted <=letter (18 downto 0) & letter (25 downto 19);
			when "10100"=>
			lettershifted <=letter (19 downto 0) & letter (25 downto 20);
			when "10101"=>
			lettershifted <=letter (20 downto 0) & letter (25 downto 21);
			when "10110"=>
			lettershifted <=letter (21 downto 0) & letter (25 downto 22);
			when "10111"=>
			lettershifted <=letter (22 downto 0) & letter (25 downto 23);
			when "11000"=>
			lettershifted <=letter (23 downto 0) & letter (25 downto 24);
			when "11001"=>
			lettershifted <=letter (24 downto 0) & letter (25);
			when others =>
			lettershifted <= letter;
			end case;
	end if;
end process;
END g22_barrel_shifter_behavior;