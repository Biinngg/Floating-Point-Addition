module Mux_5(clk,res,en,mux,rounding,outp);
  input clk,res,en;
  input [7:0] mux,rounding;
  output reg [7:0] outp;
  
  always @(posedge clk) begin
    if(!en)
      outp = mux;
    else
      outp = rounding;
    if(!res)
      outp = 0;
    end
endmodule