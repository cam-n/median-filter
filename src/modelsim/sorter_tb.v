`timescale 1 ns / 100 ps

module sorter_tb();

	reg 	   iClk;
	reg  [7:0] iNumA;
	reg  [7:0] iNumB;
	reg  [7:0] iNumC;

	wire [7:0] oNumMin;
	wire [7:0] oNumMedian;
	wire [7:0] oNumMax;

sorter sort(

	.iClk(iClk),
	.iNumA(iNumA),
	.iNumB(iNumB),
	.iNumC(iNumC),

	.oNumMin(oNumMin),
	.oNumMedian(oNumMedian),
	.oNumMax(oNumMax)

);

	initial begin
		iClk = 1'b0;
        end

	always begin
		#5 iClk = !iClk;
	end

	initial begin
		#50
		iNumA = 8'd0;
		iNumB = 8'd0;
		iNumC = 8'd4;
		#50
		iNumA = 8'd3;
		iNumB = 8'd1;
		iNumC = 8'd1;
		#50
		iNumA = 8'd12;
		iNumB = 8'd7;
		iNumC = 8'd4;
		#50
		iNumA = 8'd3;
		iNumB = 8'd10;
		iNumC = 8'd4;
		#50
		iNumA = 8'd2;
		iNumB = 8'd2;
		iNumC = 8'd2;
        end

endmodule
