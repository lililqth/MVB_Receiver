LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE IEEE.std_logic_unsigned.ALL;
ENTITY recieveBuffer IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        fifowrite                         :   IN    std_logic;
        fiforead                          :   IN    std_logic;
        start                             :   IN    std_logic;
        datasin                           :   IN    std_logic_vector(0 TO 15);  -- boolean [16]
        clk_1                             :   IN    std_logic;
        valid                             :   OUT   std_logic;
        datasout                          :   OUT   std_logic_vector(0 TO 15);  -- boolean [16]
        finished                          :   OUT   std_logic
        );
END recieveBuffer;
ARCHITECTURE rtl OF recieveBuffer IS
  SIGNAL head                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL tail                             : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL fifo                             : std_logic_vector(0 TO 255);  -- boolean [256]
  SIGNAL head_next                        : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL tail_next                        : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL fifo_next                        : std_logic_vector(0 TO 255);  -- boolean [256]
BEGIN
  recieveBuffer_1_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '0' THEN
      head <= to_unsigned(16#00#, 8);
      tail <= to_unsigned(16#00#, 8);
      fifo <= (OTHERS => '0');
    ELSIF rising_edge(clk) THEN
      head <= head_next;
      tail <= tail_next;
      fifo <= fifo_next;
    END IF;
  END PROCESS recieveBuffer_1_process;
  recieveBuffer_1_output : PROCESS (clk_1)
    VARIABLE zero : std_logic_vector(0 TO 15);
    VARIABLE add_temp : unsigned(8 DOWNTO 0);
    VARIABLE add_temp_0 : unsigned(8 DOWNTO 0);
  BEGIN
    zero := (OTHERS => '0');
    valid <= '0';
    finished <= '0';
    IF clk_1='1' THEN
        head_next <= head;
        tail_next <= tail;
        fifo_next <= fifo;
        datasout <= zero;

      IF start = '1' THEN
        tail_next <= to_unsigned(16#00#, 8);
        head_next <= to_unsigned(16#00#, 8);
        valid <= '0';
        finished <= '0';
        datasout <= zero;
      ELSE
        IF fifowrite = '1' THEN
          IF tail = to_unsigned(16#10#, 8) THEN
            tail_next <= to_unsigned(16#00#, 8);
          ELSE
            FOR t_1 IN 0 TO 15 LOOP
              fifo_next(to_integer(to_unsigned(t_1, 13) + resize(to_unsigned(16#10#, 8) * tail, 13))) <= datasin(t_1);
            END LOOP;
            add_temp := resize(tail, 9) + to_unsigned(16#001#, 9);
            IF add_temp(8) /= '0' THEN
             tail_next <= "11111111";
            ELSE
             tail_next <= add_temp(7 DOWNTO 0);
            END IF;
          END IF;
          valid <= '0';
          finished <= '0';
          datasout <= zero;
        ELSIF fiforead = '1' THEN
          IF head = tail THEN
            head_next <= to_unsigned(0, 8);
            tail_next <= to_unsigned(0, 8);
            finished <= '1';
            valid <= '0';
            datasout <= zero;
          ELSE
            finished <= '0';
            valid <= '1';
            FOR t_0 IN 0 TO 15 LOOP
              datasout(t_0) <= fifo(to_integer(to_unsigned(t_0, 13) + resize(to_unsigned(16#10#, 8) * head, 13)));
            END LOOP;
            head_next <= head + 1;
          END IF;
        ELSE
          valid <= '0';
          finished <= '0';
          datasout <= zero;
        END IF;
      END IF;
    END IF;
  END PROCESS recieveBuffer_1_output;
END rtl;