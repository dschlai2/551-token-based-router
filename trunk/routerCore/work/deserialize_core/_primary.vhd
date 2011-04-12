library verilog;
use verilog.vl_types.all;
entity deserialize_core is
    port(
        Packet_From_Node: in     vl_logic_vector(28 downto 0);
        encode_type     : out    vl_logic;
        addr            : out    vl_logic_vector(3 downto 0);
        payload         : out    vl_logic_vector(23 downto 0)
    );
end deserialize_core;
