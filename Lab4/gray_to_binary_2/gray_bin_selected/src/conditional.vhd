library ieee;
use ieee.std_logic_1164.all;



entity converter_bcd_2421 is
port(
 d, c, b, a : in std_logic;
 p, q, r, s : out std_logic
 );			 
 
 attribute loc : string;
   attribute loc of d : signal is "P3";
   attribute loc of c : signal is "P4";
   attribute loc of b : signal is "P5";
   attribute loc of a : signal is "P6";		
   attribute loc of p : signal is "P27";		
   attribute loc of q : signal is "P26";		
   attribute loc of r : signal is "P25";		
   attribute loc of s : signal is "P24";
end converter_bcd_2421;	 

architecture conditional of converter_bcd_2421 is	 
signal tmp : std_logic_vector(3 downto 0);
begin 
tmp <= (d, c, b, a);
p <= '0' when tmp = "0000" else  
	 '0' when tmp = "0001" else
	 '0' when tmp = "0010" else
	 '0' when tmp = "0011" else
	 '0' when tmp = "0100" else
	 '1' when tmp = "0101" else
	 '1' when tmp = "0110" else
	 '1' when tmp = "0111" else
	 '1' when tmp = "1000" else	
	 '1' when tmp = "1001" else	 
	 '-';
	 
q <= '0' when tmp = "0000" else  
	 '0' when tmp = "0001" else
	 '0' when tmp = "0010" else
	 '0' when tmp = "0011" else
	 '0' when tmp = "0101" else
	 '1' when tmp = "0100" else
	 '1' when tmp = "0110" else
	 '1' when tmp = "0111" else
	 '1' when tmp = "1000" else	
	 '1' when tmp = "1001" else	 
	 '-';

r <= '0' when tmp = "0000" else  
	 '0' when tmp = "0001" else
	 '0' when tmp = "0100" else
	 '0' when tmp = "0110" else
	 '0' when tmp = "0111" else
	 '1' when tmp = "0010" else
	 '1' when tmp = "0011" else
	 '1' when tmp = "0101" else
	 '1' when tmp = "1000" else	
	 '1' when tmp = "1001" else	 
	 '-';
	
s <= '0' when tmp = "0000" else  
	 '0' when tmp = "0010" else
	 '0' when tmp = "0100" else
	 '0' when tmp = "0110" else
	 '0' when tmp = "1000" else
	 '1' when tmp = "0001" else
	 '1' when tmp = "0011" else
	 '1' when tmp = "0101" else
	 '1' when tmp = "0111" else	
	 '1' when tmp = "1001" else	 
	 '-';
	 
end conditional;
	
	