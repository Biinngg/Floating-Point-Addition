module Mux_2 (clk, res, x, y, en, out);
    input clk, res, en;
    input [31:0] x, y;
    output reg [31:0] out;
    
    always @(posedge clk) begin
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