----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.08.2019 22:57:09
-- Design Name: 
-- Module Name: contador - Behavioral
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

entity contador is
	Port ( reset 	: in STD_LOGIC;
			 clk 		: in STD_LOGIC;
			 led 		: out std_logic_vector(1 downto 0));
end contador;

architecture Behavioral of contador is

signal count : unsigned(1 downto 0) := (others=>'0');

begin

	-- contador ascendente
	process(clk,reset)
	begin
		if reset='1' then
			count <= (others=>'0');
		elsif rising_edge(clk) then
			count <= count+1;
		end if;
	end process;
	
	led <= std_logic_vector(count);

end Behavioral;
