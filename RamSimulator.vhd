library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RamSimulator is 
end RamSimulator;

architecture Test of  RamSimulator is
  component RamProcess is port (
    date_in : in  UNSIGNED(7 downto 0);
    date_out: out UNSIGNED(7 downto 0);
    address : in  UNSIGNED(7 downto 0);
    wr,ce,oe: in  STD_LOGIC
  );
  end component;
  signal wr, ce, oe : STD_LOGIC;
  signal address, date_in, date_out: UNSIGNED(7 downto 0);
begin
  Test: RamProcess PORT MAP(date_in, date_out, address, wr, ce, oe); 
  process
  begin
    ce <= '1';
    oe <= '1';
    wr <= '1';     
    wait for 10 ms;
      ce <= '0';
      address <= "10000011";
      date_in <= "10000000";
      wr <= '0';      
    wait for 10 ms;
      ce <= '0';
      address <= "10000111";
      date_in <= "10000000";
      wr <= '0';
    wait for 10 ms;
      address <= "10000011";
      wr <= '1';
      oe <= '0';    
    wait for 10 ms;
      ce <= '1';
      address <= "10000000";
      date_in <= "10000011";
      wr <= '0';      
  end process;   
end Test;


    