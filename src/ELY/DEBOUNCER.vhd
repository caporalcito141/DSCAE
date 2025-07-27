library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity debouncer is
    port (
        clk     : in  std_logic;       -- Reloj del sistema
        btn_in  : in  std_logic;       -- Entrada con rebote (botón)
        btn_out : out std_logic        -- Salida limpia (botón sin rebote)
    );
end debouncer;

architecture Behavioral of debouncer is
    signal btn_reg     : std_logic := '0';                   -- Estado estable del botón
    signal counter     : integer range 0 to 250000 := 0;     -- Contador de estabilidad
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if btn_in /= btn_reg then                        -- Si el botón ha cambiado
                counter <= counter + 1;                      -- Empieza a contar
                if counter > 200000 then                    -- Espera a que se mantenga el nuevo valor
                    btn_reg <= btn_in;                      -- Acepta el nuevo valor
                    counter <= 0;                           -- Reinicia el contador
                end if;
            else
                counter <= 0;                               -- Si no cambió, reinicia contador
            end if;
        end if;
    end process;

    btn_out <= btn_reg;                                     -- Salida estable sin rebote
end Behavioral;