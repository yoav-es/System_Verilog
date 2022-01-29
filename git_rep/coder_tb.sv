module coder_tb():

logic in;
logic clk;
logic rst;
logic out;
logic [2:0];
logic [3:0] mem;

// DUT (Device Under Test)
coder coder_ins (.in(in), .clk(clk), .rst(rst) ,out(out));

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
	
	

function void randomize_inputs();
	in = $random();
	mem = $random();
endfunction



inital
	begin 
		mem = 0
		inp = 0;
		{out,rst,in,} = 1; 
		#1
	end 
	


// Golden model
function logic [11:0] golden_model(input logic [7:0] value, logic [3:0] mul);
	begin
		if (mul<=10)
			golden_model = value*mul;
		else
			golden_model = 0;
			
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
	end
endfunction 
	
// Checker
function void check_coder(logic [7:0] value, logic [3:0] mul, logic [11:0] result);
	logic [11:0] exp_result;
	 
	//exp_result = (mul>10) ? '0 : value * mul;
	exp_result = golden_model(value, mul);
	
	$display("value=%b  mul=%b result=%b ,(%d*%d=%d)\n", value,mul,result,value,mul,result);

	if (exp_result != result)
		$error("checker failed: exp_result=%b (%d)", exp_result, exp_result);
endfunction

// Monitor
initial
	begin
		forever
			begin
				@(value,mul,result);
				#0;
				check_coder(value,mul,result);
			end
	end
				





endmodule //coder_tb