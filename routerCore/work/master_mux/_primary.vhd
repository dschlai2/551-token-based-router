library verilog;
use verilog.vl_types.all;
entity master_mux is
    port(
        token           : in     vl_logic_vector(54 downto 0);
        nack            : in     vl_logic_vector(54 downto 0);
        ack             : in     vl_logic_vector(54 downto 0);
        \buffer\        : in     vl_logic_vector(54 downto 0);
        data            : in     vl_logic_vector(54 downto 0);
        TX_data_select  : in     vl_logic_vector(2 downto 0);
        \out\           : out    vl_logic_vector(54 downto 0)
    );
end master_mux;
