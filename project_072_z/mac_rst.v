
module mac_rst
(
  input wire clk,
  input wire en,
  output wire reset

);

reg [31:0] a=0;
reg flag_rst=0;

always @(posedge clk)
if (en)
begin

	if (a<125000000) a<=a+1; 
	
	if (a<100000000) flag_rst<=0; else
	
	if (a<120000000) flag_rst<=1; else flag_rst<=0;		
	
end

assign reset = flag_rst;

endmodule
