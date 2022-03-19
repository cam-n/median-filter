
module rank_order(

	input iClk,
	input [3:0] iOrder,
	input [7:0] iNum1, iNum2, iNum3,
	input [7:0] iNum4, iNum5, iNum6,
	input [7:0] iNum7, iNum8, iNum9,
	
	output reg [7:0] oValue
);

	wire [7:0] buffer [0 : 8];

	// Iteration 1
	wire [7:0] A11, A12, A13, A14, A15, A16, A17, A18, A19;
	comparison C11(.iClk(iClk), .iNum1(iNum1), .iNum2(iNum2), .oNum_Smaller(A11), .oNum_Greater(A12) );
	comparison C12(.iClk(iClk), .iNum1(iNum3), .iNum2(iNum4), .oNum_Smaller(A13), .oNum_Greater(A14) );
	comparison C13(.iClk(iClk), .iNum1(iNum5), .iNum2(iNum6), .oNum_Smaller(A15), .oNum_Greater(A16) );
	comparison C14(.iClk(iClk), .iNum1(iNum7), .iNum2(iNum8), .oNum_Smaller(A17), .oNum_Greater(A18) );
	assign A19 = iNum9;
	
	// Iteration 2
	wire [7:0] A21, A22, A23, A24, A25, A26, A27, A28, A29;
	assign A21 = A11;
	comparison C21(.iClk(iClk), .iNum1(A12), .iNum2(A13), .oNum_Smaller(A22), .oNum_Greater(A23) );
	comparison C22(.iClk(iClk), .iNum1(A14), .iNum2(A15), .oNum_Smaller(A24), .oNum_Greater(A25) );
	comparison C23(.iClk(iClk), .iNum1(A16), .iNum2(A17), .oNum_Smaller(A26), .oNum_Greater(A27) );
	comparison C24(.iClk(iClk), .iNum1(A18), .iNum2(A19), .oNum_Smaller(A28), .oNum_Greater(A29) );
	
	// Iteration 3
	wire [7:0] A31, A32, A33, A34, A35, A36, A37, A38, A39;
	comparison C31(.iClk(iClk), .iNum1(A21), .iNum2(A22), .oNum_Smaller(A31), .oNum_Greater(A32) );
	comparison C32(.iClk(iClk), .iNum1(A23), .iNum2(A24), .oNum_Smaller(A33), .oNum_Greater(A34) );
	comparison C33(.iClk(iClk), .iNum1(A25), .iNum2(A26), .oNum_Smaller(A35), .oNum_Greater(A36) );
	comparison C34(.iClk(iClk), .iNum1(A27), .iNum2(A28), .oNum_Smaller(A37), .oNum_Greater(A38) );
	assign A39 = A29;
	
	// Iteration 4
	wire [7:0] A41, A42, A43, A44, A45, A46, A47, A48, A49;
	assign A41 = A31;
	comparison C41(.iClk(iClk), .iNum1(A32), .iNum2(A33), .oNum_Smaller(A42), .oNum_Greater(A43) );
	comparison C42(.iClk(iClk), .iNum1(A34), .iNum2(A35), .oNum_Smaller(A44), .oNum_Greater(A45) );
	comparison C43(.iClk(iClk), .iNum1(A36), .iNum2(A37), .oNum_Smaller(A46), .oNum_Greater(A47) );
	comparison C44(.iClk(iClk), .iNum1(A38), .iNum2(A39), .oNum_Smaller(A48), .oNum_Greater(A49) );
	
	// Iteration 5
	wire [7:0] A51, A52, A53, A54, A55, A56, A57, A58, A59;
	comparison C51(.iClk(iClk), .iNum1(A41), .iNum2(A42), .oNum_Smaller(A51), .oNum_Greater(A52) );
	comparison C52(.iClk(iClk), .iNum1(A43), .iNum2(A44), .oNum_Smaller(A53), .oNum_Greater(A54) );
	comparison C53(.iClk(iClk), .iNum1(A45), .iNum2(A46), .oNum_Smaller(A55), .oNum_Greater(A56) );
	comparison C54(.iClk(iClk), .iNum1(A47), .iNum2(A48), .oNum_Smaller(A57), .oNum_Greater(A58) );
	assign A59 = A49;
	
	// Iteration 6
	wire [7:0] A61, A62, A63, A64, A65, A66, A67, A68, A69;
	assign A61 = A51;
	comparison C61(.iClk(iClk), .iNum1(A52), .iNum2(A53), .oNum_Smaller(A62), .oNum_Greater(A63) );
	comparison C62(.iClk(iClk), .iNum1(A54), .iNum2(A55), .oNum_Smaller(A64), .oNum_Greater(A65) );
	comparison C63(.iClk(iClk), .iNum1(A56), .iNum2(A57), .oNum_Smaller(A66), .oNum_Greater(A67) );
	comparison C64(.iClk(iClk), .iNum1(A58), .iNum2(A59), .oNum_Smaller(A68), .oNum_Greater(A69) );
	
	// Iteration 7
	wire [7:0] A71, A72, A73, A74, A75, A76, A77, A78, A79;
	comparison C71(.iClk(iClk), .iNum1(A61), .iNum2(A62), .oNum_Smaller(A71), .oNum_Greater(A72) );
	comparison C72(.iClk(iClk), .iNum1(A63), .iNum2(A64), .oNum_Smaller(A73), .oNum_Greater(A74) );
	comparison C73(.iClk(iClk), .iNum1(A65), .iNum2(A66), .oNum_Smaller(A75), .oNum_Greater(A76) );
	comparison C74(.iClk(iClk), .iNum1(A67), .iNum2(A68), .oNum_Smaller(A77), .oNum_Greater(A78) );
	assign A79 = A69;
	
	// Iteration 8
	wire [7:0] A81, A82, A83, A84, A85, A86, A87, A88, A89;
	assign A81 = A71;
	comparison C81(.iClk(iClk), .iNum1(A72), .iNum2(A73), .oNum_Smaller(A82), .oNum_Greater(A83) );
	comparison C82(.iClk(iClk), .iNum1(A74), .iNum2(A75), .oNum_Smaller(A84), .oNum_Greater(A85) );
	comparison C83(.iClk(iClk), .iNum1(A76), .iNum2(A77), .oNum_Smaller(A86), .oNum_Greater(A87) );
	comparison C84(.iClk(iClk), .iNum1(A78), .iNum2(A79), .oNum_Smaller(A88), .oNum_Greater(A89) );
	
	// Iteration 9
	
	comparison C91(.iClk(iClk), .iNum1(A81), .iNum2(A82), .oNum_Smaller(buffer[0]), .oNum_Greater(buffer[1]) );
	comparison C92(.iClk(iClk), .iNum1(A83), .iNum2(A84), .oNum_Smaller(buffer[2]), .oNum_Greater(buffer[3]) );
	comparison C93(.iClk(iClk), .iNum1(A85), .iNum2(A86), .oNum_Smaller(buffer[4]), .oNum_Greater(buffer[5]) );
	comparison C94(.iClk(iClk), .iNum1(A87), .iNum2(A88), .oNum_Smaller(buffer[6]), .oNum_Greater(buffer[7]) );
	assign buffer[8] = A89;
	
	reg [3:0] count = 4'd0;
	
	always @ (posedge iClk) begin
		count <= count + 1'b1;
		if (count == 4'd10) begin
			oValue <= buffer[iOrder - 1'b1];
			count <= 4'd0;
		end
	end

	

endmodule
