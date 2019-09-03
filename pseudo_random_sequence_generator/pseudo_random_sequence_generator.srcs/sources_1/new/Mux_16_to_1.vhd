----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2018 20:39:08
-- Design Name: 
-- Module Name: Mux_16_to_1 - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mux_16_to_1 is
  Port (selector : in STD_LOGIC_VECTOR(3 downto 0);
        a0 : in STD_LOGIC_VECTOR(3 downto 0);
        a1 : in STD_LOGIC_VECTOR(3 downto 0);
        a2 : in STD_LOGIC_VECTOR(3 downto 0);
        a3 : in STD_LOGIC_VECTOR(3 downto 0);
        a4 : in STD_LOGIC_VECTOR(3 downto 0);
        a5 : in STD_LOGIC_VECTOR(3 downto 0);
        a6 : in STD_LOGIC_VECTOR(3 downto 0);
        a7 : in STD_LOGIC_VECTOR(3 downto 0);
        a8 : in STD_LOGIC_VECTOR(3 downto 0);
        a9 : in STD_LOGIC_VECTOR(3 downto 0);
        a10 : in STD_LOGIC_VECTOR(3 downto 0);
        a11 : in STD_LOGIC_VECTOR(3 downto 0);
        a12 : in STD_LOGIC_VECTOR(3 downto 0);
        a13 : in STD_LOGIC_VECTOR(3 downto 0);
        a14 : in STD_LOGIC_VECTOR(3 downto 0);
        a15 : in STD_LOGIC_VECTOR(3 downto 0);
        pass : out STD_LOGIC_VECTOR(3 downto 0));
end Mux_16_to_1;

architecture Behavioral of Mux_16_to_1 is

begin

with selector select
    pass <= a0 when "0000",
            a1 when "0001",
            a2 when "0010",
            a3 when "0011",
            a4 when "0100",
            a5 when "0101",
            a6 when "0110",
            a7 when "0111",
            a8 when "1000",
            a9 when "1001",
            a10 when "1010",
            a11 when "1011",
            a12 when "1100",
            a13 when "1101",
            a14 when "1110",
            a15 when others;

end Behavioral;
