library ieee ;
use ieee.std_logic_1164.all ;
use ieee.std_logic_unsigned.all ;

entity hex2bcd is
    port ( hex_in  : in  std_logic_vector (7 downto 0) ;
           bcd_hun : out std_logic_vector (3 downto 0) ;
           bcd_ten : out std_logic_vector (3 downto 0) ;
           bcd_uni : out std_logic_vector (3 downto 0) ) ;
end hex2bcd ;

architecture arc_hex2bcd of hex2bcd is
begin

	process ( hex_in )
		variable hex_src : std_logic_vector (4 downto 0):= (others => '0') ;
    	variable bcd     : std_logic_vector (11 downto 0):= (others => '0') ;
	begin
		bcd             := (others => '0') ;
		bcd(2 downto 0) := hex_in(7 downto 5);
		hex_src         := hex_in(4 downto 0);
		for i in hex_src'range loop
      	if bcd(3 downto 0) > "0100" then
				bcd(3 downto 0) := bcd(3 downto 0) + "0011" ;
        	end if ;
        	if bcd(7 downto 4) > "0100" then
				bcd(7 downto 4) := bcd(7 downto 4) + "0011" ;
        	end if ;
        -- No roll over for hundred digit, since in 0 .. 2

        	bcd := bcd(10 downto 0) & hex_src(hex_src'left) ; -- shift bcd + 1 new entry
        	hex_src := hex_src(hex_src'left - 1 downto hex_src'right) & '0' ; -- shift src + pad with 0
		end loop ;
		bcd_hun <= bcd(11 downto 8) ;
		bcd_ten <= bcd(7  downto 4) ;
		bcd_uni <= bcd(3  downto 0) ;
end process ;

end arc_hex2bcd;