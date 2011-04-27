module receive_protocol(input S_Data, clk, rst, 
    output reg [54:0] packet,
    output reg 	      ready);


reg [2:0] 	      state, next_state;
reg 	  next_in;
reg [5:0] start_seq, next_start_seq;
reg [6:0] next_counter, counter;
reg [54:0] next_packet;

parameter WAIT = 3'b001, READ = 3'b010 , DONE = 3'b100;

always@(posedge clk, negedge rst) begin
	if(!rst) begin
	   state <= WAIT;
	   start_seq <= 6'b111111;
	   counter <= 7'd54;
	   packet <= 55'b0;
	end
	else begin
	   state <= next_state;
	   counter <= next_counter;
	   start_seq <= next_start_seq;
	   packet <= next_packet;
	end
end

always@(*) begin

	case(state) 
	  WAIT: begin
	     next_counter = 7'd54;
	     next_start_seq = {start_seq[4:0],S_Data};
	     if(start_seq == 6'b011111) begin
		next_state = READ;
		next_packet = packet;
		next_packet[counter] = S_Data;
		next_counter = counter -1;
	     end else begin
		next_state = WAIT;
		next_packet = packet;
	     end
	  end
	  
	  READ:  begin
	     next_start_seq = 6'b111111;
	     if(counter == 0) begin
		next_state = DONE;
		next_counter = 7'd20;
		next_packet = packet;
		next_packet[counter] = S_Data;
	     end else begin
		next_state = READ;
		next_packet = packet;
		next_packet[counter] = S_Data;
		next_counter = counter-1;
	     end
	  end
	  
	  DONE: begin
	     next_counter = 7'd54;
	     next_state = WAIT;
	     next_start_seq = 6'b111111;
	     next_packet = packet;
	  end

	  default: begin
	     next_counter = 7'd54;
	     next_state = WAIT;
	     next_start_seq = 6'b111111;
	     next_packet = packet;
	  end
	endcase
end
		
always@(state) begin

	if(state == DONE)begin
		ready = 1'b1;
	end else
		ready = 1'b0;
end


endmodule
	

