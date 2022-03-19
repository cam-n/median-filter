
module preAddrDecoder(
	input iClk,
	input [12:0] iAddr,
	output reg [5:0] oBeiginRow,
	output reg [5:0] oBeiginCol
);
always @ (posedge iClk) begin
	oBeiginRow <= iAddr%13'd64;
	oBeiginCol <= iAddr/13'd64;
end
endmodule
