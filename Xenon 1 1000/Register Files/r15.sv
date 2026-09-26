/** MIT License. 
    Copyright (C) QMX Corporation. */

module R15 (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // R15 Input
    input logic [63:0] r15_in,
    // R15 Output
    output logic [63:0] r15_out
);
logic [63:0] r15_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        r15_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        r15_reg <= r15_in;
    end

end

// The Output Port transfers the data in Real Time
assign r15_out = r15_reg;

endmodule