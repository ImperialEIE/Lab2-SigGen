module ram2ports #(
    parameter   ADDRESS_WIDTH = 8,
                DATA_WIDTH = 8
)(
    input  logic                     clk,
//  input  logic                     ren,
    input  logic                     wen,
    input  logic [ADDRESS_WIDTH-1:0] waddr,
    input  logic [ADDRESS_WIDTH-1:0] raddr,
    input  logic [DATA_WIDTH-1:0]    din,
    output logic [DATA_WIDTH-1:0]    dout,
);

logic [DATA_WIDTH-1:0] rom_array [2 ** ADDRESS_WIDTH-1:0];

initial begin
        $display("Loading rom.");
        $readmemh("sinerom.mem", rom_array);
end;

always_ff @(posedge clk) begin
    // output is synchronous
    if (wen) rom_array [waddr] <= din1;
    dout <= rom_array [raddr];
end

endmodule
