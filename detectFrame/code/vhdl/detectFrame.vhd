library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity detectFrame is
port
(
  rst:in std_logic;
   md:in std_logic;
  clk:in std_logic;
master:out std_logic;
slave:out std_logic;
start:out std_logic
);
end detectFrame;
architecture Arc_detectFrame of detectFrame is
component detectMainFrame is
port
(
  rst:in std_logic;
   md:in std_logic;
  clk:in std_logic;
master:out std_logic
);
end component;
component detectSlaveFrame is
port
(
  rst:in std_logic;
   md:in std_logic;
  clk:in std_logic;
  slave:out std_logic
);
end component;
signal masterframe:std_logic:='0';
signal slaveframe:std_logic:='0';
begin
    detectMaster:detectMainFrame port map(rst=>rst,clk=>clk,md=>md,master=>masterframe);
    detectSlave:detectSlaveFrame port map(rst=>rst,clk=>clk,md=>md,slave=>slaveframe);
    master<=masterframe;
    slave<=slaveframe;
    start<=masterframe or slaveframe;
end Arc_detectFrame;
