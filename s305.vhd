----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:42:41 10/22/2016 
-- Design Name: 
-- Module Name:    cntr - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--					up counter with an overflow value to reset the counter (Be careful : asynchronous reset signal is here too!)
--					the counter is completely implemented inside a process!
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

entity S305cntrov is
generic( N : integer := 20);
port( clk : in std_logic;
		ov : in unsigned(N-1 downto 0);
		q : out std_logic_vector(N-1 downto 0);
		rst : in std_logic);
end S305cntrov;

architecture Behavioral of S305cntrov is
signal cnt : unsigned(N-1 downto 0);
begin

	cntup : process(clk,rst)
	begin
		
		if (rst = '1') then
			cnt <= to_unsigned(0,N);
			-- cnt <= (others => '0');
		elsif (clk'event and clk = '1') then
			cnt <= cnt+1;
		if (cnt = ov) then cnt <= (others => '0'); end if;
		-- placing increment here, obviously is not true! (You should synthesis it.)
		--	cnt <= cnt+1;
		end if;
	end process;
	
	q <= std_logic_vector(cnt);
end Behavioral;

