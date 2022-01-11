-------------------------------------------------------------------------------
--
-- Title       : gray_bin
-- Design      : gray_bin_table_lookup_dc
-- Author      : Ishabul Haque
-- Company     : stony brook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\gray_bin_table_lookup_dc\src\gray_bin.vhd
-- Generated   : Wed Feb 26 04:55:08 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {gray_bin} architecture {table_lookup_dc}}

library IEEE;
use IEEE.std_logic_1164.all; 
use ieee.numeric_std.all; 

entity gray_bin is
	 port(
		 g3 : in STD_LOGIC;
		 g2 : in STD_LOGIC;
		 g1 : in STD_LOGIC;
		 g0 : in STD_LOGIC;
		 b3 : out STD_LOGIC;
		 b2 : out STD_LOGIC;
		 b1 : out STD_LOGIC;
		 b0 : out STD_LOGIC
	     );
end gray_bin;

--}} End of automatically maintained section

architecture table_lookup_dc of gray_bin is	 
	
	signal b : std_logic_vector(3 downto 0); 
	signal g : std_logic_vector(3 downto 0);  
	type lookup_table is array (0 to 9) of std_logic_vector(3 downto 0); 
	constant table : lookup_table := 
	("0000","0001", "0011","0100","0101","0110","0111","1000","1001"); 

begin

  
	g <= (g3,g2,g1,g0);  
	b <= table(to_integer(unsigned'(g))); 
	
	
	 

end table_lookup_dc;
