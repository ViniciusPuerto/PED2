----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/02/2019 12:56:25 PM
-- Design Name: 
-- Module Name: lfsrController - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity lfsrController is
  Port ( clk : in std_logic;
         reset : in std_logic;
         start : in std_logic;
        led : out STD_LOGIC_VECTOR (7 downto 0)
  );
end lfsrController;

architecture Behavioral of lfsrController is

component lfsr8bits
    Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       start : in STD_LOGIC;
       preset : in STD_LOGIC_VECTOR (3 downto 0);
       lfsr_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal presetA : std_logic_vector(3 downto 0) := (others=>'0');
signal reset_aux, start_aux : std_logic := '0';
signal presetB : std_logic_vector(3 downto 0) := (others=>'0');
signal led_out_aux : std_logic_vector(7 downto 0);
signal enable : std_logic;

begin
    my_lfsrA: lfsr8bits port map(
		clk		=>clk,
		preset 	=> presetA,
		reset 	=> reset_aux,
		start 	=> start_aux,
		lfsr_out => led_out_aux(3 downto 0));

	my_lfsrB: lfsr8bits port map(
		clk		=> clk,
		preset 	=> presetB,
		reset 	=> reset_aux,
		start 	=> start_aux,
		lfsr_out => led_out_aux(7 downto 4));
		
		
    process(clk, reset)
        begin
         if rising_edge(clk) then
            if led_out_aux(3 downto 0) = led_out_aux(7 downto 4) then
                start_aux <= '0';
                enable <= '1';
            else 
                start_aux <= start;
                reset_aux <= reset;
                enable <= '0';
            end if;
         end if;
    end process;

    led <= led_out_aux;
    			
	presetA <= "0101";
	presetB <= "0001";
    
    
    
end Behavioral;
