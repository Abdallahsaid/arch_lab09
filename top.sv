module top(input logic clk, reset,
            output logic [31:0] writedata, dataadr,
            output logic [1:0]memwrite);

logic [31:0] pc, instr, readdata;

// instantiate processor and memories
mips mips(clk, reset, pc, instr, memwrite, 
        dataadr, writedata, readdata);

imem imem(pc[7:2], instr);

dmem dmem(clk, memwrite, dataadr, writedata, readdata);

endmodule