library verilog;
use verilog.vl_types.all;
entity append_3of6 is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        F               : out    vl_logic;
        G               : out    vl_logic;
        H               : out    vl_logic
    );
end append_3of6;
