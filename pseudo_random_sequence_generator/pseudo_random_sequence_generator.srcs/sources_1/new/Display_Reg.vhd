----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.06.2018 22:15:11
-- Design Name: 
-- Module Name: Display_Reg - Behavioral
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

entity Display_Reg is
  Port (clock_in : in STD_LOGIC;
        reset : in STD_LOGIC;
        reg : out STD_LOGIC_VECTOR(3 downto 0));
end Display_Reg;

architecture Behavioral of Display_Reg is

signal anod : STD_LOGIC_VECTOR(3 downto 0);

begin

process(clock_in,reset)
    variable counter : integer := 0;
begin
    if(clock_in'event and clock_in = '1') then
        if(reset = '1') then
            anod <= "1111";
            counter := 0;
        else
            if(counter = 4) then
                counter := 0;
            end if;
            anod <= "1111";
            anod(counter) <= '0';
            counter := counter + 1;
        end if;
    end if;
end process;

reg <= anod;

end Behavioral;