library ieee;
use ieee.numeric_bit.all;

entity contador0a99 is
	port(
			cep, cet, clk, ud : in bit;
			q: out unsigned(7 downto 0);
			tc: out bit
		);
end contador0a99;

architecture behavorial of contador0a99 is

	component contador74169 is
		port(
			cep, cet, clk, pe, ud : in bit;
			d: in unsigned(3 downto 0);
			q: out unsigned(3 downto 0);
			tc: out bit
		);
	end component;
	
	signal d: unsigned(7 downto 0);
	signal load: bit;
	signal temp: unsigned(7 downto 0);
	signal tcaux: bit;
	signal TC1, TC2: bit;
	
	begin
	uu1: contador74169 port map(CEP, CET, Clk, load, UD, D(3 downto 0), temp(3 downto 0), tc1);
	uu2: contador74169 port map(tc1, CET, Clk, load, UD, D(7 downto 4), temp(7 downto 4), tc2);
	
	
	Q <= temp;
	TC <= tcaux;
	tcaux <= not ((not temp(7) and not temp(6) and not temp(5) and not temp(4) and not temp(3) and not temp(2) and not temp(1) and not temp(0) and not UD) or (not temp(7) and temp(6) and temp(5) and not temp(4) and not temp(3) and not temp(2) and temp(1) and temp(0) and UD));
	
	process(tcaux)
	begin
		if tcaux = '0' then
			if UD = '1' then
				D <= "00000000";
				load <= '0';
			else
				D <= "01100011";
				load <= '0';
			end if;
		else load <= '1';
		end if;
	end process;
	
end architecture;
	