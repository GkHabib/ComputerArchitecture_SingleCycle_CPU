module registerMemory(clk, rst, writeEn, readAdr1, readAdr2, writeAdr, readData1, readData2, writeData);
  input[3:0] readAdr1 , readAdr2, writeAdr;
  output[7:0] readData1, readData2;
  input[7:0] writeData;
  input clk, rst, regWriteEn;
  reg[8:0] registersMemory[4095:0];
  always@(posedge clk, posedge rst) begin
    if(rst) begin
      for (int i=0; i<=7; i=i+1) begin
        registersMemory[i] = 8'b0;
      end
    end
    else begin
      if(writeEn) begin
        registerMemory[writeAdr] <= writeData;
      end
    end
  end
  assign readData1 = (readAdr1==0)? 8'b0:registersMemory[readAdr1];
  assign readData2 = (readadr2==0)? 8'b0:registersMemory[readAdr2];
endmodule
