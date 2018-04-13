module dataMemory(clk, rst, writeEn, address, readData, writeData);
  input clk, rst, writeEn;
  input[7:0] address, writeData;
  output[7:0] readData;
  reg[7:0] dataArray[255:0];
  integer i;
  always@(posedge clk, posedge rst) begin
    if(rst) begin
      for (i=0; i<=255; i=i+1) begin
        dataArray[i] = 8'b0;
      end
    end
    else begin
      if(writeEn) begin
        dataArray[address] <= writeData;
      end
    end
  end
  assign readData = dataArray[address];
endmodule
