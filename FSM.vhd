library ieee;
use ieee.std_logic_1164.all;

entity FSM is
	port(start,clk,rst: in std_logic;
			shift,load,add,sub: out std_logic);
end FSM;
architecture FSM_arch of FSM is 
	signal state: integer :=0;
begin
	load<= '1' when state = 1 else '0';
	add<='1' when state = 2 or state = 4 or state = 6 or state = 8 or state = 10 or state = 12 or state = 14 or state = 16 else '0';
	sub<='1' when state = 18 else '0';
	shift<='1' when state = 3 or state = 5 or state = 7 or state = 9 or state = 11 or state = 13 or state = 15 or state = 17 or state = 19 else '0';
	
	process(clk,rst,start,state)
	begin
		if clk'event and clk='1' then
			if rst = '1' then
				state<=0;
			elsif state = 0 and start ='1' then
				state <=1;
			elsif state = 20 then
				state <= 0;
			elsif state /= 0 then
				state<=state+1;
			else
				state<=0;
			end if;
		end if;
		end process;
end FSM_arch;

library ieee;
use ieee.std_logic_1164.all;
		package comp5 is
		component FSM is
				port(start,clk,rst: in std_logic;
					shift,load,add,sub: out std_logic);
		end component;
		end package;