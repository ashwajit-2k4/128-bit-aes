library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shiftrows is
	port(inp : in  std_logic_vector(127 downto 0);
		  outp: out std_logic_vector(127 downto 0));
end shiftrows;
	  
architecture bhv of shiftrows is	
	begin
	shift: process(inp)
		variable loc: INTEGER := 0;
		variable column: INTEGER := 0;
		begin
			
			for i in 0 to 15 loop 
				if (i < 4) then
					column:= 0;
				elsif (i < 8) then
					column:= 1;
				elsif (i < 12) then
					column:= 2;
				else 
					column:= 3;
				end if;
				loc := ((i rem 4)*5 + 4*column)rem 16;
				outp(8*i+7 downto 8*i) <= inp(8*loc + 7 downto 8*loc);
			end loop;
		end process;
end bhv;