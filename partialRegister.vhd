library ieee;
use ieee.std_logic_1164.all;

entity partialRegister is
	port(start,load,shift,clk,rst: in std_logic;
			num: in std_logic_vector(19 downto 0);
			output: out std_logic_vector(19 downto 0));
end partialRegister;
architecture partialRegister_arch of partialRegister is 
	signal reg: std_logic_vector(19 downto 0):="00000000000000000000";
	signal msb: std_logic;
begin
	output<=reg;
	
	process(clk,rst,start,shift)
	begin
		
		if clk'event and clk = '1' then
				if rst ='1' or start = '1' then 
					reg<="00000000000000000000";
				elsif shift='1' then
					reg(18 downto 0)<=reg(19 downto 1);
					reg(19)<=reg(17);
				elsif load='1' then
					reg(17 downto 9)<=num(17 downto 9);
					reg(18)<=num(17);
					reg(19)<=num(17);
				end if;
				
		end if;
	end process;
end partialRegister_arch;

library ieee;
use ieee.std_logic_1164.all;
		package comp is
		component partialRegister is
				port(start,load,shift,clk,rst: in std_logic;
					num: in std_logic_vector(19 downto 0);
					output: out std_logic_vector(19 downto 0));
		end component;
		end package;