
module counter(

	input iClk,
	output reg oWrite,
	output reg [12:0]oAddrPixel = 13'd0
);
	reg [3:0] count = 4'd0;
	always @ (posedge iClk) begin
		count <= count + 1'b1;
		if(count == 4'd10) begin
			oAddrPixel <= oAddrPixel + 1'b1;
			count <= 4'd0;
		end
		if(count != 4'd9) begin
			oWrite <= 1'b0; 
		end
		if(count == 4'd9) begin
			oWrite <= 1'b1; 
		end
	end


endmodule 