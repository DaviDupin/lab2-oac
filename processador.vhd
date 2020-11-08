library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processador is
    generic(n	:	integer := 32); -- Num de bits
    port(
		clk		:	in	std_logic;							
        rst		:	in	std_logic;
        PC_IN   :   in  std_logic_vector(n - 1 downto 0);							
		
		PC_OUT	:	out	std_logic_vector(n - 1 downto 0) 	-- dado out [0:31]
	);
end processador;

architecture PC of processador is

    signal PC_aux, PC_somado    : std_logic_vector(n - 1 downto 0);

    signal CARRY_OUT            :   std_logic;
    signal CARRY_IN             :   std_logic := '0'; -- carry in do somador
    signal quatro : std_logic_vector(n - 1 downto 0) := "00000000000000000000000000000100";

begin

    PC: entity work.reg(main) port map (clk, rst, PC_IN, PC_aux);
    ADD: entity work.adder32b(main) port map (PC_aux, quatro, CARRY_IN, PC_somado, CARRY_OUT); -- não preciso do carry out, mas não sei o que fazer com ele (warning)
    PC_OUT <= PC_somado;

end PC;