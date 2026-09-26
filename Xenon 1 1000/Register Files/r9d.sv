/** MIT License. 
    Copyright (C) QMX Corporation. */

module R9D (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // R9D Input
    input logic [63:0] r9d_in,
    // R9D Output
    output logic [63:0] r9d_out
);
logic [63:0] r9d_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        r9d_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        r9d_reg <= r9d_in;
    end

end

// The Output Port transfers the data in Real Time
assign r9d_out = r9d_reg;

endmodule