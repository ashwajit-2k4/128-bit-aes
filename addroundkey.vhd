library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addroundkey is
	port(  inp, w:in std_logic_vector(127 downto 0);
	outp: out std_logic_vector(127 downto 0));
end addroundkey;
	  
architecture bhv of addroundkey is	
	begin
		outp <= inp xor w;
end bhv;
