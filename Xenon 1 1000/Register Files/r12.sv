/** MIT License. 
    Copyright (C) QMX Corporation. */

module R12 (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // R12 Input
    input logic [63:0] r12_in,
    // R12 Output
    output logic [63:0] r12_out
);
logic [63:0] r12_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        r12_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        r12_reg <= r12_in;
    end

end

// The Output Port transfers the data in Real Time
assign r12_out = r12_reg;

endmodule