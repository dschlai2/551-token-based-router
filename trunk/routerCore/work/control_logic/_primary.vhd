library verilog;
use verilog.vl_types.all;
entity control_logic is
    generic(
        TOKEN           : integer := 7;
        ACK             : integer := 0;
        NACK            : integer := 3;
        DATA_C          : integer := 2;
        DATA_3          : integer := 1;
        OUR_ADDRESS     : integer := 1;
        tx_ACK          : integer := 0;
        tx_NACK         : integer := 1;
        tx_FORWARD      : integer := 2;
        tx_TOKEN        : integer := 3;
        tx_NEW          : integer := 4;
        ERR_STATE       : integer := 0;
        CHECK_IF_MASTER : integer := 1;
        SEND_TOKEN      : integer := 2;
        CHECK_NODE      : integer := 3;
        ENCODE          : integer := 4;
        SEND_TX         : integer := 5;
        LISTEN_WITH_TOKEN: integer := 6;
        LISTEN_NO_TOKEN : integer := 7;
        FORWARD         : integer := 8;
        CHECK_ADDRESS   : integer := 9;
        SEND_NODE       : integer := 10;
        SEND_NACK       : integer := 11
    );
    port(
        Clk_R           : in     vl_logic;
        Rst_n           : in     vl_logic;
        rx_has_data     : in     vl_logic;
        address         : in     vl_logic_vector(3 downto 0);
        bad_decode      : in     vl_logic;
        data_type       : in     vl_logic_vector(2 downto 0);
        Packet_To_Node_Valid: out    vl_logic;
        Core_Load_Ack   : out    vl_logic;
        Packet_From_Node_Valid: in     vl_logic;
        buffer_select   : out    vl_logic;
        tx_data_select  : out    vl_logic_vector(2 downto 0);
        rc_ready        : out    vl_logic;
        tx_ready        : in     vl_logic;
        rc_has_data     : out    vl_logic
    );
end control_logic;
