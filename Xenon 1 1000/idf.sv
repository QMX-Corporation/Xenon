/** MIT License.
  Copyright (C) QMX Corporation. */

  
module IDF (
  // The Clock
  input logic clk,
  // The Input
  input logic [63:0] idf_in,
  // The Output
  output logic [63:0] idf_out
);
/** The Logic */
always_ff @(posedge clk) begin
    idf_out <= idf_in;
end

endmodule