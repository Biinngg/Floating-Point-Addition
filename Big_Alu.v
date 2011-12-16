module Big_Alu(clk, res, a, b, outp);
  input clk,res;
  input [22:0] a;
  input [31:0] b;
  reg [22:0] fra_b;
  output reg [22:0] outp;
  
  always @(posedge clk)
    begin
      fra_b = b[22:0];
      outp = a + fra_b;
      if(res == 0)
        outp = 0;
    end
endmodule