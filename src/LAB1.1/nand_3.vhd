------ File nand_2.vhd: ---------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------
ENTITY nand_3 IS
    PORT (a, b, c: IN STD_LOGIC; d: OUT STD_LOGIC);
END nand_3;
--------------------------------------------
ARCHITECTURE nand_3 OF nand_3 IS
BEGIN
    d <= NOT (a AND b AND c);
END nand_3;
--------------------------------------------