library verilog;
use verilog.vl_types.all;
entity tx_handshake is
    generic(
        RST             : integer := 0;
        \WAIT\          : integer := 1;
        TRANSFER        : integer := 2;
        ERR             : integer := 3
    );
    port(
        tx_ready        : out    vl_logic;
        rc_has_data     : in     vl_logic;
        TX_Data_Valid   : out    vl_logic;
        TX_Data_Ready   : in     vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic
    );
end tx_handshake;
