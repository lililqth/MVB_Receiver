LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
ENTITY Subsystem IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        md                                :   IN    std_logic;
        clk_1                             :   IN    std_logic;
        master                            :   OUT   std_logic;
        slave                             :   OUT   std_logic;
        start                             :   OUT   std_logic
        );
END Subsystem;
ARCHITECTURE rtl OF Subsystem IS
  COMPONENT detectMainFrame
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          md                              :   IN    std_logic;
          clk_1                           :   IN    std_logic;
          master                          :   OUT   std_logic
          );
  END COMPONENT;
  COMPONENT detectSlaveFrame1
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          md                              :   IN    std_logic;
          clk_1                           :   IN    std_logic;
          slave                           :   OUT   std_logic
          );
  END COMPONENT;
  FOR ALL : detectMainFrame
    USE ENTITY work.detectMainFrame(rtl);
  FOR ALL : detectSlaveFrame1
    USE ENTITY work.detectSlaveFrame1(rtl);
  SIGNAL detectMainFrame_out1             : std_logic;
  SIGNAL detectSlaveFrame1_out1           : std_logic;
  SIGNAL detectMainFrame_out1_1           : std_logic;
BEGIN
  u_detectMainFrame : detectMainFrame
    PORT MAP( clk => clk,
              reset => reset,
              md => md,
              clk_1 => clk_1,
              master => detectMainFrame_out1
              );
  u_detectSlaveFrame1 : detectSlaveFrame1
    PORT MAP( clk => clk,
              reset => reset,
              md => md,
              clk_1 => clk_1,
              slave => detectSlaveFrame1_out1
              );
  detectMainFrame_out1_1 <= detectMainFrame_out1 OR detectSlaveFrame1_out1;
  master <= detectMainFrame_out1;
  slave <= detectSlaveFrame1_out1;
  start <= detectMainFrame_out1_1;
END rtl;
