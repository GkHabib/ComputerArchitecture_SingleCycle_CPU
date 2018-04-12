module pc(clk, rst, in, out);
  input[11:0] in;
  output reg [11:0] out;
  always @(posedge clk, posedge rst) begin
    if(rst) begin
      out <= 12'b0;
    end
    else begin
      out <= in;
    end
  end
endmodule
