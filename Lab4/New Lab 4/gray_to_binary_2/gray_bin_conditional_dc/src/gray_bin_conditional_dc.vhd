-------------------------------------------------------------------------------
--
-- Title       : gray_bin
-- Design      : gray_bin_conditional_dc
-- Author      : Ish and Ken 
-- Company     : SBU
--
-------------------------------------------------------------------------------
--
-- File        : F:\Spring 2020\ESE382\Lab 4\New Lab 4\gray_to_binary_2\gray_bin_conditional_dc\src\gray_bin_conditional_dc.vhd
-- Generated   : Wed Feb 26 15:20:36 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description :  Conditional Signal Assignment Approach with Don’t Cares
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {gray_bin} architecture {conditional_dc}}

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

architecture conditional_dc of gray_bin is
begin

	 b <= "0000" when g = "0000" else  
	 "0001" when g = "0001" else
	 "0010" when g = "0011" else
	 "0011" when g = "0010" else
	 "0100" when g = "0110" else
	 "0101" when g = "0111" else
	 "0110" when g = "0101" else
	 "0111" when g = "0100" else
	 "1000" when g = "1100" else	
	 "1001" when g = "1101" else
	 "1010" when g = "1111" else
	 "1011" when g = "1110" else
	 "----";

end conditional_dc;
