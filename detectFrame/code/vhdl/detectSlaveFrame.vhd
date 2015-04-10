library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity detectSlaveFrame is
port
(
  rst:in std_logic;
   md:in std_logic;
  clk:in std_logic;
  slave:out std_logic
);
end detectSlaveFrame;
architecture Arc_detectSlaveFrame of detectSlaveFrame is
signal samples:std_logic_vector(143 downto 0):=(others=>'0');
signal s1front:std_logic:='0';
signal s1back:std_logic:='0';
signal s2front:std_logic:='0';
signal s2back:std_logic:='0';
signal s3front:std_logic:='0';
signal s3back:std_logic:='0';
signal s4front:std_logic:='0';
signal s4back:std_logic:='0';
signal s5front:std_logic:='0';
signal s5back:std_logic:='0';
signal s6front:std_logic:='0';
signal s6back:std_logic:='0';
signal s7front:std_logic:='0';
signal s7back:std_logic:='0';
signal s8front:std_logic:='0';
signal s8back:std_logic:='0';
signal s9front:std_logic:='0';
signal s9back:std_logic:='0';
begin
p1:process(rst,clk)
   begin
	     if rst='0' then
		     samples<=(others=>'0');
		  elsif clk'event and clk='1' then
		     samples<=samples(142 downto 0) & md;
		  end if;
end process p1;
slave<=s1front and s1back and s2front and s2back and s3front and s3back and s4front and s4back and s5front and s5back and s6front and s6back and s7front and s7back and s8front and s8back and s9front and s9back;
p2:process(samples)
   begin
	     case samples(143 downto 136) is
		       when "11111111"|"11111110"|"11111101"|"11111011"|"11110111"|"11101111"|"11011111"|"10111111"|"01111111"|"00111111"|"11111100"|"01111110"|"00111100"=>
			        s1front<='1';
			    when others=>
			        s1front<='0';
		  end case;
		  case samples(135 downto 128)  is
		       when "00000000"|"00000001"|"00000010"|"00000100"|"00001000"|"00010000"|"00100000"|"01000000"|"10000000"|"11000000"|"00000011"|"10000001"|"11000011"=>
			        s1back<='1';
			    when others=>
			        s1back<='0';
		  end case;
		  case samples(123) is
		       when '1'=>
			        s2front<='1';
			    when others=>
			        s2front<='0';
		  end case;
		  case samples(115)  is
		       when '0'=>
			        s2back<='1';
			    when others=>
			        s2back<='0';
		   end case;
			case samples(107) is
		         when '1'=>
			        s3front<='1';
			      when others=>
			        s3front<='0';
		   end case;
		   case samples(99)  is
		         when '0'=>
			        s3back<='1';
			      when others=>
			        s3back<='0';
		   end case;
			case samples(91) is
		         when '1'=>
			        s4front<='1';
			      when others=>
			        s4front<='0';
		   end case;
		   case samples(83)  is
		         when '0'=>
			        s4back<='1';
			      when others=>
			        s4back<='0';
		   end case;
			case samples(75) is
		         when '0'=>
			          s5front<='1';
			      when others=>
			          s5front<='0';
		   end case;
		   case samples(67)  is
		         when '0'=>
			          s5back<='1';
			      when others=>
			          s5back<='0';
		   end case;
			case samples(59) is
		         when '1'=>
			          s6front<='1';
			      when others=>
			          s6front<='0';
		   end case;
		   case samples(51)  is
		         when '1'=>
			          s6back<='1';
			      when others=>
			          s6back<='0';
		   end case;
			case samples(43) is
					when '1'=>
			          s7front<='1';
			      when others=>
			          s7front<='0';
		   end case;
		   case samples(35)  is
			      when '0'=>
			          s7back<='1';
			      when others=>
			          s7back<='0';
		   end case;
			case samples(27) is
		         when '0'=>
			          s8front<='1';
			      when others=>
			          s8front<='0';
		   end case;
		   case samples(19)  is
		         when '0'=>
			          s8back<='1';
			      when others=>
			          s8back<='0';
		   end case;
			case samples(11) is
		         when '1'=>
			          s9front<='1';
			      when others=>
			          s9front<='0';
		   end case;
		   case samples(3)  is
		         when '1'=>
			          s9back<='1';
			      when others=>
			          s9back<='0';
		   end case;
end process p2;
end Arc_detectSlaveFrame;
