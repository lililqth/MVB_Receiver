library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity decoder is
    port(
            --24MHZʱ���ź�
            clk:in std_logic;
            --�첽����:�͵�ƽ��Ч
            rst:in std_logic;
            --֡��Ϣ�������
            md:in std_logic;
            --�ɹ���⵽֡ͷ��detectFrame�����Ŀ�ʼ������ź�
            start:in std_logic;
            --detectFrame�����ļ�⵽��֡֡ͷ,��start='1'ʱ��Ч
            master:in std_logic;
            --detectFrame�����ļ�⵽��֡֡ͷ,��start='1'ʱ��Ч
            slave:in std_logic;
            --merror:manchester code error
            merror:out std_logic;
            --cerror:check code error
            cerror:out std_logic;
            --֡���ȴ���
            lengtherror:out std_logic;
            --�����ź�:��1����ʾ��֡
            ismaster:out std_logic;
            --�����ź�:��1����ʾ��֡
            isslave:out std_logic;
            --vframe:valid frame,֡���ݷ���manchester����
            vframe:out std_logic;
            --set ready='1' when one frame was recieved successfully and correctly.
            ready:out std_logic;
            --fifowrite:write fifo,given to recievebuffer
            fifowrite:out std_logic;
            --��֡��Ϣ���ݸ�recievebuffer��������
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
    --��ʶ������ʶУ������󣻡�1����ʾ��У������󣬡�0����ʾû�м��������
    signal cerrorflag:std_logic:='0';
    --�����ʶλ����1����ʾ���������0����ʾû�����
    signal overflow:std_logic:='0';
    --cfl:֡���ȼ�����
    signal cfl:std_logic_vector(4 downto 0):=(others=>'0');
begin
    -------------------------------------------------------------------------------------------------
    --�����״̬�������manchester code���룬CRC���飬�������ݴ���recievebuffer��
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
            --�ȴ�start='1',ת�롰001��״̬��ʼmanchester����
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
            --8�β�����ת�롰010��״̬
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
            --8�β�����ת��"011"״̬
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
            --8�β�����ת�롰100��״̬
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
            --8�β�����ת�롰101��״̬
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
                            --shift ��00�� bits into dataregisters
                                when "0101" =>
                                    dataRegisters<=dataRegisters(13 downto 0) & "00";
                                    -- ������2λ���ݺ�ת��01
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
                            --�����������߷���manchester�������
                                when "0011"|"0010"|"0001"|"0000"=>
                                    -- �Ѿ�������4*4=16λ֮�����CRCУ��
                                    if counter8="100" then
                                        if (checkcode(7 downto 1) xor dataRegisters(7 downto 1))="1111111" and
                                        (checkcode(0) xor checkcode(7) xor checkcode(6) xor checkcode(5) xor checkcode(4) xor checkcode(3) xor checkcode(2) xor checkcode(1) xor dataRegisters(0))='1' then --У������ȷ
                                        --û��У����������������֡������ȷ
                                            if cerrorflag='0' and overflow='0' and (cfl="00001" or cfl="00010" or cfl="00100" or cfl="01000" or cfl="10000") then
                                                ready<='1';
                                            else
                                                ready<='0';
                                            end if;
                                        --û��У�������
                                        if cerrorflag='0' then
                                            cerror<='0';
                                        --������У�������
                                        else
                                            cerror<='1';
                                        end if;
                                        checkcode<="00000000";
                                    else
                                        cerror<='1';
                                        ready<='0';
                                        merror<='0';
                                    end if;
                                    --û�г��ȴ���
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
                            --manchester �������
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
                            --dataRegisters �Ѿ�����16λ
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
                                     --�����ʶλ��λ
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
                            --δ��16λ��������ص���001��̬������������
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
                 --����״̬���ص���ʼ̬���Ĵ�����λΪ��ʼֵ
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
 --����״̬���ص���ʼ̬���Ĵ�����λΪ��ʼֵ
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
