library verilog;
use verilog.vl_types.all;
entity trans_protocol is
    generic(
        sz_START_SEQ    : integer := 6;
        sz_DATA         : integer := 55;
        START_SEQ       : integer := 31;
        \START\         : integer := 0;
        S_SEQ           : integer := 1;
        TRANSMIT        : integer := 4;
        DONE            : integer := 5;
        \WAIT\          : integer := 6
    );
    port(
        TX_Data         : in     vl_logic_vector(54 downto 0);
        start           : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        ready           : out    vl_logic;
        S_Data          : out    vl_logic
    );
end trans_protocol;
