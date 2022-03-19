
module addr_decoder_last_version(

	input [5:0] iStartRow,
	input [5:0] iStartCol,

	output [12:0] oAddrP11, oAddrP12, oAddrP13,
	output [12:0] oAddrP21, oAddrP22, oAddrP23,
	output [12:0] oAddrP31, oAddrP32, oAddrP33
);

	assign oAddrP11 = ((iStartRow == 6'd0) && (iStartCol < 6'd63))? ((iStartCol+1'b1)*7'd64 + 1'b1) : 
					  ((iStartRow == 6'd0) && (iStartCol == 6'd63))? (( iStartCol-1'b1)*7'd64 + 1'b1) : 
					  ((iStartCol == 6'd0) && (iStartRow < 6'd63))? ((iStartCol+1'b1)*7'd64 + iStartRow + 1'b1):
					  ((iStartCol == 6'd0) && (iStartRow == 6'd63))? 7'd127:
					  ((iStartCol - 1'b1)*7'd64 + iStartRow - 1'b1 ); 
					  
	assign oAddrP12 = (iStartRow == 6'd0)? (iStartCol*7'd64 + 1'b1) :
					  (iStartCol * 7'd64 + iStartRow - 1'b1);
	
	assign oAddrP13 = ((iStartRow == 6'd0) && (iStartCol == 6'd0))? 13'd65 : 
					  (iStartRow == 6'd0) ? (( iStartCol-1'b1)*7'd64 + 1'b1) : 
					  ((iStartCol == 6'd63) && (iStartRow < 6'd63))? (( iStartCol-1'b1)*7'd64 + 1'b1) :
					  ((iStartCol == 6'd63) && (iStartRow == 6'd63))? ((iStartCol-1'b1)*7'd64 + iStartRow - 1'b1) :
					  ((iStartCol + 1'b1)* 7'd64 + iStartRow - 1'b1 );

	assign oAddrP21 = (iStartCol == 6'd0)? 13'd64 + iStartRow : 
					  ((iStartCol - 1'b1)* 7'd64 + iStartRow  );
	
	assign oAddrP22 = iStartCol* 7'd64 + iStartRow ;
	
	assign oAddrP23 = (iStartCol == 6'd63)? (iStartCol - 1'b1)*7'd64 + iStartRow : 
					  ((iStartCol + 1'b1 )* 7'd64 + iStartRow  );

	assign oAddrP31 = ((iStartRow == 6'd0) && (iStartCol == 6'd0))? 13'd65 : 
					  ((iStartCol == 6'd0)? 13'd64 + iStartRow - 1'b1 : 
					  ((iStartCol < 6'd63) && (iStartRow == 6'd63))? (iStartCol+1'b1)*7'd64 + iStartRow - 1'b1 : 
					   ((iStartCol == 6'd63) && (iStartRow == 6'd63))? (iStartCol-1'b1)*7'd64 + iStartRow - 1'b1 :
					  (((iStartCol - 1'b1) * 7'd64) + iStartRow + 1'b1 ));
	
	assign oAddrP32 = (iStartRow == 6'd63)? (iStartCol)*7'd64 + iStartRow - 1'b1 : 
					  (iStartCol * 7'd64 + iStartRow + 1'b1);
	
	assign oAddrP33 = ((iStartRow == 6'd63) && (iStartCol == 6'd0))? 13'd126 : 
					  ((iStartRow == 6'd63)? (iStartCol - 1'b1)*7'd64 + iStartRow - 1'b1 : 
					  ((iStartCol == 6'd63) && (iStartRow == 6'd0))? (iStartCol - 1'b1)*7'd64 + iStartRow - 1'b1 :
					  (iStartCol == 6'd63)? (iStartCol - 1'b1)*7'd64 + iStartRow - 1'b1 :
					  ((iStartCol + 1'b1)* 7'd64) + iStartRow + 1'b1 );

endmodule

