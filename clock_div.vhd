----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.08.2019 21:42:29
-- Design Name: 
-- Module Name: clock_div - Behavioral
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

entity clock_div is
	Port ( reset 	: in STD_LOGIC;
			 clk 		: in STD_LOGIC;
			 enable 	: out STD_LOGIC;
			 led 		: out STD_LOGIC);
end clock_div;

architecture Behavioral of clock_div is

signal count : unsigned(22 downto 0) := (others=>'0');
signal auxled : std_logic := '0';

begin

	-- contador de 100 ms e criacao do enable
	process(clk,reset)
	begin
		if reset='1' then
			count <= (others=>'0');
			auxled <= '0';
			enable <= '0';
		elsif rising_edge(clk) then
			if count = "10011000100101101000000" then
				auxled <= not auxled;
				enable <= '1';
				count <= (others=>'0');
			else
				enable <= '0';
				count <= count+1;
			end if;
		end if;
	end process;
    
	led <= auxled;
    
end Behavioral;
