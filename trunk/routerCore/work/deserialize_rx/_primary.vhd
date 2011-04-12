library verilog;
use verilog.vl_types.all;
entity deserialize_rx is
    port(
        rx_side         : in     vl_logic_vector(54 downto 0);
        raw_data        : out    vl_logic_vector(47 downto 0);
        \type\          : out    vl_logic_vector(2 downto 0);
        addr            : out    vl_logic_vector(3 downto 0)
    );
end deserialize_rx;
