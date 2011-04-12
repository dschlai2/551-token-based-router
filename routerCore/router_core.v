module router_core(input [54:0] RX_Data,
		input Clk_R, Rst_n,
		input RX_Data_Valid, TX_Data_Ready, Packet_From_Node_Valid,
		input [28:0] Packet_From_Node,
		output Core_Load_Ack, Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid,
		output [54:0] TX_Data,
		output [23:0] Packet_To_Node);


wire bad_decode, buffer_select, rx_has_data, rc_ready, tx_ready, rc_has_data
wire[3:0] address;
wire[2:0] data_type, tx_data_select
wire[54:0] enc_to_buf, buf_to_forward




rx_handshake rHandshake(.rc_ready(rc_ready),
			.rx_has_data(rx_has_data),
			.RX_Data_Ready(RX_Data_Ready),
			.RX_Data_Valid(RX_Data_Valid),
			.clk(Clk_R),
			.rst_n(Rst_n));

tx_handshake tHandshake(.tx_ready(tx_ready),
			.rc_has_data(rc_has_data),
			.TX_Data_Valid(TX_Data_Valid),
			.TX_Data_Ready(TX_Data_Ready),
			.clk(Clk_R),
			.rst_n(Rst_n));

decode_logic dec_logic(.RX_Data(RX_Data),
			.addr(address),
			.Packet_To_Node(Packet_To_Node),
			.bad_decode(bad_decode),
			.type(data_type));

encode_logic enc_logic(.Packet_From_Node(Packet_From_Node),
			.packet(enc_to_buf));

buffer ever_versetile(.new_value(enc_to_buf),
			.buffer_select(buffer_select),
			.clk(Clk_R),
			.rst(Rst_n),
			.out(buf_to_forward));

control control_logic
