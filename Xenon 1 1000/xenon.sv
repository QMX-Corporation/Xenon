/** MIT License.
   Copyright (C) QMX Corporation. */

module XenonProcessor (
    // Clock
    input logic clk,
    // Reset
    input logic reset,
    // External RAM Memory
    input logic [31:0] ram_data_in
);

// The Array
logic [63:0] reg_bus [15:0];

// Control Wires
logic [3:0] id_instr_code;
logic [4:0] id_reg_selector;
logic [3:0] alu_flags;
logic [4:0] id_instr_len;       
logic [63:0] pc_current_addr;   
logic [63:0] idf_next_addr;     
logic [63:0] fetched_data_64;   
logic [127:0] current_instr;  

// | --- | THE INSTANCES | --- |
// --- REGISTERS ---    
// RAX (Index 0)
RAX rax_inst (
    .clk(clk),
    .reset(reset),
    .rax_in(reg_bus[0]),
    .rax_out(reg_bus[0])
);
// RBX (Index 1)
RBX rbx_inst (
    .clk(clk),
    .reset(reset),
    .rbx_in(reg_bus[1]),
    .rbx_out(reg_bus[1])
);
// RCX (Index 2)
RCX rcx_inst (
    .clk(clk),
    .reset(reset),
    .rcx_in(reg_bus[2]),
    .rcx_out(reg_bus[2])
);
// RDX (Index 3)
RDX rdx_inst (
    .clk(clk),
    .reset(reset),
    .rdx_in(reg_bus[3]),
    .rdx_out(reg_bus[3])
);
// RDI (Index 4)
RDI rdi_inst (
    .clk(clk),
    .reset(reset),
    .rdi_in(reg_bus[4]),
    .rdi_out(reg_bus[4])
);
// R8 (Index 5)
R8 r8_inst (
    .clk(clk),
    .reset(reset),
    .r8_in(reg_bus[5]),
    .r8_out(reg_bus[5])
);
// R9 (Index 6)
R9 r9_inst (
    .clk(clk),
    .reset(reset),
    .r9_in(reg_bus[6]),
    .r9_out(reg_bus[6])
);
// R10 (Index 7)
R10 r10_inst (
    .clk(clk),
    .reset(reset),
    .r10_in(reg_bus[7]),
    .r10_out(reg_bus[7])
);
// R11 (Index 8)
R11 r11_inst (
    .clk(clk),
    .reset(reset),
    .r11_in(reg_bus[8]),
    .r11_out(reg_bus[8])
);
// R12 (Index 9)
R12 r12_inst (
    .clk(clk),
    .reset(reset),
    .r12_in(reg_bus[9]),
    .r12_out(reg_bus[9])
);
// R13 (Index 10)
R13 r13_inst (
    .clk(clk),
    .reset(reset),
    .r13_in(reg_bus[10]),
   .r13_out(reg_bus[10])
);
// R14 (Index 11)
R14 r14_inst (
    .clk(clk),
    .reset(reset),
    .r14_in(reg_bus[11]),
    .r14_out(reg_bus[11])
);
// R15 (Index 12)
R15 r15_inst (
    .clk(clk),
    .reset(reset),
    .r15_in(reg_bus[12]),
    .r15_out(reg_bus[12])
);
// R8D (Index 13 - Native 64-bit)
R8D r8d_inst (
    .clk(clk),
    .reset(reset),
    .r8d_in(reg_bus[13]),
    .r8d_out(reg_bus[13])
);
// R9D (Index 14 - Native 64-bit)
R9D r9d_inst (
    .clk(clk),
    .reset(reset),
    .r9d_in(reg_bus[14]),
    .r9d_out(reg_bus[14])
);
// --- CONTROL & EXECUTION UNITS ---
// Instruction Decode Instance
id id_inst (
    .clk(clk),
    .reset(reset),
    .id_entry(current_instr),    
    .instr_len(id_instr_len),   
    .instr_code(id_instr_code),
    .reg_selector(id_reg_selector)
);
// Arithmetic Logic Unit Instance
ALU alu_inst (
    .clk(clk),
    .reset(reset),
    .instr_code(id_instr_code),
    .reg_selector(id_reg_selector),
    .flags(alu_flags),  
    // Bank Connections
    .rax_in(reg_bus[0]), .rax_out(reg_bus[0]),
    .rbx_in(reg_bus[1]), .rbx_out(reg_bus[1]),
    .rcx_in(reg_bus[2]), .rcx_out(reg_bus[2]),
    .rdx_in(reg_bus[3]), .rdx_out(reg_bus[3]),
    .rdi_in(reg_bus[4]), .rdi_out(reg_bus[4]),
    .r8_in(reg_bus[5]),  .r8_out(reg_bus[5]),
    .r9_in(reg_bus[6]),  .r9_out(reg_bus[6]),
    .r10_in(reg_bus[7]), .r10_out(reg_bus[7]),
    .r11_in(reg_bus[8]), .r11_out(reg_bus[8]),
    .r12_in(reg_bus[9]), .r12_out(reg_bus[9]),
    .r13_in(reg_bus[10]),.r13_out(reg_bus[10]),
    .r14_in(reg_bus[11]),.r14_out(reg_bus[11]),
    .r15_in(reg_bus[12]),.r15_out(reg_bus[12]),
    .r8d_in(reg_bus[13]),.r8d_out(reg_bus[13]),
    .r9d_in(reg_bus[14]),.r9d_out(reg_bus[14])
);
// Program Counter Instance
PC pc_inst (
    .clk(clk),
    .reset(reset),
    .instr_len(id_instr_len),
    .idf_target(idf_next_addr),
    .next_pc(idf_next_addr),     
    .pc_out(pc_current_addr)
);
// Instruction Fetch Delay (IDF) Instance
IDF idf_inst (
    .clk(clk),
    .idf_in(idf_next_addr),
    .idf_out(fetched_data_64)
);
// Instruction Fetch (IF) Instance
IF if_inst (
    .clk(clk),
    .reset(reset),
    .if_entry(fetched_data_64),
    .mem_data(ram_data_in),            
    .if_out(current_instr)
);

/** The Logic */
always_ff @(posedge clk) begin 
    
    // Is reset?
    if (reset) begin 

    end

end