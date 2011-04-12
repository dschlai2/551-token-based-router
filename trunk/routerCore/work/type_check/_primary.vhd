library verilog;
use verilog.vl_types.all;
entity type_check is
    port(
        \type\          : in     vl_logic_vector(2 downto 0);
        token           : out    vl_logic;
        ack             : out    vl_logic;
        nack            : out    vl_logic;
        check           : out    vl_logic;
        three           : out    vl_logic
    );
end type_check;
