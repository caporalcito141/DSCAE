------ File nand_2.vhd: ---------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;
--------------------------------------------
ENTITY nand_2 IS
    PORT (a, b: IN STD_LOGIC; c: OUT STD_LOGIC);
END nand_2;
--------------------------------------------
ARCHITECTURE nand_2 OF nand_2 IS
BEGIN
    c <= NOT (a AND b);
END nand_2;
--------------------------------------------