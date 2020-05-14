`timescale 1 ns / 1 ns

module test_t1hz (
	input clk,    // Clock
	output z
);

reg signal_1sec;
reg [31:0] timer_1sec=0;
always @(posedge clk)
begin
if (timer_1sec!=24000000) 
begin
timer_1sec <=timer_1sec+1; 
end
else
	begin
	timer_1sec <=0;
	signal_1sec<=~signal_1sec;	
	end
end

assign z=signal_1sec;

endmodule