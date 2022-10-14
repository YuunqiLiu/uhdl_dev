

module test #(
    parameter WIDTH = 32,
    parameter DEPTH = 13,
    parameter logic LOGIC = 1'b0,
    parameter string STR = "asdf"
)(
    input signed [WIDTH-1:3] din_signed_vec,
    output signed [WIDTH-1:0] dout_signed_vec,

    input [WIDTH-1:0] din_unsigned_vec,
    output [WIDTH-1:0] dout_unsigned_vec,

    input din_unsigned,
    output dout_unsigned,

    input signed din_signed,
    output signed dout_signed,

    input din_reg,
    output reg dout_reg
);

    assign dout_signed_vec = din_signed_vec;
    assign dout_unsigned_vec = din_unsigned_vec;

    assign dout_unsigned = din_unsigned;
    assign dout_signed = din_signed;
    
    always_comb begin
        dout_reg = din_reg;
    end



endmodule

module asdf(
    output dout,
    input din

);

    assign dout = din;

endmodule