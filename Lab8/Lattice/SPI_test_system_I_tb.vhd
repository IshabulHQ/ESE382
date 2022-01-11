
-- VHDL Test Bench Created from source file SPI_test_system_I.vhd -- Tue Apr 28 17:39:12 2020

--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Lattice recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "source->import"
-- menu in the ispLEVER Project Navigator to import the testbench.
-- Then edit the user defined section below, adding code to generate the 
-- stimulus for your design.
-- 3) VHDL simulations will produce errors if there are Lattice FPGA library 
-- elements in your design that require the instantiation of GSR, PUR, and
-- TSALL and they are not present in the testbench. For more information see
-- the How To section of online help.  
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY testbench IS
END testbench;

ARCHITECTURE behavior OF testbench IS 

	COMPONENT SPI_test_system_I
	PORT(
		rst_bar : IN std_logic;
		clk : IN std_logic;
		send : IN std_logic;
		cpol : IN std_logic;
		cpha : IN std_logic;
		data_in : IN std_logic_vector(7 downto 0);          
		mosi : OUT std_logic;
		sck : OUT std_logic;
		ss_bar : OUT std_logic
		);
	END COMPONENT;

	SIGNAL rst_bar :  std_logic;
	SIGNAL clk :  std_logic;
	SIGNAL send :  std_logic;
	SIGNAL cpol :  std_logic;
	SIGNAL cpha :  std_logic;
	SIGNAL data_in :  std_logic_vector(7 downto 0);
	SIGNAL mosi :  std_logic;
	SIGNAL sck :  std_logic;
	SIGNAL ss_bar :  std_logic;

BEGIN

-- Please check and add your generic clause manually
	uut: SPI_test_system_I PORT MAP(
		rst_bar => rst_bar,
		clk => clk,
		send => send,
		cpol => cpol,
		cpha => cpha,
		data_in => data_in,
		mosi => mosi,
		sck => sck,
		ss_bar => ss_bar
	);


-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
      wait; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
