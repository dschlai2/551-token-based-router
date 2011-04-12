library verilog;
use verilog.vl_types.all;
entity router_core is
    generic(
        ACK             : integer := 0
    );
    port(
        RX_Data         : in     vl_logic_vector(54 downto 0);
        Clk_R           : in     vl_logic;
        Rst_n           : in     vl_logic;
        RX_Data_Valid   : in     vl_logic;
        TX_Data_Ready   : in     vl_logic;
        Packet_From_Node_Valid: in     vl_logic;
        Packet_From_Node: in     vl_logic_vector(28 downto 0);
        Core_Load_Ack   : out    vl_logic;
        Packet_To_Node_Valid: out    vl_logic;
        RX_Data_Ready   : out    vl_logic;
        TX_Data_Valid   : out    vl_logic;
        TX_Data         : out    vl_logic_vector(54 downto 0);
        Packet_To_Node  : out    vl_logic_vector(23 downto 0)
    );
end router_core;
