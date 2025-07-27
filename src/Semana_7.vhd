-----------------------------------------------------------------------
-- Decodificador heca 7 segmentos
library ieee;
use ieee.std_logic_1164.all;

entity CIRCUITO_13 is
	port (a: in std_logic_vector(3 downto 0);
			f: out std_logic_vector(6 downto 0));
end CIRCUITO_13;

architecture behavior of CIRCUITO_13 is
begin
	decod:process(a)
	begin
		case a is
			when "0000" => f <= "0000001";
			when "0001" => f <= "1001111";
			when "0010" => f <= "0010010";
			when "0011" => f <= "0000110";
			when "0100" => f <= "1001100";
			when "0101" => f <= "0100100";
			when "0110" => f <= "0100000";
			when "0111" => f <= "0001111";
			when "1000" => f <= "0000000";
			when "1001" => f <= "0000100";
			when "1010" => f <= "0001000";
			when "1011" => f <= "1100000";
			when "1100" => f <= "0110001";
			when "1101" => f <= "1000010";
			when "1110" => f <= "0110000";
			when "1111" => f <= "0111000";
			when others => f <= "-------";
		end case;
	end process decod;

end behavior;

---------------------------------------------------------------------

