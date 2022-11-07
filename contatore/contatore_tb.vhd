library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cont_tb is
end entity cont_tb;

architecture test of cont_tb is
    component contatore is
        generic (
            n: positive
        );
        port (
            cnt_max, set_value: in std_logic_vector(n-1 downto 0);
            clk, rst, set: in std_logic;
            tc: out std_logic;
            count: out std_logic_vector(n-1 downto 0)
        );
    end component;

    signal tb_in, tb_count, tb_set_value: std_logic_vector(5 downto 0) := (others => '0');
    signal tb_set, tb_ck, tb_rst, tb_tc: std_logic := '0';
    constant clk_period: time := 10 ns;
begin
    dut: contatore
    generic map(n => 6)
    port map (
        tb_in, 
        tb_set_value, 
        tb_ck, 
        tb_rst, 
        tb_set, 
        tb_tc, 
        tb_count
    );

    ns_counter: process 
    begin
        tb_in <= "111100";
        tb_rst <= '1';
        wait for 20 ns;
        tb_rst <= '0';
        wait for 20 ns;
        assert (tb_count = "000010") report "expected 2" severity failure;
        wait for 50 ns;
        assert (tb_count = "000111") report "expected 7" severity failure;
        wait;
    end process ns_counter;

    clock: process
    begin
        for i in 0 to 99
        loop
            tb_ck <= '1';
            wait for clk_period/2;
            tb_ck <= '0';
            wait for clk_period/2;
        end loop;
        wait;
    end process clock;
    
end architecture test;