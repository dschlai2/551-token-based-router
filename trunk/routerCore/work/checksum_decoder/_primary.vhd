library verilog;
use verilog.vl_types.all;
entity checksum_decoder is
    port(
        encoded         : in     vl_logic_vector(27 downto 0);
        checksum_err    : out    vl_logic;
        payload         : out    vl_logic_vector(23 downto 0)
    );
end checksum_decoder;
