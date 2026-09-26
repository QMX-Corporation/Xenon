/** MIT License. 
    Copyright (C) QMX Corporation. */

module RBX (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // RBX Input
    input logic [63:0] rbx_in,
    // RBX Output
    output logic [63:0] rbx_out
);
logic [63:0] rbx_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        rbx_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        rbx_reg <= rbx_in;
    end

end

// The Output Port transfers the data in Real Time
assign rbx_out = rbx_reg;

endmodule