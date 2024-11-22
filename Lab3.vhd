library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

library work;
use work.comp.all;
use work.comp2.all;
use work.comp3.all;
use work.comp4.all;
use work.comp5.all;

entity Lab3 is
	port(x,a: in std_logic_vector(7 downto 0);
			clk,rst,start: in std_logic;
			sumout: out std_logic_vector(15 downto 0);
			ai,xi: out std_logic_vector(7 downto 0));
end Lab3;
architecture Lab3_arch of Lab3 is
	signal partial,partialSum,complete: std_logic_vector(19 downto 0):="00000000000000000000";
	signal load,sum,sumit,sub,cin,shift: std_logic;
	
	signal x_wire,a_wire,a_input,x_input: std_logic_vector(8 downto 0):="000000000";
	signal a_mux: std_logic_vector(10 downto 0):="00000000000";
	signal s_in,rst_in : std_logic;
begin
	cin<=x_wire(0) and sub;
	sumout<=partial(15 downto 0);
	
	a_mux(10)<=a_mux(8);
	a_mux(9)<=a_mux(8);
	
	a_input(8)<=a(7);
	a_input(7 downto 0)<=a(7 downto 0);
	
	x_input(8)<=x(7);
	x_input(7 downto 0)<=x(7 downto 0);
	
	s_in<=start;
	rst_in<=rst;
	
	xi<=x(7 downto 0);
	ai<=a(7 downto 0);
	
	sumit<=sum or sub;
	par  : partialRegister 	port map(load,sumit,shift,clk,rst_in,partialSum,partial);
	xreg : BitReg 				port map(load,shift,clk,rst_in,x_input,x_wire);
	areg : BitReg 			  	port map(load,'0',clk,rst_in,a_input,a_wire);
	muxip: Mux 					port map(x_wire(0),sub,a_wire,a_mux(8 downto 0));
	adder: FA					port map(cin,a_mux,partial(19 downto 9),partialSum(19 downto 9));
	FS	  : FSM					port map(s_in,clk,rst_in,shift,load,sum,sub);
end Lab3_arch;