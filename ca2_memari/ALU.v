`timescale 1ns/1ns
module ALU(in1,in2,cIn,sc,aluOp,zero,cOut,out);
  input cIn;
  input [2:0]sc;
  input [3:0]aluOp;
  input [7:0]in1,in2;
  output reg zero;
  output reg cOut;
  output reg [7:0]out;
  wire [15:0]rightRotate;
  wire [15:0]leftRotate;

  assign rightRotate = {in1,in1} >> sc;
  assign leftRotate = {in1,in1} << sc;
  always@*begin
    case(aluOp)
      4'b0000 : begin {cOut,out} = in1+in2; zero = (|out) ? 0 : 1; end
      4'b0001 : begin {cOut,out} = in1+in2+cIn; zero = (|out) ? 0 : 1; end
      4'b0010 : begin {cOut,out} = in1-in2; zero = (|out) ? 0 : 1; end
      4'b0011 : begin {cOut,out} = in1-in2-cIn; zero = (|out) ? 0 : 1; end
      4'b0100 : begin out = (in1&in2); cOut = 1'b0; zero = (|out) ? 0 : 1; end
      4'b0101 : begin out = (in1|in2); cOut = 1'b0; zero = (|out) ? 0 : 1; end
      4'b0110 : begin out = (in1^in2); cOut = 1'b0; zero = (|out) ? 0 : 1; end
      4'b0111 : begin out = ~(in1^in2); cOut = 1'b0; zero = (|out) ? 0 : 1; end
      4'b1000 : begin {cOut,out} = in1 << sc; zero = (|out) ? 0 : 1; end
      4'b1001 : begin {cOut,out} = in1 >> sc; zero = (|out) ? 0 : 1; end
      4'b1010 : begin out = leftRotate[15:7]; cOut = 1'b0; zero = (|out) ? 0 : 1; end
      4'b1011 : begin out = rightRotate[7:0]; cOut = 1'b0; zero = (|out) ? 0 : 1; end
      default : begin out = 0; cOut = 0; zero = 0; end
    endcase
  end
endmodule
