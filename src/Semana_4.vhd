-------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mux_CC is
port( a, b, s: in std_logic;
		y: out std_logic);
end mux_CC;

architecture behavior of mux_CC is
begin
	y <= (a and not(s)) or (b and s);
end behavior;

-------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CIRCUITO_2 is
port( a, b, s: in std_logic;
		y: out std_logic);
end CIRCUITO_2;

architecture behavior of CIRCUITO_2 is
begin
	y <= a when s='0' else b;
end behavior;


-----------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity CIRCUITO_3 is
port( a: in std_logic_vector(2 downto 0);
		y: out std_logic);
end CIRCUITO_3;

architecture behavior of CIRCUITO_3 is
begin
	y <= '1' when ((a(0) = '1') or (a(1) = '1')) and ((a(1) = '1') xor (a(2) = '1')) else '0';
end behavior;

-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity CIRCUITO_4 is
	port (sel: in std_logic_vector(2 downto 0);
			y: out std_logic);
end CIRCUITO_4;

architecture behavior of CIRCUITO_4 is
begin
	with sel select
		y <= '1' when "010",
				'1' when "101",
				'1' when "110",
				'0' when others;
end behavior;
