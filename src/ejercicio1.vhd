library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ejercicio1 is
	port ( a, b, c : in bit;
			y : out bit);
end ejercicio1;

architecture myarch of ejercicio1 is
begin
	y <= (a and b) or c;
end myarch;
--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_D is
    port ( d, clk, rst: in std_logic;
           q: out std_logic);
end flip_flop_D;

architecture behavior of flip_flop_D is
begin
	process (rst, clk)
	begin
		if (rst='1') then
			q <= '0';
		elsif (clk'event and clk='1') then
			q <= d;
		end if;
	end process;
end behavior;

--------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FFD_NAND is
	port(a, b, clk: in bit;
	q: out bit);
end FFD_NAND;

architecture behavior of FFD_NAND is
	signal temp: bit;
begin
	temp <= a nand b;
	process (clk)
	begin
		if (clk'event and clk='1') then q<=temp;
		end if;
	end process;
end behavior;

---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux is
	port(a,b: in std_logic_vector(7 downto 0);
		sel: in std_logic_vector (2 downto 0);
		c: out std_logic_vector (7 downto 0));
end mux;

architecture behavior of mux is
begin
	process(a, b, sel)
	begin
		if (sel = "00") then
			c <= "00000000";
		elsif (sel = "01") then
			c <= a;
		elsif (sel = "00") then
			c <= b;
		else
			c <= (others => 'Z');
		end if;
	end process;
end behavior;

---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ejercicio_4 is
	port(a,b,c: in std_logic;
		d: out std_logic);
end ejercicio_4;

architecture behavior of ejercicio_4 is
begin
	d <= a nand ((a and b) or not c);
end behavior;

	