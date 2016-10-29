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
--					Same as S305 but up counting is implemented inside process. reset and overflow are handled outside the process!
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

entity S306cntrovt is
generic( N : integer := 20);
port( clk : in std_logic;
		ov : in unsigned(N-1 downto 0);
		q : out std_logic_vector(N-1 downto 0);
		rst : in std_logic);
end S306cntrovt;

architecture Behavioral of S306cntrovt is
signal cnt : unsigned(N-1 downto 0);
signal rsts : std_logic;
begin

	cntup : process(clk,rsts)
	begin
		
		if (rsts = '1') then
			--cnt <= to_unsigned(0,N);
		   cnt <= (others => '0');
		elsif (clk'event and clk = '1') then
			cnt <= cnt+1;
		end if;
	end process;
	
	 rsts <= '1' when cnt = ov else rst;
	 -- Uncommenting below line causes error! why? how can it be solved?
	 -- cnt <= to_unsigned(0,N) when cnt = ov; rsts <= rst;
				
	q <= std_logic_vector(cnt);
end Behavioral;

