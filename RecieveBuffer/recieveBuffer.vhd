use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity recieveBuffer is
port
(
    rst:in std_logic;
    clk:in std_logic;
    fifowrite:in std_logic;
    fiforead:in std_logic;
    start:in std_logic;
    datasin:in std_logic_vector(15 downto 0);
    valid:out std_logic;
    datasout:out std_logic_vector(15 downto 0);
    finished:out std_logic
);
end recieveBuffer;
architecture Arc_recieveBuffer of recieveBuffer is
type FiFoMem is array(0 to 15) of std_logic_vector(15 downto 0);
signal FiFo:FiFoMem:=(("0000000000000000"),("0000000000000000"),("0000000000000000"),("0000000000000000"),
              ("0000000000000000"),("0000000000000000"),("0000000000000000"),("0000000000000000"),
              ("0000000000000000"),("0000000000000000"),("0000000000000000"),("0000000000000000"),
              ("0000000000000000"),("0000000000000000"),("0000000000000000"),("0000000000000000"));
signal head:integer range 0 to 16:=0;
signal tail:integer range 0 to 16:=0;
signal readtag:std_logic:='0';
begin
p1:process(rst,clk)
    begin
        if rst='0' then
            FiFo<=(("0000000000000000"),("0000000000000000"),("0000000000000000"),("0000000000000000"),
              ("0000000000000000"),("0000000000000000"),("0000000000000000"),("0000000000000000"),
              ("0000000000000000"),("0000000000000000"),("0000000000000000"),("0000000000000000"),
              ("0000000000000000"),("0000000000000000"),("0000000000000000"),("0000000000000000"));
              tail<=0;
              head<=0;
              readtag<='0';
              valid<='0';
              finished<='0';
              datasout<="0000000000000000";
        elsif clk'event and clk='1' then
            if start='1' then
    				    tail<=0;
                head<=0;
                readtag<='0';
                valid<='0';
                finished<='0';
                datasout<="0000000000000000";
    				else
                if fifowrite='1' then
                  if tail=16 then
                      tail<=0;
                  else
      							  fifo(tail)<=datasin;
                      tail<=tail+1;
                  end if;
                  valid<='0';
                  finished<='0';
                  datasout<="0000000000000000";
                else
                  if readtag='1' then
                      if head=tail then
                          head<=0;
                          tail<=0;
                          readtag<='0';
                          finished<='1';
                          valid<='0';
                          datasout<="0000000000000000";
                      else
                          finished<='0';
                          valid<='1';
                          datasout<=fifo(head);
                          head<=head+1;
                      end if;
                  else
                    if fiforead='1' then
                        readtag<='1';
                    else
                        readtag<='0';
                    end if;
                    valid<='0';
                    finished<='0';
                    datasout<="0000000000000000";
                  end if;
              end if;
            end if;
		    end if;
   end process p1;
end Arc_recieveBuffer;
