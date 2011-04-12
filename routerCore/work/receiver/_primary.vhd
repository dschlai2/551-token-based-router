library verilog;
use verilog.vl_types.all;
entity receiver is
    generic(
        receiveSignal   : integer := 0;
        readyTT         : integer := 1;
        transmit        : integer := 3
    );
    port(
        RX_Ready        : in     vl_logic;
        Clk_S           : in     vl_logic;
        Rst_n           : in     vl_logic;
        S_Data          : in     vl_logic;
        RX_Data_Valid   : out    vl_logic;
        RX_Data         : out    vl_logic_vector(54 downto 0)
    );
end receiver;
