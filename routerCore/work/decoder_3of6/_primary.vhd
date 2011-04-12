library verilog;
use verilog.vl_types.all;
entity decoder_3of6 is
    port(
        encoded         : in     vl_logic_vector(47 downto 0);
        payload         : out    vl_logic_vector(23 downto 0);
        error_3of6      : out    vl_logic
    );
end decoder_3of6;
