

module test_led
(
	input wire clk,
  output wire led1,
  output wire led2,
  output wire led3

);

reg [31:0] sch=0;

always @(posedge clk)
begin

	sch<=sch+1'd1;

end

assign led1 = sch [24];
assign led2 = sch [25];
assign led3 = sch [26];

endmodule



module rst
(
  input wire clk,
  output wire reset

);

reg [31:0] a=32'hf0000000;

always @(posedge clk)
begin

	a<=a>>1;

end

assign reset = a [0];

endmodule
