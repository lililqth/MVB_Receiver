LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Subsystem_pkg.ALL;
ENTITY detectSlaveFrame1 IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        md                                :   IN    std_logic;
        clk_1                             :   IN    std_logic;
        slave                             :   OUT   std_logic
        );
END detectSlaveFrame1;
ARCHITECTURE rtl OF detectSlaveFrame1 IS
  SIGNAL samples                          : std_logic_vector(0 TO 143);  -- boolean [144]
  SIGNAL samples_next                     : std_logic_vector(0 TO 143);  -- boolean [144]
BEGIN
  detectSlaveFrame1_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      samples <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      samples <= samples_next;
    END IF;
  END PROCESS detectSlaveFrame1_1_process;
  detectSlaveFrame1_1_output : PROCESS (md, samples, clk_1)
    VARIABLE s1front : std_logic;
    VARIABLE s2front : std_logic;
    VARIABLE s3front : std_logic;
    VARIABLE s4front : std_logic;
    VARIABLE s5front : std_logic;
    VARIABLE s6front : std_logic;
    VARIABLE s7front : std_logic;
    VARIABLE s8front : std_logic;
    VARIABLE s9front : std_logic;
    VARIABLE s1back : std_logic;
    VARIABLE s2back : std_logic;
    VARIABLE s3back : std_logic;
    VARIABLE s4back : std_logic;
    VARIABLE s5back : std_logic;
    VARIABLE s6back : std_logic;
    VARIABLE s7back : std_logic;
    VARIABLE s8back : std_logic;
    VARIABLE s9back : std_logic;
    VARIABLE add_cast : vector_of_unsigned8(0 TO 142);
  BEGIN
    samples_next <= samples;
    slave <= '0';
    IF ((((((((((((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1')) OR ((((((((samples(136) = '1') AND (samples(137) = '0')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '0')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '0')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '0')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '0')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '0')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '0'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '0')) AND (samples(143) = '0'))) OR ((((((((samples(136) = '0') AND (samples(137) = '0')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '0') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '0'))) OR ((((((((samples(136) = '0') AND (samples(137) = '0')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '0')) AND (samples(143) = '0')) THEN
      s1front := '1';
    ELSE
      s1front := '0';
    END IF;
    IF (((((((((((((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0')) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '1'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '1')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '1')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '1')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '1')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '1')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '1')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '1') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '1') AND (samples(129) = '1')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '1')) AND (samples(135) = '1'))) OR ((((((((samples(128) = '1') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '1'))) OR ((((((((samples(128) = '1') AND (samples(129) = '1')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '1')) AND (samples(135) = '1')) THEN
      s1back := '1';
    ELSE
      s1back := '0';
    END IF;
    IF samples(123) = '1' THEN
      s2front := '1';
    ELSE
      s2front := '0';
    END IF;
    IF samples(115) = '0' THEN
      s2back := '1';
    ELSE
      s2back := '0';
    END IF;
    IF samples(107) = '1' THEN
      s3front := '1';
    ELSE
      s3front := '0';
    END IF;
    IF samples(99) = '0' THEN
      s3back := '1';
    ELSE
      s3back := '0';
    END IF;
    IF samples(91) = '1' THEN
      s4front := '1';
    ELSE
      s4front := '0';
    END IF;
    IF samples(83) = '0' THEN
      s4back := '1';
    ELSE
      s4back := '0';
    END IF;
    IF samples(75) = '0' THEN
      s5front := '1';
    ELSE
      s5front := '0';
    END IF;
    IF samples(67) = '0' THEN
      s5back := '1';
    ELSE
      s5back := '0';
    END IF;
    IF samples(59) = '1' THEN
      s6front := '1';
    ELSE
      s6front := '0';
    END IF;
    IF samples(51) = '1' THEN
      s6back := '1';
    ELSE
      s6back := '0';
    END IF;
    IF samples(43) = '1' THEN
      s7front := '1';
    ELSE
      s7front := '0';
    END IF;
    IF samples(35) = '0' THEN
      s7back := '1';
    ELSE
      s7back := '0';
    END IF;
    IF samples(27) = '0' THEN
      s8front := '1';
    ELSE
      s8front := '0';
    END IF;
    IF samples(19) = '0' THEN
      s8back := '1';
    ELSE
      s8back := '0';
    END IF;
    IF samples(11) = '1' THEN
      s9front := '1';
    ELSE
      s9front := '0';
    END IF;
    IF samples(3) = '1' THEN
      s9back := '1';
    ELSE
      s9back := '0';
    END IF;
    IF (((((((((((((((((s1front AND s2front) AND s3front) AND s4front) AND s5front) AND s6front) AND s7front) AND s8front) AND s9front) AND s1back) AND s2back) AND s3back) AND s4back) AND s5back) AND s6back) AND s7back) AND s8back) AND s9back) = '1' THEN
      slave <= '1';
    ELSE
      slave <= '0';
    END IF;
    IF clk_1 = '1' THEN
      FOR t_0 IN 0 TO 142 LOOP
        add_cast(t_0) := unsigned(to_signed(t_0, 32)(7 DOWNTO 0));
        samples_next(to_integer(1 + add_cast(t_0))) <= samples(t_0);
      END LOOP;
      samples_next(0) <= md;
    END IF;
  END PROCESS detectSlaveFrame1_1_output;
END rtl;
