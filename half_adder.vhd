library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port (
    A, B    :   in  std_logic; -- entradas
    
    SUM     :   out std_logic; -- soma
    CARRY   :   out std_logic  -- "vai 1"
  ) ;
end half_adder;

architecture main of half_adder is
begin
    SUM     <= A xor B;
    CARRY   <= A and B;
end main ; -- main