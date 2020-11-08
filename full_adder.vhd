library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
    port(
        A, B    :   in std_logic; -- entradas
        CARRY_IN:   in std_logic; -- carry inicial
        
        SUM     :   out std_logic; -- soma
        CARRY   :   out std_logic  -- "vai 1"
    );
end full_adder;

architecture main of full_adder is
    signal  S1, C1, C2  :   std_logic;
    
begin

    ha1: entity work.half_adder(main)
        port map(A, B, S1, C1);
    
    ha2: entity work.half_adder(main)
        port map(S1, CARRY_IN, SUM, C2);

    CARRY <= C2 or C1;

end main;