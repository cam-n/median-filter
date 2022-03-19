
module median_filter_w3x3(

	input 	     iClk,
	input  [7:0] iP11, iP12, iP13,
	input  [7:0] iP21, iP22, iP23,
	input  [7:0] iP31, iP32, iP33,

	output [7:0] oMedianValue
);
// The pixels are sorted horizontally:

wire [7:0] MinRow1, MedianRow1, MaxRow1;
	sorter row1(
		.iClk(iClk),
		.iNumA(iP11), 
		.iNumB(iP12), 
		.iNumC(iP13), 
		.oNumMin(MinRow1), 
		.oNumMedian(MedianRow1), 
		.oNumMax(MaxRow1)
	 );

wire [7:0] MinRow2, MedianRow2, MaxRow2;
	sorter row2(
		.iClk(iClk),
		.iNumA(iP21), 
		.iNumB(iP22), 
		.iNumC(iP23), 
		.oNumMin(MinRow2), 
		.oNumMedian(MedianRow2), 
		.oNumMax(MaxRow2)
	 );

wire [7:0] MinRow3, MedianRow3, MaxRow3;
	sorter row3(
		.iClk(iClk),
		.iNumA(iP31), 
		.iNumB(iP32), 
		.iNumC(iP33), 
		.oNumMin(MinRow3), 
		.oNumMedian(MedianRow3), 
		.oNumMax(MaxRow3)
	 );
// The updated pixels are sorted vertically:

wire [7:0] p11, p21, p31;
	sorter col1(
		.iClk(iClk),
		.iNumA(MinRow1), 
		.iNumB(MinRow2), 
		.iNumC(MinRow3), 
		.oNumMin(p31), 
		.oNumMedian(p21), 
		.oNumMax(p11)
	 );

wire [7:0] p12, p22, p32;
	sorter col2(
		.iClk(iClk),
		.iNumA(MedianRow1), 
		.iNumB(MedianRow2), 
		.iNumC(MedianRow3), 
		.oNumMin(p32), 
		.oNumMedian(p22), 
		.oNumMax(p12)
	 );

wire [7:0] p13, p23, p33;
	sorter col3(
		.iClk(iClk),
		.iNumA(MaxRow1), 
		.iNumB(MaxRow2), 
		.iNumC(MaxRow3), 
		.oNumMin(p33), 
		.oNumMedian(p23), 
		.oNumMax(p13)
	 );

// Compute the value of median pixel from input 3x3 window.

sorter result(
		.iClk(iClk),
		.iNumA(p11), 
		.iNumB(p22), 
		.iNumC(p33), 
		.oNumMin(), 
		.oNumMedian(oMedianValue), 
		.oNumMax()
	 );

endmodule 
