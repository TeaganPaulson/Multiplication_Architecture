library ieee;
use ieee.std_logic_1164.all;

entity BitReg is
	port(load,shift,clk,rst: in std_logic;
			num: in std_logic_vector(8 downto 0);
			output: out std_logic_vector(8 downto 0));
end BitReg;
architecture BitReg_arch of BitReg is 
	signal reg: std_logic_vector(8 downto 0):="000000000";
	signal msb: std_logic;
begin
	output<=reg;
	
	process(clk,rst,shift,load)
	begin
		if clk'event and clk='1' then
			if rst ='1' then 
				reg<="000000000";
			elsif load ='1' then
				reg<=num;
			elsif shift = '1' then
				reg(7 downto 0)<=reg(8 downto 1);
				reg(8)<='0';	
			end if;
		end if;
	end process;
end BitReg_arch;

library ieee;
use ieee.std_logic_1164.all;
		package comp2 is
		component BitReg is
				port(load,shift,clk,rst: in std_logic;
					num: in std_logic_vector(8 downto 0);
					output: out std_logic_vector(8 downto 0));
		end component;
		end package;