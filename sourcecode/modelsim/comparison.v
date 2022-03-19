
module comparison (

	input 	    iClk,
	//input       iRst_n,
	input [7:0] iNum1,
	input [7:0] iNum2,

	output reg [7:0] oNum_Smaller,
	output reg [7:0] oNum_Greater
);

	always@ (posedge iClk) begin
		if (iNum1 <= iNum2) begin
			oNum_Smaller <=  iNum1;
			oNum_Greater <=  iNum2;
		end
		else begin
			oNum_Smaller <=  iNum2;
			oNum_Greater <=  iNum1;
		end
	end

endmodule
