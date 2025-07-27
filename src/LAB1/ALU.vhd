-- Módulo de ALU (Unidad Lógica-Aritmética)
/*
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 

entity ALU is 
    port(
		  clk	  : in  std_logic;
        Q     : in  std_logic_vector(2 downto 0); -- Acumulador
		  B	  : in  std_logic;						  -- Control
        RD    : in  std_logic_vector(2 downto 0); -- Dato nuevo
        OP    : in  std_logic_vector(3 downto 0); -- Código de operación
        C     : out std_logic_vector(2 downto 0); -- Resultado
        carry : out std_logic
    );
end ALU;

architecture behavior of ALU is
begin	 
    process(clk)
        variable temp_result : unsigned(3 downto 0);
        variable result      : std_logic_vector(2 downto 0);
    begin
	 
	 if rising_edge(clk) then
		  if (B = '1') then
        case OP is
            when "0001" => -- Suma
                result := (Q ) + (RD); 
                carry <= temp_result(3);

            when "0010" => -- Resta
                temp_result := ('0' & unsigned(Q)) - ('0' & unsigned(RD));
                result := std_logic_vector(temp_result(2 downto 0));
                carry <= temp_result(3);

            when "0011" => -- AND
                result := Q and RD;
                carry <= '0';

            when "0100" => -- OR
                result := Q or RD;
                carry <= '0';

            when "0101" => -- XOR
                result := Q xor RD;
                carry <= '0';

            when "0110" => -- NOT
                result := not RD;
                carry <= '0';

            when "0111" => -- Reset
                result := (others => '0');
                carry <= '0';

            when "1000" => -- Retener
                result := RD;
                carry <= '0';

            when others => -- Default
                result := (others => '0');
                carry <= '0';
        end case;
		  
				C <= result;
		  end if;
		  
	 end if;
    end process;
end behavior;


-- Decodificador de display de 7 segmentos

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DECOD_7SEG is
    Port (
		  clk : in STD_LOGIC;
        Q : in STD_LOGIC_VECTOR(2 downto 0);
        SEG : out STD_LOGIC_VECTOR(6 downto 0)	  
    );
end DECOD_7SEG;

architecture Behavioral of DECOD_7SEG is
begin
    process (clk)
    begin
		if rising_edge(clk) then
			  case Q is
					when "000" => SEG <= "1000000"; --0
					when "001" => SEG <= "1111001"; --1
					when "010" => SEG <= "0100100"; --2
					when "011" => SEG <= "0110000"; --3
					when "100" => SEG <= "0011001"; --4
					when "101" => SEG <= "0010010"; --5
					when "110" => SEG <= "0000010"; --6
					when "111" => SEG <= "1111000"; --7
			  end case;
		 end if;
    end process;
end Behavioral;

*/

