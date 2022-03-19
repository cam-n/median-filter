`timescale 1 ns / 100 ps

module rank_order_filter_tb;

reg iClk;

initial begin
	iClk = 1'b0;
end

always begin
	#5 iClk = !iClk;
end

wire [12:0] AddrPixel;
wire oWrite;

reg [7:0] RAM [0:4096];
reg [7:0] FIFO [0:4095];
integer i, f;


initial begin
	$readmemh("oImageTest.txt", RAM);
	RAM[4096] = 8'd0;
end

counter counter(

	.iClk(iClk),
	.oWrite(oWrite),
	.oAddrPixel(AddrPixel)
);

wire [5:0] row, col;

preAddrDecoder  preAddrDecoder(
	.iClk(iClk),
	.iAddr(AddrPixel),
	.oBeiginRow(row),
	.oBeiginCol(col)
);

wire [12:0] oAddrP11, oAddrP12,oAddrP13;
wire [12:0] oAddrP21, oAddrP22,oAddrP23;
wire [12:0] oAddrP31, oAddrP32,oAddrP33;

AddrDecoder   AddrDecoder(

	.iStartRow(row),
	.iStartCol(col),

	.oAddrP11(oAddrP11), .oAddrP12(oAddrP12), .oAddrP13(oAddrP13),
	.oAddrP21(oAddrP21), .oAddrP22(oAddrP22), .oAddrP23(oAddrP23),
	.oAddrP31(oAddrP31), .oAddrP32(oAddrP32), .oAddrP33(oAddrP33)
);
wire [7:0] oMedianValue;
/*
median_filter_w3x3   median_filter_w3x3(

	.iClk(iClk),
	.iP11(RAM[oAddrP11]), .iP12(RAM[oAddrP12]), .iP13(RAM[oAddrP13]),
	.iP21(RAM[oAddrP21]), .iP22(RAM[oAddrP22]), .iP23(RAM[oAddrP23]),
	.iP31(RAM[oAddrP31]), .iP32(RAM[oAddrP32]), .iP33(RAM[oAddrP33]),

	.oMedianValue(oMedianValue)
);

*/
rank_order rank_order(

	.iClk(iClk),
	.iOrder(4'd6),
	.iNum1(RAM[oAddrP11]), .iNum2(RAM[oAddrP12]), .iNum3(RAM[oAddrP13]),
	.iNum4(RAM[oAddrP21]), .iNum5(RAM[oAddrP22]), .iNum6(RAM[oAddrP23]),
	.iNum7(RAM[oAddrP31]), .iNum8(RAM[oAddrP32]), .iNum9(RAM[oAddrP33]),
	
	.oValue(oMedianValue)
);

always @ (posedge iClk) begin
	if (oWrite) begin
		FIFO[AddrPixel - 1] = oMedianValue;
	end
end

reg oDone;
initial begin
	oDone = 1'b0;
end 


initial
    begin
      f = $fopen("result.txt","w");
    end
	
always @ (posedge iClk) begin
	if (AddrPixel == 13'd4097) begin
		oDone = 1'b1;
	end
end

always @ (posedge iClk) begin
	if(oDone) begin
		for (i = 0; i<4097; i=i+1) begin
			$fwrite(f,"%x\n",FIFO[i]);
		end
		$fclose(f); 
		$stop;
	end
end
	
/*initial begin
      for (i = 0; i<4096; i=i+1)
        $fwrite(f,"%x\n",FIFO[i]);
		$fclose(f);  
    end
*/	

endmodule

