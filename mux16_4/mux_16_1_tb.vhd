library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all;
use IEEE.STD_LOGIC_TEXTIO.all;

entity mux_16_1_tb is 
end mux_16_1_tb;


architecture structural of mux_16_1_tb is

component mux_16_1 is
  Port ( 
    a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0: in std_logic_vector(7 downto 0);
    s: in std_logic_vector(3 downto 0); 
    y: out std_logic_vector(7 downto 0)
  );
  

end component;

type t_array_mux is array (0 to 15) of std_logic_vector(7 downto 0);

signal k: t_array_mux;
signal k_out: std_logic_vector(7 downto 0);
signal k_selections: std_logic_vector (3 downto 0);

begin
 
  uut: mux_16_1 
   port map(
    k(15), 
    k(14), 
    k(13), 
    k(12),
    k(11), 
    k(10), 
    k(9), 
    k(8),
    k(7), 
    k(6), 
    k(5), 
    k(4), 
    k(3), 
    k(2), 
    k(1), 
    k(0),
    k_selections, 
    k_out
  );

 test_bench: process
    file in_file: text open read_mode is "mux16_4/tb_input.txt";
    variable line, line_write: line;
    variable ok: boolean;
    variable input_value, output_value: std_logic_vector(7 downto 0);
    variable selection: std_logic_vector(3 downto 0);
  
 begin

  while not endfile(in_file) loop
    readline(in_file, line);

    for i in 15 downto 0 loop
      read(line, input_value, ok);
      if not ok then
        exit;
      end if;
      k(i) <= input_value;
    end loop;

    next when not(ok);
    read (line, selection, ok);
  
    next when not(ok);
    k_selections <= selection;

    read (line, output_value, ok);
    next when not(ok);
  
    wait for 5 ns;

    if output_value /= k_out then
      write(line_write, string'("Errore al tempo "));
      write(line_write, now);
      write(line_write, string'("; attesa "));
      write(line_write, output_value);
      write(line_write, string'(" ottenuta "));
      write(line_write, k_out);
      writeline(output, line_write);
    end if;
    
  end loop;
  file_close(in_file);
  wait;
  
 end process test_bench;
   
end structural;