use ieee.numeric_std.all;

entity keyexp is
	port (key: in std_logic_vector(127 downto 0); i_bits: in std_logic_vector(5 downto 0); wprev: in std_logic_vector(63 downto 0) wi:out std_logic_vector (31 downto 0));
end keyexp;


architecture behav of keyexp is
	function rotword(inp : std_logic_vector(31 downto 0))
              return std_logic_vector(31 downto 0) is
		begin

		end rotword;
	function subword(inp : std_logic_vector(31 downto 0))
              return std_logic_vector(31 downto 0) is
		begin

		end subword;
	function rcon(inp : std_logic_vector(31 downto 0))
              return std_logic_vector(31 downto 0) is
		begin

		end rcon;

	begin
	
	KeyExpansion: process (byte key[16], word w[44], Nk)
		variable i : INTEGER := 0;
		variable temp: std_logic_vector (31 downto 0):= temp(63 downto 32);
		begin
			while i < Nk loop
				for j in 0 to 31
					if (j < 8) then
						w[i](j) <= key(4*i + j);
					elsif (j < 16) then
						w[i](j) <= key(4*(i + 1) + j);
					elsif (j < 24) then
						w[i](j) <= key(4*(i + 2) + j);
					else
						w[i](j) <= key(4*(i + 3) + j);
					end if;
				i := i+1;
			end loop;
			i := Nk;
			while i < 44 loop
				temp = w[i-1];
				if (i mod 4 = 0) then
					temp = SubWord(RotWord(temp)) xor Rcon[i/4];
				elsif (Nk > 6 and i mod 4 = 4) then
					temp = SubWord(temp);
				end if;
				w[i] = w[i-Nk] xor temp;
				i = i + 1;
			end loop;
	end process;