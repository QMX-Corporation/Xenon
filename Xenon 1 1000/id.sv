/** MIT License.
  Copyright (C) QMX Corporation. */


module ID (
  // Clock
  input logic clk,
  // Reset 
  input logic reset,
  // Instructions Input
  input logic [127:0] id_entry,
  // Out for PC
  output logic [4:0] instr_len,
  // Control Signals
  output logic [3:0] instr_code,
  output logic [4:0] reg_selector
);

always_ff @(posedge clk) begin 
        // If reset?
        if (reset) begin 
          instr_len <= 5'b00000;
          instr_code <= 4'b0000;
          reg_selector <= 5'b00000;
        end 
        // Not? Ok...
        else begin 
          
          // Instruction movs
          if (id_entry[127:104] == 24'b00110100_10011001_01000010) begin
              instr_len <= 5'b11000;
              instr_code <= 4'b0010;
              reg_selector <= id_entry[103:99];
          end
         

        end
end