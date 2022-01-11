-------------------------------------------------------------------------------
--
-- Title       : gray_bin
-- Design      : gray_bin_table_lookup_dc
-- Author      : admin
-- Company     : SBU
--
-------------------------------------------------------------------------------
--
-- File        : F:\Spring 2020\ESE382\Lab 4\New Lab 4\gray_to_binary_2\gray_bin_table_lookup_dc\src\gray_bin_table_lookup_dc.vhd
-- Generated   : Wed Feb 26 15:49:09 2020
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
		 g : in STD_LOGIC_VECTOR(3 downto 0);
		 b : out STD_LOGIC_VECTOR(3 downto 0)
	     );		   
		 attribute loc : string;
attribute loc of g : signal is "P3,P4,P5,P6";
attribute loc of b : signal is "P27,P26,P25,P24";

end gray_bin;

--}} End of automatically maintained section

architecture table_lookup_dc of gray_bin is	
	type lookup_table is array (0 to 15) of std_logic_vector(3 downto 0); 
	constant table : lookup_table :=   
	("0000","0001","0011","0010","0110","0111","0101","0100","----","----","----","----","1100","1101","1111","1110");
		
begin
	b <= table(to_integer(unsigned(g))); 
	
	 

end table_lookup_dc;
