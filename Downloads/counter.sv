module counter(
input logic clk,
input logic resetb,
input logic en,
input logic updn,
output logic [3:0] count);

logic [3:0] counter;

always_ff(posedge clk or negedge resetb)
	if(~resetb)
		counter <= 4'b000;
	else if(en == 1'b0)
		counter <= counter;
	else if(updn == 1'b1)
		counter <= counter + 1'b1
	else 
		counter <= counter - 1'b1

assign count = counter;

endmodule 