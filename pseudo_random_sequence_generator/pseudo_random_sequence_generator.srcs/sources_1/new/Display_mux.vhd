----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2018 20:39:08
-- Design Name: 
-- Module Name: Display_Mux - Behavioral
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

entity Display_Mux is
  Port (clk : in STD_LOGIC;
        reset : in STD_LOGIC;
        num0 : in STD_LOGIC_VECTOR(3 downto 0);
        num1 : in STD_LOGIC_VECTOR(3 downto 0);
        num2 : in STD_LOGIC_VECTOR(3 downto 0);
        num3 : in STD_LOGIC_VECTOR(3 downto 0);
        anode : out STD_LOGIC_VECTOR(3 downto 0);
        number : out STD_LOGIC_VECTOR(6 downto 0));
end Display_Mux;

architecture Behavioral of Display_Mux is

component Mux_16_to_1 is
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
end component;

component display_reg is
  Port (clock_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        reg : out STD_LOGIC_VECTOR(3 downto 0));
end component;

component seg_converter is
  Port (binary : in STD_LOGIC_VECTOR(3 downto 0);
        converted : out STD_LOGIC_VECTOR(6 downto 0));
end component;

signal divided_clock : STD_LOGIC;
signal selector_local : STD_LOGIC_VECTOR(3 downto 0);
signal binary_local : STD_LOGIC_VECTOR(3 downto 0);

begin

mux : mux_16_to_1 port map(selector => selector_local,
                           a0 => "0000",
                           a1 => "0000",
                           a2 => "0000",
                           a3 => "0000",
                           a4 => "0000",
                           a5 => "0000",
                           a6 => "0000",
                           a7 => num3,
                           a8 => "0000",
                           a9 => "0000",
                           a10 => "0000",
                           a11 => num2,
                           a12 => "0000",
                           a13 => num1,
                           a14 => num0,
                           a15 => "0000",
                           pass => binary_local);

decoder : seg_converter port map(binary => binary_local,
                                 converted => number);

register_local : display_reg port map(clock_in => clk,
                                      reset => reset,
                                      reg => selector_local);

anode <= selector_local;

end Behavioral;
