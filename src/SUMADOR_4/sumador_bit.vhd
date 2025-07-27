library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sumador_bit is
port(
	a,b,c_in : in std_logic;
	y, cout : out std_logic
	);
end sumador_bit;


architecture behavior of sumador_bit is
begin
	y <= a xor b xor c_in;
	cout <= (a and b) or (a and c_in) or (b and c_in);
end behavior;