module buffer(from_processor, from_rx, buffer_select, clk, rst, out);
    
   input [54:0] from_processor, from_rx;
   input 	clk, rst;
   input [1:0] 	buffer_select;
   output reg [54:0] out;

   parameter [1:0] HOLD = 0;
   parameter [1:0] PROC = 1;
   parameter [1:0] RX   = 2;
   
   always@(posedge clk, posedge rst)begin
      // Reset
      if(rst)begin
         out <= 55'b0;
      end
      
      // Otherwise
      else begin
	 case (buffer_select) /* select data line */
	   HOLD: out <= out;
	   PROC: out <= from_processor;
	   RX:   out <= from_rx;
	   default: 55'b0;
      end // else
      
   end // Always
endmodule
