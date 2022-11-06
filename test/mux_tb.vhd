library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mux_tb is
end entity mux_tb;

architecture prova of mux_tb is

    component mux port (
        a1, a0: in std_logic_vector(7 downto 0);
        s: in std_logic;
        y: out std_logic_vector(7 downto 0)
    );
    end component;

    signal s_a0, s_a1, s_y: std_logic_vector(7 downto 0);
    signal s_selection: std_logic;

    begin
        dut: mux port map (s_a1, s_a0, s_selection, s_y);

        s_a1 <= "00000000", "00001111" after 4 ns,  "00001100" after 6 ns;
        s_a0 <= "11111111", "11110000" after 4 ns,  "11000000" after 6 ns;
        s_selection <= '1', '0' after 1 ns, '1' after 3 ns, '0' after 7 ns, '1' after 10 ns;
end architecture prova;