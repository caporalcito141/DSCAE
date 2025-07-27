/*****************************************
*ACUMULADOR (si le pones descripción)
******************************************/

library ieee;
use ieee.std_logic_1164.all;

entity Registro_Acumulador is
    Port (
			
			clk  : in	STD_LOGIC;
			E    : in	STD_LOGIC_VECTOR(1 downto 0); -- Selector de bus de entrada
			w	  : in	STD_LOGIC;							-- Señal de escritura 

			Ai   : in  STD_LOGIC_VECTOR(7 downto 0);	-- Bus de entrada A
			Bi   : in  STD_LOGIC_VECTOR(7 downto 0);	-- Bus de entrada B
			Ci   : in  STD_LOGIC_VECTOR(7 downto 0);	-- Bus de entrada C

			Ao   : out STD_LOGIC_VECTOR(7 downto 0);	-- Bus de salida A
			Bo   : out STD_LOGIC_VECTOR(7 downto 0);	-- Bus de salida B	
			Co   : out STD_LOGIC_VECTOR(7 downto 0);	-- Bus de salida C

			N    : out STD_LOGIC; 							-- Bandera de signo
			Z    : out STD_LOGIC; 							-- Bandera de cero
			V    : out STD_LOGIC  							-- Bandera de overflow
			);
end Registro_Acumulador;

architecture behavior of Registro_Acumulador is

-- temp => Almacena el contenido del registro
-- t2   => Guarda el dato multiplexado temporalmente

    signal temp, t2 : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
	 
begin
	process(all)
	begin
		case E is
		  when "01" => t2 <= Ai;
		  when "10" => t2 <= Bi;
		  when "11" => t2 <= Ci;
		  when others => t2 <= temp;	-- Mantiene el ultimo valor
		end case;
	end process;
		
	process(clk)
	begin
		if rising_edge(clk) then
			if w = '0' then
				temp <= t2;
			end if;
		end if;
	end process;
	
	-- Banderas
	N <= temp(7);																																-- Bit de signo
	Z <= '1' when temp = "00000000" else '0';																							-- Bandera cero
	V <= (not temp(7)) and (temp(6) and temp(5) and temp(4) and temp(3) and temp(2) and temp(1) and temp(0));	-- Overflow
	
	Ao <= temp when (E = "01" and w = '1') else (others => 'Z');
	Bo <= temp when (E = "10" and w = '1') else (others => 'Z');
	Co <= temp;
	
end behavior;


/*****************************************
*SR LATCH
******************************************/
library ieee;
use ieee.std_logic_1164.all;


entity SR_FF is
    port (
        clk : in  std_logic;
        S   : in  std_logic;
        R   : in  std_logic;
        Q   : out std_logic
    );
end entity;

architecture behavior of SR_FF is
    signal Q_reg : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if (S = '1' and R = '0') then
                Q_reg <= '1';
            elsif (S = '0' and R = '1') then
                Q_reg <= '0';
            elsif (S = '0' and R = '0') then
                Q_reg <= Q_reg; -- mantiene
            else
                Q_reg <= 'X'; -- invalido
            end if;
        end if;
    end process;
    Q <= Q_reg;
end architecture;


/*****************************************
*REGISTRO DE DIRECCIONES
******************************************/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Address_Register is
  port (
    clk   : in  std_logic;                          -- Reloj
    cbd   : in  std_logic;                          -- Reset asíncrono activo en '1'
    ln    : in  std_logic_vector(15 downto 0);      -- Entrada de datos
    dout  : out std_logic_vector(15 downto 0)       -- Salida del registro
  );
end entity Address_Register;

architecture behavior of Address_Register is
  signal reg : std_logic_vector(15 downto 0);
begin

  process (clk)
  begin
    if cbd = '1' then
      reg <= (others => '0');           -- Reset asíncrono
    elsif rising_edge(clk) then
      reg <= ln;                        -- Carga de datos en flanco de subida
    end if;
  end process;

  dout <= reg;

end architecture behavior;


/*****************************************
*GROUND
******************************************/

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ground is
    Port (
        E  : in  STD_LOGIC_VECTOR(1 downto 0);       -- señal de control
        Q  : out STD_LOGIC_VECTOR(15 downto 0)       -- salida: ceros o 'Z'
    );
end Ground;

architecture behavior of Ground is
begin
    process(E)
    begin
        if (E = "01") then
            Q <= (others => '0');                    -- salida en 0
        else
            Q <= (others => 'Z');                    -- alta impedancia (desconectado)
        end if;
    end process;
end behavior;



/*****************************************
*Busmux_8bit
******************************************/

library ieee;
use ieee.std_logic_1164.all;

entity Busmux_8bit is
	port (
		selbus	: in std_logic;
		lowd		: in std_logic_vector(7 downto 0);
		highd		: in std_logic_vector(7 downto 0);
		Q			: out std_logic_vector(7 downto 0)
	);
end Busmux_8bit;

architecture behavior of Busmux_8bit is

	signal Qx	: std_logic_vector(7 downto 0);
	
begin
	
	process (all)
	begin
		if selbus = '1' then
			Qx		<= highd;
		else
			Qx		<= lowd;
		end if;
	end process;
	
	Q	<= Qx;
end behavior;


/*****************************************
*Carry_Mux3
******************************************/

library ieee;
use ieee.std_logic_1164.all;

entity Carry_Mux3 is
	port (
		CReg   	: in std_logic;
		CAlu		: in std_logic;
		Selmux	: in std_logic_vector(1 downto 0);
		Carry		: out std_logic
	);
end Carry_Mux3;

architecture behavior of Carry_Mux3 is

	signal Carryx	: std_logic;
	
begin
	
	process (all)
	begin
		case (Selmux) is
			when "01" => Carryx <= CReg;
			when "11" => Carryx <= CAlu;
			when others => Carryx <= Carryx;
		end case;
		
	end process;
	
	Carry	<= Carryx;
end behavior;



/*****************************************
*BusDemux_8bit
******************************************/

library ieee;
use ieee.std_logic_1164.all;

entity BusDemux_8bit is
	port (
		selupa   : in std_logic;
		ede		: in std_logic;
		D			: in std_logic_vector(7 downto 0);
		lows		: out std_logic_vector(7 downto 0);
		highs		: out std_logic_vector(7 downto 0)
	);
end BusDemux_8bit;

architecture behavior of BusDemux_8bit is

	signal lowx	: std_logic_vector(7 downto 0);
	signal highx	: std_logic_vector(7 downto 0);
	
begin
	
	process (all)

	begin
	
	highx <= (others => '0');
	lowx	<= (others => '0');
		if ede = '0' then
			if selupa = '1' then
				highx <= D;
			else
				lowx <= D;
			end if;
			
		end if;
		
	end process;
	
	lows <= lowx;
	highs <= highx;
end behavior;


/*****************************************
*Tri-state Buffer
******************************************/
library ieee;
use ieee.std_logic_1164.all;

entity Buffer_tristate is

	port(
		IM		: in std_logic_vector(7 downto 0);
		ASn	: in std_logic;
		BD		: in std_logic;
		RWn	: in std_logic;
		
		Dout	: out std_logic_vector(7 downto 0)
	);
	
end Buffer_tristate;

architecture behavior of Buffer_tristate is

	signal Doutx	: std_logic_vector(7 downto 0);
	signal E			: std_logic;

begin
	
	process(all)
	begin
		if (ASn and BD and RWn) = '1' then
			Doutx	<= IM;
		else 
			Doutx <= (others => 'Z');
		end if;
	end process;
	
	
	Dout <= Doutx;
end behavior;


/*****************************************
*REGISTRO DE INTERRUPCIONES
******************************************/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InterruptionRegister is
    port (
        clk   : in  std_logic;
        load  : in  std_logic;
        cx    : in  std_logic;
        ex    : in  std_logic;
        d     : in  std_logic_vector(15 downto 0);
        q     : out std_logic_vector(15 downto 0)
    );
end entity;

architecture behavior of InterruptionRegister is
    signal reg_q : std_logic_vector(15 downto 0);
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if cx = '1' then
                reg_q <= (others => '0');
            elsif load = '1' then
                reg_q <= d;
            elsif ex = '1' then
                reg_q <= (reg_q or d);
            end if;
        end if;
    end process;

    q <= reg_q;
end architecture;


/*****************************************
*Multiplexaje de los registros X e I
******************************************/
library ieee;
use ieee.std_logic_1164.all;

entity X_Y_Mux is
    port (
        enaY : in  std_logic;
        Nx   : in  std_logic;
        Zx   : in  std_logic;
        Ny   : in  std_logic;
        Zy   : in  std_logic;
        Ni   : out std_logic;
        Zi   : out std_logic
    );
end entity;

architecture behavior of X_Y_Mux is
begin
    process(enaY, Nx, Zx, Ny, Zy)
    begin
        if enaY = '0' then
            Ni <= Nx;
            Zi <= Zx;
        else
            Ni <= Ny;
            Zi <= Zy;
        end if;
    end process;
end architecture;


/***************************************************************************************************************
*CONTADOR (16 bits)

Entradas:
clk						: Señal de reloj
rst						: Coloca el contenido de registro a ceros
C(2 downto 0)			: Controlan el funcionamiento del contador, de manera que permita realizar
								incrementos, decrementos y cargas de datos
E(2 downto 0)			: Permite seleccionar uno o varios buses de salida
ln(15 downto 0)		: Bus de entrada de 16 bits. Los 8 bits más significativos de este bus
								corresponden al bus de entrada C y los 8 bits menos significativos al bus de entrada D
Salidas:
N							: Bandera de negativo, el resultado es negativo (el bit 7 vale ‘1’ lógico)
Z							: Bandera de cero, el resultado es igual a cero
Q(15 downto 0)			: Bus de salida de 16 bits. Los 8 bits más significativos de este bus
								corresponden al bus de salida C y los 8 bits menos significativos al bus de salida D
Y(15 downto 0)			: Bus de salida de 16 bits correspondiente al bus de salida E

****************************************************************************************************************/

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Registro_Contador is
    Port(
        clk, rst    : in STD_LOGIC;
        C, E        : in STD_LOGIC_VECTOR(2 downto 0);
		  ln          : in STD_LOGIC_VECTOR(15 downto 0);
        N, Z        : out STD_LOGIC;
        Q, Y        : out STD_LOGIC_VECTOR(15 downto 0)
    );
end Registro_Contador;

architecture behavior of Registro_Contador is
    signal temp : STD_LOGIC_VECTOR(15 downto 0);
begin

    process(clk, C)
    begin
	 
        if rising_edge(clk) then
            if rst = '1' then
                temp <= (others => '0');
            else
				
					case C is						
						when "001" => temp <= temp + 1;								-- Incremento en 1
						when "010" => temp <= temp - 1;								-- Decremento en 1
						when "011" => temp(7 downto 0) <= ln(7 downto 0);		-- Cargar un valor en la parte baja (Escritura)
						when "100" => temp(15 downto 8) <= ln(15 downto 8);	-- Cargar un valor en la parte alta (Escritura)
						when "101" => temp <= ln;										-- Cargar un valor de 16 bits (Escritura)
						when "110" => temp <= temp(14 downto 0) & '0';			-- Corrimiento a la izquierda
						when "111" => temp <= '0' & temp(15 downto 1);			-- Corrimiento a la derecha
						when others => temp <= temp;
						end case;
            end if;
        end if;
    end process;

    Z <= '1' when temp = "0" else '0';
    N <= temp(15);

    Y <= temp when (E(2) = '0') else (others => 'Z');
    Q(15 downto 8) <= temp(15 downto 8) when (E(1) = '0') else (others => 'Z');
    Q(7 downto 0)  <= temp(7 downto 0) when (E(0) = '0') else (others => 'Z');
	 

end behavior;



/*******************************************************************************************************************
* REGISTRO DE BANDERAS

El registor de banderas está formado por las siguientes banderas que serán la salida el
registro almacenada en Out[7:0]

C : Bit 0 -> Bandera de acarreo
V : Bit 1 -> Bandera de overflow (sobreflujo)
Z : Bit 2 -> Bandera de cero
N : Bit 3 -> Bandera de negativo     ___
I : Bit 4 -> Bandera de interrupcion IRQ
H : Bit 5 -> Bandera de medio acarreo ____
X : Bit 6 -> Bandera de interrupción  XIRQ

************* Salidas **********************************************************************************************

Co						: Linea de salida con el valor de la bandera de acarreo
Out(7 downto 0)	: Bus de salida hacia la parte baja del bus de datos con las banderas del registro

************* Entradas *********************************************************************************************
clk							: Señal de reloj 											
ln[7:0]						: Bus de 8 bits conectado a la parte baja del bus de datos interno
Calu, Ccor					: Banderas de acarreo provenientes de la ALU y del registro de corrimiento de la UPA

Valu, Vcor,|				: Banderas de overflow provenientes de la ALU, del registro de corrimiento de la UPA,
Va, Vb     |				  del acumulador A y B

Zalu, Zcor, |				  Banderas de cero provenientes de la ALU, registro de corrimiento de la UPA, de los
Za, Zb, Zsp,|				: registros acumuladores A y B, del apuntador de pila, del registro de indice IX y del
Zi, Zd      |				  registro D

Nalu, Ncor, |			     Banderas de negativo provenientes de la ALU, registro de corrimiento de la UPA, de los	  
Na, Nb, Nsp,|				: registros acumuladores A y B, del apuntador de pila y del registro de indice IX
Ni          |				  

Halu							: Bandera de medio acarreo proveniente de la ALU
							
Cena, Vena, Zena,|      : Habilitan la carga de datos en el registro de banderas adecuado (C, V, Z, N, I, H, XX y S) 
Nena, Iena, Hena,| 
Xena, Sena       |

C[2:0],V[2:0], Z[3:0], |  Permite seleccionar la procedencia de las banderas C, V, Z, N, I, H, XX y S.
N[3:0], I[1:0], H[1:0],|: 
XX[1:0], S[1:0]        |
	
*******************************************************************************************************************/

library ieee;
use ieee.std_logic_1164.all;


entity Registro_Banderas is
	port (
			clk																	: in std_logic;
			ln 																	: in std_logic_vector (7 downto 0);
			Calu, Ccor, Valu, Vcor, Va, Vb								: in std_logic;
			Zalu, Zcor, Za, Zb, Zi, Zsp, Zd								: in std_logic;
			Nalu, Ncor, Na, Nb, Ni, Nsp									: in std_logic;
			Halu, Cena, Vena, Zena, Nena, Iena, Hena, Xena, Sena	: in std_logic;
			C, V																	: in std_logic_vector (2 downto 0);
			Z, N																	: in std_logic_vector (3 downto 0);
			I, H, XX, S															: in std_logic_vector (1 downto 0);
			Co																		: out std_logic;
			Output																: out std_logic_vector (7 downto 0)
			
			);
end Registro_Banderas;


architecture behavior of Registro_Banderas is

	signal tempOut	:	std_logic_vector (7 downto 0);

begin

	process (clk)
	begin
		
		if rising_edge (clk) then
		
			-- Actualiza bandera de acarreo
			
			if (Cena = '0') then
			
				case C is
					when "000" => tempOut(0) <= ln(0);		-- C = bit 0 del bus de datos
					when "001" => tempOut(0) <= '0';			-- C = 0
					when "010" => tempOut(0) <= '1';			-- C = 1
					when "011" => tempOut(0) <= Calu;		-- C = bandera de la alu
					when "100" => tempOut(0) <= Ccor;		-- C = bandera del registro de corrimiento
					when others => tempOut(0) <= tempOut(0);
				end case;
			end if;
			
			-- Actualiza la bandera de sobreflujo
			
			if (Vena = '0') then
				
				case V is
					when "000" => tempOut(1) <= ln(1);		-- V = bit 1 del bus de datos
					when "001" => tempOut(1) <= '0';			-- V = 0
					when "010" => tempOut(1) <= '1';			-- V = 1
					when "011" => tempOut(1) <= Valu;		-- V = bandera de la alu
					when "100" => tempOut(1) <= Vcor;		-- V = bandera del registro de corrimiento
					when "101" => tempOut(1) <= Va;			-- V = bandera del acumulador A
					when "110" => tempOut(1) <= Vb;			-- V = bandera del acumulador B
					when others => tempOut(1) <= tempOut(1);
				end case;
			end if;
			
			-- Actualiza la bandera de cero
			
			if (Zena = '0') then
			
				case Z is
					when "0000" => tempOut(2) <= ln(2);		-- Z = bit 2 del bus de datos
					when "0001" => tempOut(2) <= '0';		-- Z = 0
					when "0010" => tempOut(2) <= '1';		-- Z = 1
					when "0011" => tempOut(2) <= Zalu;		-- Z = bandera de alu
					when "0100" => tempOut(2) <= Zcor;		-- Z = bandera de registro de corrimiento
					when "0101" => tempOut(2) <= Za;			-- Z = bandera de acumulador A
					when "0110" => tempOut(2) <= Zb;			-- Z = bandera de acumulador B
					when "0111" => tempOut(2) <= Zi;			-- Z = bandera del registro indice
					when "1000" => tempOut(2) <= Zd;			-- Z = bandera del doble acumulador
					when "1001" => tempOut(2) <= Zsp;		-- Z = bandera de apuntador de pila
					when others => tempOut(2) <= tempOut(2);
				end case;
			end if;
			
			-- Actualiza la bandera de negativo
			
			if (Nena = '0') then
			
				case N is
					when "0000" => tempOut(3) <= ln(3);		-- N = bit 3 del bus de datos
					when "0001" => tempOut(3) <= '0';		-- N = 0
					when "0010" => tempOut(3) <= '1';		-- N = 1
					when "0011" => tempOut(3) <= Nalu;		-- N = bandera de alu
					when "0100" => tempOut(3) <= Ncor;		-- N = bandera de registro de corrimiento
					when "0101" => tempOut(3) <= Na;			-- N = bandera de acumulador A
					when "0110" => tempOut(3) <= Nb;			-- N = bandera de acumulador B
					when "0111" => tempOut(3) <= Ni;			-- N = bandera de registro indice
					when "1000" => tempOut(3) <= Nsp;		-- N = bandera de apuntador de pila
					when others => tempOut(3) <= tempOut(3);
				end case;
			end if;
			
			-- Actualiza la bandera de interrupcion IRQ
			
			if (Iena = '0') then
			
				case I is
					when "00" => tempOut(4) <= ln(4);		-- I = bit 4 del bus de datos
					when "01" => tempOut(4) <=  '0';			-- I = 0
					when "10" => tempOut(4) <=  '1';			-- I = 1
					when others => tempOut(4) <= tempOut(4);
				end case;
			end if;
			
			-- Actualiza la bandera de medio acarreo
			
			if (Hena = '0') then
			
				case H is
					when "00" => tempOut(5) <= ln(5);		-- H = bit 5 del bus de datos
					when "01" => tempOut(5) <= '0';			-- H = 0
					when "10" => tempOut(5) <= '1';			-- H = 1
					when "11" => tempOut(5) <= Halu;			-- H = bandera de la alu
					when others => tempOut(5) <= tempOut(5);
				end case;
			end if;
			
			-- Actualiza la bandera de interrupcion XIRQ
			
			if (Xena = '0') then
				
				case XX is
					when "00" => tempOut(6) <= ln(6);		-- XX = bit 6 del bus de datos
					when "01" => tempOut(6) <= '0';			-- XX = 0
					when "10" => tempOut(6) <= '1';			-- XX = 1
					when others => tempOut(6) <= tempOut(6);
				end case;
			end if;
			
			-- Actualiza la bandera de STOP
			
			if (Sena = '0') then
			
				case S is
					when "00" => tempOut(7) <= ln(7);		-- S = bit 7 del bus de datos
					when "01" => tempOut(7) <= '0';			-- S = 0
					when "10" => tempOut(7) <= '1';			-- S = 1
					when others => tempOut(7) <= tempOut(7);
				end case;
			end if;
								
		end if;
		
	end process;
	
	Co <= tempOut(0);
	Output <= tempOut;
	
end behavior;



/*******************************************************************************************************************
* UNIDAD DE PROCESOS ARIMÉTICOS (UPA)

Esta unidad se compone de 3 modulos:

UPA_in		=> Selecciona las fuentes de donde provendran los datos
ALU_8bits	=> Efectua las operaciones entre los operandos seleccionados
UPA_out_A	=> Se encarga de efectuar los corrimientos, y de colocar en el
					registro adecuado (destino) el resultado de las operaciones
*******************************************************************************************************************/


/**********************************************UPA_IN**************************************************************
El módulo selecciona la procedencia de los datos a operar.

********Entradas************

A[7:0]		=> Dato proveniente del acumulador A
B[7:0]		=> Dato proveniente del acumulador B
D[7:0]		=> Dato proveniente del bus de datos
Q[7:0]		=> Dato proveniente del registor de corrimiento Q de la UPA
UPA[3:0]		=> Señales de control. Permiten elegir la procedencia de los datos

********Salidas*************

R[7:0]		=> Primer operando
S[7:0]		=> Segundo operando
Cln			=> Limpia contador (coloca a 0 el contenido del registro contador)
Inc			=> Incrementa en contenido del contador a una unidad
********************************************************************************************************************/


library ieee;
use ieee.std_logic_1164.all;

entity UPA_IN is
	port(
		UPA				: in std_logic_vector(3 downto 0);
		A, B, D, Q		: in std_logic_vector(7 downto 0);
		R, S				: out std_logic_vector( 7 downto 0);
		Cln, Inc			: out std_logic
		);
end UPA_IN;

architecture behavior of UPA_IN is

	signal Rx, Sx		:	std_logic_vector(7 downto 0);
	signal Clnx, Incx	:	std_logic;
	
begin
	
	process (all)
	begin
		
		Rx    <= (others => '0');
		Sx    <= (others => '0');
		Clnx  <= '0';
		Incx  <= '0';
		case UPA is
			
			-- Selecciona bus A y 0
			when "0000" => Rx<= A; Sx<= x"00"; Clnx<= '0'; Incx<= '0';
			-- Selecciona bus A y B
			when "0001" => Rx<= A; Sx<= B; Clnx<= '0'; Incx<= '0';
			-- Selecciona 0 y bus Q
			when "0010" => Rx<= x"00"; Sx<= Q; Clnx<= '0'; Incx<= '0';
			-- Selecciona 0 y bus B
			when "0011" => Rx<= x"00"; Sx<= B; Clnx<= '0'; Incx<= '0';
			-- Selecciona 0 y bus A
			when "0100" => Rx<= x"00"; Sx<= A; Clnx<= '0'; Incx<= '0';
			-- Selecciona bus D y A
			when "0101" => Rx<= D; Sx<= A; Clnx<= '0'; Incx<= '0';
			-- Selecciona bus D y Q
			when "0110" => Rx<= D; Sx<= Q; Clnx<= '0'; Incx<= '0';
			-- Selecciona bus D y 0
			when "0111" => Rx<= D; Sx<= x"00"; Clnx<= '0'; Incx<= '0';
			-- Selecciona bus D y B
			when "1000" => Rx<= D; Sx<= B; Clnx<= '0'; Incx<= '0';
			-- Selecciona bus Q y B
			when "1001" => Rx<= Q; Sx<= B; Clnx<= '0'; Incx<= '0';
			-- Limpia el contenido del registro contador
			when "1010" => Rx<= B; Sx<= x"00"; Clnx<= '1'; Incx<= '0';
			-- Incrementa el contenido del registor contador
			when "1011" => Rx<= B; Sx<= x"00"; Clnx<= '0'; Incx<= '1';
			-- Selecciona el bus Q y A
			when "1100" => Rx<= Q; Sx<= A; Clnx<= '0'; Incx<= '0';
			when others => null;
		end case;
		
	end process;
	
	R		<= Rx;
	S		<= Sx;
	Cln	<= Clnx;
	Inc	<= Incx;

end behavior;
		

/**********************************************ALU_8bit**************************************************************
Este módulo realiza las operaciones logico-aritmeticas entre los operandos seleccionados.

********Entradas************

clk			=> Señal de reloj
Cin			=> Acarreo de entrada
Inc			=> Indica que la operacion a efectuar es un incremento
Dec			=> Indica que la operacion a efectuar es un decremento
Neg			=> Indica que la operacion a efectuar es una negacion
Haba			=> Flanco positivo calcula las banderas de la ALU
R, S			=> Datos a operar
UPA [6:4]	=> Señales de control para seleccionar la operación a efectuar

********Salidas*************

H, N, Z, V, C	=> Son los valores de las banderas de medio acarreo, negativo, cero, overflow y acarreo,
						generadas tras cualquier operacion de la ALU
F [7:0]			=> Resulato de la operacion

********************************************************************************************************************/
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all; 


entity ALU_8bit is
	port(
		clk, Cin, Inc, Dec, Neg, Haba			: in std_logic;
		UPA											: in Std_logic_vector (2 downto 0);
		R,S											: in std_logic_vector (7 downto 0);
		C, N, Z, V, H								: out std_logic;
		F												: out Std_logic_vector(7 downto 0)
		);
end ALU_8bit;


architecture behavior of ALU_8bit is

	signal Cx, Nx, Zx, Vx, Hx					: std_logic;
	signal Fx										: Std_logic_vector(7 downto 0);
	
	/*********Función and_reduce***********
	Esta función recibe un vector de tipo std_logic_vector y devuelve un solo bit std_logic.
	Su propósito es realizar una operación lógica AND entre todos los bits del vector de entrada.
	**************************************/
	
	function and_reduce(v : std_logic_vector) return std_logic is
	
	variable result : std_logic := '1';
	begin
		for i in v'range loop
		  result := result and v(i);
		end loop;
		return result;
		
	end function;
	
	
	/*********Función or_reduce***********
	Esta función recibe un vector de tipo std_logic_vector y devuelve un solo bit std_logic.
	Su propósito es realizar una operación lógica OR entre todos los bits del vector de entrada. 
	**************************************/
	
	function or_reduce(v : std_logic_vector) return std_logic is
	
	variable result : std_logic := '1';
	begin
		for i in v'range loop
		  result := result or v(i);
		end loop;
		return result;
		
	end function;
	
begin

	process (all)
	begin
		 Cx <= '0';
		 Vx <= '0';
		 Hx <= '0';
		 Fx <= (others => '0');
			
		case(UPA) is
			
			-- Suma R+S+Cin
			when "000" => 
			
			Fx <= R + S + Cin;
			Hx <= (R(3) and S(3)) or (S(3) and (not Fx(3))) or ((not Fx(3)) and R(3));
			Cx <= (R(7) and S(7)) or (S(7) and (not Fx(7))) or ((not Fx(7)) and R(7));
			
			if Inc = '1' then
				Vx <= (not R(7)) and (and_reduce(Fx(6 downto 0)));
			else
				Vx <= (R(7) and S(7) and (not Fx(7))) or ((not R(7)) and (not S(7)) and Fx(7));
			end if;
			
			
			-- Resta S-R-(not (Cin))
			when "001" => 
			
			Fx <= S - R - (not Cin);
			Hx <= '0';
			
			-- Resta normal
			if Dec = Neg then
				Vx <= (S(7) and (not R(7)) and (not F(7))) or ((not S(7)) and R(7) and F(7));
				Cx <= ((not S(7)) and R(7)) or (R(7) and Fx(7)) or (Fx(7) and (not S(7)));

			-- Decremento
			elsif (Dec and (not Neg)) then
				Vx <= (not Fx(7)) and (and_reduce(Fx(6 downto 0)));
				Cx <= '0';
			
			-- Negación
			elsif ((not Dec) and Neg) then
				Vx <= Fx(7) and (not Fx(6)) and (not Fx(5)) and (not Fx(4)) and (not Fx(3)) and (not Fx(2)) and (not Fx(1)) and (not Fx(0));
				Cx <= (or_reduce(Fx));
			end if;
			
			
			-- Resta R-S-(not Cin)
			when "010" =>
			
			Fx <= R - S - (not Cin);
			Hx <= '0';
			
			-- Resta normal
			if Dec = Neg then
				Vx <= (R(7) and (not S(7)) and (not F(7))) or ((not R(7)) and S(7) and F(7));
				Cx <= ((not R(7)) and S(7)) or (S(7) and Fx(7)) or (Fx(7) and (not R(7)));
				
			-- Decremento
			elsif (Dec and (not Neg)) then
				Vx <= (not Fx(7)) and (and_reduce(Fx(6 downto 0)));
				Cx <= '0';
			
			-- Negación
			elsif ((not Dec) and Neg) then
				Vx <= Fx(7) and (not Fx(6)) and (not Fx(5)) and (not Fx(4)) and (not Fx(3)) and (not Fx(2)) and (not Fx(1)) and (not Fx(0));
				Cx <= (or_reduce(Fx));
			end if;
			
					
			-- R or S
			when "011" =>
			Fx <= (R or S);
			Hx <= '0';
			Cx <= '0';
			Vx <= '0';
			
			
			-- R and S
			when "100" =>
			Fx <= (R and S);
			Hx <= '0';
			Cx <= '0';
			Vx <= '0';
			
			
			-- not(R) and S
			when "101" =>
			Fx <= ((not (R)) and S);
			Hx <= '0';
			Cx <= '0';
			Vx <= '0';
			
			
			-- R xor S
			when "110" =>
			Fx <= (R xor S);
			Hx <= '0';
			Cx <= '0';
			Vx <= '0';
		
	
			-- R xnor S
			when "111" =>
			Fx <= (R xnor S);
			Hx <= '0';
			Cx <= '0';
			Vx <= '0';
			
			when others => null;
			
		end case;
	end process;

	
	process (clk)
	begin
		if Haba = '1' then
			C <= Cx;							-- Asigna bandera de acarreo
			N <= Fx(7);						-- Calcula bandera de negativo
			Z <= not (or_reduce(Fx));	-- Calcula bandera de cero
			V <= Vx;							-- Asigna bandera de sobreflujo
			H <= Hx;							-- Asigna bandera de medio acarreo
		end if;
	end process;
	
	
	F	<= Fx;
	
end behavior;


/**********************************************UPA_out_A**************************************************************
Este módulo realiza el calculo de los corrimientos y asigna el valor de estos a los distintos destinos

********Entradas************

clk			=> Señal de reloj
Cin			=> Acarreo de entrada
Log			=> La operacion a efectuar es un desplazamiento lógico
Rot			=> La operacion a efectuar es una rotacion

Log = 0 y Rot = 0 => La operacion a efectuar es un desplazamiento aritmetico
Log = 1 y Rot = 1 => El corrimiento efectuado es para el calculo de una multiplicacion

Hab			=> Flanco positivo que habilita las operaciones del modulo UPA_Out_A
A,B			=> Datos provenientes de los acumuladores A y B
F				=> Resultado de la operacion realizada por el modulo ALU_8bit
UPA [9:7]	=> Señales de control para seleccionar el tipo de desplazamiento y el destino del resultado

********Salidas*************

Ncor, Zcor, Vcor y Ccor		=>	Son los valores de las banderas de negativo, cero, overflow y acarreo, generadas tras un corrimiento
Qi [7:0]							=> Salida con el contenido del registro Q
Yi [7:0]							=> Salida con el contenido del registro Y

********************************************************************************************************************/


library ieee;
use ieee.std_logic_1164.all;

entity UPA_OUT_A is
	port(
		clk, Cin, Log, Rot, Hab			: in std_logic;
		UPA									: in std_logic_vector (2 downto 0);
		A, B, F								: in std_logic_vector (7 downto 0);
		Ccor, Ncor, Zcor, Vcor			: out std_logic;
		Qi, Yi								: out std_logic_vector (7 downto 0)
		);
end UPA_OUT_A;

architecture behavior of UPA_OUT_A is

  signal Qi_r, Yi_r 								: std_logic_vector(7 downto 0);
  signal Ct, Cm, Qm, Mul 						: std_logic;
  signal Ccor_r, Ncor_r, Vcor_r, Zcor_r 	: std_logic;
  
  
  	/*********Función or_reduce***********
	Esta función recibe un vector de tipo std_logic_vector y devuelve un solo bit std_logic.
	Su propósito es realizar una operación lógica OR entre todos los bits del vector de entrada. 
	**************************************/
	
	function or_reduce(v : std_logic_vector) return std_logic is
	
	variable result : std_logic := '1';
	begin
		for i in v'range loop
		  result := result or v(i);
		end loop;
		return result;
		
	end function;
  
begin

  process(clk)
  begin
    if rising_edge(clk) then
      Ct  <= Yi_r(0);
      Cm  <= Yi_r(7);
      Qm  <= Qi_r(7);
      Mul <= Yi_r(0);

      if Hab = '1' then
        case UPA is

          when "000" =>  -- Carga F en Yi y Qi
            Ct  <= '0';
            Yi_r <= F;
            Qi_r <= F;

          when "001" =>  -- Carga F en Yi
            Ct  <= '0';
            Yi_r <= F;

          when "010" =>  -- Carga A en Yi
            Ct  <= '0';
            Yi_r <= A;

          when "011" =>  -- Carga B en Yi
            Ct  <= '0';
            Yi_r <= B;

          when "100" =>  -- F/2 en Yi
			 
				-- desplazamiento aritmético der
            if Log = '1' and Rot = '0' then
              Yi_r <= '0' & F(7 downto 1);
				-- desplazamiento aritmético der
            elsif Log = '0' and Rot = '0' then
              Yi_r <= Cm & F(7 downto 1);
				-- rotación der
            elsif Log = '0' and Rot = '1' then
              Yi_r <= Cin & F(7 downto 1);
            end if;

          when "101" =>  -- Qi/2 en Qi
			 
				-- desplazamiento aritmético der
            if Log = '1' and Rot = '0' then
              Qi_r <= '0' & Qi_r(7 downto 1);
				-- desplazamiento aritmético der
            elsif Log = '0' and Rot = '0' then
              Qi_r <= Qm & Qi_r(7 downto 1);
				-- rotación der
            elsif Log = '0' and Rot = '1' then
              Qi_r <= Cin & Qi_r(7 downto 1);
				-- desplazamiento hacia la derecha para multiplicaciones
            elsif Log = '1' and Rot = '1' then
              Qi_r <= Mul & Qi_r(7 downto 1);
              Yi_r <= Cin & Yi_r(7 downto 1);
            end if;

          when "110" =>  -- 2F en Yi
			 
				-- Desplazamiento logico y aritmetico hacia la izquierda
            if Rot = '0' then
              Yi_r <= F(6 downto 0) & '0';
				-- Rotacion hacia la izquierda
            else
              Yi_r <= F(6 downto 0) & Cin;
            end if;

          when "111" =>  -- 2Qi en Qi
			 
				-- Desplazamiento logico y aritmetico hacia la izquierda
            if Rot = '0' then
              Qi_r <= Qi_r(6 downto 0) & '0';
            -- Rotacion hacia la izquierda
				else
              Qi_r <= Qi_r(6 downto 0) & Cin;
            end if;

          when others => null;

        end case;
      end if;

      -- Cálculo de banderas
      if UPA(2) = '1' and UPA(1) = '1' then
        Ccor_r <= Cm;
        Vcor_r <= Yi_r(7) xor Cm;
      elsif Log = '1' and Rot = '1' then
        Ccor_r <= Qi_r(7);
        Vcor_r <= Yi_r(7) xor Ct;
      else
        Ccor_r <= Ct;
        Vcor_r <= Yi_r(7) xor Ct;
      end if;

      Ncor_r <= Yi_r(7);
      Zcor_r <= not or_reduce (Yi_r);
    end if;
  end process;

  Qi <= Qi_r;
  Yi <= Yi_r;
  Ccor <= Ccor_r;
  Ncor <= Ncor_r;
  Vcor <= Vcor_r;
  Zcor <= Zcor_r;

end architecture;


/**********************************************Counter**************************************************************

Este modulo es un contador de 3 bits, las señales de entrada ClrCounter e IncCounter permiten incrementar e 
inicializar el contador, respectivamente. Si el contador alcanza su cuenta maxima, es decir, llega a 7, la señal 
de salida FC es activada.

********************************************************************************************************************/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Counter3bit is
  port (
    clk        : in  std_logic;
    ClrCounter : in  std_logic;
    IncCounter : in  std_logic;
    FC         : out std_logic
  );
end entity;

architecture behavior of Counter3bit is
  signal cnt : unsigned(2 downto 0) := (others => '0');
begin


  process(clk)
  begin
    if rising_edge(clk) then
      if ClrCounter = '1' then
        cnt <= (others => '0');
		  
      elsif IncCounter = '1' then
        cnt <= cnt + 1;
      end if;
		
    end if;
	 
  end process;
  
  
  FC <= '1' when cnt = "111" else '0';

end architecture;



/**********************************************UPA_A**************************************************************
Este modulo integra los 4 modulos anteriores, los unirá para generar una sola entidad
*****************************************************************************************************************/

library ieee;
use ieee.std_logic_1164.all;

entity UPA_A is
	port (
	  clk       : in  std_logic;                        -- Señal de reloj (flanco positivo)
	  Cin       : in  std_logic;                        -- Acarreo de entrada

	  UPA       : in  std_logic_vector(9 downto 0);     -- Señales de control de la UPA

	  A         : in  std_logic_vector(7 downto 0);     -- Dato procedente del acumulador A
	  B         : in  std_logic_vector(7 downto 0);     -- Dato procedente del acumulador B
	  D         : in  std_logic_vector(7 downto 0);     -- Dato procedente del bus de datos interno

	  Inc       : in  std_logic;                        -- Las banderas a calcular son para un incremento
	  Dec       : in  std_logic;                        -- Las banderas a calcular son para un decremento
	  Neg       : in  std_logic;                        -- Las banderas a calcular son para una negación
	  Haba      : in  std_logic;                        -- Si Haba=1, se calculan las banderas de la ALU

	  Log       : in  std_logic;                        -- Desplazamiento lógico
	  Rot       : in  std_logic;                        -- Rotación
	  Hab       : in  std_logic;                        -- Habilita las operaciones en el módulo upa_out_a
	  
	  
	    -- Banderas de la ALU
	  Halu  		: out std_logic;                        -- Medio acarreo
	  Nalu  		: out std_logic;                        -- Negativo
	  Zalu  		: out std_logic;                        -- Cero
	  Valu  		: out std_logic;                        -- Sobreflujo
	  Calu  		: out std_logic;                        -- Acarreo

		-- Banderas generadas tras un corrimiento
	  Ncor  		: out std_logic;                        -- Negativo (corrimiento)
	  Zcor  		: out std_logic;                        -- Cero (corrimiento)
	  Vcor  		: out std_logic;                        -- Sobreflujo (corrimiento)
	  Ccor  		: out std_logic;                        -- Acarreo (corrimiento)

	  -- Bits extremos del registro de corrimiento Qi
	  Qi0	  		: out std_logic;     						-- Bit menos significativo del registro de corrimiento Q
	  Qi7	  		: out std_logic;     						-- Bit mas significativo del registro de corrimiento Q

	  -- Señal del contador
	  FC    		: out std_logic;                        -- Señal de activacion del contador

	  -- Bus de salida con el resultado de la UPA
	  Yi    		: out std_logic_vector(7 downto 0)      -- Resultado de la operación
	);

end UPA_A;

architecture behavior of UPA_A is

  -- Señales internas
  signal R, S, F, Qo						: std_logic_vector(7 downto 0);
  signal ClnCounter, IncCounter		: std_logic;

begin

  -- Instancia de UPA_IN
  UPA_IN_inst : entity work.UPA_IN
    port map (
      UPA  => UPA(3 downto 0),
      A    => A,
      B    => B,
      D    => D,
      Q    => Qo,
      R    => R,
      S    => S,
      Cln  => ClnCounter,
      Inc  => IncCounter
    );

  -- Instancia de ALU_8bit
  ALU_inst : entity work.ALU_8bit
    port map (
      clk   => clk,
      Cin   => Cin,
      Inc   => Inc,
      Dec   => Dec,
      Neg   => Neg,
      Haba  => Haba,
      UPA   => UPA(6 downto 4),
      R     => R,
      S     => S,
      C     => Calu,
      N     => Nalu,
      Z     => Zalu,
      V     => Valu,
      H     => Halu,
      F     => F
    );

  -- Instancia de UPA_OUT_A
  UPA_OUT_inst : entity work.UPA_OUT_A
    port map (
      clk   => clk,
      Cin   => Cin,
      Log   => Log,
      Rot   => Rot,
      Hab   => Hab,
      UPA   => UPA(9 downto 7),
      A     => A,
      B     => B,
      F     => F,
      Ccor  => Ccor,
      Ncor  => Ncor,
      Zcor  => Zcor,
      Vcor  => Vcor,
      Qi    => Qo,
      Yi    => Yi
    );

  -- Instancia de contador
  Counter_inst : entity work.Counter3bit
    port map (
      clk        => clk,
      ClrCounter => ClnCounter,
      IncCounter => IncCounter,
      FC         => FC
    );

  -- Asignaciones de salida
  
  Qi0 <= Qo(0);
  Qi7	<= Qo(7); 

end architecture;



/**********************************************ARQUITECTURA_WIRE*************************************************
Módulo que integra a todos los modulos anteriores que conforman los buses de datos
*****************************************************************************************************************/

library ieee;
use ieee.std_logic_1164.all;


entity ARQUITECTURA_WIRE is
  port (
    WBn        : in std_logic;
    LdX        : in std_logic;
    CX         : in std_logic_vector(2 downto 0);
    EB         : in std_logic_vector(1 downto 0);
    CXnn       : in std_logic;
    EXnn       : in std_logic;
    EXn        : in std_logic_vector(2 downto 0);
    EnaY       : in std_logic;
    Ldl        : in std_logic;
    Clnn       : in std_logic;
    WAn        : in std_logic;
    Elnn       : in std_logic;
    EA         : in std_logic_vector(1 downto 0);
    UPA        : in std_logic_vector(9 downto 0);
    ResetAux   : in std_logic;
    Cena       : in std_logic;
    CA         : in std_logic_vector(2 downto 0);
    Vena       : in std_logic;
    EAn        : in std_logic_vector(2 downto 0);
    Zena       : in std_logic;
    Nena       : in std_logic;
    Inc        : in std_logic;
    lena       : in std_logic;
    Dec        : in std_logic;
    Hena       : in std_logic;
    Neg        : in std_logic;
    Xena       : in std_logic;
    Haba       : in std_logic;
    Sena       : in std_logic;
    Log        : in std_logic;
    C          : in std_logic_vector(2 downto 0);
    Rot        : in std_logic;
    V          : in std_logic_vector(2 downto 0);
    HAb        : in std_logic;
    CSP        : in std_logic_vector(2 downto 0);
    Z          : in std_logic_vector(3 downto 0);
    ESPn       : in std_logic_vector(2 downto 0);
    N          : in std_logic_vector(3 downto 0);
    l          : in std_logic_vector(1 downto 0);
    H          : in std_logic_vector(1 downto 0);
    XX         : in std_logic_vector(1 downto 0);
    Selbus     : in std_logic;
    S          : in std_logic_vector(1 downto 0);
    Reset      : in std_logic;
    CPC        : in std_logic_vector(2 downto 0);
    EPCn       : in std_logic_vector(2 downto 0);
    Selmux     : in std_logic_vector(1 downto 0);
    clock      : in std_logic;
    CBDn       : in std_logic;
    Selupa     : in std_logic;
    EDEn       : in std_logic;
    EG         : in std_logic_vector(1 downto 0);
    IM         : in std_logic_vector(7 downto 0);
    ASn        : in std_logic;
    BD         : in std_logic;
    RWn        : in std_logic;
	 
	 Edos			: out std_logic_vector(7 downto 0);
	 ln15_8		: out std_logic_vector(7 downto 0);
	 ln7_0		: out std_logic_vector(7 downto 0);
	 Qi7			: out std_logic;
	 Qi0			: out std_logic;
	 FC			: out std_logic;
	 Dir			: out std_logic_vector(15 downto 0)
  );
end ARQUITECTURA_WIRE;

architecture behavior of ARQUITECTURA_WIRE is

  -- Señales internas
  
	signal lnx		: std_logic_vector(15 downto 0) := (others => '0');
	signal Nx		: std_logic;
	signal Zx		: std_logic;
	signal Ny		: std_logic;
	signal Zy		: std_logic;
	signal Dout		: std_logic_vector(15 downto 0) := (others => '0');
	signal Y			: std_logic_vector(15 downto 0) := (others => '0');
	signal Dirx		: std_logic_vector(15 downto 0) := (others => '0');
	signal FCx		: std_logic;
  
  -- Señales para UPA_A
	
	signal Aupa  : std_logic_vector(7 downto 0);
	signal Bupa  : std_logic_vector(7 downto 0);
	signal Dupa  : std_logic_vector(7 downto 0);
	signal Cin	 : std_logic;
  
	signal Halu	 : std_logic;
	signal Nalu  : std_logic;
	signal Zalu  : std_logic;
	signal Valu  : std_logic;
	signal Calu  : std_logic;
	signal Ccor  : std_logic;
	signal Ncor  : std_logic;
	signal Vcor  : std_logic;
	signal Zcor  : std_logic;
	signal Qi0x  : std_logic;
	signal Qi7x  : std_logic;
	signal Yo    : std_logic_vector(7 downto 0);

  
  -- Señales de acumuladores
  
  signal Nb		: std_logic;
  signal Zb		: std_logic;
  signal Vb		: std_logic;
  signal Na		: std_logic;
  signal Za		: std_logic;
  signal Va		: std_logic;
  
  -- señales Z de 16 bits
  signal Zd		: std_logic;  
  
  
  -- Señales del registro de estados
  signal Co		: std_logic;
  signal Ni		: std_logic;
  signal Zi		: std_logic;
  signal Nsp	: std_logic;
  signal Zsp	: std_logic;

begin

	Zd		<= not (Za and Zb);
	

	-- Instancia de Registro Contador
	
	Register_IX : entity work.Registro_Contador
	port map (
		clk	=> not EnaY and clock,
		rst	=> Reset,
		C		=> CX,
		E		=> EXn(2 downto 1) & EnaY,
		ln		=> lnx,
		N		=> Nx,
		Z		=> Zx,
		Q		=> Dout,
		Y		=> Y
		);
		
	Register_IY : entity work.Registro_Contador
	port map (
		clk	=> not EnaY and clock,
		rst	=> Reset,
		C		=> CX,
		E		=> EXn(2 downto 1) & not EnaY,
		ln		=> lnx,
		N		=> Ny,
		Z		=> Zy,
		Q		=> Dout,
		Y		=> Y
		);
		
	Auxiliar_Register : entity work.Registro_Contador
	port map (
		clk	=> clock,
		rst	=> ResetAux,
		C		=> CA,
		E		=> EAn,
		ln		=> lnx,
		Q		=> Dout,
		Y		=> Y
		);
		
	Register_SP : entity work.Registro_Contador
	port map (
		clk	=> clock,
		rst	=> Reset,
		C		=> CSP,
		E		=> ESPn,
		ln		=> lnx,
		N		=> Nsp,
		Z		=> Zsp,
		Q		=> Dout,
		Y		=> Y
		);
		
	Register_PC : entity work.Registro_Contador
	port map (
		clk	=> clock,
		rst	=> Reset,
		C		=> CPC,
		E		=> EPCn,
		ln		=> lnx,
		Q		=> Dout,
		Y		=> Y
		);
		
		
	Address_Register : entity work.Address_Register
	port map (
		clk	=> clock,
		cbd	=> CBDn,
		ln		=> Y,
		Dout	=> Dirx
	);
	
	
	Register_Addr_X : entity work.InterruptionRegister
	port map (
		clk	=> clock,
		load	=> LdX,
		cx		=> CXnn,
		ex		=> EXnn,
		d		=> lnx,
		q		=> Dout
		);
		
		
	Register_Addr_I : entity work.InterruptionRegister
	port map (
		clk	=> clock,
		load	=> Ldl,
		cx		=> Clnn,
		ex		=> Elnn,
		d		=> lnx,
		q		=> Dout
		);
		
		
	Flags_IX_IY : entity work.X_Y_Mux
	port map (
		enaY	=> EnaY,
		Nx		=> Nx,
		Zx		=> Zx,
		Ny		=> Ny,
		Zy		=> Zy,
		Ni		=> Ni,
		Zi		=> Zi		
	);
	
	
	Acumulador_A : entity work.Registro_Acumulador
	port map (
		clk	=> clock,
		w		=> WAn,
		E		=> EA,
		Ai		=> lnx (7 downto 0),
		Bi		=> lnx (15 downto 8),
		Ci		=> Yo,
		
		N		=> Na,
		Z		=> Za,
		V		=> Va,
		Ao		=> Dout (7 downto 0),
		Bo		=> Dout (15 downto 8),
		Co		=> Aupa
	);


	Acumulador_B : entity work.Registro_Acumulador
	port map (
		clk	=> clock,
		w		=> WBn,
		E		=> EB,
		Ai		=> lnx (7 downto 0),
		Bi		=> lnx (15 downto 8),
		Ci		=> Yo,
		
		N		=> Nb,
		Z		=> Zb,
		V		=> Vb,
		Ao		=> Dout (7 downto 0),
		Bo		=> Dout (15 downto 8),
		Co		=> Bupa
	);
	
		
	UPA_A : entity work.UPA_A
	port map (
		UPA	=> UPA,
		A		=> Aupa,
		B		=> Bupa,
		D		=> Dupa,
		Cin	=> Cin,
		clk	=> clock,
		Inc	=> Inc,
		Dec	=> Dec,
		Neg	=> Neg,
		Haba	=> Haba,
		Log	=> Log,
		Rot	=> Rot,
		Hab	=> Hab,
		
		Halu	=> Halu,
		Nalu	=> Nalu,
		Zalu	=> Zalu,
		Valu	=> Valu,
		Calu	=> Calu,
		Ccor	=> Ccor,
		Ncor	=> Ncor,
		Vcor	=> Vcor,
		Zcor	=> Zcor,
		Qi0	=> Qi0x,
		Qi7	=> Qi7x,
		FC		=> FCx,
		Yi		=> Yo
	);
	
	
	Ground : entity work.Ground
	port map(
		E	=> EG,
		Q	=> Dout
	);
	
	
	Busmux_8bit : entity work.Busmux_8bit
	port map(
		selbus	=> Selbus,
		lowd		=> lnx(7 downto 0),
		highd		=> lnx(15 downto 8),
		Q			=> Dupa
	);
	

	Carry_Mux3 : entity work.Carry_Mux3
	port map(
		CReg		=> Co,
		Calu		=> Calu,
		Carry		=> Cin,
		Selmux	=> Selmux
	);

	
	BusDemux_8bit : entity work.BusDemux_8bit
	port map(
		selupa	=> Selupa,
		ede		=> EDEn,
		D			=> Yo,
		lows		=> Dout(7 downto 0),
		highs		=> Dout (15 downto 8)
	);
	
	
	StatesRegister : entity work.Registro_Banderas
		port map (
			clk      => clock,
			ln       => lnx(7 downto 0),
			Calu     => Calu,
			Ccor     => Ccor,
			Valu     => Valu,
			Vcor     => Vcor,
			Va       => Va,
			Vb       => Vb,
			Zalu     => Zalu,
			Zcor     => Zcor,
			Za       => Za,
			Zb       => Zb,
			Zi       => Zi,
			Zsp      => Zsp,
			Zd       => Zd,
			Nalu     => Nalu,
			Ncor     => Ncor,
			Na       => Na,
			Nb       => Nb,
			Ni       => Ni,
			Nsp      => Nsp,
			Halu     => Halu,
			Cena     => Cena,
			Vena     => Vena,
			Zena     => Zena,
			Nena     => Nena,
			Iena     => lena,
			Hena     => Hena,
			Xena     => Xena,
			Sena     => Sena,
			C        => C,
			V        => V,
			Z        => Z,
			N        => N,
			I        => l,
			H        => H,
			XX       => XX,
			S        => S,
			Co       => Co,
			Output   => Edos
		);
	
	
	
	Buffer_tristateH : entity work.Buffer_tristate
		port map (
			IM		=> IM,
			ASn	=> not ASn,
			BD		=> BD,
			RWn	=> RWn,
			Dout	=> Dout(15 downto 8)
			);
	
	
	Buffer_tristateL : entity work.Buffer_tristate
		port map (
			IM		=> IM,
			ASn	=> not ASn,
			BD		=> not BD,
			RWn	=> RWn,
			Dout	=> Dout(7 downto 0)
			);
			
			
			
	lnx(15 downto 8)		<= Dout(15 downto 8);
	lnx(7 downto 0)		<= Dout(7 downto 0);
	ln15_8					<= lnx(15 downto 8);
	ln7_0						<= lnx(7 downto 0);
	Dir						<= Dirx;
	Qi0						<= Qi0x;
	Qi7						<= Qi7x;
	FC							<= FCx;
end architecture;


/*********************************************************************
ETAPA 2: CONTROL
*********************************************************************/

/********************************************************************
-- *UCI (Unidad de control de Interrupciones) *
*********************************************************************/

-- Entradas:
-- clk   			: Señal de reloj (disparo con flanco positivo)
-- IRQ   			: Petición de interrupción externa IRQ
-- XIRQ  			: Petición de interrupción externa XIRQ
-- LINT  			: Línea de habilitación de interrupción baja (LINT)
-- HRE   			: Habilita interrupción de alto nivel (HRE)
-- HINT  			: Habilita interrupción alta (HINT)
-- DINT  			: Deshabilita las interrupciones (DINT)

-- Salidas:
-- Av [11..0]		: Dirección de inicio de la subrutina que atiende a la interrupción (12 bits)
-- INT				: Señal de interrupción externa; cuando INT = '1', hay una petición activa


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UCI is
    port (
        clk   : in  std_logic;                          -- Señal de reloj (disparo con flanco positivo)
        IRQ   : in  std_logic;                          -- Petición de interrupción externa IRQ
        XIRQ  : in  std_logic;                          -- Petición de interrupción externa XIRQ
        LINT  : in  std_logic;                          -- Línea de habilitación de interrupción baja (LINT)
        HRE   : in  std_logic;                          -- Habilita interrupción de alto nivel (HRE)
        HINT  : in  std_logic;                          -- Habilita interrupción alta (HINT)
        DINT  : in  std_logic;                          -- Deshabilita las interrupciones (DINT)

        Av    : out std_logic_vector(11 downto 0);      -- Dirección de inicio de la subrutina que atiende a la interrupción
        INT   : out std_logic                           -- Señal de interrupción externa; cuando INT = '1', hay una petición activa
    );
end entity;

architecture Behavioral of UCI is
    signal Av_reg : std_logic_vector(11 downto 0) := (others => '0');
	 signal Q1		: std_logic;
	 signal Q2		: std_logic;
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if (IRQ = '0' and XIRQ = '1') then
                Av_reg <= x"F90"; -- dirección arbitraria para XIRQ
            elsif (IRQ = '1' and XIRQ = '0') then
                Av_reg <= x"FC0"; -- dirección arbitraria para IRQ
            else
                Av_reg <= Av_reg; -- mantener valor anterior
            end if;
        end if;
    end process;
	 
	 
	 SRFF1 : entity work.SR_FF
		port map(
			clk	=> clk,
			S		=> (IRQ nand XIRQ),
			R		=> LINT,
			Q		=> Q1
		);
	
	 SRFF2 : entity work.SR_FF
		port map(
			clk	=> clk,
			S		=> HINT,
			R		=> ((not HRE) or DINT),
			Q		=> Q2
			);
	
	AV 	<= Av_reg;
	INT	<= Q1 and Q2;

end architecture;



-- **********************************************************************
-- *                      UNIDAD DE CONTROL DE COMPUTADORA (UCC)       *
-- **********************************************************************
-- *  Descripción:                                                      *
-- *  La UCC es la parte fundamental de la computadora. Su tarea        *
-- *  consiste en decodificar las instrucciones en lenguaje ensamblador *
-- *  y ejecutar las micro-operaciones necesarias para llevarlas a cabo.*
-- *                                                                    *
-- *  La unidad de control está conformada por los siguientes módulos:  *
-- *   - Registro de instrucción                                        *
-- *   - Secuenciador                                                   *
-- *   - Memoria de microprograma                                       *
-- *   - Lógica de selección                                            *
-- *                                                                    *
-- *  Esta unidad coordina el flujo de control interno y asegura que    *
-- *  cada instrucción sea ejecutada correctamente a nivel de hardware. *
-- **********************************************************************


-- **********************************************************************
-- *                        REGISTRO DE INSTRUCCIÓN                     *
-- **********************************************************************
-- *  Descripción:                                                      *
-- *  En este registro se almacena el código de operación de la         *
-- *  próxima instrucción a ejecutar. Este código representa una        *
-- *  dirección de salto que le indica al secuenciador en dónde         *
-- *  comienzan las microoperaciones correspondientes a dicha           *
-- *  instrucción.                                                      *
-- *                                                                    *
-- *  Es un componente clave en la Unidad de Control, ya que permite    *
-- *  la interpretación y ejecución ordenada del flujo de instrucciones.*
-- *                                                                    *
-- *  Entradas:                                                         *
-- *    ln[7..0]  : Bus de entrada de 8 bits, conectado a la parte baja *
-- *                del bus de datos interno.                           *
-- *                                                                    *
-- *  Salidas:                                                          *
-- *    Q[11..0]  : Bus de salida de 12 bits, conectado directamente al *
-- *                secuenciador. Representa la dirección de inicio de  *
-- *                las microoperaciones asociadas a la instrucción.    *
-- **********************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterInstruction is
    port (
		  CRI	: in std_logic;
        ln  : in  std_logic_vector(7 downto 0);    -- Código de operación
        Q   : out std_logic_vector(11 downto 0)    -- Instrucción extendida
    );
end entity;

architecture behavior of RegisterInstruction is

begin
	process (all)
	begin
		if CRI = '0' then
			 -- Asignación combinacional: desplazamiento a la izquierda 4 bits
			 Q <= ln & "0000";  -- concatena los 8 bits de In con 4 ceros (LSBs)
		else
			Q	<= (others => 'Z');
		end if;
	end process;
end architecture;



-- ****************************************************************************************************************
-- *                            SECUENCIADOR                            														*
-- ****************************************************************************************************************
-- *  Descripción:                                                      														*
-- *  Este módulo representa el secuenciador de la unidad de control.  															*	
-- *  Su función es calcular la dirección del siguiente estado          														*
-- *  microprogramado a partir de una instrucción y señales de control.															*
-- *                                                                    														*
-- *  Entradas:                                                         														*
-- *    clk     : std_logic                     -> Señal de reloj (flanco positivo)               						*
-- *    reset   : std_logic                     -> Inicializa al secuenciador                     						*
-- *    ena     : std_logic                     -> Habilita las operaciones del secuenciador     						*
-- *    instr   : std_logic_vector(1 downto 0)  -> Instrucción de control (2 bits)               						*
-- *    cc      : std_logic                     -> Control de condición para salto               						*
-- *    Ap      : std_logic_vector(11 downto 0) -> Dirección de salto condicional (registro de liga) 					*
-- *    Am      : std_logic_vector(11 downto 0) -> Dirección de salto de transformación (registro de instrucción) *
-- *    Av      : std_logic_vector(11 downto 0) -> Dirección de interrupción (proviene de la UCI) 						*
-- *                                                                    *
-- *  Salidas:                                                          														*
-- *    P       : std_logic_vector(11 downto 0) -> Dirección del estado presente (salida)        						*



-- **********************************************************************
-- * Instrucciones válidas para el secuenciador                         *
-- *                                                                    *
-- *  Código  | Descripción                                             *
-- * ---------|-------------------------------------------------------- *
-- *   00     | Continúa: la dirección del siguiente estado la         	*
-- *          | proporciona el uPc.                                    	*
-- * ---------|-------------------------------------------------------- *
-- *   01     | Salto Condicional: si cc = '1', la dirección la        	*
-- *          | proporciona uPc; si cc = '0', la proporciona Ap.       	*
-- * ---------|-------------------------------------------------------- *
-- *   10     | Salto de Transformación: la dirección la proporciona   	*
-- *          | el bus Am (registro de instrucción extendido).         	*
-- * ---------|-------------------------------------------------------- *
-- *   11     | Salto Condicional por Interrupciones: si cc = '1',     	*
-- *          | la dirección la proporciona uPc; si cc = '0', Av.      	*
-- **********************************************************************

-- ****************************************************************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Sequencer is
    port (
        clk     : in  std_logic;
        reset   : in  std_logic;
        ena     : in  std_logic;
        instr   : in  std_logic_vector(1 downto 0); -- I1I0
        cc      : in  std_logic;

        Ap      : in  std_logic_vector(11 downto 0); -- Liga
        Am      : in  std_logic_vector(11 downto 0); -- Mapa
        Av      : in  std_logic_vector(11 downto 0); -- Vector interrupción

        P       : out std_logic_vector(11 downto 0) -- Microestado actual
    );
end entity;



architecture behavior of Sequencer is

    -- Señales internas
    signal uPc   : std_logic_vector(11 downto 0) := (others => '0'); -- μPC
    signal Y     : std_logic_vector(11 downto 0); -- Incremento
    signal D     : std_logic_vector(11 downto 0); -- Entrada seleccionada
    signal temp  : std_logic_vector(11 downto 0); -- Salida MUX

    -- Señales de control
    signal PL    : std_logic;
    signal MP   : std_logic;
    signal VECT  : std_logic;
    signal Selector : std_logic;
	 
begin

    Y <= std_logic_vector(unsigned(uPc) + 1);


    process(instr, cc)
    begin
	 
        case instr is
            when "00" =>
                PL <= '1'; MP <= '1'; VECT <= '1'; Selector <= '0';
            when "01" =>
                if cc = '0' then
                    PL <= '0'; MP <= '1'; VECT <= '1'; Selector <= '1'; -- Salto
                else
                    PL <= '0'; MP <= '1'; VECT <= '1'; Selector <= '0'; -- No salto
                end if;
            when "10" =>
                if cc = '0' then
                    PL <= '1'; MP <= '0'; VECT <= '1'; Selector <= '1';
                else
                    PL <= '1'; MP <= '0'; VECT <= '1'; Selector <= '1';
                end if;
            when "11" =>
                if cc = '0' then
                    PL <= '1'; MP <= '1'; VECT <= '0'; Selector <= '1';
                else
                    PL <= '1'; MP <= '1'; VECT <= '0'; Selector <= '0';
                end if;
            when others =>
                PL <= '1'; MP <= '1'; VECT <= '1'; Selector <= '0';
        end case;
    end process;

    process(all)
    begin
        if MP = '1' and VECT = '1' then
            D <= Ap; -- liga
        elsif MP = '1' and VECT = '1' then
            D <= Am; -- mapeada
        elsif MP = '1' and PL = '1' then
            D <= Av; -- interrupción
        else
            D <= Ap; -- por seguridad
        end if;
    end process;

	 
	process(Selector, D, Y)
	begin
		 if Selector = '0' then
			  temp <= Y;  -- continúa secuencial
		 else
			  temp <= D;  -- salto por MAP, VECT o Ap
		 end if;
	end process;


    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                uPc <= (others => '0');
            elsif ena = '1' then
                uPc <= temp;
            end if;
        end if;
    end process;

    P <= uPc;

end architecture;




		
		
-- **********************************************************************************************
-- *                       LÓGICA DE SELECCIÓN                          								*
-- **********************************************************************************************
-- *  Descripción:                                                      								*
-- *  Este módulo implementa la lógica de selección de condición para  									*
-- *  realizar saltos condicionales dentro del secuenciador. Evalúa    									*
-- *  el valor de distintas banderas o señales internas según el       									*
-- *  campo de prueba `P`, comparándolas con el valor lógico `VF`.     									*
-- *  Si son iguales, se considera condición verdadera (cc = '0'),     									*
-- *  de lo contrario, condición falsa (cc = '1').                      								*
-- *                                                                    								*
-- *  Entradas:                                                         								*
-- *    P     : std_logic_vector(3 downto 0)  -> Campo de prueba        								*
-- *    edos  : std_logic_vector(3 downto 0)  -> Banderas:              								*
-- *              edos(3) = N (negativo)                                								*
-- *              edos(2) = Z (cero)                                    								*
-- *              edos(1) = V (sobreflujo)                              								*
-- *              edos(0) = C (acarreo)                                 								*
-- *    INT   : std_logic                    -> Señal de interrupción externa 						*
-- *    VF    : std_logic                    -> Valor esperado (1 = cierto, 0 = falso) 			*
-- *    D7    : std_logic                    -> Bit más significativo del registro Qi 				*
-- *    Qx    : std_logic                    -> Variable auxiliar para saltos 						*
-- *    Qo    : std_logic                    -> Bit menos significativo del registro Qi 			*
-- *    FC    : std_logic                    -> Estado del contador de la UPA (fin de cuenta) 	*
-- *                                                                    								*
-- *  Salidas:                                                          								*
-- *    cc    : std_logic                    -> Señal de salida hacia el secuenciador 				*
-- *                                            (0 = condición verdadera, 1 = falsa)  				*
-- **********************************************************************************************

-- **********************************************************************************************
-- * Campo de prueba P (Selector de condición)                         									*
-- *                                                                    								*
-- *   Valor P  |  Señal evaluada                                       								*
-- *  ----------|-------------------------------------------------------------------------------*
-- *   0000     | Qx (variable auxiliar)                                								*
-- *   0001     | Banderas: Carry (C = edos(0))                         								*
-- *   0010     | Banderas: Overflow (V = edos(1))                      								*
-- *   0011     | Banderas: Zero (Z = edos(2))                          								*
-- *   0100     | Banderas: Negative (N = edos(3))                      								*
-- *   0101     | Lógica: Carry OR Zero (edos(0) OR edos(2))           									*
-- *   0110     | Lógica: Overflow XOR Negative (edos(1) XOR edos(3))  									*
-- *   0111     | Lógica: Zero OR (Overflow XOR Negative)              									*
-- *   1000     | Bit más significativo D7 del registro Qi              								*
-- *   1001     | Señal de interrupción externa (INT)                  									*
-- *   1010     | Bit menos significativo Qo del registro Qi           									*
-- *   1011     | Estado del contador de la UPA (FC)                   									*
-- **********************************************************************************************

  
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SelectionLogic is
    port (
        P     : in  std_logic_vector(3 downto 0);  -- Campo de prueba
        edos  : in  std_logic_vector(3 downto 0);  -- Banderas: C, V, Z, N
        INT   : in  std_logic;
        VF    : in  std_logic;                    -- Valor esperado
        D7    : in  std_logic;
        Qx    : in  std_logic;
        Qo    : in  std_logic;
        FC    : in  std_logic;
        cc    : out std_logic                     -- Resultado: 0 = verdadera, 1 = falsa
    );
end entity;

architecture behavior of SelectionLogic is
	signal ccx	: std_logic;
begin

    process(all)
    begin
        case P is

            when "0000" => -- Qx
                if Qx = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "0001" => -- Carry (edos(0))
                if edos(0) = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "0010" => -- Overflow (edos(1))
                if edos(1) = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "0011" => -- Zero (edos(2))
                if edos(2) = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "0100" => -- Negative (edos(3))
                if edos(3) = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "0101" => -- Carry OR Zero
                if (edos(0) or edos(2)) = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "0110" => -- Overflow XOR Negative
                if (edos(1) xor edos(3)) = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "0111" => -- Zero OR (Overflow XOR Negative)
                if (edos(2) or (edos(1) xor edos(3))) = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "1000" => -- D7 (bit más significativo del Qi)
                if D7 = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "1001" => -- INT
                if INT = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "1010" => -- Qo (bit menos significativo del Qi)
                if Qo = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when "1011" => -- FC (estado del contador)
                if FC = VF then ccx <= '0';
                else ccx <= '1';
                end if;

            when others =>
                ccx <= '1';  -- Por defecto, condición falsa

        end case;
		  
		  cc <= ccx;
    end process;
end architecture;
	 


/****************************************************************************************
* MEMORIA DE MICROPROGRAMA – ROM DE CONTROL
*
* Esta memoria ROM contiene la información necesaria para el control detallado de la 
* arquitectura del procesador. Cada dirección representa un microestado, y la palabra 
* almacenada en esa dirección constituye una microinstrucción compuesta por múltiples 
* campos de control. 
*
* La ROM recibe como entrada una dirección de 12 bits, proporcionada por el secuenciador, 
* y entrega una palabra de 120 bits que indica:
*   - Qué señales de control deben activarse o desactivarse
*   - Qué dirección de microestado seguir
*   - Qué tipo de salto debe ejecutar el secuenciador
*   - Qué condición lógica evaluar (a través de la lógica de selección)
*
* Esta memoria coordina el funcionamiento tanto de los módulos internos del procesador 
* (ALU, registros, buses) como de eventos externos (interrupciones, saltos condicionales).
* 
* Las direcciones están organizadas de forma que cada instrucción del repertorio tiene 
* una región exclusiva en la ROM, comenzando en la dirección obtenida al desplazar su 
* código de operación 4 bits a la izquierda (opcode << 4).
****************************************************************************************/
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM is
    port (
        clk          : in std_logic;
        address      : in std_logic_vector(11 downto 0); -- Dirección de entrada (12 bits)
        control_word : out std_logic_vector(120 downto 0) -- Salida: palabra de 120 bits
    );
end entity;

architecture rtl of ROM is
    type rom_array is array (0 to 4095) of std_logic_vector(120 downto 0);
		signal rom : rom_array;


    attribute ram_init_file : string;
    attribute ram_init_file of rom : signal is "ROM";

    attribute ramstyle : string;
    attribute ramstyle of rom : signal is "ROM"; -- ayuda a que lo infiera como memoria

begin
    process(clk)
    begin
        if rising_edge(clk) then
            control_word <= rom(to_integer(unsigned(address)));
        end if;
    end process;
end architecture;




/****************************************************************************************
* Módulo: MegaRegister
*
* Este módulo actúa como un registro intermedio (pipeline register) para las señales de 
* control generadas por la memoria de microprograma (ROM). Su propósito es capturar 
* la palabra de control completa al flanco de subida del reloj y mantenerla estable 
* durante el siguiente ciclo, asegurando así un comportamiento sincronizado y libre de 
* glitches en el sistema.
*****************************************************************************************/

library ieee;
use ieee.std_logic_1164.all;

entity MegaRegister is
    port (
        clk       : in std_logic;

        -- Entradas
		  iAp         : in std_logic_vector(11 downto 0);
		  iInstr      : in std_logic_vector(1 downto 0);
		  iPr         : in std_logic_vector(3 downto 0);
		  iVF         : in std_logic;
		  iLINT       : in std_logic;
		  iHINT       : in std_logic;
		  iHRE        : in std_logic;
		  iDINT       : in std_logic;
		  iEnable     : in std_logic;
		  
        iRWn        : in std_logic;
        iASn        : in std_logic;
        iBD         : in std_logic;
        iCX         : in std_logic_vector(2 downto 0);
        iEXn        : in std_logic_vector(2 downto 0);
        iEnaY       : in std_logic;
        iCA         : in std_logic_vector(2 downto 0);
        iEAn        : in std_logic_vector(2 downto 0);
        iCSP        : in std_logic_vector(2 downto 0);
        iESPn       : in std_logic_vector(2 downto 0);
        iCPC        : in std_logic_vector(2 downto 0);
        iEPCn       : in std_logic_vector(2 downto 0);
        iWAn        : in std_logic;
        iEA         : in std_logic_vector(1 downto 0);
        iWBn        : in std_logic;
        iEB         : in std_logic_vector(1 downto 0);
        iLdX        : in std_logic;
        iCXnn       : in std_logic;
        iEXnn       : in std_logic;
        iLdl        : in std_logic;
        iClnn       : in std_logic;
        iElnn       : in std_logic;
        iUPA        : in std_logic_vector(9 downto 0);
        iInc        : in std_logic;
        iDec        : in std_logic;
        iNeg        : in std_logic;
        iLog        : in std_logic;
        iRot        : in std_logic;
        iHab        : in std_logic;
        iSelbus     : in std_logic;
        iSelmux     : in std_logic_vector(1 downto 0);
        iSelupa     : in std_logic;
        iEDEn       : in std_logic;
        iCBDn       : in std_logic;
        iCena       : in std_logic;
        iC          : in std_logic_vector(2 downto 0);
        iVena       : in std_logic;
        iV          : in std_logic_vector(2 downto 0);
        iZena       : in std_logic;
        iZ          : in std_logic_vector(3 downto 0);
        iNena       : in std_logic;
        iNN         : in std_logic_vector(3 downto 0);
        ilena       : in std_logic;
        il          : in std_logic_vector(1 downto 0);
        iHena       : in std_logic;
        iH          : in std_logic_vector(1 downto 0);
        iXena       : in std_logic;
        iXX         : in std_logic_vector(1 downto 0);
        iSena       : in std_logic;
        iSS         : in std_logic_vector(1 downto 0);
        iHaba       : in std_logic;
        iResetAux   : in std_logic;
        iEG         : in std_logic_vector(1 downto 0);
		  iCRI		  : in std_logic;

        -- Salidas
		  
		  Ap         : out std_logic_vector(11 downto 0);
		  Instr      : out std_logic_vector(1 downto 0);
		  Pr         : out std_logic_vector(3 downto 0);
		  VF         : out std_logic;
		  LINT       : out std_logic;
		  HINT       : out std_logic;
		  HRE        : out std_logic;
		  DINT       : out std_logic;
		  enable     : out std_logic;
		  
        RWn       : out std_logic;
        ASn        : out std_logic;
        BD         : out std_logic;
        CX         : out std_logic_vector(2 downto 0);
        EXn        : out std_logic_vector(2 downto 0);
        EnaY       : out std_logic;
        CA         : out std_logic_vector(2 downto 0);
        EAn        : out std_logic_vector(2 downto 0);
        CSP        : out std_logic_vector(2 downto 0);
        ESPn       : out std_logic_vector(2 downto 0);
        CPC        : out std_logic_vector(2 downto 0);
        EPCn       : out std_logic_vector(2 downto 0);
        WAn        : out std_logic;
        EA         : out std_logic_vector(1 downto 0);
        WBn        : out std_logic;
        EB         : out std_logic_vector(1 downto 0);
        LdX        : out std_logic;
        CXnn       : out std_logic;
        EXnn       : out std_logic;
        Ldl        : out std_logic;
        Clnn       : out std_logic;
        Elnn       : out std_logic;
        UPA        : out std_logic_vector(9 downto 0);
        Inc        : out std_logic;
        Dec        : out std_logic;
        Neg        : out std_logic;
        Log        : out std_logic;
        Rot        : out std_logic;
        Hab        : out std_logic;
        Selbus     : out std_logic;
        Selmux     : out std_logic_vector(1 downto 0);
        Selupa     : out std_logic;
        EDEn       : out std_logic;
        CBDn       : out std_logic;
        Cena       : out std_logic;
        C          : out std_logic_vector(2 downto 0);
        Vena       : out std_logic;
        V          : out std_logic_vector(2 downto 0);
        Zena       : out std_logic;
        Z          : out std_logic_vector(3 downto 0);
        Nena       : out std_logic;
        N          : out std_logic_vector(3 downto 0);
        lena       : out std_logic;
        l          : out std_logic_vector(1 downto 0);
        Hena       : out std_logic;
        H          : out std_logic_vector(1 downto 0);
        Xena       : out std_logic;
        XX         : out std_logic_vector(1 downto 0);
        Sena       : out std_logic;
        SS         : out std_logic_vector(1 downto 0);
        Haba       : out std_logic;
        ResetAux   : out std_logic;
        EG         : out std_logic_vector(1 downto 0);
		  CRI			 : out std_logic
    );
end entity MegaRegister;

architecture rtl of MegaRegister is
begin
    process(clk)
    begin
        if rising_edge(clk) then
				Ap       <= iAp;
				Instr    <= iInstr;
				Pr       <= iPr;
				VF       <= iVF;
				LINT     <= iLINT;
				HINT     <= iHINT;
				HRE      <= iHRE;
				DINT     <= iDINT;
				enable   <= iEnable;
				
            RWn     	<= iRWn;
            ASn      <= iASn;
            BD       <= iBD;
            CX       <= iCX;
            EXn      <= iEXn;
            EnaY     <= iEnaY;
            CA       <= iCA;
            EAn      <= iEAn;
            CSP      <= iCSP;
            ESPn     <= iESPn;
            CPC      <= iCPC;
            EPCn     <= iEPCn;
            WAn      <= iWAn;
            EA       <= iEA;
            WBn      <= iWBn;
            EB       <= iEB;
            LdX      <= iLdX;
            CXnn     <= iCXnn;
            EXnn     <= iEXnn;
            Ldl      <= iLdl;
            Clnn     <= iClnn;
            Elnn     <= iElnn;
            UPA      <= iUPA;
            Inc      <= iInc;
            Dec      <= iDec;
            Neg      <= iNeg;
            Log      <= iLog;
            Rot      <= iRot;
            Hab      <= iHab;
            Selbus   <= iSelbus;
            Selmux   <= iSelmux;
            Selupa   <= iSelupa;
            EDEn     <= iEDEn;
            CBDn     <= iCBDn;
            Cena     <= iCena;
            C        <= iC;
            Vena     <= iVena;
            V        <= iV;
            Zena     <= iZena;
            Z        <= iZ;
            Nena     <= iNena;
            N        <= iNN;
            lena     <= ilena;
            l        <= il;
            Hena     <= iHena;
            H        <= iH;
            Xena     <= iXena;
            XX       <= iXX;
            Sena     <= iSena;
            SS       <= iSS;
            Haba     <= iHaba;
            ResetAux <= iResetAux;
            EG       <= iEG;
				CRI		<= iCRI;
        end if;
    end process;
end architecture rtl;

	 

-- **************************************************************************************
-- *                      UNIDAD DE CONTROL DE COMPUTADORA (UCC) (Top Level-controlwire)*
-- **************************************************************************************


library ieee;
use ieee.std_logic_1164.all;

entity control_wire is
    port (
	 
        -- Entradas
        ln7_0     : in std_logic_vector(7 downto 0);  -- Instrucción desde memoria
        Reset     : in std_logic;                     -- Reset global
        IRQ       : in std_logic;                     -- Interrupción IRQ
        XIRQ      : in std_logic;                     -- Interrupción XIRQ
        Edos      : in std_logic_vector(3 downto 0);  -- Banderas (N, Z, V, C)
        D7        : in std_logic;                     -- Bit más significativo de Qi
        Qo        : in std_logic;                     -- Bit menos significativo de Qi
        FC        : in std_logic;                     -- Estado del contador
        clock     : in std_logic;                      -- Reloj del sistema
		  
		  
        -- Salidas

        RWn       : out std_logic;
        ASn        : out std_logic;
        BD         : out std_logic;
        CX         : out std_logic_vector(2 downto 0);
        EXn        : out std_logic_vector(2 downto 0);
        EnaY       : out std_logic;
        CA         : out std_logic_vector(2 downto 0);
        EAn        : out std_logic_vector(2 downto 0);
        CSP        : out std_logic_vector(2 downto 0);
        ESPn       : out std_logic_vector(2 downto 0);
        CPC        : out std_logic_vector(2 downto 0);
        EPCn       : out std_logic_vector(2 downto 0);
        WAn        : out std_logic;
        EA         : out std_logic_vector(1 downto 0);
        WBn        : out std_logic;
        EB         : out std_logic_vector(1 downto 0);
        LdX        : out std_logic;
        CXnn       : out std_logic;
        EXnn       : out std_logic;
        Ldl        : out std_logic;
        Clnn       : out std_logic;
        Elnn       : out std_logic;
        UPA        : out std_logic_vector(9 downto 0);
        Inc        : out std_logic;
        Dec        : out std_logic;
        Neg        : out std_logic;
        Log        : out std_logic;
        Rot        : out std_logic;
        Hab        : out std_logic;
        Selbus     : out std_logic;
        Selmux     : out std_logic_vector(1 downto 0);
        Selupa     : out std_logic;
        EDEn       : out std_logic;
        CBDn       : out std_logic;
        Cena       : out std_logic;
        C          : out std_logic_vector(2 downto 0);
        Vena       : out std_logic;
        V          : out std_logic_vector(2 downto 0);
        Zena       : out std_logic;
        Z          : out std_logic_vector(3 downto 0);
        Nena       : out std_logic;
        N          : out std_logic_vector(3 downto 0);
        lena       : out std_logic;
        l          : out std_logic_vector(1 downto 0);
        Hena       : out std_logic;
        H          : out std_logic_vector(1 downto 0);
        Xena       : out std_logic;
        XX         : out std_logic_vector(1 downto 0);
        Sena       : out std_logic;
        SS         : out std_logic_vector(1 downto 0);
        Haba       : out std_logic;
        ResetAux   : out std_logic;
        EG         : out std_logic_vector(1 downto 0)
		  
    );
end entity control_wire;


architecture behavior of control_wire is

	signal rom_out : std_logic_vector(120 downto 0);
	
	-- Señales de la ROM
	
	signal Ap		: std_logic_vector(11 downto 0);
	signal Instr	: std_logic_vector(1 downto 0);
	signal Pr		: std_logic_vector(3 downto 0);
	signal VF		: std_logic;
	
	
	signal LINT		: std_logic;
	signal HINT		: std_logic;
	signal HRE		: std_logic;
	signal DINT		: std_logic;
	signal enable	: std_logic;
	signal CRI		: std_logic;
	
	-- Señales de instruccion
	
	signal Am		: std_logic_vector(11 downto 0);
	
	-- Señales de Sequencer
	signal P			: std_logic_vector(11 downto 0);
	signal CC		: std_logic;
	signal Av		: std_logic_vector(11 downto 0);
	
	-- Señales de UCI
	signal INT		: std_logic;
	
	-- Señales de SL
	signal zero		: std_logic := '0';


begin

	MicroROM : entity work.ROM
		port map (
			  clk          => clock,
			  address      => P,
			  control_word => rom_out
		 );
		 
	
	ExtenderInstruction: entity work.RegisterInstruction
		port map (
				CRI			=> CRI,
				ln				=> ln7_0,
				Q				=> Am
		);
		
	
	Sequencer: entity work.Sequencer
		port map (
				clk			=> clock,
				reset			=> Reset,
				ena			=> Enable,
				instr			=> Instr,
				cc				=> CC,
				Ap				=> Ap,
				Am				=> Am,
				Av				=> Av,
				
				P				=> P
		);
		
		
	UCI: entity work.UCI
		port map	(
				clk			=> clock,
				IRQ			=> IRQ,
				XIRQ			=> XIRQ,
				LINT			=> LINT,
				HRE			=> HRE,
				HINT			=> HINT,
				DINT			=> DINT,
				
				Av				=> Av,
				INT			=> INT
		);
		
	SelectionLogic: entity work.SelectionLogic
		port map(
				P				=>	Pr,
				edos			=> Edos,
				INT			=> INT,
				VF				=> VF,
				D7				=> D7,
				Qx				=> zero,
				Qo				=> Qo,
				FC				=> FC,
				
				cc				=> CC
				
		);

		
	MegaReg : entity work.MegaRegister
		port map (
			  clk        => not clock,

			  -- Entradas desde ROM (rom_out mapeado)
			  
			 iAp        => rom_out(11 downto 0),    
			 iInstr     => rom_out(13 downto 12),   
			 iPr        => rom_out(17 downto 14),    
			 iVF        => rom_out(18),          
			 iLINT      => rom_out(19),         
			 iHINT      => rom_out(20),            
			 iHRE       => rom_out(21),            
			 iDINT      => rom_out(22),             
			 iEnable    => rom_out(23),              

			  
			 iRWn       => rom_out(24),
			 iASn       => rom_out(25),
			 iBD        => rom_out(26),
			 iCX        => rom_out(29 downto 27),
			 iEXn       => rom_out(32 downto 30),
			 iEnaY      => rom_out(33),
			 iCA        => rom_out(36 downto 34),
			 iEAn       => rom_out(39 downto 37),
			 iCSP       => rom_out(42 downto 40),
			 iESPn      => rom_out(45 downto 43),
			 iCPC       => rom_out(48 downto 46),
			 iEPCn      => rom_out(51 downto 49),
			 iWAn       => rom_out(52),
			 iEA        => rom_out(54 downto 53),
			 iWBn       => rom_out(55),
			 iEB        => rom_out(57 downto 56),
			 iLdX       => rom_out(58),
			 iCXnn      => rom_out(59),
			 iEXnn      => rom_out(60),
			 iLdl       => rom_out(61),
			 iClnn      => rom_out(62),
			 iElnn      => rom_out(63),
			 iUPA       => rom_out(73 downto 64),
			 iInc       => rom_out(74),
			 iDec       => rom_out(75),
			 iNeg       => rom_out(76),
			 iLog       => rom_out(77),
			 iRot       => rom_out(78),
			 iHab       => rom_out(79),
			 iSelbus    => rom_out(80),
			 iSelmux    => rom_out(82 downto 81),
			 iSelupa    => rom_out(83),
			 iEDEn      => rom_out(84),
			 iCBDn      => rom_out(85),
			 iCena      => rom_out(86),
			 iC         => rom_out(89 downto 87),
			 iVena      => rom_out(90),
			 iV         => rom_out(93 downto 91),
			 iZena      => rom_out(94),
			 iZ         => rom_out(98 downto 95),
			 iNena      => rom_out(99),
			 iNN        => rom_out(103 downto 100),
			 ilena      => rom_out(104),
			 il         => rom_out(106 downto 105),
			 iHena      => rom_out(107),
			 iH         => rom_out(109 downto 108),
			 iXena      => rom_out(110),
			 iXX        => rom_out(112 downto 111),
			 iSena      => rom_out(113),
			 iSS        => rom_out(115 downto 114),
			 iHaba      => rom_out(116),
			 iResetAux  => rom_out(117),
			 iEG        => rom_out(119 downto 118),
			 iCRI			=> rom_out(120),


			  -- Salidas a los puertos reales
			  
			  Ap         => Ap,
			  Instr      => Instr,
			  Pr         => Pr,
			  VF         => VF,
			  LINT       => LINT,
			  HINT       => HINT,
			  HRE        => HRE,
			  DINT       => DINT,
			  enable     => enable,
			  
			  RWn        => RWn,
			  ASn        => ASn,
			  BD         => BD,
			  CX         => CX,
			  EXn        => EXn,
			  EnaY       => EnaY,
			  CA         => CA,
			  EAn        => EAn,
			  CSP        => CSP,
			  ESPn       => ESPn,
			  CPC        => CPC,
			  EPCn       => EPCn,
			  WAn        => WAn,
			  EA         => EA,
			  WBn        => WBn,
			  EB         => EB,
			  LdX        => LdX,
			  CXnn       => CXnn,
			  EXnn       => EXnn,
			  Ldl        => Ldl,
			  Clnn       => Clnn,
			  Elnn       => Elnn,
			  UPA        => UPA,
			  Inc        => Inc,
			  Dec        => Dec,
			  Neg        => Neg,
			  Log        => Log,
			  Rot        => Rot,
			  Hab        => Hab,
			  Selbus     => Selbus,
			  Selmux     => Selmux,
			  Selupa     => Selupa,
			  EDEn       => EDEn,
			  CBDn       => CBDn,
			  Cena       => Cena,
			  C          => C,
			  Vena       => Vena,
			  V          => V,
			  Zena       => Zena,
			  Z          => Z,
			  Nena       => Nena,
			  N          => N,
			  lena       => lena,
			  l          => l,
			  Hena       => Hena,
			  H          => H,
			  Xena       => Xena,
			  XX         => XX,
			  Sena       => Sena,
			  SS         => SS,
			  Haba       => Haba,
			  ResetAux   => ResetAux,
			  EG         => EG,
			  CRI			 => CRI

		);

end architecture;



-- **************************************************************************************
-- *                      MODULO_WIRE (conecta al control_wire y arquitectura_wire
-- **************************************************************************************


library ieee;
use ieee.std_logic_1164.all;

entity modulo_wire is
	port (
		
		Reset		: in std_logic;
		IRQ		: in std_logic;
		XIRQ		: in std_logic;
		clock		: in std_logic;
		IM			: in std_logic_vector(7 downto 0);
		
		Edos		: out std_logic_vector(7 downto 0);
		ln			: out std_logic_vector(15 downto 0);
		Dir		: out std_logic_vector(15 downto 0);
		RWn		: out std_logic;
		ASn		: out std_logic;
		BD			: out std_logic;
		CBDn		: out std_logic
	);

end entity modulo_wire;


architecture behavior of modulo_wire is

	-- señales de salida de control_wire
	signal SRWn      : std_logic;
	signal SASn      : std_logic;
	signal SBD       : std_logic;
	signal SEdos	  : std_logic_vector(7 downto 0);
	signal SCBDn	  : std_logic;
	
	
	signal CX        : std_logic_vector(2 downto 0);
	signal EXn       : std_logic_vector(2 downto 0);
	signal EnaY      : std_logic;
	signal CA        : std_logic_vector(2 downto 0);
	signal EAn       : std_logic_vector(2 downto 0);
	signal CSP       : std_logic_vector(2 downto 0);
	signal ESPn      : std_logic_vector(2 downto 0);
	signal CPC       : std_logic_vector(2 downto 0);
	signal EPCn      : std_logic_vector(2 downto 0);
	signal WAn       : std_logic;
	signal EA        : std_logic_vector(1 downto 0);
	signal WBn       : std_logic;
	signal EB        : std_logic_vector(1 downto 0);
	signal LdX       : std_logic;
	signal CXnn      : std_logic;
	signal EXnn      : std_logic;
	signal Ldl       : std_logic;
	signal Clnn      : std_logic;
	signal Elnn      : std_logic;
	signal UPA       : std_logic_vector(9 downto 0);
	signal Inc       : std_logic;
	signal Dec       : std_logic;
	signal Neg       : std_logic;
	signal Log       : std_logic;
	signal Rot       : std_logic;
	signal Hab       : std_logic;
	signal Selbus    : std_logic;
	signal Selmux    : std_logic_vector(1 downto 0);
	signal Selupa    : std_logic;
	signal EDEn      : std_logic;
	signal Cena      : std_logic;
	signal C         : std_logic_vector(2 downto 0);
	signal Vena      : std_logic;
	signal V         : std_logic_vector(2 downto 0);
	signal Zena      : std_logic;
	signal Z         : std_logic_vector(3 downto 0);
	signal Nena      : std_logic;
	signal N         : std_logic_vector(3 downto 0);
	signal lena      : std_logic;
	signal l         : std_logic_vector(1 downto 0);
	signal Hena      : std_logic;
	signal H         : std_logic_vector(1 downto 0);
	signal Xena      : std_logic;
	signal XX        : std_logic_vector(1 downto 0);
	signal Sena      : std_logic;
	signal SS        : std_logic_vector(1 downto 0);
	signal Haba      : std_logic;
	signal ResetAux  : std_logic;
	signal EG        : std_logic_vector(1 downto 0);

-- señales de salida de arquitectura_wire

	signal Q7		: std_logic;
	signal Qo		: std_logic;
	signal FC		: std_logic;
	signal ln7_0	: std_logic_vector(7 downto 0);
	
begin

	control_wire : entity work.control_wire
		port map(
			ln7_0		=> ln7_0,
			Reset		=> Reset,
			IRQ		=> IRQ,
			XIRQ		=> XIRQ,
			Edos		=> SEdos(3 downto 0),
			D7			=> Q7,
			Qo			=> Qo,
			FC			=> FC,
			clock		=> clock,
			
			RWn      => SRWn,
			ASn      => SASn,
			BD       => SBD,
			CX       => CX,
			EXn      => EXn,
			EnaY     => EnaY,
			CA       => CA,
			EAn      => EAn,
			CSP      => CSP,
			ESPn     => ESPn,
			CPC      => CPC,
			EPCn     => EPCn,
			WAn      => WAn,
			EA       => EA,
			WBn      => WBn,
			EB       => EB,
			LdX      => LdX,
			CXnn     => CXnn,
			EXnn     => EXnn,
			Ldl      => Ldl,
			Clnn     => Clnn,
			Elnn     => Elnn,
			UPA      => UPA,
			Inc      => Inc,
			Dec      => Dec,
			Neg      => Neg,
			Log      => Log,
			Rot      => Rot,
			Hab      => Hab,
			Selbus   => Selbus,
			Selmux   => Selmux,
			Selupa   => Selupa,
			EDEn     => EDEn,
			CBDn     => SCBDn,
			Cena     => Cena,
			C        => C,
			Vena     => Vena,
			V        => V,
			Zena     => Zena,
			Z        => Z,
			Nena     => Nena,
			N        => N,
			lena     => lena,
			l        => l,
			Hena     => Hena,
			H        => H,
			Xena     => Xena,
			XX       => XX,
			Sena     => Sena,
			SS       => SS,
			Haba     => Haba,
			ResetAux => ResetAux,
			EG       => EG
	);
	
	
	
	arquitectura_wire : entity work.ARQUITECTURA_WIRE
		port map(
			
			CX       => CX,
			EXn      => EXn,
			EnaY     => EnaY,
			CA       => CA,
			EAn      => EAn,
			CSP      => CSP,
			ESPn     => ESPn,
			CPC      => CPC,
			EPCn     => EPCn,
			WAn      => WAn,
			EA       => EA,
			WBn      => WBn,
			EB       => EB,
			LdX      => LdX,
			CXnn     => CXnn,
			EXnn     => EXnn,
			Ldl      => Ldl,
			Clnn     => Clnn,
			Elnn     => Elnn,
			UPA      => UPA,
			Inc      => Inc,
			Dec      => Dec,
			Neg      => Neg,
			Log      => Log,
			Rot      => Rot,
			Hab      => Hab,
			Selbus   => Selbus,
			Selmux   => Selmux,
			Selupa   => Selupa,
			EDEn     => EDEn,
			CBDn     => SCBDn,
			Cena     => Cena,
			C        => C,
			Vena     => Vena,
			V        => V,
			Zena     => Zena,
			Z        => Z,
			Nena     => Nena,
			N        => N,
			lena     => lena,
			l        => l,
			Hena     => Hena,
			H        => H,
			Xena     => Xena,
			XX       => XX,
			Sena     => Sena,
			S        => SS,
			Haba     => Haba,
			ResetAux => ResetAux,
			EG       => EG,
			clock		=> clock,
			Reset		=> Reset,
			
			ASn		=> SASn,
			BD			=> SBD,
			RWn		=> SRWn,
			IM			=> IM,
			
			Edos		=> SEdos,
			ln15_8	=> ln(15 downto 8),
			ln7_0		=> ln7_0,
			Qi7		=> Q7,
			Qi0		=> Qo,
			FC			=> FC,
			Dir		=> Dir			
		);
	
	RWn		<= SRWn;
	ASn		<= SASn;
	BD			<= SBD;
	Edos		<= SEdos;
	CBDn		<= SCBDn;
	
	ln(7 downto 0)	<= ln7_0;
	
end architecture;



-- **************************************************************************************
-- *                                   BUFFER
-- **************************************************************************************

library ieee;
use ieee.std_logic_1164.all;

entity bufferx is
    port (
        BD    : in std_logic;                      -- Selección de parte alta o baja
        ASn   : in std_logic;                      -- Habilitación (activo bajo)
        ln    : in std_logic_vector(15 downto 0);  -- Entrada completa
        data  : out std_logic_vector(7 downto 0)   -- Salida de 8 bits
    );
end entity;

architecture behavior of bufferx is
begin
    process(BD, ASn, ln)
    begin
        if ASn = '0' then
            if BD = '0' then
                data <= ln(7 downto 0);      -- Parte baja
            else
                data <= ln(15 downto 8);     -- Parte alta
            end if;
        else
            data <= (others => 'Z');         -- Alta impedancia
        end if;
    end process;
end architecture;



-- **************************************************************************************
-- *                                   LPM_RAM
-- **************************************************************************************


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LPM_RAM is
    port (
        clk     : in std_logic;
        we      : in std_logic;
        address : in std_logic_vector(5 downto 0); -- 6 bits para 64 palabras
        data    : in std_logic_vector(7 downto 0); -- datos de entrada
        q       : out std_logic_vector(7 downto 0) -- datos de salida
    );
end entity;

architecture rtl of LPM_RAM is

    type ram_array is array (0 to 63) of std_logic_vector(7 downto 0);
    signal ram : ram_array;

    -- Archivo de inicialización (.mif)
    attribute ram_init_file : string;
    attribute ram_init_file of ram : signal is "RAM.mif";

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram(to_integer(unsigned(address))) <= data; -- escritura
            end if;
            q <= ram(to_integer(unsigned(address))); -- lectura
        end if;
    end process;

end architecture;



-- **************************************************************************************
-- *                      modulo PROTO_WIRE
-- **************************************************************************************

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PROTO_WIRE is
    port (
        Reset   : in std_logic;
        IRQ     : in std_logic;
        XIRQ    : in std_logic;
        clock   : in std_logic;
		  
        Edos    : out std_logic_vector(7 downto 0);
		  Dir		 : out std_logic_vector(15 downto 0);
		  RWn		 : out std_logic;
		  ASn		 : out std_logic;
		  BD		 : out std_logic;
		  CBDn	 : out std_logic;
		  IM		 : out std_logic_vector(7 downto 0);
        data    : out std_logic_vector(7 downto 0)
    );
end entity;

architecture rtl of PROTO_WIRE is

    -- Señales internas
    signal RWnx    : std_logic;
    signal ASnx    : std_logic;
    signal BDx     : std_logic;
    signal CBDnx   : std_logic;
    signal Inx     : std_logic_vector(15 downto 0);
    signal Dirx    : std_logic_vector(15 downto 0);
    signal IMx     : std_logic_vector(7 downto 0);
	 signal datax	 : std_logic_vector(7 downto 0);

begin

    -- Instancia de la memoria RAM
    ram_inst : entity work.LPM_RAM
        port map (
            clk     => clock,
            we      => not RWnx,           -- escritura activa en bajo
            address => Dirx(5 downto 0),   -- 6 bits
            data    => datax,              -- datos de entrada desde buffer
            q       => IMx                  -- salida hacia el procesador
        );

    -- Instancia del microprocesador
    cpu_core : entity work.modulo_wire
        port map (
            Reset   => Reset,
            IRQ     => IRQ,
            XIRQ    => XIRQ,
            CLOCK   => clock,
            IM      => IMx,
            Edos    => Edos,
            ln      => Inx,
            Dir     => Dirx,
            RWn    => RWnx,
            ASn     => ASnx,
            BD      => BDx,
            CBDn    => CBDnx
        );

    -- Instancia del buffer de salida
    buffer_inst : entity work.bufferx
        port map (
            BD      => BDx,
            ASn     => ASnx,
            ln      => Inx,
            data    => datax
        );
		  
	 Dir		<= Dirx;
	 RWn		<= RWnx;
	 ASn		<= ASnx;
	 BD		<= BDx;
	 IM		<= IMx;
	 data		<= datax;

end architecture;



