----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.08.2019 08:58:17
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Deion: 
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

entity top is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (7 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0)
           );
end top;

architecture Behavioral of top is

component clock_div
	Port ( reset 	: in STD_LOGIC;
		 clk 		: in STD_LOGIC;
		 enable 	: out STD_LOGIC;
		 clk_out	: out STD_LOGIC);
end component;

--component lfsr8bits
--    Port ( clk : in STD_LOGIC;
--       reset : in STD_LOGIC;
--       start : in STD_LOGIC;
--       preset : in STD_LOGIC_VECTOR (7 downto 0);
--       lfsr_out : out STD_LOGIC_VECTOR (7 downto 0));
--end component;

component lfsrController
     Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       start : in STD_LOGIC;
       led : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Display_Mux is 
          port( clk : in std_logic;
                reset : in STD_LOGIC;
                num0 : in STD_LOGIC_VECTOR(3 downto 0);
                num1 : in STD_LOGIC_VECTOR(3 downto 0);
                num2 : in STD_LOGIC_VECTOR(3 downto 0);
                num3 : in STD_LOGIC_VECTOR(3 downto 0);
                anode : out STD_LOGIC_VECTOR(3 downto 0);
                number : out STD_LOGIC_VECTOR(6 downto 0));
                
    end component;
    
    component binary_bcd is
        generic(N: positive := 16);
        port(
            clk, reset: in std_logic;
            binary_in: in std_logic_vector(N-1 downto 0);
            bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0)
        );    
    end component;
    
    
signal clock_1Hz : std_logic := '0';
signal enable : std_logic := '1';
signal led_aux : STD_LOGIC_VECTOR (7 downto 0);
signal n0, n1, n2, n3 : std_logic_vector(3 downto 0);
begin
	
	enable <= '1';
	
	my_controller: lfsrController port map(
	   clk => clock_1Hz,
	   reset => reset,
	   start => start,
	   led => led_aux
	);
	my_clkdiv: clock_div port map(
		clk 		=> clk,
		reset 	=> reset,
		enable 	=> enable,
		clk_out  => clock_1Hz);
	
	n0 <= led_aux(7 downto 4);
	n3 <= led_aux(3 downto 0); 
			
	mux_dis : Display_Mux port map (clk => clock_1Hz,
                                reset =>  reset,
                                num0 => n0,
                                num1 => "0000",
                                num2 => "0000",
                                num3 => n3,
                                anode => an,
                                number => seg
                                );
                                
                                
                          
end Behavioral;
