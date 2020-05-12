library ieee;
use ieee.numeric_bit.all;

entity contador0a99_tb is
end entity;

architecture x of contador0a99_tb is
	
	component contador0a99 is
	port(
			cep, cet, clk, ud : in bit;
			q: out unsigned(7 downto 0);
			tc: out bit
		);
	end component;
	
	signal cep, cet : bit := '0';
	signal ud : bit := '1';
	signal clk, tc : bit;
	signal q : unsigned(7 downto 0);
	
	
	begin
	
	uu1: contador0a99 port map(cep, cet, clk, ud, q,tc);
	
	clk_process: process
	begin
			clk <= '0';
			wait for 5 ns;
			clk <= '1';
			wait for 5 ns;
	end process;
	
	count_process: process
	begin
		wait for 100 ns;
		
		UD <= '0';
		
		wait for 200 ns;
		
		UD <= '1';
		
	end process;
	
end x;