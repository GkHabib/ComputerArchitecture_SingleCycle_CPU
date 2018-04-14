module TB();
  reg clk,rst=0,start;
  cpu UUT(.clk(clk), .rst(rst), .start(start));
  initial begin
    #100
    rst=1;
    #100
    rst=0;
    #100
    start=1;
    #100
    start=0;
    #100
    clk=1;
  end
  initial begin
    repeat(50) #100 clk=~clk;
  end
endmodule
