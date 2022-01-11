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

architecture cpos of converter_bcd_2421 is	 
begin
p <= (a or b or c or d)
and (not a or b or c or d)
and (a or not b or c or d)
and (not a or not b or c or d)
and (a or b or not c or d);

q <= (a or b or c or d)
and (not a or b or c or d)
and (a or not b or c or d)
and (not a or not b or c or d)
and (not a or b or not c or d);

r <= (a or b or c or d)
and (not a or b or c or d)
and (a or b or not c or d)
and (a or not b or not c or d)
and (not a or not b or not c or d);	

s <=  (a or b or c or d)
and (a or not b or c or d)
and (a or b or not c or d)
and (a or not b or not c or d)
and (a or b or c or not d);
	
end cpos;