/** MIT License.
  Copyright (C) QMX Corporation. */


module IF (
  // Clock
  input logic clk,
  // Reset
  input logic reset,
  // Entry Port
  input logic [63:0] if_entry,
  // Out Port
  output logic [127:0] if_out,
  // Data Memory (in)
  input logic [31:0] mem_data
);
// A Intern Register('Buffer' 128 Bits)
logic [127:0] bReg;
// A Counter
logic [1:0] chunck_counter;
// The logic
always_ff @(posedge clk) begin
  /** Counter State: 0 in the CPU Start,
  or in Reset */
  if (reset) begin
     chunck_counter <= 2'b00;
     bReg <= 128'b0;
     if_out <= 128'b0;
  end 
  /** Not reset? Continue */
  else begin
      /** 1. Write the Datas */
      case (chunck_counter) 
           2'b00: bReg[31:0]   <= mem_data;
           2'b01: bReg[63:32]  <= mem_data;
           2'b10: bReg[95:64]  <= mem_data;
           2'b11: bReg[127:96] <= mem_data;
      endcase
      /** 2. In Cycle Increment (1, 2...),
          increment the Counter */
         chunck_counter <= chunck_counter + 1;
      /** If the Buffer complete the 128 Bits,
       pass the bReg Value to the if_out */
      if (chunck_counter == 2'b11) begin
         if_out <= bReg;
      end
  end
end

endmodule      