/** MIT License. 
    Copyright (C) QMX Corporation. */

module R11 (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // R11 Input
    input logic [63:0] r11_in,
    // R11 Output
    output logic [63:0] r11_out
);
logic [63:0] r11_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        r11_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        r11_reg <= r11_in;
    end

end

// The Output Port transfers the data in Real Time
assign r11_out = r11_reg;

endmodule