library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CIRCUITO_14 is
    Port (
        clk     : in  STD_LOGIC;  -- Reloj de 50MHz
        rst     : in  STD_LOGIC;  -- Reset síncrono
        clk_out : out STD_LOGIC   -- Señal dividida
    );
end CIRCUITO_14;

architecture behavior of CIRCUITO_14 is
    constant MAX_COUNT : integer := 25_000_000;  -- 50MHz / 2 = 25M para 1Hz
    signal counter     : integer range 0 to MAX_COUNT := 0;
    signal clk_reg     : STD_LOGIC := '0';
begin
process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                counter  <= 0;
                clk_reg  <= '0';
            else
					if counter = MAX_COUNT - 1 then
                    counter <= 0;
                    clk_reg <= not clk_reg;  ----Cambia estado cada 25M ciclos
                else
                    counter <= counter + 1;
                end if;
            end if;
        end if;
    end process;

    clk_out <= clk_reg;

end behavior;

--------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CIRCUITO_15 is
    Port (
        clk                  : in  STD_LOGIC;
        input_signal         : in  STD_LOGIC;
        rising_edge_detected : out STD_LOGIC;
		  falling_edge_detected: out STD_LOGIC
		  );
end CIRCUITO_15;

architecture behavior of CIRCUITO_15 is
	signal input_prev : STD_LOGIC := '0';
begin
	
	process(clk)
	begin
		if rising_edge(clk) then
			-- Detecta flanco de subida: 0 -> 1
			if input_prev = '0' and input_signal = '1' then
				rising_edge_detected <= '1';
			else
				rising_edge_detected <= '0';
			end if;
			
			-- Detecta flanco de bajada: 1->0
			if input_prev = '1' and input_signal = '0' then
				falling_edge_detected <= '1';
			else
				falling_edge_detected <= '0';
			end if;
			
			-- Guardar el valor anterior
			input_prev <= input_signal;
			
		end if;
		
	end process;
	
	
end behavior;