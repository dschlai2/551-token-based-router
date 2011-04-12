library verilog;
use verilog.vl_types.all;
entity encode_logic is
    port(
        Packet_From_Node: in     vl_logic_vector(28 downto 0);
        packet          : out    vl_logic_vector(54 downto 0)
    );
end encode_logic;
