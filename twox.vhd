library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity twox is
	port(inbyte : in  std_logic_vector(7 downto 0);
		  outbyte: out std_logic_vector(7 downto 0));
end twox;
	  
architecture bhv of twox is	
	signal outp, temp, mod_vec : std_logic_vector (7 downto 0);
	begin
	temp <= "00011011";
	gen3: for i in 0 to 7 generate
		mod_vec(i) <= temp(i) and inbyte(7);
	end generate;
	outbyte <= outp;
	bitloop: for i in 0 to 7 generate 
		gen1: if i = 0 generate
			outp(i) <= '0' xor mod_vec(i);
		end generate;
		gen2: if i>0 generate
			outp(i) <=inbyte(i-1) xor mod_vec(i);
		end generate;
	end generate;
end bhv;