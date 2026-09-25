module PC (
  // Control Flags 
  input logic clk,
  input logic reset,
  // Signal Entrie
  input logic [3:0] instr_len,
  output logic [63:0] idf_target,
  // Data Flow (Input)
  input logic [63:0] next_pc,
  // Data Flow (Output)
  output logic [63:0] pc_out
);
/** Update the BaseAddress in 
    Cycle Clock */
always_ff @(posedge clk) begin
  if (reset) begin
    pc_out <= 64'h0000_0000_0000_0000;
  end else begin 
    pc_out <= next_pc;
  end
end
/** The Adder */
always_comb begin
  idf_target = pc_out + instr_len;
end
  
endmodule