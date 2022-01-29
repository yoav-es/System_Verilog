//coder yoav eshed 
module coder(
input logic [3:0] in,
input logic clk,
input logic rst,
input logic [3:0] r_counter,
input logic [3:0] w_counter,
output logic out);

logic clearen;
logic delayen;
logic disa;
logic [29:0] timer; 
logic [3:0] mem;
logic [2:0] inp;


//input
always_ff @ (posedge clk or negedge rst)
	if(~rst)
		inp <= 3'b000;
	else if (disa):
		inp <= inp;
	else	
		inp <= {in, inp[2:1]};
		
//memory
always_ff @ (posedge clk or negedge rst)
	if(~rst)
		mem <= 4'b0000;
	else
		if(clearen)
			mem  <= {in,inp};
		
//clear_counter
always_ff @ (posedge clk or negedge rst)
	if(~rst)
		r_counter <= 3'b000;
	else if (in == mem):
		r_counter <= r_counter + 3'b001;
	else	
		r_counter <= 3'b000;;
		
// wrong counter 
always_ff @ (posedge clk or negedge rst)
	if(~rst)
		w_counter <= 3'b000;
	else if (in != mem):
		w_counter <= r_counter + 3'b001;
	else	
		w_counter <= 3'b000;

//timer
always_ff @ (posedge clk or negedge rst)
	if(~rst)
		timer <= 5'b00000;
	else if (~delayen)
		timer <= 5'b00000;
	else if(~disa)
		timer <= timer + 5'b00001;
	
		
// clearm mem 
assign clearen = (r_counter == 3'b100) ? 1 : 0; 

// activate delay 
assign delayen = (w_counter == 3'b100) ? 1 : 0; 

// control lock 
assign out = (mem == in) ? 1'b1 : 1'b0;

// timer disable
assign disa = (timer == 31) ? 1'b0: 1'b1;

endmodule // coder