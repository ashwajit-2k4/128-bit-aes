library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mixcolumns is
	port(inp : in  std_logic_vector(31 downto 0);
		  outp: out std_logic_vector(31 downto 0));
end mixcolumns;
	  
architecture bhv of mixcolumns is	
	signal outs, mult, mult3: std_logic_vector (31 downto 0);
	component twox is
		port(inbyte : in  std_logic_vector(7 downto 0);
			  outbyte: out std_logic_vector(7 downto 0));
	end component;
	begin
	outp <= outs;
	mult3 <= mult xor inp;
	gen1: for i in 0 to 3 generate
		assign:twox port map (inbyte => inp(8*i + 7 downto 8*i), outbyte => mult(8*i + 7 downto 8*i));
	end generate;
	outs(7 downto 0)   <= mult(7 downto 0) xor mult3(15 downto 8) xor inp(23 downto 16) xor inp(31 downto 24);
	outs(15 downto 8)  <= mult(15 downto 8) xor mult3(23 downto 16) xor inp(31 downto 24) xor inp(7 downto 0);
	outs(23 downto 16) <= mult(23 downto 16) xor mult3(31 downto 24) xor inp(7 downto 0) xor inp(15 downto 8);
	outs(31 downto 24) <= mult(31 downto 24) xor mult3(7 downto 0) xor inp(15 downto 8) xor inp(23 downto 16);
	
end bhv;