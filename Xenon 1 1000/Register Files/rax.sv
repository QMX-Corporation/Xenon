/** MIT License. 
    Copyright (C) QMX Corporation. */

module RAX (
    // Clock
    input logic clk,
    // Reset 
    input logic reset,
    // RAX Input
    input logic [63:0] rax_in,
    // RAX Output
    output logic [63:0] rax_out
);
logic [63:0] rax_reg;

always_ff @(posedge clk) begin 

    // Is Reset?
    if (reset) begin 
        // 0 in all 64 Bits (0 -> 63 Bit state: Value: 0)
        rax_reg <= 64'b0000_0000_0000_0000;
    end
    
    // Not? Ok....
    else begin 
        // Captures the Value of ALU 
        rax_reg <= rax_in;
    end

end

// The Output Port transfers the data in Real Time
assign rax_out = rax_reg;


endmodule