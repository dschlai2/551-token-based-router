library verilog;
use verilog.vl_types.all;
entity rx_handshake is
    generic(
        RST             : integer := 0;
        \WAIT\          : integer := 1;
        TRANSFER        : integer := 3;
        HOLD            : integer := 2
    );
    port(
        RX_Data_Ready   : out    vl_logic;
        RX_Data_Valid   : in     vl_logic;
        rc_ready        : in     vl_logic;
        rx_has_data     : out    vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic
    );
end rx_handshake;
