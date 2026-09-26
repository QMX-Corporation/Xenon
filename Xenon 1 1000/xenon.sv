/** MIT License.
   Copyright (C) QMX Corporation. */

module XenonProcessor (
    // Clock
    input logic clk,
    // Reset
    input logic reset
);

// The Array
logic [63:0] reg_bus [15:0];

// The instances



/** The Logic */
always_ff @(posedge clk) begin 
    
    // Is reset?
    if (reset) begin 

    end

end