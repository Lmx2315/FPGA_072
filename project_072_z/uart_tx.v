`define CLK 240000000	
`define BAUDCLK 115200
`define SCLK  (115200 * 8 * (2<<32)/(240000000))	 
//`define SCLK 100000

module uart_tx(clk, data, start, tx, ready);	

input   wire             clk;
input   wire    [7:0]   data;
input   wire           start;
output  reg               tx;
output  wire           ready;

reg [7:0] data_tx=0;
reg [2:0] count=0;
reg [3:0] state=0;
initial count = 0;	  
	
reg [31:0] accum=0;
reg [31:0] delta=2061725;	
reg start_reg=0; 

reg [2:0] front_clock=0;

wire clock;

always @(posedge clk) 	front_clock<={front_clock[1:0],clock};

always @(posedge clk)
	begin 
		accum<=accum+delta;	
		if ((start)&&(start_reg==0)) 
			begin
			start_reg<=1;
			data_tx  <= data; 
			state <= 4'b0000;
			end			
		else 
			begin
			if (front_clock==3'b011)
				begin  
				if (state<4'b1010) state <= state+1;	
				end
			if (state==4'b1010)  start_reg<=0;
			end
	end
	
assign ready = ~start_reg;

assign clock = accum[31];

//
always @(posedge clk)
        case (state)
                4'b0000: tx <= 1'b1; //  
                4'b0001: tx <= 1'b0; // 
                4'b0010: tx <= data_tx[0];
                4'b0011: tx <= data_tx[1];
                4'b0100: tx <= data_tx[2];
                4'b0101: tx <= data_tx[3];
                4'b0110: tx <= data_tx[4];
                4'b0111: tx <= data_tx[5];
                4'b1000: tx <= data_tx[6];
                4'b1001: tx <= data_tx[7];
                4'b1010: tx <= 1'b1; //
                default: tx <= 1'b1; 
        endcase

endmodule

