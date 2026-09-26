module ID (
  // Clock
  input logic clk,
  // Reset 
  input logic reset,
  // Instructions Input
  input logic [127:0] id_entry,
  // Out for PC
  output logic [3:0] instr_len,
  // Control Signals
  output logic instr_code,
  output logic reg_selector
);