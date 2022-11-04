module counter #(
    parameter WIDTH = 8
)(
    // interface signals
    input  logic             clk,
    input  logic             rst,
    input  logic             en,
    input  logic [WIDTH-1:0] incr,
    output logic [WIDTH-1:0] count
);

always_ff @(posedge clk)
    if (rst)     count <= {WIDTH{1'b0}};
    // value of count is set to value of count + en, which if 0 will not change anything, otherwise be 1, incremeneting, as required.
    else if (en) count <= (count + incr) & 8'hFF;
endmodule
