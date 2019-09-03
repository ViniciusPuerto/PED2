----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.08.2019 22:29:03
-- Design Name: 
-- Module Name: desloca_esq - Behavioral
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

entity desloca_esq is
Port ( reset 	: in STD_LOGIC;
		 clk 		: in STD_LOGIC;
		 D 		: in STD_LOGIC;
		 led 		: out std_logic_vector(15 downto 0));
end desloca_esq;

architecture Behavioral of desloca_esq is

signal reg : std_logic_vector(15 downto 0) := (others=>'0');

begin

	process(clk,reset)
	begin
		if reset='1' then
			reg <= "0000000000000001";
		elsif rising_edge(clk) then
			reg <= reg(14 downto 0) & D;
		end if;
	end process;
	
	led <= reg;

end Behavioral;
