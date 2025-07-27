/*
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port (
        clk     : in STD_LOGIC;
		  A		 : in STD_LOGIC;
		  B		 : in STD_LOGIC;
		  C		 : in STD_LOGIC;  
        RO      : in STD_LOGIC_VECTOR(6 downto 0);
        display : out STD_LOGIC_VECTOR(6 downto 0);
		  display_2 : out STD_LOGIC_VECTOR(6 downto 0);
		  salida : out STD_LOGIC_VECTOR(2 downto 0)
    );
end main;

architecture Behavioral of main is
    signal RI        : STD_LOGIC_VECTOR(3 downto 0);
    signal RD        : STD_LOGIC_VECTOR(2 downto 0);
    signal acc_out   : STD_LOGIC_VECTOR(2 downto 0);
	 signal act_out   : STD_LOGIC_VECTOR(2 downto 0);
    signal alu_out   : STD_LOGIC_VECTOR(2 downto 0);
    signal carry     : STD_LOGIC;
	 
begin
    ACC: entity work.Acumulador
        port map (
            clk  => clk,
				B    => B,
            D    => alu_out,
            Q    => acc_out
        );
		  
	 ACT: entity work.AcumuladorT
		  port map(
				clk => clk,
				C   => C,
				F => acc_out,
				G => act_out
			);
		
    R_INS: entity work.REG_INS
			port map (
					clk => clk,
					A   => A,
					RO  => RO,
					RI  => RI
			);
			
    R_DAT: entity work.REG_DAT
			port map (
				A     => A,
				clk   => clk,
				RO    => RO,
				RD    => RD
			);
			

    ALUCINA: entity work.ALU
        port map (
				clk   => clk,
            Q     => act_out,
            B     => B,
            RD    => RD,
				OP    => RI,
            C     => alu_out,
            carry => carry
        );

    DIS: entity work.DECOD_7SEG
        port map (
				clk => clk,
            Q => act_out,
            SEG => display_2
        );
		  
	 DIS2: entity work.DECOD_7SEG
		   port map (
				clk => clk,
				Q   => RD,
				SEG => display
		  );
end Behavioral;
*/