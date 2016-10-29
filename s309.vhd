----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:51:25 10/29/2016 
-- Design Name: 
-- Module Name:    S309clkdiv - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--					clock divider : frequency of divided clock can be calculated by the original clock and 2^N! (How?)
--					generated clk (dclk) is a gated clock and is assymetric and its duty cycle is small (Why?) : google what is gated clock!
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

entity S309clkdiv is
generic(N : integer := 20);
port(
		clk : in std_logic;
		dclk : out std_logic);
end S309clkdiv;

architecture Behavioral of S309clkdiv is
signal cnt : unsigned (N-1 downto 0);
begin

process(clk)
begin
	if (clk'event and clk='1') then
		dclk <= '0';
		
		cnt <= cnt+1;
		
		if (cnt = to_unsigned(0,N)) then
		-- dclk is 1 in just one period of the original clock!
			dclk <= '1';
		end if;
	end if;
end process;

-- dclk could be completely outside process using below line
-- dclk <= '1' when cnt = to_unsigned(0,N) else '0';

end Behavioral;

