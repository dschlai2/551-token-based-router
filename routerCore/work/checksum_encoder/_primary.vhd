library verilog;
use verilog.vl_types.all;
entity checksum_encoder is
    generic(
        load            : integer := 24
    );
    port(
        payload         : in     vl_logic_vector(23 downto 0);
        \out\           : out    vl_logic_vector(27 downto 0)
    );
end checksum_encoder;
