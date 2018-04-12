module signExt(in, out);
  input[7:0] in;
  output[11:0] out;
  assign out = {in[7],4'b0,in[6:0]};
endmodule
