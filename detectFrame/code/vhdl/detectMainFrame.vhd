library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity detectMainFrame is
port
(
  rst:in std_logic;
   md:in std_logic;
  clk:in std_logic;
  master:out std_logic
);
end detectMainFrame;
architecture Arc_detectMainFrame of detectMainFrame is
signal samples:std_logic_vector(143 downto 0):=(others=>'0');
signal m1front:std_logic:='0';
signal m1back:std_logic:='0';
signal m2front:std_logic:='0';
signal m2back:std_logic:='0';
signal m3front:std_logic:='0';
signal m3back:std_logic:='0';
signal m4front:std_logic:='0';
signal m4back:std_logic:='0';
signal m5front:std_logic:='0';
signal m5back:std_logic:='0';
signal m6front:std_logic:='0';
signal m6back:std_logic:='0';
signal m7front:std_logic:='0';
signal m7back:std_logic:='0';
signal m8front:std_logic:='0';
signal m8back:std_logic:='0';
signal m9front:std_logic:='0';
signal m9back:std_logic:='0';
begin
p1:process(rst,clk)
   begin
	     if rst='0' then
		     samples<=(others=>'0');
		  elsif clk'event and clk='1' then
		     samples<=samples(142 downto 0) & md;
		  end if;
end process p1;
master<=m1front and m1back and m2front and m2back and m3front and m3back and m4front and m4back and m5front and m5back and m6front and m6back and m7front and m7back and m8front and m8back and m9front and m9back;
p2:process(samples)
   begin
	     case samples(143 downto 136) is
		       when "11111111"|"11111110"|"11111101"|"11111011"|"11110111"|"11101111"|"11011111"|"10111111"|"01111111"|"00111111"|"11111100"|"01111110"|"00111100"=>
			        m1front<='1';
			    when others=>
			        m1front<='0';
		  end case;
		  case samples(135 downto 128)  is
		       when "00000000"|"00000001"|"00000010"|"00000100"|"00001000"|"00010000"|"00100000"|"01000000"|"10000000"|"11000000"|"00000011"|"10000001"|"11000011"=>
			        m1back<='1';
			    when others=>
			        m1back<='0';
		  end case;
		  case samples(123) is
		       when '1'=>
			        m2front<='1';
			    when others=>
			        m2front<='0';
		  end case;
		  case samples(115)  is
		       when '1'=>
			        m2back<='1';
			    when others=>
			        m2back<='0';
		   end case;
			case samples(107) is
		         when '0'=>
			          m3front<='1';
			      when others=>
			          m3front<='0';
		   end case;
		   case samples(99)  is
		         when '0'=>
			          m3back<='1';
			      when others=>
			          m3back<='0';
		   end case;
			case samples(91) is
		         when '0'=>
			          m4front<='1';
			      when others=>
			          m4front<='0';
		   end case;
		   case samples(83)  is
		         when '1'=>
			          m4back<='1';
			      when others=>
			          m4back<='0';
		   end case;
			case samples(75) is
		         when '1'=>
			          m5front<='1';
			      when others=>
			          m5front<='0';
		   end case;
		   case samples(67)  is
		         when '1'=>
			          m5back<='1';
			      when others=>
			          m5back<='0';
		   end case;
			case samples(59) is
		         when '0'=>
			          m6front<='1';
			      when others=>
			          m6front<='0';
		   end case;
		   case samples(51)  is
		         when '0'=>
			          m6back<='1';
			      when others=>
			          m6back<='0';
		   end case;
			case samples(43) is
		         when '0'=>
			          m7front<='1';
			      when others=>
			          m7front<='0';
		   end case;
		   case samples(35)  is
		         when '1'=>
			          m7back<='1';
			      when others=>
			          m7back<='0';
		   end case;
			case samples(27) is
		         when '0'=>
			          m8front<='1';
			      when others=>
			          m8front<='0';
		   end case;
		   case samples(19)  is
		         when '1'=>
			          m8back<='1';
			      when others=>
			          m8back<='0';
		   end case;
			case samples(11) is
		         when '0'=>
			          m9front<='1';
			      when others=>
			          m9front<='0';
		   end case;
		   case samples(3)  is
		         when '1'=>
			          m9back<='1';
			      when others=>
			          m9back<='0';
		   end case;
end process p2;
end Arc_detectMainFrame;