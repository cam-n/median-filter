module sorter (

	input 	     iClk,
	input  [7:0] iNumA,
	input  [7:0] iNumB,
	input  [7:0] iNumC,

	output [7:0] oNumMin,
	output [7:0] oNumMedian,
	output [7:0] oNumMax
);
	wire [7:0] temp1, temp2, temp3;

	comparison CP0(.iClk(iClk),.iNum1(iNumA), .iNum2(iNumB), .oNum_Smaller(temp1), .oNum_Greater(temp2) );
	comparison CP1(.iClk(iClk),.iNum1(temp2), .iNum2(iNumC), .oNum_Smaller(temp3), .oNum_Greater(oNumMax) );
	comparison CP2(.iClk(iClk),.iNum1(temp1), .iNum2(temp3), .oNum_Smaller(oNumMin), .oNum_Greater(oNumMedian) );


endmodule

