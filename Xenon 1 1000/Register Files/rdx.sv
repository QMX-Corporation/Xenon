/** MIT License. 
    Copyright (C) QMX Corporation. */

module RDX (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // RDX Input
    input logic [63:0] rdx_in,
    // RDX Output
    output logic [63:0] rdx_out
);
logic [63:0] rdx_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        rdx_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        rdx_reg <= rdx_in;
    end

end

// The Output Port transfers the data in Real Time
assign rdx_out = rdx_reg;

endmodule