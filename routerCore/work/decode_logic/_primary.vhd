library verilog;
use verilog.vl_types.all;
entity decode_logic is
    port(
        RX_Data         : in     vl_logic_vector(54 downto 0);
        addr            : out    vl_logic_vector(3 downto 0);
        Packet_To_Node  : out    vl_logic_vector(23 downto 0);
        bad_decode      : out    vl_logic;
        \type\          : out    vl_logic_vector(2 downto 0)
    );
end decode_logic;
