----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:56:07 10/29/2016 
-- Design Name: 
-- Module Name:    S303tff - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description:
--					N-bit T-FF with asynchronous reset 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity S303tff is
-- generics should be used to have general modules with minimum effort! 
	 generic( N : integer := 20);
    Port ( clk : in  STD_LOGIC;
           t : in  STD_LOGIC_VECTOR (N-1 downto 0);
           qp : out  STD_LOGIC_VECTOR (N-1 downto 0);
           rst : in  STD_LOGIC);
end S303tff;

architecture Behavioral of S303tff is
-- feedback from qp as output port is not allowed!
signal q,d : std_logic_vector(N-1 downto 0);
begin

process(clk,rst)
begin
	if(rst = '1') then
		q <= (others => '0');
	elsif (clk'event and clk='1') then
	-- replicating the "if(t(i) = '1'" condition for each bit, for ... loop is used in sequential structures such as process!
		for i in 0 to N-1 loop 
			if(t(i)='1') then
				q(i) <= not q(i);
			--redundant! Because last value is preserved under unstated conditions.
			--else
				--q(i) <= q(i);
			end if;
		end loop;
	end if;
end process;

--using DFF
-- most sequential logics can be implemented using D-FF defined in process as the squential part(memory) and other concurrent structures as the logic part
--process(clk,rst)
--begin
--	if(rst='1') then
--		q <= (others => '0');
--	elsif(clk'event and clk='1') then
--		q <= d;
--	end if;
--end process;
--
--tff : for i in 0 to N-1 generate
--	d(i) <= not q(i) when t(i) = '1' else q(i);
--end generate tff;	

qp <= q;

end Behavioral;

