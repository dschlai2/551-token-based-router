library verilog;
use verilog.vl_types.all;
entity six_bit_checker is
    port(
        \in\            : in     vl_logic_vector(5 downto 0);
        error           : out    vl_logic
    );
end six_bit_checker;
