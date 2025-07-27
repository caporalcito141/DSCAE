library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------
entity inverter is
port(
	a: in std_logic;
	b: out std_logic);
end inverter;

------------------------------------------------
architecture behavior of inverter is
begin
	b <= not a;
end behavior;