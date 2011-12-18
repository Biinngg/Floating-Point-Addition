module Mux_1 (clk, res, x, y, en, out);
    input clk, res, en;
    input [31:0] x, y;
    reg [7:0] exp_x, exp_y;
    output reg [7:0] out;
    
    always @(posedge clk)
    begin
      exp_x = x[30:23];
      exp_y = y[30:23];
      begin
      if(en)
        out = y;
      else
        out = x;
      end
      begin
      if(!res)
        out = 0;
      end
    end
endmodule