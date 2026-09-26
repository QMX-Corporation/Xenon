/** MIT License. 
    Copyright (C) QMX Corporation. */

module R9 (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // R9 Input
    input logic [63:0] r9_in,
    // R9 Output
    output logic [63:0] r9_out
);
logic [63:0] r9_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        r9_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        r9_reg <= r9_in;
    end

end

// The Output Port transfers the data in Real Time
assign r9_out = r9_reg;

endmodule