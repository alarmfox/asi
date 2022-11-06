library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- multiplexer con 16 ingressi a 8 bit
entity mux_16_1 is

  Port ( 
  a15, a14, a13, a12, a11, a10, a9, a8, a7, a6, a5, a4, a3, a2, a1, a0: in std_logic_vector(7 downto 0);
  s: in std_logic_vector(3 downto 0); 
  y: out std_logic_vector(7 downto 0)
  );
  
end mux_16_1;


architecture structural of mux_16_1 is

component mux_4_1 is
  Port ( 
    a3, a2, a1, a0: in std_logic_vector (7 downto 0);
    s : in std_logic_vector (1 downto 0);
    u : out std_logic_vector(7 downto 0)
  );

end component;

signal k3, k2, k1, k0 : std_logic_vector (7 downto 0);

begin
 
  mux_0: mux_4_1 
   port map(a15, a14, a13, a12, s(3 downto 2), k3);
  
  mux_1: mux_4_1 
   port map(a11, a10, a9, a8, s(3 downto 2), k2);

  mux_2: mux_4_1 
   port map(a7, a6, a5, a4, s(3 downto 2), k1);
  
  mux_3: mux_4_1 
   port map(a3, a2, a1, a0, s(3 downto 2), k0);

  mux_4: mux_4_1
    port map(k3, k2, k1, k0, s(1 downto 0), y);
   
end structural;