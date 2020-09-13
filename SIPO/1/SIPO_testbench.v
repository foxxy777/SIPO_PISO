module se_pa_testbench();

reg clk,rst;
reg serial;
reg en;
wire [3:0] parallel;

parameter PERIOD =10;

initial begin
    clk = 1'b0;
    forever #(PERIOD/2) clk = ~clk;
end

integer i;

initial begin
    /*
    rst = 1'b0;
    #1
    rst = 1'b1;
    en = 1'b1;
    #4
    */
 rst = 1'b0;
    #5
    rst = 1'b1;
    en = 1'b1;
    for(i = 0;i<10;i=i+1)
    begin
        serial = 1'b1;
        #10;
        serial = 1'b1;
        #10;
        serial = 1'b0;
        #10;
        serial = 1'b1;
        #10;
    end

    $finish;

end

sipo sipo_inst(
    .clk(clk),
    .rst(rst),
    .parallel(parallel),
    .en(en),
    .serial(serial)
);

endmodule

