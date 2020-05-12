library ieee;
use ieee.numeric_bit.all;

entity contador74169_tb is
end entity;

architecture arch of contador74169_tb is

	component contador74169 is
		port(
			CEP, CET, Clk, PE, UD : in bit;
			D: in unsigned(3 downto 0);
			Q: out unsigned(3 downto 0);
			TC: out bit
		);
	end component;
	
	signal CEP, CET : bit := '0';
	signal PE : bit := '1';
	signal D, Q : unsigned(3 downto 0);
	signal Clk, TC : bit;
	signal UD : bit := '1';
	
	begin
	
	UU1: contador74169 port map(CEP, CET, Clk, PE, UD, D, Q, TC);
	
	clk_process: process
	begin
			Clk <= '0';
			wait for 5 ns;
			Clk <= '1';
			wait for 5 ns;
	end process;
	
	test: process
	begin
		D <= "0000";
		PE <= '0';
		wait for 10 ns;
		
		PE <= '1';
		
		wait for 70 ns;
		
		UD <= '0';
		wait for 150 ns;
	end process;
	
end architecture;