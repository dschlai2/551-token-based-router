library verilog;
use verilog.vl_types.all;
entity three_of_six_encoder is
    port(
        payload         : in     vl_logic_vector(23 downto 0);
        \out\           : out    vl_logic_vector(47 downto 0)
    );
end three_of_six_encoder;
