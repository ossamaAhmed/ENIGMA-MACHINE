library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.all;     

LIBRARY work;

ENTITY g22_0_25_counter IS 
	PORT
	(
		count_enable :  IN  STD_LOGIC;
		clk : IN STD_LOGIC;
		reset :  IN  STD_LOGIC;
		input : IN STd_LOGIC_VECTOR (4 downto 0);
		load : IN STD_LOGIC;
		count : OUT STD_LOGIC_VECTOR(4 downto 0)
	);
END g22_0_25_counter;

ARCHITECTURE g22_0_25_counter_behavior OF g22_0_25_counter IS 
signal count_tmp : integer range 0 to 25;

BEGIN
counter : process(count_enable,reset, clk)
	BEGIN
		if reset = '1' then
			count_tmp <= 0;
		elsif rising_edge(clk) then
			if load = '1' then 
				count_tmp <= to_integer(unsigned(input));
			if count_enable = '1' then
				if(count_tmp = 25) then
					count_tmp <= 0;
				else
					count_tmp <= count_tmp + 1;
				end if;
			end if;
		end if;
		end if;
end process;

count <= STD_LOGIC_VECTOR(to_unsigned(count_tmp,5));
END g22_0_25_counter_behavior;