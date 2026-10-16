
`timescale 1 ns / 100 ps

module rank_order_tb();

	reg iClk;
	reg [3:0] iOrder;
	reg [7:0] iNum1, iNum2, iNum3;
	reg [7:0] iNum4, iNum5, iNum6;
	reg [7:0] iNum7, iNum8, iNum9;
	
	wire [7:0] oValue;
	
	
	rank_order   sorter(

	.iClk(iClk),
	.iOrder(iOrder),
	.iNum1(iNum1), .iNum2(iNum2), .iNum3(iNum3),
	.iNum4(iNum4), .iNum5(iNum5), .iNum6(iNum6),
	.iNum7(iNum7), .iNum8(iNum8), .iNum9(iNum9),
	
	.oValue(oValue)
);
	
	initial begin
		iClk = 1'b0;
	end
	
	always begin
		#5 iClk = !iClk;
	end
	
	initial begin
		iOrder = 4'd7;
		
		iNum1 = 8'd4;
		iNum2 = 8'd0;
		iNum3 = 8'd9;
		iNum4 = 8'd7;
		iNum5 = 8'd6;
		iNum6 = 8'd4;
		iNum7 = 8'd4;
		iNum8 = 8'd0;
		iNum9 = 8'd4;
		
		#120
		iOrder = 4'd2;
		
		iNum1 = 8'd4;
		iNum2 = 8'd0;
		iNum3 = 8'd9;
		iNum4 = 8'd7;
		iNum5 = 8'd6;
		iNum6 = 8'd0;
		iNum7 = 8'd4;
		iNum8 = 8'd0;
		iNum9 = 8'd4;
		
	end
endmodule


