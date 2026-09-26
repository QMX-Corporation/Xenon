/** MIT License. 
    Copyright (C) QMX Corporation. */

module R8 (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // R8 Input
    input logic [63:0] r8_in,
    // R8 Output
    output logic [63:0] r8_out
);
logic [63:0] r8_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        r8_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        r8_reg <= r8_in;
    end

end

// The Output Port transfers the data in Real Time
assign r8_out = r8_reg;

endmodule