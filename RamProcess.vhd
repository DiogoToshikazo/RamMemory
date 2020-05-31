LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RamProcess IS
  PORT(date_in : IN  UNSIGNED(7 DOWNTO 0);
       date_out: OUT UNSIGNED(7 DOWNTO 0);
       address : IN  UNSIGNED(7 DOWNTO 0);
       wr,ce,oe: IN  STD_LOGIC
       );
END RamProcess;
ARCHITECTURE Circuit OF RamProcess IS
  TYPE memory_array IS ARRAY(0 TO 255) OF UNSIGNED(7 DOWNTO 0);
  SIGNAL memory : memory_array;
BEGIN
  PROCESS(ce, address)
  BEGIN
    IF ce = '0' THEN
      IF wr = '0' THEN
        memory(to_integer(address)) <= date_in;
      ELSIF oe = '0' THEN
        date_out <= memory(to_integer(address)); 
      END IF; 
    END IF;
  END PROCESS;
END Circuit;
