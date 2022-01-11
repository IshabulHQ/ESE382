-------------------------------------------------------------------------------
--
-- Title       : gray_bin
-- Design      : gray_bin
-- Author      : Ken and Ishabul Haque 
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\Ken\Documents\ESE 382\Lab Designs\gray_bin\gray_bin\src\gray_bin.vhd
-- Generated   : Wed Feb 19 13:10:53 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Design Task 1; Selected Signal Assignment Approach  
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {gray_bin} architecture {gray_bin}}

library IEEE;
use IEEE.std_logic_1164.all;

entity gray_bin is
	 port(
		 g3, g2, g1, g0 : in STD_LOGIC;

		 b3, b2, b1, b0 : out STD_LOGIC
	     );
end gray_bin;

--}} End of automatically maintained section

architecture selected of gray_bin is
begin  
	with std_logic_vector'(g3, g2, g1, g0) select
	b0 <= '1' when "0001", '1' when "0010", '1' when "0100", '1' when "0111", '1' when "1101", '1' when "1110", '1' when "1000", '1' when "1011",
	'0' when others;
	
	with std_logic_vector'(g3, g2, g1, g0) select
	b1 <= '1' when "0011", '1' when "0010", '1' when "0100", '1' when "0101", '1' when "1111", '1' when "1110", '1' when "1000", '1' when "1001",
	'0' when others;
	
	with std_logic_vector'(g3, g2, g1, g0) select
	b2 <= '1' when "0100", '1' when "0101", '1' when "0111", '1' when "0110", '1' when "1000", '1' when "1001", '1' when "1011", '1' when "1010",
	'0' when others;
	
	with std_logic_vector'(g3, g2, g1, g0) select
	b3 <= '1' when "1100", '1' when "1101", '1' when "1111", '1' when "1110", '1' when "1000", '1' when "1001", '1' when "1011", '1' when "1010",
	'0' when others;
	 -- enter your statements here --

end selected;
