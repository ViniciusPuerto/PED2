----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.08.2019 21:30:39
-- Design Name: 
-- Module Name: mux4to1 - Behavioral
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

entity mux4to1 is
    Port ( in1 : in STD_LOGIC_VECTOR (3 downto 0);
           in2 : in STD_LOGIC_VECTOR (3 downto 0);
           in3 : in STD_LOGIC_VECTOR (3 downto 0);
           in4 : in STD_LOGIC_VECTOR (3 downto 0);
           ctr : in STD_LOGIC_VECTOR (1 downto 0);
           muxout : out STD_LOGIC_VECTOR (3 downto 0));
end mux4to1;

architecture Behavioral of mux4to1 is

begin

	with ctr select
		muxout <= in1 when "00",
					 in2 when "01",
					 in3 when "10",
					 in4 when others;

end Behavioral;
