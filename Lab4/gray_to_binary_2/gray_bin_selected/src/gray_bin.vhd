-------------------------------------------------------------------------------
--
-- Title       : gray_bin
-- Design      : gray_bin_cpos
-- Author      : Ishabul Haque
-- Company     : stony brook
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\gray_bin_cpos\src\gray_bin.vhd
-- Generated   : Wed Feb 19 00:28:12 2020
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
--{entity {gray_bin} architecture {gray_bin}}

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

architecture cpos of gray_bin is
begin

	-- CPOS Logic for b3 of gray to binary 
		
	b3 <= (g3 or g2 or g1 or g0) 
	and (g3 or g2 or g1 or not g0) 
	and (g3 or g2 or not g1 or not g0) 
	and (g3 or g2 or not g1 or g0) 
	and (g3 or not g2 or not g1 or g0) 
	and (g3 or not g2 or not g1 or not g0) 
	and (g3 or not g2 or g1 or not g0) 
	and (g3 or not g2 or g1 or g0); 
	
	-- CPOS Logic for b2 output of gray to binary 
		
	b2 <= (g3 or g2 or g1 or g0) 
	and (g3 or g2 or g1 or not g0) 
	and (g3 or g2 or not g1 or not g0) 
	and (g3 or g2 or not g1 or g0) 
	and (not g3 or not g2 or g1 or g0) 
	and (not g3 or not g2 or g1 or not g0) 
	and (not g3 or not g2 or not g1 or not g0) 
	and (not g3 or not g2 or not g1 or g0); 
	
	-- CPOS Logic for b1 output of gray to binary 
		
	b1 <= (g3 or g2 or g1 or g0) 
	and (g3 or g2 or g1 or not g0) 
	and (g3 or not g2 or not g1 or g0) 
	and (g3 or not g2 or not g1 or not g0) 
	and (not g3 or not g2 or g1 or g0) 
	and (not g3 or not g2 or g1 or not g0) 
	and (not g3 or g2 or not g1 or g0) 
	and (not g3 or g2 or not g1 or not g0); 
	
	-- CPOS Logic for b0 output of gray to binary 
		
	b0 <= (g3 or g2 or g1 or g0) 
	and (g3 or g2 or not g1 or not g0) 
	and (g3 or not g2 or not g1 or g0) 
	and (g3 or not g2 or g1 or not g0) 
	and (not g3 or not g2 or g1 or g0) 
	and (not g3 or not g2 or not g1 or not g0) 
	and (not g3 or g2 or not g1 or g0) 
	and (not g3 or g2 or g1 or not g0); 
	

end cpos;
