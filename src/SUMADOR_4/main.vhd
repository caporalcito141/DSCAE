---------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------
ENTITY sumador_4bits IS
    PORT (a, b, c, d, e, f, g, h: IN STD_LOGIC;
          i, j, k, l, c_out: OUT STD_LOGIC);
END sumador_4bits;
--------------------------------------------
ARCHITECTURE structural OF sumador_4bits IS
    ------------
    COMPONENT sumador_bit IS
        PORT (a, b, c_in: IN STD_LOGIC; y, cout: OUT STD_LOGIC);
    END COMPONENT;
    ------------
    SIGNAL w1, w2, w3: STD_LOGIC;
BEGIN
    U1: sumador_bit PORT MAP (a, e, '0', i, w1);
    U2: sumador_bit PORT MAP (b, f, w1, j, w2);
    U3: sumador_bit PORT MAP (c, g, w2, k, w3);
	 U4: sumador_bit PORT MAP (d, h, w3, l, c_out);
END structural;
--------------------------------------------