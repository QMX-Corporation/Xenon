/** MIT License. 
    Copyright (C) QMX Corporation. */

module RCX (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // RCX Input
    input logic [63:0] rcx_in,
    // RCX Output
    output logic [63:0] rcx_out
);
logic [63:0] rcx_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        rcx_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        rcx_reg <= rcx_in;
    end

end

// The Output Port transfers the data in Real Time
assign rcx_out = rcx_reg;

endmodule