library IEEE;
use IEEE.std_logic_1164.all;


entity mux is
    port (
        a1, a0: in std_logic_vector(7 downto 0);
        s: in std_logic;
        y: out std_logic_vector(7 downto 0)
    );
end entity mux;

architecture test of mux is
    
begin
end architecture test;