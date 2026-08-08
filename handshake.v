module handshake(

    input clk,
    input rst_n,
    input out_ready,

    output reg out_valid,
    output reg [7:0] out_data

);

always @(posedge clk) begin

    if(!rst_n) begin
        out_valid <= 0;
        out_data <= 0;
    end

    else begin

        out_valid <= 1;

        if(out_valid && out_ready)
            out_data <= out_data + 1;

    end

end

endmodule
