module z1 (input clk,input en,output start);

reg [15:0] sch=0;
reg flag_start=0;
reg [31:0] timer=0;

always @(posedge clk)
if (en)
begin
sch<=0;
flag_start<=0;
end 
else
if (sch!=10000)
begin
	if (timer!=12500) begin timer<=timer+1; flag_start<=0; end
	else
		begin
		timer<=0;
		flag_start<=1;
		sch<=sch+1;
		end
end else flag_start<=0;

assign start = flag_start;

endmodule