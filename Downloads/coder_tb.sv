module coder_tb():

logic in[3:0],
logic out,
logic [3:0] mem,
logic clk,
logic rst,

ins coder coder(.in(in), .clk(clk), .rst(rst) ,out(out) 


task clk;
		#5ns;
		clk = ~clk; 

	
function reset_test;
	mem = 1011;
	in = 1011;
	in = 1011;
	in = 1011; 
	
function wrong_test 
	mem = 1010; 
	in = 1010;
	in = 1010;
	in = 0011;
	
	
function radmon_test 
	mem = $randonm;
	in = radmom;
	in = radmom;
	in = radmom;

inital
	begin 
		mem = 3'b0;
		in = 3'b0;
		out = 1'b0; 
		#1
		rst = 1'b0;
	end 
	

int goldenmodel in [3:0] , out;
	reset_test;
	if(!out): 
		$error 
		retrun
	wrong_test;
	if(out):
		$error
		return;
	else if 
		//time test
		return 
	if(radmon_test):
		$error
		return;
	$print("succes");
	return;
	
	
	
checker 
	goldenmodel


monitor 





endmodule //coder_tb