library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lfsr8bits is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start : in STD_LOGIC;
           preset : in STD_LOGIC_VECTOR (3 downto 0);
           lfsr_out : out STD_LOGIC_VECTOR (3 downto 0));
end lfsr8bits;

architecture Behavioral of lfsr8bits is

signal reg : std_logic_vector(3 downto 0) := (others=>'0');

begin

	process(clk,reset)
	variable aux : std_logic := '0';
	begin
		if reset='1' then
			--reg <= "00000111";
			reg <= preset;
			aux := '0';
		elsif rising_edge(clk) then
		   if start = '1' then 
                aux := reg(2) xor reg(3); 
                reg <= reg(2 downto 0) & aux;
		   end if;
		end if;
	end process;
	
	lfsr_out <= reg;

end Behavioral;






