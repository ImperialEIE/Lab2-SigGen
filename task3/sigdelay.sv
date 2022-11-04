module sigdelay #(
    parameter ADDRESS_WIDTH = 8
) (
    input  logic       clk,
    input  logic       rst,
    input  logic       wr,
//  input  logic       rd, // always reading
    input  logic [7:0] offset,
    input  logic [7:0] mic_signal,
    output logic [7:0] delayed_signal
);
    logic [ADDRESS_WIDTH-1:0] waddr;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (1'1),
    .count (waddr),
    .incr (1'1)
);

ram2ports fred (
    .clk (clk),
    .wen (wr),
    .waddr (waddr),
    .raddr (waddr - offset),
    .din (mic_signal),
    .dout (delayed_signal)
);
    
endmodule
