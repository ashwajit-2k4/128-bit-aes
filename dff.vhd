library ieee;
use ieee.std_logic_1164.all;

entity thing is
	port (J, K, en, clk, prst, rst: in std_logic; Q, Qbar: out std_logic);
end entity thing;

architecture Struct of thing is
	signal Dbar, tempq: std_logic;
begin
	async: process(prst, rst)
		begin
			if (prst = '1' and rst = '0') then
				tempq <= '1';
			elsif (rst = '1' and prst = '1') then
				tempq <= '0';
			end if;
		end process;
	flipflop: process(clk, J, K, en)
		begin
			if (clk' event and clk = '1' and en = '1') then
				if (J = '1' and K = '1') then
					tempq <= not tempq;
				elsif (J = '1' and K = '0') then
					tempq <= '0';
				elsif (J = '0' and K = '1') then
					tempq <= '1';
				else
					tempq <= tempq;
				end if;
			end if;
		end process;
	assigning: process(tempq)
		begin
			Q <= tempq;
			Qbar <= not tempq;
		end process;
end Struct;
	
	
									 