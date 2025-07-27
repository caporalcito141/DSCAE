library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
    port(
        DI        : in std_logic_vector(3 downto 0);
        RD        : in std_logic_vector(7 downto 0);
        clk       : in std_logic;
        btn_clean : in std_logic;  -- Entrada del botón ya procesada por el debouncer
        OP        : out std_logic_vector(3 downto 0);
        btn_count : out std_logic_vector(7 downto 0)  -- Salida del contador de pulsaciones
    );
end ALU;

architecture behavior of ALU is
    signal carry_flag     : std_logic;
    signal rc             : std_logic_vector(3 downto 0);
    signal count_reg      : unsigned(7 downto 0) := (others => '0');
    signal prev_btn_clean : std_logic := '0';
begin
    process(clk)
        variable a, b : unsigned(3 downto 0);
        variable temp_result : unsigned(4 downto 0);
    begin
        if rising_edge(clk) then

            -- Detectar flanco de subida del botón
            if btn_clean = '1' and prev_btn_clean = '0' then
                count_reg <= count_reg + 1;
            end if;
            prev_btn_clean <= btn_clean;

            -- Operaciones de la ALU
            a := unsigned(RD(7 downto 4));
            b := unsigned(RD(3 downto 0));

            case DI is
                when "1000" =>  -- AND
                    OP <= std_logic_vector(a and b);
                    carry_flag <= '0';

                when "0100" =>  -- OR
                    OP <= std_logic_vector(a or b);
                    carry_flag <= '0';

                when "0010" =>  -- NOT
                    OP <= std_logic_vector(not a);
                    carry_flag <= '0';

                when "0001" =>  -- Suma
                    temp_result := ('0' & a) + ('0' & b);
                    OP <= std_logic_vector(temp_result(3 downto 0));
                    carry_flag <= temp_result(4);

                when "0110" =>  -- Resta
                    temp_result := ('0' & a) - ('0' & b);
                    OP <= std_logic_vector(temp_result(3 downto 0));
                    carry_flag <= temp_result(4);

                when "1111" =>  -- Pasar valor de a
                    OP <= std_logic_vector(a);
                    carry_flag <= '0';

                when others =>
                    OP <= RD(3 downto 0);
                    carry_flag <= '0';
            end case;

            -- Flags
            rc(3) <= carry_flag xor (a(3) xor b(3) xor unsigned(OP)(3)); -- Overflow
            if OP = "0000" then
                rc(2) <= '1';  -- Zero
            else
                rc(2) <= '0';
            end if;
            rc(1) <= OP(3);   -- Sign
            rc(0) <= carry_flag; -- Carry
        end if;
    end process;

    btn_count <= std_logic_vector(count_reg);  -- Salida del contador
end behavior;