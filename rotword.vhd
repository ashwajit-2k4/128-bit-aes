library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rotword is
	port(inp : in  std_logic_vector(31 downto 0);
		  outp: out std_logic_vector(31 downto 0));
end rotword;
	  
architecture bhv of rotword is	
	begin
	shift: process(inp)
		variable loc: INTEGER := 0;
		variable column: INTEGER := 0;
		begin
			for i in 0 to 3 loop
				if i = 3 then
					outp(31 downto 24) <= inp(7 downto 0);
				else 
					outp(8*i+7 downto 8*i) <= inp(8*(i+1) + 7 downto 8*(i+1));
				end if;
			end loop;
			
		end process;
end bhv;