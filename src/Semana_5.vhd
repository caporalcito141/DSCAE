library ieee;
use ieee.std_logic_1164.all;

entity CIRCUITO_5 is
	port (a, b, s: in std_logic;
			y: out std_logic);
end CIRCUITO_5;

architecture behavior of CIRCUITO_5 is
begin
	y <= a when s='0' else b;
end behavior;


------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CIRCUITO_6 is
	port(a,b: in std_logic;
		y: out std_logic);
end CIRCUITO_6;

architecture behavior of CIRCUITO_6 is
begin
	process(a, b)
	begin
		if (a = '1' and b='1') then y <= '0';
		else
			y <= '1';
		end if;
	end process;
end behavior;
------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CIRCUITO_7 is
	port(a,b,s: in std_logic;
		y: out std_logic);
end CIRCUITO_7;

architecture behavior of CIRCUITO_7 is
begin
	process(a, b, s)
	begin
		if (s='1') then y <= a;
		else
			y <= b;
		end if;
	end process;
end behavior;
------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CIRCUITO_8 is
	port(a,b,s: in std_logic;
		y: out std_logic);
end CIRCUITO_8;

architecture behavior of CIRCUITO_8 is
begin
	process(a, b, s)
	begin
		case s is
			when '0' => y<=a;
			when '1' => y<=b;
			when others => y<='-';
		end case;
	end process;
end behavior;

------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CIRCUITO_9 is
	Port(clk: in std_logic;
           q: out std_logic_vector(1 downto 0));
end CIRCUITO_9;

architecture behavior of CIRCUITO_9 is
    signal q0, q1 : std_logic;
begin
    process(clk)
		 begin
			  if (clk'event and clk='1') then
					q0 <= not q0;
			  end if;
		 end process;

		 process(q0)
		 begin
			  if (q0'event and q0='1') then
					q1 <= not q1;
			  end if;
		 end process;
		 q <= q1 & q0;
end behavior;

------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CIRCUITO_10 is
	Port(clk: in std_logic;
			q: out std_logic_vector(2 downto 0));
end CIRCUITO_10;

architecture behavior of CIRCUITO_10 is
	signal q0, q1, q2 : std_logic :='0';
begin
	process(clk)
		begin
			if (clk' event and clk='1') then
            q0 <= not q0;                    
            q1 <= q1 xor q0;                     
            q2 <= q2 xor (q0 and q1); 
			end if;
	end process;
		q <= q2 & q1 & q0;
end behavior;


-------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;			-- librería para usar operaciones aritméticas "+"

entity CIRCUITO_11 is
	Port(clk, rs : std_logic;
			count: out std_logic_vector (3 downto 0));
end CIRCUITO_11;

architecture behavior of CIRCUITO_11 is

	signal Q: std_logic_vector (3 downto 0) := (others => '0');
	signal res_alu: std_logic_vector ( 3 downto 0);
	
	begin
		res_alu <= std_logic_vector (unsigned(Q) + 1);
		
		process(clk, rs)
		begin
			if rs = '1' then
				Q <= (others => '0');
			elsif rising_edge(clk) then
				Q <= res_alu;
			end if;
		end process;
		
		
		count <= Q;
		
end behavior;


-------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CIRCUITO_12 is
	Port ( clk: in STD_LOGIC;
				led: out STD_LOGIC);
end CIRCUITO_12;

architecture behavior of CIRCUITO_12 is

signal count : integer range 0 to 4_999_999 := 0;
signal temp_led : STD_LOGIC := '0';
begin

	process(clk)
	begin
		if rising_edge (clk) then
			if (count = 4_999_999) then
				count <= 0;
				temp_led <= not temp_led;
			else
				count <= count + 1;
			end if;
		end if;
	end process;

led <= temp_led;

end behavior;
				


