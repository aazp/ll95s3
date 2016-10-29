----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:08:50 10/22/2016 
-- Design Name: 
-- Module Name:    S308cntrupx - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--					N-bit up counter with up as an input port! 
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

entity S308cntrupx is
generic (N : integer := 20);
port( clk,rst,up : in std_logic;
		q : out std_logic_vector(N-1 downto 0));
end S308cntrupx;

architecture Behavioral of S308cntrupx is
signal tmp : unsigned(N-1 downto 0);
begin

cntar : process(clk,rst,up)
		  begin
			
			if(rst = '1') then
				tmp <= (others => '0');
			elsif (clk'event and clk = '1') then
				if ( up = '1') then
					tmp <= tmp+1;
				end if;
			end if;
		end process;
		
q <= std_logic_vector(tmp);


end Behavioral;

