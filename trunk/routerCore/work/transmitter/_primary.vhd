library verilog;
use verilog.vl_types.all;
entity transmitter is
    generic(
        RST             : integer := 0;
        RDY             : integer := 1;
        TRANSMIT        : integer := 2
    );
    port(
        TX_Data         : in     vl_logic_vector(54 downto 0);
        TX_Data_Valid   : in     vl_logic;
        Clk_S           : in     vl_logic;
        Rst_n           : in     vl_logic;
        TX_Ready        : out    vl_logic;
        S_Data          : out    vl_logic
    );
end transmitter;
