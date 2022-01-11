-------------------------------------------------------------------------------
--
-- Title       : gray_bin_selected_dc
-- Design      : gray_bin_selected
-- Author      : Ken
-- Company     : Stony Brook University
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Ken\Documents\ESE 382\Lab Designs\gray_to_binary_2\gray_bin_selected\src\gray_bin_selected_dc.vhd
-- Generated   : Wed Feb 26 03:07:41 2020
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
--{entity {gray_bin_selected_dc} architecture {gray_bin_selected_dc}}

library IEEE;
use IEEE.std_logic_1164.all;

entity gray_bin is
	 port(
		 g3, g2, g1, g0 : in STD_LOGIC;

		 b3, b2, b1, b0 : out STD_LOGIC
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
	"----" when others;
	 -- enter your statements here --

end selected_dc;
