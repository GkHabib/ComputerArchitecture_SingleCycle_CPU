module instructionMemory(PC, dataPathOut, CuOut);
  input[11:0] PC;
  output[13:0] dataPathOut;
  output[4:0] CuOut;
  reg[18:0] insMemory[0:4095];
  wire[18:0] currentIns;
  assign currentIns = insMemory[PC];
  assign dataPathOut = currentIns[13:0];
  assign CuOut = currentIns[18:14];
endmodule
