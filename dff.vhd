----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:46 10/22/2016 
-- Design Name: 
-- Module Name:    dff - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
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

entity dff is
generic( N : integer := 20);
port( clk : in std_logic;
		d : in unsigned(N-1 downto 0);
		q : out unsigned(N-1 downto 0);
		rst : in std_logic);
end dff;

architecture Behavioral of dff is

begin

	dff : process(clk,rst)
	begin
		if (rst = '0') then
			q <= (others => '0');
		elsif (clk'event and clk = '1') then
			q <= d;
		end if;
	end process;

end Behavioral;

