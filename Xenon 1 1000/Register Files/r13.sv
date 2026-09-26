/** MIT License. 
    Copyright (C) QMX Corporation. */

module R13 (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // R13 Input
    input logic [63:0] r13_in,
    // R13 Output
    output logic [63:0] r13_out
);
logic [63:0] r13_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        r13_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        r13_reg <= r13_in;
    end

end

// The Output Port transfers the data in Real Time
assign r13_out = r13_reg;

endmodule