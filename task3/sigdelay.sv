module sigdelay #(
    paramter ADDRESS_WIDTH = 8
) (
    input  logic       clk,
    input  logic       rst,
    input  logic       wr,
//  input  logic       rd, // always reading
    input  logic [7:0] offset,
    input  logic [7:0] mic_signal,
    output logic [7:0] mic_signal,
    output logic [7:0] delayed_signal
);
    logic [ADDRESS_WIDTH-1:0] waddr;

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en)
    .count (addr1)
);
    
endmodule