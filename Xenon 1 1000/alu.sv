/** MIT License.
  Copyright (C) QMX Corporation. */

module ALU (
    // Clock
    input logic clk,
    // Reset
    input logic reset,
    // Instruction Code
    input logic [3:0] instr_code,
    // Register Selector
    input logic [4:0] reg_selector,
    // Flags
    output logic [3:0] flags,
    // RAX Register
    input logic [63:0] rax_in,
    output logic [63:0] rax_out,
    // RBX Register
    input logic [63:0] rbx_in,
    output logic [63:0] rbx_out,
    // RCX Register
    input logic [63:0] rcx_in,
    output logic [63:0] rcx_out,
    // RDX Register
    input logic [63:0] rdx_in,
    output logic [63:0] rdx_out,
    // RDI Register
    input logic [63:0] rdi_in,
    output logic [63:0] rdi_out,
    // R8 Register
    input logic [63:0] r8_in,
    output logic [63:0] r8_out,
    // R9 Register
    input logic [63:0] r9_in,
    output logic [63:0] r9_out,
    // R10 Register
    input logic [63:0] r10_in,
    output logic [63:0] r10_out,
    // R11 Register
    input logic [63:0] r11_in,
    output logic [63:0] r11_out,
    // R12 Register
    input logic [63:0] r12_in,
    output logic [63:0] r12_out,
    // R13 Register
    input logic [63:0] r13_in,
    output logic [63:0] r13_out,
    // R14 Register
    input logic [63:0] r14_in,
    output logic [63:0] r14_out,
    // R15 Register
    input logic [63:0] r15_in,
    output logic [63:0] r15_out,
    // R8D Register (Native 64-Bit)
    input logic [63:0] r8d_in,
    output logic [63:0] r8d_out,
    // R9D Register (Native 64-Bit)
    input logic [63:0] r9d_in,
    output logic [63:0] r9d_out
);

/** The Logic */
always_comb begin 
    // Is reset?
    if (reset) begin 
        flags = 4'b0000;
    end

    // Default Repassement 
    rax_out = rax_in;
    rbx_out = rbx_in;
    rcx_out = rcx_in;
    rdx_out = rdx_in;
    rdi_out = rdi_in;
    r8_out  = r8_in;
    r9_out  = r9_in;
    r10_out = r10_in;
    r11_out = r11_in;
    r12_out = r12_in;
    r13_out = r13_in;
    r14_out = r14_in;
    r15_out = r15_in;
    r8d_out = r8d_in;
    r9d_out = r9d_in;

    // No? Ok....
    // Instruction movs
    if (instr_code == 4'b0010) begin 
        // What the Register use?
        case (reg_selector) 
            // RAX
            5'b00000:
              // Logic
              rax_out = 64'h8000_0000_0000_0000;
              // Success
              flags = 4'b0000;

            // RBX
              5'b00001:
              // Logic
              rbx_out = 64'h8000_0000_0000_0000;
              // Success
              flags = 4'b0000;

            // RCX
              5'b00010:
                // Logic
                rcx_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // RDX
               5'b00011:
                 // Logic
                 rdx_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // RDI
               5'b00100:
                // Logic
                rdi_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R8
               5'b00101:
                // Logic
                r8_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R9
               5'b00110:
                // Logic
                r9_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R10
               5'b00111:
                // Logic
                 r10_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R11
               5'b01000:
                // Logic
                r11_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R12
               5'b01001:
                // Logic
                r12_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R13
               5'b01010:
                // Logic
                r13_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R14
               5'b01011:
                // Logic
                r14_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R15
               5'b01100:
                // Logic
                r15_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R8D
               5'b01101:
                // Logic
                r8d_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // R9D
               5'b01110:
                // Logic
                r9d_out = 64'h8000_0000_0000_0000;
                // Success
                flags = 4'b0000;

            // Invalid Instruction
               default:
                 flags = 4'b1111;
           endcase
      end
end

endmodule