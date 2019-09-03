----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.08.2019 22:42:11
-- Design Name: 
-- Module Name: barrelshift_dir - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity barrelshift_dir is
Port ( reset 	: in STD_LOGIC;
		 clk 		: in STD_LOGIC;
		 load		: in STD_LOGIC;
		 sw 		: in std_logic_vector(15 downto 0);
		 led 		: out std_logic_vector(15 downto 0));
end barrelshift_dir;

architecture Behavioral of barrelshift_dir is

signal reg : std_logic_vector(15 downto 0) := (others=>'0');

begin

	process(clk,reset)
	begin
		if reset='1' then
			reg <= (others=>'0');
		elsif rising_edge(clk) then
			if load='1' then
				reg <= sw;
			else
				reg <= reg(0) & reg(15 downto 1);
			end if;
		end if;
	end process;
	
	led <= reg;

end Behavioral;
