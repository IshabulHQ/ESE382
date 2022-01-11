-------------------------------------------------------------------------------
--
-- Title       : gray_bin
-- Design      : gray_bin_selected_dc
-- Author      : Ish and Ken 
-- Company     : SBU
--
-------------------------------------------------------------------------------
--
-- File        : F:\Spring 2020\ESE382\Lab 4\New Lab 4\gray_to_binary_2\gray_bin_selected_dc\src\gray_bin.vhd
-- Generated   : Wed Feb 26 15:04:16 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : Task 2 Selected Signal Assignment Approach with Don't Cares  
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {gray_bin} architecture {selected_dc}}

library IEEE;
use IEEE.std_logic_1164.all;

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

architecture selected_dc of gray_bin is
begin

	with std_logic_vector' (g3, g2, g1, g0) select
	(b3, b2, b1, b0) <= std_logic_vector' ("0000") when "0000",
	"0001" when "0001",
	"0010" when "0011",
	"0011" when "0010",
	"0100" when "0110",
	"0101" when "0111",
	"0110" when "0101",
	"0111" when "0100",
	"1000" when "1100",
	"1001" when "1101",	
	"1010" when "1111", 
	"1011" when "1110", 
	"----" when others;
	 -- enter your statements here --


end selected_dc;
