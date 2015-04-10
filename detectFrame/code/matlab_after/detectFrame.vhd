LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
ENTITY detectMF IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        md                                :   IN    std_logic;
        clk_1                             :   IN    std_logic;
        master                            :   OUT   std_logic;
        slave                             :   OUT   std_logic
        );
END detectMF;
ARCHITECTURE rtl OF detectMF IS
  SIGNAL samples                          : std_logic_vector(143 DOWNTO 143);  -- boolean [144]
  SIGNAL b_samples                        : std_logic_vector(0 DOWNTO 143);  -- boolean [144]
  SIGNAL samples_next                     : std_logic_vector(0 DOWNTO 143);  -- boolean [144]
  SIGNAL b_samples_next                   : std_logic_vector(0 DOWNTO 143);  -- boolean [144]
BEGIN
  detectMF_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      samples <= (OTHERS => '0');
      b_samples <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      samples <= samples_next;
      b_samples <= b_samples_next;
    END IF;
  END PROCESS detectMF_1_process;
  detectMF_1_output : PROCESS (md, clk_1, samples, b_samples)
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
  BEGIN
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
    IF rising_edge(clk_1) THEN
      samples_next <= samples_next(142 downto 0) & md;
    END IF;
    IF ((((((((((((((((((b_samples(136) = '1') AND (b_samples(137) = '1')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '1')) AND (b_samples(143) = '1')) OR ((((((((b_samples(136) = '1') AND (b_samples(137) = '0')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '1')) AND (b_samples(143) = '1'))) OR ((((((((b_samples(136) = '1') AND (b_samples(137) = '1')) AND (b_samples(138) = '0')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '1')) AND (b_samples(143) = '1'))) OR ((((((((b_samples(136) = '1') AND (b_samples(137) = '1')) AND (b_samples(138) = '1')) AND (b_samples(139) = '0')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '1')) AND (b_samples(143) = '1'))) OR ((((((((b_samples(136) = '1') AND (b_samples(137) = '1')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '0')) AND (b_samples(141) = '1')) AND (b_samples(142) = '1')) AND (b_samples(143) = '1'))) OR ((((((((b_samples(136) = '1') AND (b_samples(137) = '1')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '0')) AND (b_samples(142) = '1')) AND (b_samples(143) = '1'))) OR ((((((((b_samples(136) = '1') AND (b_samples(137) = '1')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '0')) AND (b_samples(143) = '1'))) OR ((((((((b_samples(136) = '1') AND (b_samples(137) = '1')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '1')) AND (b_samples(143) = '0'))) OR ((((((((b_samples(136) = '1') AND (b_samples(137) = '1')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '0')) AND (b_samples(143) = '0'))) OR ((((((((b_samples(136) = '0') AND (b_samples(137) = '0')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '1')) AND (b_samples(143) = '1'))) OR ((((((((b_samples(136) = '0') AND (b_samples(137) = '1')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '1')) AND (b_samples(143) = '0'))) OR ((((((((b_samples(136) = '0') AND (b_samples(137) = '0')) AND (b_samples(138) = '1')) AND (b_samples(139) = '1')) AND (b_samples(140) = '1')) AND (b_samples(141) = '1')) AND (b_samples(142) = '0')) AND (b_samples(143) = '0')) THEN
      s1front := '1';
    ELSE
      s1front := '0';
    END IF;
    IF (((((((((((((((((((b_samples(128) = '0') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '0')) OR ((((((((b_samples(128) = '0') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '1'))) OR ((((((((b_samples(128) = '0') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '1')) AND (b_samples(135) = '0'))) OR ((((((((b_samples(128) = '0') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '1')) AND (b_samples(134) = '0')) AND (b_samples(135) = '0'))) OR ((((((((b_samples(128) = '0') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '1')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '0'))) OR ((((((((b_samples(128) = '0') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '1')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '0'))) OR ((((((((b_samples(128) = '0') AND (b_samples(129) = '0')) AND (b_samples(130) = '1')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '0'))) OR ((((((((b_samples(128) = '0') AND (b_samples(129) = '1')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '0'))) OR ((((((((b_samples(128) = '1') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '0'))) OR ((((((((b_samples(128) = '1') AND (b_samples(129) = '1')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '0'))) OR ((((((((b_samples(128) = '0') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '1')) AND (b_samples(135) = '1'))) OR ((((((((b_samples(128) = '1') AND (b_samples(129) = '0')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '0')) AND (b_samples(135) = '1'))) OR ((((((((b_samples(128) = '1') AND (b_samples(129) = '1')) AND (b_samples(130) = '0')) AND (b_samples(131) = '0')) AND (b_samples(132) = '0')) AND (b_samples(133) = '0')) AND (b_samples(134) = '1')) AND (b_samples(135) = '1')) THEN
      s1back := '1';
    ELSE
      s1back := '0';
    END IF;
    IF b_samples(123) = '1' THEN
      s2front := '1';
    ELSE
      s2front := '0';
    END IF;
    IF b_samples(115) = '0' THEN
      s2back := '1';
    ELSE
      s2back := '0';
    END IF;
    IF b_samples(107) = '1' THEN
      s3front := '1';
    ELSE
      s3front := '0';
    END IF;
    IF b_samples(99) = '0' THEN
      s3back := '1';
    ELSE
      s3back := '0';
    END IF;
    IF b_samples(91) = '1' THEN
      s4front := '1';
    ELSE
      s4front := '0';
    END IF;
    IF b_samples(83) = '0' THEN
      s4back := '1';
    ELSE
      s4back := '0';
    END IF;
    IF b_samples(75) = '0' THEN
      s5front := '1';
    ELSE
      s5front := '0';
    END IF;
    IF b_samples(67) = '0' THEN
      s5back := '1';
    ELSE
      s5back := '0';
    END IF;
    IF b_samples(59) = '1' THEN
      s6front := '1';
    ELSE
      s6front := '0';
    END IF;
    IF b_samples(51) = '1' THEN
      s6back := '1';
    ELSE
      s6back := '0';
    END IF;
    IF b_samples(43) = '1' THEN
      s7front := '1';
    ELSE
      s7front := '0';
    END IF;
    IF b_samples(35) = '0' THEN
      s7back := '1';
    ELSE
      s7back := '0';
    END IF;
    IF b_samples(27) = '0' THEN
      s8front := '1';
    ELSE
      s8front := '0';
    END IF;
    IF b_samples(19) = '0' THEN
      s8back := '1';
    ELSE
      s8back := '0';
    END IF;
    IF b_samples(11) = '1' THEN
      s9front := '1';
    ELSE
      s9front := '0';
    END IF;
    IF b_samples(3) = '1' THEN
      s9back := '1';
    ELSE
      s9back := '0';
    END IF;
    IF (((((((((((((((((s1front AND s2front) AND s3front) AND s4front) AND s5front) AND s6front) AND s7front) AND s8front) AND s9front) AND s1back) AND s2back) AND s3back) AND s4back) AND s5back) AND s6back) AND s7back) AND s8back) AND s9back) = '1' THEN
      slave <= '1';
    ELSE
      slave <= '0';
    END IF;
    IF rising_edge(clk_1) THEN
      b_samples_next = b_samples_next(142 downto 0) & md;
    END IF;
  END PROCESS detectMF_1_output;
END rtl;
