library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity FA is
	port(cin : in std_logic;
			num1,num2: in std_logic_vector(10 downto 0);
			cout: out std_logic_vector(10 downto 0) );
end FA;
architecture FA_arch of FA is
	signal wireb,wire: std_logic_vector(10 downto 0);
	signal sum: std_logic_vector(10 downto 0):="00000000000";

begin 
	sum(0)<=cin;
	Wireb <= num1 + num2;
	wire<=wireb+sum;
	cout(10)<=Wire(8);
	cout(9)<=Wire(8);
	cout(8 downto 0)<=Wire(8 downto 0);
end FA_arch;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
package comp4 is
		component FA is
				port(cin : in std_logic;
					num1,num2: in std_logic_vector(10 downto 0);
					cout: out std_logic_vector(10 downto 0) );
		end component;
		end package;