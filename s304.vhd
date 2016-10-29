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
--					simple up counter : incrremented by one in each rising clock edge! 
--					Active low reset is used, be careful!
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

entity S304dffcntr is
generic( N : integer := 20);
port( clk : in std_logic;
		q : inout unsigned(N-1 downto 0);
		rst : in std_logic);
end S304dffcntr;

architecture Behavioral of S304dffcntr is
--signal d : unsigned(N-1 downto 0);
begin

-- counter with asynchronous reset
	cntr : process(clk,rst)
	begin
		-- 
		if (rst = '0') then
			q <= (others => '0');
		elsif (clk'event and clk = '1') then
			q <= q+1;
			--q <= d;
		end if;
	end process;
	
	-- just like s303 the counter could be implemented using D-FF : to do this, uncomment lines 44 &  50, comment line 49
	--d <= q+1;
	
-- counter with synchronous reset	
--	dff : process(clk,rst)
--	begin
--		if(rising_edge(clk)) then
--			q <= q+1;
--			if (rst = '0') then
--				q <= (others => '0');
--			end if;
--		end if;
--end process;
	
	

end Behavioral;

