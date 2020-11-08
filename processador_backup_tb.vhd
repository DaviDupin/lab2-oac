library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity processador_tb is
    constant    n   :   integer := 32; --Num de bits
end processador_tb;

architecture sim of processador_tb is

    signal clk      :   std_logic  := '0';
    signal rst      :   std_logic  := '0';
    signal PC_IN    :   std_logic_vector(n-1 downto 0)  := (others => '0');

    signal PC_OUT	:	std_logic_vector(n - 1 downto 0) := (others => '0');

begin
    DUT :   entity work.processador generic map(n) port map(clk,rst,PC_IN,PC_OUT);

    clock: process
    begin
        wait for 50ns; --clk 10MHz
        clk <= not clk;
    end process clock;

    reset: process
    begin
        rst <= '0';
        wait for 120 ns;
        rst <= '1';
        wait for 120 ns;
        rst <= '0';
        wait;
    end process reset;

end sim;