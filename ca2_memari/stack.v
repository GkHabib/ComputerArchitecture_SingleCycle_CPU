module stack(clk, rst, push, pop, writeData, readData);
  input clk, rst, push, pop;
  input[11:0] writeData;
  output[11:0] readData;
  reg[11:0] stackArray[7:0];
  reg[2:0] pointer;
  always@(posedge clk, posedge rst) begin
    if(rst) begin
      for (int i=0; i<=7; i=i+1) begin
        stackArray[i] = 12'b0;
      end
      pointer = 3'b0;
    end
    else begin
      if(push) begin
        stackArray[pointer] <= writeData;
        pointer = pointer + 1;
      end
      else begin
        if(pop) begin
          pointer = pointer - 1;
        end
      end
    end
  end
  assign readData = stackArray[pointer];
endmodule
