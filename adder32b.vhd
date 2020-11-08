library ieee;
use ieee.std_logic_1164.all;

entity adder32b is
    generic(n	:	integer := 32); -- Num de bits
    port(
        A, B        :   in  std_logic_vector(n - 1 downto 0);
        CARRY_IN    :   in  std_logic;

        SUM         :   out std_logic_vector(n - 1 downto 0);
        CARRY_OUT   :   out std_logic
    );
end adder32b;


architecture main of adder32b is

    signal CARRY   :   std_logic_vector(0 to n); -- Vetor de carries

begin
    
    CARRY(0) <= CARRY_IN; 

    -- Realiza a soma com full adder para 32 bits
    L1: for i in 0 to n - 1 generate
            FA: entity work.full_adder(main) port map(A(i), B(i), CARRY(i), SUM(i), CARRY(i + 1));
        end generate L1;

    CARRY_OUT <= CARRY(n); -- poderia vir antes do loop, mas na minha mente fica mais organizado assim, porque "percorre" de 0 a n, em ordem

end main ; -- main