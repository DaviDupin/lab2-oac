library ieee;
use ieee.std_logic_1164.all;

entity reg is
	generic(n	:	integer := 32); -- Num de bits
	port(
		clk		:	in	std_logic;							
		rst		:	in	std_logic;							
		d		:	in	std_logic_vector(n - 1 downto 0);	-- dado [0:31]
		
		q		:	out	std_logic_vector(n - 1 downto 0) 	-- dado out [0:31]
	);
end reg;

architecture main of reg is
begin
	process(rst, clk, d)
	begin
		
		if rst = '1' then -- Reset setado para 1	{DÚVIDA: não seria falling_edge(rst)?}
			q <= (others => '0');
		elsif clk = '1' then -- clock ativado na borda de subida
			q <= d;
		end if;
		
	end process;
end main;