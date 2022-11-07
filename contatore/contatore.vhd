library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity contatore is
    generic (
        n: positive
    );
    port (
        cnt_max, set_value: in std_logic_vector(n-1 downto 0);
        clk, rst, set: in std_logic;
        tc: out std_logic;
        count: out std_logic_vector(n-1 downto 0)
    );
end entity contatore;

architecture rtl of contatore is
    
begin
    proc_name: process(clk)
    variable current: unsigned(n-1 downto 0) := (others => '0');
    begin
        if rising_edge(clk) then
            if rst = '1' then
                current := (others => '0');
            elsif set = '1' then
                current := unsigned(set_value);
            elsif (unsigned(cnt_max) - 1 = current) then
                tc <= '1';
                current := (others => '0');
            else 
                tc <= '0';
                current := current +1;
            end if;
            count <= std_logic_vector(current);
        end if;
   end process proc_name;
    
end architecture rtl;