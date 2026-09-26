/** MIT License. 
    Copyright (C) QMX Corporation. */

module FLAGS (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // FLAGS Input
    input logic [63:0] flags_in,
    // FLAGS Output
    output logic [63:0] flags_out
);
logic [63:0] flags_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        flags_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        flags_reg <= flags_in;
    end

end

// The Output Port transfers the data in Real Time
assign flags_out = flags_reg;

endmodule
