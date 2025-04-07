library IEEE;
use ieee.std_logic_1164.ALL;

library std;
use std.standard.all;

library work;
use work.all;


entity ejercicio1 is
	port ( a, b, c : in bit;
			y : out bit);
end ejercicio1;

architecture myarch of ejercicio1 is
begin
--	y <= (a and b and c) or (b and not a and d) or (not b and a and e) or (not a and not b and f);
	y <= (a and b) or c;
end myarch;