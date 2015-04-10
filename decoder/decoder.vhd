library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity decoder is
    port(
            --24MHZ时钟信号
            clk:in std_logic;
            --异步清零:低电平有效
            rst:in std_logic;
            --帧信息的输入端
            md:in std_logic;
            --成功检测到帧头后，detectFrame发出的开始译码的信号
            start:in std_logic;
            --detectFrame发出的检测到主帧帧头,在start='1'时有效
            master:in std_logic;
            --detectFrame发出的检测到从帧帧头,在start='1'时有效
            slave:in std_logic;
            --merror:manchester code error
            merror:out std_logic;
            --cerror:check code error
            cerror:out std_logic;
            --帧长度错误
            lengtherror:out std_logic;
            --脉冲信号:‘1’表示主帧
            ismaster:out std_logic;
            --脉冲信号:‘1’表示从帧
            isslave:out std_logic;
            --vframe:valid frame,帧内容符合manchester编码
            vframe:out std_logic;
            --set ready='1' when one frame was recieved successfully and correctly.
            ready:out std_logic;
            --fifowrite:write fifo,given to recievebuffer
            fifowrite:out std_logic;
            --将帧信息传递给recievebuffer的数据线
            datas:out std_logic_vector(15 downto 0)
        );
end decoder;

architecture Arc_decoder of decoder is
    --store check code
    signal checkcode:std_logic_vector(7 downto 0):=(others=>'0');
    --store 16 bit data after decoding
    signal dataRegisters:std_logic_vector(15 downto 0):=(others=>'0');
    --masterframe:the symbol of master frame
    signal masterframe:std_logic:='0';
    --slaveframe:the symbol of slave frame
    signal slaveframe:std_logic:='0';
    --store 4 bits sampling value
    signal samples:std_logic_vector(3 downto 0):=(others=>'0');
    --the state of processing data
    signal prostate:std_logic_vector(1 downto 0):=(others=>'0');
    --add 1 per 16 bit
    signal total:std_logic_vector(2 downto 0):=(others=>'0');
    --the number of datas in dataRegsiters
    signal counter8:std_logic_vector(2 downto 0):=(others=>'0');
    --sample the value per 8 cycle
    signal sample8:std_logic_vector(2 downto 0):=(others=>'0');
    --the state of sampling data value
    signal state:std_logic_vector(2 downto 0):=(others=>'0');
    --标识符：标识校验码错误；‘1’表示有校验码错误，‘0’表示没有检验码错误
    signal cerrorflag:std_logic:='0';
    --溢出标识位：‘1’表示有溢出，‘0’表示没有溢出
    signal overflow:std_logic:='0';
    --cfl:帧长度计数器
    signal cfl:std_logic_vector(4 downto 0):=(others=>'0');
begin
    -------------------------------------------------------------------------------------------------
    --译码的状态机：完成manchester code译码，CRC检验，并把数据存入recievebuffer中
    --
    -------------------------------------------------------------------------------------------------
    p1:process(rst,clk)
    begin
        if rst='0' then
            checkcode<="00000000";
            dataRegisters<="0000000000000000";

            masterframe<='0';
            slaveframe<='0';
            samples<="0000";

            prostate<="00";
            total<="000";
            counter8<="000";
            sample8<="000";
            state<="000";

            merror<='0';
            cerror<='0';
            ismaster<='0';
            isslave<='0';
            ready<='0';
            fifowrite<='0';
            datas<="0000000000000000";

            cerrorflag<='0';
            cfl<="00000";
            overflow<='0';

            lengtherror<='0';
            vframe<='0';
        elsif clk'event and clk='1' then
            case state is
            --等待start='1',转入“001”状态开始manchester译码
                when "000"=>
                    if start='1' then
                        masterframe<=master;
                        slaveframe<=slave;
                        sample8<="100";
                        state<="001";
                    else
                        state<="000";
                        masterframe<='0';
                        slaveframe<='0';
                        sample8<="000";
                    end if;
                    checkcode<="00000000";
                    dataRegisters<="0000000000000000";
                    samples<="0000";
                    total<="000";
                    counter8<="000";

                    merror<='0';
                    cerror<='0';
                    ismaster<='0';
                    isslave<='0';
                    ready<='0';
                    fifowrite<='0';
                    datas<="0000000000000000";
                    prostate<="00";

                    cerrorflag<='0';
                    cfl<="00000";
                    overflow<='0';

                    lengtherror<='0';
                    vframe<='0';
            --8次采样后，转入“010”状态
                when "001"=>
                    if sample8="111" then
                        samples<=samples(2 downto 0) & md;
                        sample8<="000";
                        state<="010";
                    else
                        sample8<=sample8+1;
                        state<="001";
                    end if;
                    merror<='0';
                    cerror<='0';
                    ismaster<='0';
                    isslave<='0';
                    ready<='0';
                    fifowrite<='0';
                    datas<="0000000000000000";
                    prostate<="00";

                    lengtherror<='0';
                    vframe<='0';
            --8次采样后，转入"011"状态
                when "010"=>
                    if sample8="111" then
                        samples<=samples(2 downto 0) & md;
                        sample8<="000";
                        state<="011";
                    else
                        sample8<=sample8+1;
                        state<="010";
                    end if;
                    merror<='0';
                    cerror<='0';
                    ismaster<='0';
                    isslave<='0';
                    ready<='0';
                    fifowrite<='0';
                    datas<="0000000000000000";
                    prostate<="00";

                    lengtherror<='0';
                    vframe<='0';
            --8次采样后，转入“100”状态
                when "011"=>
                    if sample8="111" then
                        samples<=samples(2 downto 0) & md;
                        sample8<="000";
                        state<="100";
                    else
                        sample8<=sample8+1;
                        state<="011";
                    end if;
                    merror<='0';
                    cerror<='0';
                    ismaster<='0';
                    isslave<='0';
                    ready<='0';
                    fifowrite<='0';
                    datas<="0000000000000000";
                    prostate<="00";

                    lengtherror<='0';
                    vframe<='0';
            --8次采样后转入“101”状态
                when "100"=>
                    if sample8="111" then
                        samples<=samples(2 downto 0) & md;
                        sample8<="000";
                        state<="101";
                    else
                        sample8<=sample8+1;
                        state<="100";
                    end if;
                    merror<='0';
                    cerror<='0';
                    ismaster<='0';
                    isslave<='0';
                    ready<='0';
                    fifowrite<='0';
                    datas<="0000000000000000";
                    prostate<="00";

                    lengtherror<='0';
                    vframe<='0';
            --decode manchester code
                when "101"=>
                    sample8<=sample8+1;
                    case  prostate is
                        when "00"=>
                            case samples is
                            --shift “00” bits into dataregisters
                                when "0101" =>
                                    dataRegisters<=dataRegisters(13 downto 0) & "00";
                                    -- 产生了2位数据后，转到01
                                    prostate<="01";
                                    state<="101";
                                    if counter8="111" then
                                        counter8<="000";
                                    else
                                        counter8<=counter8+1;
                                    end if;
                                    merror<='0';
                                    cerror<='0';
                                    ismaster<='0';
                                    isslave<='0';
                                    ready<='0';

                                    lengtherror<='0';
                                    vframe<='0';
                            --shift "01" bits into dataregisters
                                when "0110"=>
                                    dataRegisters<=dataRegisters(13 downto 0) & "01";
                                    prostate<="01";
                                    state<="101";
                                    if counter8="111" then
                                        counter8<="000";
                                    else
                                        counter8<=counter8+1;
                                    end if;
                                    merror<='0';
                                    cerror<='0';
                                    ismaster<='0';
                                    isslave<='0';
                                    ready<='0';

                                    lengtherror<='0';
                                    vframe<='0';
                            --shift "10" bits into dataregisters
                                when "1001"=>
                                    dataRegisters<=dataRegisters(13 downto 0) & "10";
                                    prostate<="01";
                                    state<="101";
                                    if counter8="111" then
                                        counter8<="000";
                                    else
                                        counter8<=counter8+1;
                                    end if;
                                    merror<='0';
                                    cerror<='0';
                                    ismaster<='0';
                                    isslave<='0';
                                    ready<='0';

                                    lengtherror<='0';
                                    vframe<='0';
                            --shift "11" bits into dataregisters
                                when "1010"=>
                                    dataRegisters<=dataRegisters(13 downto 0) & "11";
                                    prostate<="01";
                                    state<="101";
                                    if counter8="111" then
                                        counter8<="000";
                                    else
                                        counter8<=counter8+1;
                                    end if;
                                    merror<='0';
                                    cerror<='0';
                                    ismaster<='0';
                                    isslave<='0';
                                    ready<='0';

                                    lengtherror<='0';
                                    vframe<='0';
                            --遇到结束或者发生manchester编码错误
                                when "0011"|"0010"|"0001"|"0000"=>
                                    -- 已经接收了4*4=16位之后进行CRC校验
                                    if counter8="100" then
                                        if (checkcode(7 downto 1) xor dataRegisters(7 downto 1))="1111111" and
                                        (checkcode(0) xor checkcode(7) xor checkcode(6) xor checkcode(5) xor checkcode(4) xor checkcode(3) xor checkcode(2) xor checkcode(1) xor dataRegisters(0))='1' then --校验码正确
                                        --没有校验码错误，溢出错误且帧长度正确
                                            if cerrorflag='0' and overflow='0' and (cfl="00001" or cfl="00010" or cfl="00100" or cfl="01000" or cfl="10000") then
                                                ready<='1';
                                            else
                                                ready<='0';
                                            end if;
                                        --没有校验码错误
                                        if cerrorflag='0' then
                                            cerror<='0';
                                        --否则，有校验码错误
                                        else
                                            cerror<='1';
                                        end if;
                                        checkcode<="00000000";
                                    else
                                        cerror<='1';
                                        ready<='0';
                                        merror<='0';
                                    end if;
                                    --没有长度错误
                                    if overflow='0' and (cfl="00001" or cfl="00010" or cfl="00100" or cfl="01000" or cfl="10000") then
                                        lengtherror<='0';
                                    else
                                        lengtherror<='1';
                                    end if;
                                    merror<='0';
                                    ismaster<=masterframe;
                                    isslave<=slaveframe;
                                    vframe<='1';
                                    else
                                        merror<='1';
                                        cerror<='0';
                                        ready<='0';
                                        ismaster<=masterframe;
                                        isslave<=slaveframe;

                                        lengtherror<='0';
                                        vframe<='0';
                                    end if;
                                    prostate<="00";
                                    state<="000";
                            --manchester 编码错误
                                when others=>
                                    merror<='1';
                                    cerror<='0';
                                    ismaster<=masterframe;
                                    isslave<=slaveframe;
                                    ready<='0';
                                    prostate<="00";
                                    state<="000";
                                    lengtherror<='0';
                                    vframe<='0';
                            end case;
                            fifowrite<='0';
                            datas<="0000000000000000";
                        when "01"=>
                            --dataRegisters 已经存满16位
                            if counter8="000" then
                                 --it has stored 64  bit into fifo(recievebuffer)
                                if total="100" then
                                    total<="000";
                                     --check code error
                                    if not((checkcode(7 downto 1) xor dataRegisters(15 downto 9))="1111111" and
                                    (checkcode(0) xor checkcode(7) xor checkcode(6) xor checkcode(5) xor checkcode(4) xor checkcode(3) xor checkcode(2) xor checkcode(1) xor dataRegisters(8))='1') then
                                        cerrorflag<='1';
                                    end if;
                                    dataRegisters<="00000000" & dataRegisters(7 downto 0);
                                    counter8<="100";
                                    state<="001";
                                    prostate<="00";
                                    checkcode<="00000000";
                                    ismaster<='0';
                                    isslave<='0';
                                    fifowrite<='0';
                                    datas<="0000000000000000";
                                else
                                     --store another 16 bits into fifo
                                    total<=total+1;
                                     --store datas
                                    fifowrite<='1';
                                     --溢出标识位置位
                                    if cfl="10000" then
                                        overflow<='1';
                                    else
                                        cfl<=cfl+1;
                                    end if;
                                    datas<=dataRegisters;
                                     --check code
                                    checkcode(0) <= dataRegisters(15) xor dataRegisters(14) xor dataRegisters(13) xor dataRegisters(12) xor dataRegisters(11) xor dataRegisters(10) xor dataRegisters(9) xor dataRegisters(8) xor dataRegisters(7)
                                                    xor dataRegisters(6) xor dataRegisters(5) xor dataRegisters(4) xor dataRegisters(3) xor dataRegisters(2) xor dataRegisters(1) xor dataRegisters(0) xor checkcode(0);
                                    checkcode(1) <= dataRegisters(15) xor dataRegisters(13) xor dataRegisters(7) xor dataRegisters(6) xor dataRegisters(5) xor dataRegisters(4) xor dataRegisters(3) xor dataRegisters(1) xor dataRegisters(0) xor checkcode(5) xor checkcode(7);
                                    checkcode(2) <= dataRegisters(14) xor dataRegisters(8) xor dataRegisters(7) xor dataRegisters(6) xor dataRegisters(5) xor dataRegisters(4) xor dataRegisters(2) xor dataRegisters(1) xor checkcode(6);
                                    checkcode(3) <= dataRegisters(13) xor dataRegisters(9) xor dataRegisters(8) xor dataRegisters(4) xor dataRegisters(2) xor dataRegisters(1) xor dataRegisters(0) xor checkcode(1) xor checkcode(5);
                                    checkcode(4) <= dataRegisters(14) xor dataRegisters(10) xor dataRegisters(9) xor dataRegisters(5) xor dataRegisters(3) xor dataRegisters(2) xor dataRegisters(1) xor checkcode(1) xor checkcode(2) xor checkcode(6);
                                    checkcode(5) <= dataRegisters(15) xor dataRegisters(11) xor dataRegisters(10) xor dataRegisters(6) xor dataRegisters(4) xor dataRegisters(3) xor dataRegisters(2) xor checkcode(2) xor checkcode(3) xor checkcode(7);
                                    checkcode(6) <= dataRegisters(15) xor dataRegisters(13) xor dataRegisters(12) xor dataRegisters(11) xor dataRegisters(6) xor dataRegisters(1) xor dataRegisters(0) xor checkcode(3) xor checkcode(4) xor checkcode(5) xor checkcode(7);
                                    checkcode(7) <= dataRegisters(15) xor dataRegisters(14) xor dataRegisters(12) xor dataRegisters(6) xor dataRegisters(5) xor dataRegisters(4) xor dataRegisters(3) xor dataRegisters(2) xor dataRegisters(0) xor checkcode(4) xor checkcode(6) xor checkcode(7);
                                    prostate<="00";
                                    state<="001";

                                    ismaster<='0';
                                    isslave<='0';
                                end if;
                            --未满16位，则继续回到“001”态继续采样译码
                            else
                                state<="001";
                                prostate<="00";
                                fifowrite<='0';
                                datas<="0000000000000000";

                                ismaster<='0';
                                isslave<='0';
                            end if;
                            merror<='0';
                            cerror<='0';
                            ready<='0';

                            lengtherror<='0';
                            vframe<='0';
                 --其他状态，回到初始态，寄存器置位为初始值
                        when others=>
                            merror<='0';
                            cerror<='0';
                            ismaster<='0';
                            isslave<='0';
                            ready<='0';
                            fifowrite<='0';
                            datas<="0000000000000000";
                            prostate<="00";
                            state<="000";
                            lengtherror<='0';
                            vframe<='0';
                    end case;
 --其他状态，回到初始态，寄存器置位为初始值
                when others=>
                    checkcode<="00000000";
                    dataRegisters<="0000000000000000";

                    masterframe<='0';
                    slaveframe<='0';
                    samples<="0000";

                    prostate<="00";
                    total<="000";
                    counter8<="000";
                    sample8<="000";
                    state<="000";

                    merror<='0';
                    cerror<='0';
                    ismaster<='0';
                    isslave<='0';
                    ready<='0';
                    fifowrite<='0';
                    datas<="0000000000000000";

                    lengtherror<='0';
                    vframe<='0';

                    cerrorflag<='0';
                    cfl<="00000";
                    overflow<='0';
            end case;
    end if;
end process p1;
end Arc_decoder;
