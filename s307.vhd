----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:00:03 10/22/2016 
-- Design Name: 
-- Module Name:    S307cntrdff - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--					same as S306 but counter is implemented using separate D-FF module!
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

entity S307cntrdff is
generic( N : integer := 20);
port( clk : in std_logic;
		ov : in unsigned(N-1 downto 0);
		q : out std_logic_vector(N-1 downto 0);
		rst : in std_logic);
end S307cntrdff;

architecture Behavioral of S307cntrdff is
signal cnt,cntp1 : unsigned(N-1 downto 0);
signal rsts : std_logic;
begin

-- Both of the lines 46 and 48 are allowed!
--cntp1 <= (others => '0') when cnt = ov else cnt+1; rsts <= rst;
-- or 
rsts <= '1' when cnt = ov else rst; cntp1 <= cnt+1;



cntup : entity work.dff
generic map(N)
port map(clk => clk, d => cntp1, q => cnt, rst => rsts);
-- error!
-- port map(clk => clk, d => cnt+1, q => cnt, rst => rst);

q <= std_logic_vector(cnt);


end Behavioral;

