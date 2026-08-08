`timescale 1ns/1ps

module handshake_tb;

reg clk;
reg rst_n;
reg out_ready;

wire out_valid;
wire [7:0] out_data;

handshake DUT(

    .clk(clk),
    .rst_n(rst_n),
    .out_ready(out_ready),
    .out_valid(out_valid),
    .out_data(out_data)

);

initial begin

    clk = 0;

    forever #5 clk = ~clk;

end

initial begin

    $dumpfile("handshake.vcd");
    $dumpvars(0,handshake_tb);

    rst_n = 0;
    out_ready = 0;

    #20;

    rst_n = 1;

    #20;
    out_ready = 1;

    #40;
    out_ready = 0;

    #40;
    out_ready = 1;

    #60;

    $finish;

end

endmodule
