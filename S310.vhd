----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:44 10/30/2016 
-- Design Name: 
-- Module Name:    S310 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--					 same as S309 but dclk is symmetric and its duty cycle is 50% !
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

entity S310 is
generic(N : integer := 20);
port(
		clk : in std_logic;
		dclk : out std_logic);
end S310;

architecture Behavioral of S310 is
signal cnt : unsigned (N-1 downto 0);
begin

process(clk)
begin
	if (clk'event and clk = '1') then
		cnt <= cnt+1;
	end if;
end process;

dclk <= cnt(N-1);

end Behavioral;

