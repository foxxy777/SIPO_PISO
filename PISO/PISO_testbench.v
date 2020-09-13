`timescale 1ns/1ns
module piso_testbench();
reg clk,rst;
reg [3:0] parallel;
reg load;
wire serial ;
parameter PERIOD =10;
initial begin
    clk = 1'b0;
    forever #(PERIOD/2) clk = ~clk;
end
initial begin 
    rst = 1'b0;
    #5
    rst = 1'b1;
    parallel = 4'b1101;
    load = 1'b1;
    #10;
    load = 1'b0;
    #100;
    $finish;
end
piso piso_inst(
    .clk(clk),
    .rst(rst),
    .parallel(parallel),
    .load(load),
    .serial(serial)
);
endmodule
