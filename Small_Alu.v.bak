module Small_Alu(clk, res, a, b, outp);
  input clk,res;
  integer i;
  input [31:0] a, b;
  reg [7:0] exp_a,exp_b;
  output reg [8:0] outp;
  
  always @(posedge clk)
    begin
      exp_a = a[30:23];
      exp_b = b[30:23];
      if(exp_a > exp_b)
        outp = exp_a - exp_b;
      else
        outp = exp_b - exp_a + 9'H100;
      if(res == 0)
        outp = 0;
    end
endmodule