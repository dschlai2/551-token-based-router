module t_buffer;
    
    reg clk, rst, bufsel;
    reg [54:0] newval;
    wire [54:0] out;
    
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        #10 rst = 1'b0;
    end
    
    always begin
        #5;
        clk = ~clk;
    end
    
    buffer ever_versetile(
                  .new_value    (newval[54:0]),
                  .clk          (clk),
                  .rst          (rst),
                  .buffer_select(bufsel),
                  .out          (out[54:0]));
                  
    initial begin
        #11;
        bufsel = 1'b1;
        newval = 55'd100;
        #9;
        bufsel = 1'b0;
        newval = 55'd50;
        #10;
        newval = 55'd42;
        #10;
        #10;
        bufsel = 1'b1;
        #10;
        rst = 1'b1;
        #10;
        rst = 1'b0;
     end
     
 endmodule
        
                  
    
    
