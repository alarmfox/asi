library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
 
-- il clock_divider genera un impulso a frequenza inferiore rispetto a quella del clock
-- che viene usato per illuminare i diversi anodi
-- il segnale generato ? alto per un solo periodo di clock
 
entity clock_divider is
     generic(
                clock_frequency_in : integer := 100000000;--100MHz
                clock_frequency_out : integer := 1000000 --1MHz
                );
    Port ( clock_in : in  std_logic;
           reset : in std_logic;
           clock_out : out  std_logic);
end entity clock_divider;
 
architecture rtl of clock_divider is
 
constant count_max_value : integer := (clock_frequency_in/clock_frequency_out) -1;
 
begin
 
count_for_division: process(clock_in)
variable counter : integer range 0 to count_max_value := 0;
begin
 
    if rising_edge(clock_in) then
        if reset = '1' then
            counter := 0;
            clock_out <= '0';
        elsif counter = count_max_value then
            clock_out <=  '1';
            counter := 0;
        else
            clock_out <=  '0';
            counter := counter + 1;
        end if;
    end if;
 
end process;
 

end architecture rtl;
