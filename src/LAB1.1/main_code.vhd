------ File project.vhd: ---------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------
ENTITY project IS
    PORT (a, b, c, d: IN STD_LOGIC;
          x, y: OUT STD_LOGIC);
END project;
--------------------------------------------
ARCHITECTURE structural OF project IS
    ------------
    COMPONENT inverter IS
        PORT (a: IN STD_LOGIC; b: OUT STD_LOGIC);
    END COMPONENT;
    ------------
    COMPONENT nand_2 IS
        PORT (a, b: IN STD_LOGIC; c: OUT STD_LOGIC);
    END COMPONENT;
    ------------
    COMPONENT nand_3 IS
        PORT (a, b, c: IN STD_LOGIC; d: OUT STD_LOGIC);
    END COMPONENT;
    ------------
    SIGNAL w: STD_LOGIC;
BEGIN
    U1: inverter PORT MAP (b, w);
    U2: nand_2 PORT MAP (a, b, x);
    U3: nand_3 PORT MAP (w, c, d, y);
END structural;
--------------------------------------------