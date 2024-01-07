library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;

entity Testbench is
end entity;
architecture Behave of Testbench is
	signal clk, J, K, en, prst, rst, Q, Qbar: std_logic;
	component thing is
		port (J, K, en, clk, prst, rst: in std_logic; Q, Qbar: out std_logic);
	end component thing;

begin
process
	constant OFF_PERIOD: TIME := 10 ns;
	constant ON_PERIOD : TIME := 10 ns;
begin
		wait for OFF_PERIOD;
			CLK <= '1';
		wait for ON_PERIOD;
			CLK <= '0';
			assert (NOW < 9000 ns)
report "Simulation completed successfully.";
end process;
		J <= '0', '1' after 30 ns, '0' after 50 ns, '1' after 70 ns, '1' after 100 ns;
		K <= '1', '0' after 20 ns, '1' after 30 ns, '0' after 70 ns, '1' after 90 ns;
		en <= '0', '1' after 10 ns;
		prst <= '1', '0' after 10 ns;
		rst <= '0', '1' after 10 ns, '0' after 20 ns;
		l1: thing port map (J, K, en, clk, prst, rst, Q, Qbar);
end Behave;
		
		
		