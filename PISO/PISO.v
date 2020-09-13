module piso(
    input clk,rst,
    input load,
    input [3:0]parallel,
    output reg serial
);
reg [3:0] buffer;
always@(posedge clk, negedge rst)begin
    if(!rst)
        buffer<=4'b0;
    else if(load)
        buffer<=parallel;
    else
        buffer<={buffer[2:0],1'b0};
end
always@(posedge clk, negedge rst)begin
    if(!rst)
        serial <=1'b0;
    else
        serial <= buffer[3];
end
endmodule
