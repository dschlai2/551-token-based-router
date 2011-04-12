library verilog;
use verilog.vl_types.all;
entity receive_protocol is
    generic(
        \WAIT\          : integer := 1;
        READ            : integer := 2;
        DONE            : integer := 4
    );
    port(
        S_Data          : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        packet          : out    vl_logic_vector(54 downto 0);
        ready           : out    vl_logic
    );
end receive_protocol;
