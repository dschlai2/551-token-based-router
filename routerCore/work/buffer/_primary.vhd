library verilog;
use verilog.vl_types.all;
entity \buffer\ is
    port(
        new_value       : in     vl_logic_vector(54 downto 0);
        buffer_select   : in     vl_logic;
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        \out\           : out    vl_logic_vector(54 downto 0)
    );
end \buffer\;
