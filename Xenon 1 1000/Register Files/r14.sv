/** MIT License. 
    Copyright (C) QMX Corporation. */

module R14 (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // R14 Input
    input logic [63:0] r14_in,
    // R14 Output
    output logic [63:0] r14_out
);
logic [63:0] r14_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        r14_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        r14_reg <= r14_in;
    end

end

// The Output Port transfers the data in Real Time
assign r14_out = r14_reg;

endmodule