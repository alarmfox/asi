library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- multiplexer con 4 ingressi a 8 bit
entity mux_4_1 is
    Port ( 
        a3, a2, a1, a0: in std_logic_vector (7 downto 0);
        s : in std_logic_vector (1 downto 0);
        u : out std_logic_vector (7 downto 0)
    );
end mux_4_1;

architecture dataflow of mux_4_1 is

begin

    with s select u <=
        a3 when "11",
        a2 when "10",
        a1 when "01",
        a0 when others;
         
end dataflow;