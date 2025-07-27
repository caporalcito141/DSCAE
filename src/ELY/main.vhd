library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_level is
    port(
        clk        : in  std_logic;
        btn_in     : in  std_logic;
        DI         : in  std_logic_vector(3 downto 0);
        RD         : in  std_logic_vector(7 downto 0);
        OP         : out std_logic_vector(3 downto 0);
        btn_count  : out std_logic_vector(7 downto 0)
    );
end top_level;

architecture structural of top_level is

    -- Señal intermedia para salida del debouncer
    signal btn_clean : std_logic;

begin

    -- Instancia del debouncer
    deb: entity work.debouncer
        port map (
            clk     => clk,
            btn_in  => btn_in,
            btn_out => btn_clean
        );

    -- Instancia de la ALU
    alu_inst: entity work.ALU
        port map (
            clk       => clk,
            DI        => DI,
            RD        => RD,
            btn_clean => btn_clean,
            OP        => OP,
            btn_count => btn_count
        );

end structural;