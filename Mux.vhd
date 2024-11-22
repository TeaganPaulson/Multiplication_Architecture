library ieee;
use ieee.std_logic_1164.all;

entity Mux is
	port(enable,sel: in std_logic;
			a: in std_logic_vector(8 downto 0);
			output: out std_logic_vector(8 downto 0));
end Mux;
architecture Mux_arch of Mux is
	signal wire,wire2: std_logic_vector(8 downto 0);
	signal en,s: std_logic_vector(8 downto 0);
begin
	en(8)<=enable;
	en(7)<=enable;en(6)<=enable;en(5)<=enable;en(4)<=enable;
	en(3)<=enable;en(2)<=enable;en(1)<=enable;en(0)<=enable;
	s(8)<=sel;
	s(7)<=sel;s(6)<=sel;s(5)<=sel;s(4)<=sel;
	s(3)<=sel;s(2)<=sel;s(1)<=sel;s(0)<=sel;
	output<=en and ((a and not s) or ((not a) and s)); 
end Mux_arch;

library ieee;
use ieee.std_logic_1164.all;
		package comp3 is
		component Mux is
				port(enable,sel: in std_logic;
					a: in std_logic_vector(8 downto 0);
					output: out std_logic_vector(8 downto 0));
		end component;
		end package;