module test_bench;
reg clk; //??????
reg reset; //??????
reg[31:0] x; //10 ??????????
reg[31:0] y;

initial
    #0 clk = 1'b1;
  always
    #10 clk = ~clk;
  
  initial
    begin
      #0 reset = 1'b0;
      #5 reset = 1'b0;
      #10 reset = 1'b1;
      #500 $finish;
    end
    
  initial
    begin
      #11  x=32'b0001_1111_0000_0000_1011_1011_1111_0101;
      #11  y=32'b0001_1111_1111_1111_1111_1111_1111_0101;
    end
    Floating_Point_Addition
    test(clk,reset,x,y);
endmodule