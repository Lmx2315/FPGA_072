`timescale 1 ns / 1 ns

module test_t1hz (
	input clk,    // Clock
	output z
);

logic [31:0] sch=0;

always_ff @(posedge clk) 
begin 
	sch<=sch+1;
end
assign z=sch[26];//будет 67/48  секунды , если clk=48 МГц
endmodule