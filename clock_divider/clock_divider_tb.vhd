library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity clock_divider_tb is
end entity clock_divider_tb;

architecture test of clock_divider_tb is
    component clock_divider is
        generic(
                   clock_frequency_in : integer := 100000000; --100MHz
                   clock_frequency_out : integer := 100000000 --100MHz
                   );
       Port ( clock_in, reset : in  std_logic;
              clock_out : out  std_logic);
   end component clock_divider;
    
    signal tb_clock_in, tb_clock_out, tb_reset: std_logic := '0';
    constant clk_period: time := 10 ns;
begin
    dut: clock_divider
    generic map(
        clock_frequency_in => 100000000, --100MHz
        clock_frequency_out => 10000000 --10MHz
    )
    port map (
        clock_in=>tb_clock_in, 
        reset=>tb_reset, 
        clock_out=>tb_clock_out
    );

    testbench: process 
    begin
        tb_reset <= '1';
        wait for clk_period;
        tb_reset <= '0';
        wait for clk_period * 5;
        wait;
    end process testbench;

    clock: process
    begin
        loop
            tb_clock_in <= not tb_clock_in;
            wait for clk_period/2;
        end loop;
    end process clock;
    
end architecture test;