LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.Subsystem_pkg.ALL;
ENTITY detectMainFrame IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        md                                :   IN    std_logic;
        clk_1                             :   IN    std_logic;
        master                            :   OUT   std_logic
        );
END detectMainFrame;
ARCHITECTURE rtl OF detectMainFrame IS
  SIGNAL samples                          : std_logic_vector(0 TO 143);  -- boolean [144]
  SIGNAL samples_next                     : std_logic_vector(0 TO 143);  -- boolean [144]
BEGIN
  detectMainFrame_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      samples <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      samples <= samples_next;
    END IF;
  END PROCESS detectMainFrame_1_process;
  detectMainFrame_1_output : PROCESS (md, samples, clk_1)
    VARIABLE m1front : std_logic;
    VARIABLE m2front : std_logic;
    VARIABLE m3front : std_logic;
    VARIABLE m4front : std_logic;
    VARIABLE m5front : std_logic;
    VARIABLE m6front : std_logic;
    VARIABLE m7front : std_logic;
    VARIABLE m8front : std_logic;
    VARIABLE m9front : std_logic;
    VARIABLE m1back : std_logic;
    VARIABLE m2back : std_logic;
    VARIABLE m3back : std_logic;
    VARIABLE m4back : std_logic;
    VARIABLE m5back : std_logic;
    VARIABLE m6back : std_logic;
    VARIABLE m7back : std_logic;
    VARIABLE m8back : std_logic;
    VARIABLE m9back : std_logic;
    VARIABLE add_cast : vector_of_unsigned8(0 TO 142);
  BEGIN
    samples_next <= samples;
    master <= '0';
    IF ((((((((((((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1')) OR ((((((((samples(136) = '1') AND (samples(137) = '0')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '0')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '0')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '0')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '0')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '0')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '0'))) OR ((((((((samples(136) = '1') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '0')) AND (samples(143) = '0'))) OR ((((((((samples(136) = '0') AND (samples(137) = '0')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '1'))) OR ((((((((samples(136) = '0') AND (samples(137) = '1')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '1')) AND (samples(143) = '0'))) OR ((((((((samples(136) = '0') AND (samples(137) = '0')) AND (samples(138) = '1')) AND (samples(139) = '1')) AND (samples(140) = '1')) AND (samples(141) = '1')) AND (samples(142) = '0')) AND (samples(143) = '0')) THEN
      m1front := '1';
    ELSE
      m1front := '0';
    END IF;
    IF (((((((((((((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0')) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '1'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '1')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '1')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '1')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '1')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '1')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '1')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '1') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '1') AND (samples(129) = '1')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '0'))) OR ((((((((samples(128) = '0') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '1')) AND (samples(135) = '1'))) OR ((((((((samples(128) = '1') AND (samples(129) = '0')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '0')) AND (samples(135) = '1'))) OR ((((((((samples(128) = '1') AND (samples(129) = '1')) AND (samples(130) = '0')) AND (samples(131) = '0')) AND (samples(132) = '0')) AND (samples(133) = '0')) AND (samples(134) = '1')) AND (samples(135) = '1')) THEN
      m1back := '1';
    ELSE
      m1back := '0';
    END IF;
    IF samples(123) = '1' THEN
      m2front := '1';
    ELSE
      m2front := '0';
    END IF;
    IF samples(115) = '1' THEN
      m2back := '1';
    ELSE
      m2back := '0';
    END IF;
    IF samples(107) = '0' THEN
      m3front := '1';
    ELSE
      m3front := '0';
    END IF;
    IF samples(99) = '0' THEN
      m3back := '1';
    ELSE
      m3back := '0';
    END IF;
    IF samples(91) = '0' THEN
      m4front := '1';
    ELSE
      m4front := '0';
    END IF;
    IF samples(83) = '1' THEN
      m4back := '1';
    ELSE
      m4back := '0';
    END IF;
    IF samples(75) = '1' THEN
      m5front := '1';
    ELSE
      m5front := '0';
    END IF;
    IF samples(67) = '1' THEN
      m5back := '1';
    ELSE
      m5back := '0';
    END IF;
    IF samples(59) = '0' THEN
      m6front := '1';
    ELSE
      m6front := '0';
    END IF;
    IF samples(51) = '0' THEN
      m6back := '1';
    ELSE
      m6back := '0';
    END IF;
    IF samples(43) = '0' THEN
      m7front := '1';
    ELSE
      m7front := '0';
    END IF;
    IF samples(35) = '1' THEN
      m7back := '1';
    ELSE
      m7back := '0';
    END IF;
    IF samples(27) = '0' THEN
      m8front := '1';
    ELSE
      m8front := '0';
    END IF;
    IF samples(19) = '1' THEN
      m8back := '1';
    ELSE
      m8back := '0';
    END IF;
    IF samples(11) = '0' THEN
      m9front := '1';
    ELSE
      m9front := '0';
    END IF;
    IF samples(3) = '1' THEN
      m9back := '1';
    ELSE
      m9back := '0';
    END IF;
    IF (((((((((((((((((m1front AND m2front) AND m3front) AND m4front) AND m5front) AND m6front) AND m7front) AND m8front) AND m9front) AND m1back) AND m2back) AND m3back) AND m4back) AND m5back) AND m6back) AND m7back) AND m8back) AND m9back) = '1' THEN
      master <= '1';
    ELSE
      master <= '0';
    END IF;
    IF clk_1 = '1' THEN
      FOR t_0 IN 0 TO 142 LOOP
        add_cast(t_0) := unsigned(to_signed(t_0, 32)(7 DOWNTO 0));
        samples_next(to_integer(1 + add_cast(t_0))) <= samples(t_0);
      END LOOP;
      samples_next(0) <= md;
    END IF;
  END PROCESS detectMainFrame_1_output;
END rtl;
