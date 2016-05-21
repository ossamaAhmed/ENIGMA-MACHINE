LIBRARY ieee;
LIBRARY lpm;
USE ieee.std_logic_1164.all; 
USE lpm.lpm_components.all;
LIBRARY work;

ENTITY g22_test_bed IS 
	PORT
	(
		clk: in std_logic;
		dipswitches : in std_logic_vector (4 downto 0);
		leddisplay: out std_logic_vector(6 downto 0)
	);
END g22_test_bed;

ARCHITECTURE g22_test_bed_behavior OF g22_test_bed IS 


SIGNAL Error, Eror, enable: STD_LOGIC;
SIGNAL reset : STD_LOGIC :='0';
SIGNAL D, lettershifted: STD_LOGIC_VECTOR(25 downto 0);
SIGNAL count, INDEX: std_logic_vector(4 downto 0);
SIGNAL Q: std_logic_vector (24 downto 0);

COMPONENT g22_pulse_gen
	PORT
	(
		clk: in std_logic;
		EPULSE : out std_logic;
		Q: out std_logic_vector(24 downto 0)
	);
END COMPONENT;

COMPONENT g22_7_segment_decoder
	PORT
	(
		code: in std_logic_vector (4 downto 0);
		segments : out std_logic_vector (6 downto 0)
	);
END COMPONENT;

COMPONENT g22_0_25_counter
	PORT
	(
		count_enable :  IN  STD_LOGIC;
		clk : IN STD_LOGIC;
		reset :  IN  STD_LOGIC;
		count : OUT STD_LOGIC_VECTOR(4 downto 0)
	);
END COMPONENT;	

COMPONENT g22_barrel_shifter
	PORT
	(
		letter :  IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		shift :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		lettershifted :  OUT  STD_LOGIC_VECTOR(25 DOWNTO 0)
	);
END COMPONENT;

COMPONENT g22_5_26_Decoder
	PORT
	(
		INDEX :  IN  STD_LOGIC_VECTOR(4 DOWNTO 0);
		D :  OUT  STD_LOGIC_VECTOR(25 DOWNTO 0);
		Error :  OUT  STD_LOGIC
	);
END COMPONENT;

COMPONENT g22_26_5_Encoder
	PORT
	(
		letter :  IN  STD_LOGIC_VECTOR(25 DOWNTO 0);
		INDEX :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		ERROR :  OUT  STD_LOGIC
	);
END COMPONENT;

begin
inst_pulse_gen: g22_pulse_gen
	PORT MAP(
	clk =>clk,
	EPULSE => enable,
	Q => Q
	);


	
inst_0_25_counter: g22_0_25_counter
	PORT MAP (
	count_enable => Enable,
	clk => clk,
	reset => reset,
	count => count
	);
	
inst_5_26_Decoder: g22_5_26_Decoder
	PORT MAP (
	INDEX => dipswitches,
	D => D,
	Error => Error
	);

inst_barrel_shifter: g22_barrel_shifter
	PORT MAP ( 
	letter => D,
	shift => count,
	lettershifted => lettershifted
	);
	
inst_26_5_Encoder: g22_26_5_Encoder
	PORT MAP (
	letter => lettershifted,
	INDEX => INDEX,
	Error => Eror
	);
	
blck_7_segment_decoder: g22_7_segment_decoder
	PORT MAP
	(
		code => INDEX,
		segments => leddisplay
	);

END g22_test_bed_behavior;