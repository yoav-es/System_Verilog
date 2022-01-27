//coder yoav eshed 
module coder(
input logic [3:0] in,
input logic clk,
input logic rst,
input logic [3:0] r_counter,
input logic [3:0] w_counter,
output logic out);

logic inputenable,
logic clearen,
logic delayen,
logic [29:0] timer 
logic [3:0] mem,


//clear_counter
always_ff @ (posedge clk or negedge rst)
	if(~rst)
		r_counter <= 4'b0000;
	else if (in == mem):
		r_counter <= r_counter + 4'b0001;
	else	
		r_counter <=  4'b0000;
		
// wrong counter 
always_ff @ (posedge clk or negedge rst)
	if(~rst)
		w_counter <= 4'b0000;
	else if (in != mem):
		w_counter <= r_counter + 4'b0001;
	else	
		w_counter <= 4'b0000;

always_ff @ (posedge clk or negedge rst)
	if(~rst)
		timer <= 5'b00000;
	else if (delayen)
		time - 
	else timer <= 5'b00000;
	
	
assign inputen = (delayen == 1) ? 1 : 0; 	
	
// clearm mem 
assign clearen = (r_counter == 3'b100) ? 1 : 0; 

// activate delay 
assign delayen = (w_counter == 3'b100) ? 1 : 0; 

// control lock 
assign out = (mem == in) ? 1'b1 : 1'b0;


endmodule // coder