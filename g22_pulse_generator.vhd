LIBRARY ieee;
LIBRARY lpm;
USE ieee.std_logic_1164.all; 
USE lpm.lpm_components.all;
LIBRARY work;

ENTITY g22_pulse_gen IS 
	PORT
	(
		clk: in std_logic;
		EPULSE : out std_logic;
		Q: out std_logic_vector(24 downto 0)
	);
END g22_pulse_gen;

ARCHITECTURE g22_pulse_gen_behavior OF g22_pulse_gen IS 

SIGNAL count: std_logic_vector(24 downto 0);

BEGIN

	solo: lpm_counter
		GENERIC MAP (lpm_width => 25, lpm_modulus => (24999999))
		
		PORT MAP(
			clock => clk, 
			q => count
		);
		
		PROCESS (count, clk)
			BEGIN 
			if(rising_edge(clk)) then
				if count = "0000000000000000000000000" then
					EPULSE <= '1';
				else
					EPULSE <= '0';
				end if;
			end if;
		END PROCESS;
		
		Q <= count;

END g22_pulse_gen_behavior;