----------------------------------------------------------------------------------
-- 
-- Create Date:    00:09:12 10/29/2016 
-- Design Name: 
-- Module Name:    S301ffl - Behavioral 
-- Project Name: 
-- Target Devices: xilinx FPGAs
-- Tool versions: 
-- Description: 
--             1 bit D-Latch and Flip-Flop without using process() 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity S301ffl is

port( clk : in std_logic;
		d : in std_logic;
		q : out std_logic
		);
end S301ffl;

architecture Behavioral of S301ffl is
-- feedback from q (as output port) is not allowed! 
signal qt : std_logic;
begin

--latch
--qt <= d when clk='1' else qt;
--Flip-Flop
qt <= d when (clk'event and clk='1') else qt;
--or 
--qt <= d when (clk'event and clk='1');
q <= qt;
end Behavioral;

