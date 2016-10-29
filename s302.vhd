----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:10:45 10/29/2016 
-- Design Name: 
-- Module Name:    S302dffl - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--					D latch and D-FF definition using process! : This is the standard base definition of clocked gates 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity S302dffl is
port( clk : in std_logic;
		d : in std_logic;
		q : out std_logic
		);
end S302dffl;

architecture Behavioral of S302dffl is
--signal qt : std_logic;
begin

process(clk)
begin
	--latch:
	--if(clk='1') then
	--FF:
	--if(clk'event and clk='1') then
	if(rising_edge(clk)) then
		q <= d;
	end if;
end process;

end Behavioral;

