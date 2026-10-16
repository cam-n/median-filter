
`timescale 1 ns / 100 ps

module median_filter_w3x3_tb();

	reg 	     iClk;
	reg  [7:0] iP11, iP12, iP13;
	reg  [7:0] iP21, iP22, iP23;
	reg  [7:0] iP31, iP32, iP33;

	wire [7:0] oMedianValue;

median_filter_w3x3 filter(

	.iClk(iClk),
	.iP11(iP11), .iP12(iP12), .iP13(iP13),
	.iP21(iP21), .iP22(iP22), .iP23(iP23),
	.iP31(iP31), .iP32(iP32), .iP33(iP33),

	.oMedianValue(oMedianValue)
);

	initial begin
		iClk = 1'b0;
        end

	always begin
		#5 iClk = !iClk;
	end

	initial begin
		#100
		iP11 = 8'd0;
		iP12 = 8'd3;
		iP13 = 8'd2;

		iP21 = 8'd2;
		iP22 = 8'd2;
		iP23 = 8'd2;

		iP31 = 8'd4;
		iP32 = 8'd10;
		iP33 = 8'd1;

		#100
		iP11 = 8'd5;
		iP12 = 8'd33;
		iP13 = 8'd32;

		iP21 = 8'd11;
		iP22 = 8'd2;
		iP23 = 8'd8;

		iP31 = 8'd7;
		iP32 = 8'd78;
		iP33 = 8'd9;

		#100
		iP11 = 8'd0;
		iP12 = 8'd3;
		iP13 = 8'd4;

		iP21 = 8'd6;
		iP22 = 8'd6;
		iP23 = 8'd9;

		iP31 = 8'd9;
		iP32 = 8'd7;
		iP33 = 8'd7;
        end

endmodule