-------------------------------------------------------------------------------
--
-- Title       : gray_bin
-- Design      : gray_bin_selected
-- Author      : Ishabul Haque
-- Company     : stony brook
--
-------------------------------------------------------------------------------
--
-- File        : C:\My_Designs\ESE382\Lab 4\gray_to_binary_2\gray_bin_selected\src\gray_bin_conditional_dc.vhd
-- Generated   : Wed Feb 26 00:12:52 2020
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : This version of the gray_bin decoder has the rotary encoder attached to a shaft that 
-- can only turn through an angle of from 0 up to, but not including, 270 degrees. So, some rotary 
-- encooder output values will never be generated in this application. Therefore, these rotary encoder 
-- outputs will never be input to this design entity 
-- For all these outputs from the rotary encooder (inputs to gray_bin) the outputs of gray_bin are don't 
-- cares
-- So the output it goes up to is, but not including, 1111
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

architecture conditional_dc of gray_bin is	 
	signal b : std_logic_vector(3 downto 0);  
	signal g : std_logic_vector(3 downto 0);  
	 	

begin

  
	g <= (g3,g2,g1,g0);  
	
	
	 b <= "0000" when g = "0000" else  
	 "0001" when g = "0001" else
	 "0010" when g = "0010" else
	 "0011" when g = "0011" else
	 "0100" when g = "0010" else
	 "0101" when g = "0111" else
	 "0110" when g = "0101" else
	 "0111" when g = "0100" else
	 "1000" when g = "1100" else	
	 "1001" when g = "1101" else	
	 "----";
	 

	 

end conditional_dc;
