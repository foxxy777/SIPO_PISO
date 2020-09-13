module sipo(
    input clk,rst,
    input en,
    output reg [3:0]parallel,
    input serial
);
always@(posedge clk, negedge rst)begin
    if(!rst)
        parallel<=4'b0;
    else if(en)
        parallel<={parallel[2:0],serial};
end
endmodule
