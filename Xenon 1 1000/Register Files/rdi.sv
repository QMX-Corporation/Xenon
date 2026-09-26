/** MIT License. 
    Copyright (C) QMX Corporation. */

module RDI (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // RDI Input
    input logic [63:0] rdi_in,
    // RDI Output
    output logic [63:0] rdi_out
);
logic [63:0] rdi_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        rdi_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        rdi_reg <= rdi_in;
    end

end

// The Output Port transfers the data in Real Time
assign rdi_out = rdi_reg;

endmodule