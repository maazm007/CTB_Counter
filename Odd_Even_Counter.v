module Odd_Even_Counter(clk,clr,M,Q,One_Sec);
	input clk,clr,M;
	output reg One_Sec;
	output reg [3:0] Q;
	reg [2:0] count;
	reg [26:0] Count;
	always @(negedge clk or posedge clr)
	begin
	if(clr)
		begin
		One_Sec <= 1'b0;
		Count[26:0] <= 1'b0;
		end
	else
		begin
		Count <= Count + 1;
		One_Sec <= Count[26];
		end
	end
	always @(negedge One_Sec or posedge clr)
	begin
	if(clr)
	begin
		Q <= 4'b0000;
		count <= 3'b000;
	end
	else if(M == 1'b0) // M = 0 for even counter
		Q <= Q + 4'b0010;
	else if(M == 1'b1) // M = 1 for odd counter
	begin
		count <= count + 3'b001;
		Q <= {count,1'b1};
	end
	end
endmodule
