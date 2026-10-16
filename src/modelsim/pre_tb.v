`timescale 1 ns / 100 ps

module pre_tb;
	reg [12:0]in;
	reg iClk;
	wire [5:0] row, col;
	
	preAddrDecoder decoder(
	.iClk(iClk),
	.iAddr(in),
	.oBeiginRow(row),
	.oBeiginCol(col)
	);
	
	initial begin
	iClk = 1'b0;
		#10
		in = 13'd10;
	end
	
	always begin 
		#5 iClk = !iClk;
	end
	
endmodule

