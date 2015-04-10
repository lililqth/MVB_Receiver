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
  COMPONENT detectMF
    PORT( clk                             :   IN    std_logic;
          reset                           :   IN    std_logic;
          md                              :   IN    std_logic;
          clk_1                           :   IN    std_logic;
          master                          :   OUT   std_logic;
          slave                           :   OUT   std_logic
          );
  END COMPONENT;
  SIGNAL detectMF_out1                    : std_logic;
  SIGNAL detectMF_out2                    : std_logic;
  SIGNAL detectMF_out1_1                  : std_logic;
BEGIN
  u_detectMF : detectMF
    PORT MAP( clk => clk,
              reset => reset,
              md => md,
              clk_1 => clk_1,
              master => detectMF_out1,
              slave => detectMF_out2
              );
  detectMF_out1_1 <= detectMF_out1 OR detectMF_out2;
  master <= detectMF_out1;
  slave <= detectMF_out2;
  start <= detectMF_out1_1;
END rtl;
