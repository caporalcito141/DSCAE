/*

 *******BANCO DE REGISTROS ************
RO: Memoria de programa

RI: Registro de instruciones
RD: Registro de datos

*/
/*
-- Modulo de registro de instrucción
library ieee;
use ieee.std_logic_1164.all;

entity REG_INS is
port(
	A: in std_logic;
	RO: in std_logic_vector (6 downto 0);
	clk: in std_logic;
	RI: out std_logic_vector (3 downto 0)
	);
end REG_INS;

architecture behavior of REG_INS is
    signal reg: std_logic_vector(3 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if A = '1' then
                reg <= RO(3 downto 0);
            end if;
        end if;
    end process;

    RI <= reg;
end behavior;

-- Modulo de registro de datos
library ieee;
use ieee.std_logic_1164.all;

entity REG_DAT is
port(
	A: in std_logic;
	clk: in std_logic;
	RO: in std_logic_vector (6 downto 0);
	RD: out std_logic_vector (2 downto 0)
	);
end REG_DAT;

architecture behavior of REG_DAT is
	signal reg: std_logic_vector (2 downto 0);
begin

	process (clk) begin
		if rising_edge (clk) then
			if A = '1' then
				reg <= RO (6 downto 4);
			end if;
		end if;
	end process;
	
	RD <= reg;
	
end behavior;


-- Modulo acumulador permanente

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Acumulador is
    Port (
        clk   : in STD_LOGIC;
		  B	  : in STD_LOGIC;
        D     : in STD_LOGIC_VECTOR(2 downto 0);
        Q     : out STD_LOGIC_VECTOR(2 downto 0)
    );
end Acumulador;

architecture Behavioral of Acumulador is
    signal acc : STD_LOGIC_VECTOR(2 downto 0);
begin
    process(clk)
    begin	 
        if rising_edge(clk) then
				if B = '1' then
					acc <= D;
				end if;
        end if;
    end process;
    Q <= acc;
end Behavioral;


-- Modulo acumulador temporal

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AcumuladorT is
    Port (
        clk   : in STD_LOGIC;
		  C	  : in STD_LOGIC;
        F     : in STD_LOGIC_VECTOR(2 downto 0);
        G     : out STD_LOGIC_VECTOR(2 downto 0)
    );
end AcumuladorT;

architecture Behavioral of AcumuladorT is
    signal act : STD_LOGIC_VECTOR(2 downto 0);
begin
    process(clk)
    begin
	 
        if rising_edge(clk) then
				if C = '1' then
				 act <= F;
				end if;
        end if;
    end process;
    G <= act;
end Behavioral;

*/
