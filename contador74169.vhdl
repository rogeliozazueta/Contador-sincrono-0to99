library ieee;
use ieee.numeric_bit.all;

entity contador74169 is
	port(
			cep, cet, clk, pe, ud : in bit;
			d: in unsigned(3 downto 0);
			q: out unsigned(3 downto 0);
			tc: out bit
		);
end entity;

architecture behave of contador74169 is

	signal temp: unsigned(3 downto 0);
	
	begin
	
	q <= temp;
	tc <= not ((temp(3) and temp(2) and temp(1) and temp(0) and ud) or (not temp(3) and not temp(2) and not temp(1) and not temp(0) and not ud));
	
	process(clk)
	begin
	if clk'event and clk = '1' then
	if pe = '0' then temp <= d;
	else if cep = '0' and cet= '0' then
	if ud = '1' then temp <= temp+1;
	else temp <= temp-1; end if;
	end if;
	end if;
	end if;
	end process;
	
end architecture;