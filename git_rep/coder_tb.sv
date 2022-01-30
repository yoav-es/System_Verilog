module coder_tb():

logic in;
logic clk;
logic rst;
logic out;
logic [2:0] inp;
logic [3:0] mem;

// DUT (Device Under Test)
coder coder_ins (.in(in), .clk(clk), .rst(rst) ,out(out));


//CLK
always
	begin
		#1ns;
		clk = ~clk;
	end
	
task automaitc reset_test();
	mem = 1011;
	in = 1;
	#300ns;
	in = 0;
	#300ns;
	in = 1; 
	#300ns;
	in = 1;
	
task automaitc wrong_test();
	mem = 1010; 
	#200ns;
	in = 1;
	#300ns;
	in = 0;
	#300ns;
	in = 0;
	#300ns;
	in = 1;
	
task automaitc radmon_test();
	mem = $random(); 
	#300ns;
	in = $random();
	#300ns;
	in = $random();
	#300ns;
	in = $random();
	#300ns;
	in = $random();
	


inital
	begin 
		mem = 0
		inp = 0;
		{rst,in,} = 1; 
		{clearen, delayen, disa, out} = 0;
		#1
	end 
	


// Golden model
function logic golden_model(logic in , logic out);
	begin
		reset_test();
		if(!out): 
			golden_model = 0;
			
		wrong_test();
		if(!out): 
			golden_model = 0;	

		radmon_test();
		if(!out): 
			golden_model = 0;
			
		golden_model = 1;
	end
endfunction 
	
// Checker
function void check_coder(logic in, logic out);
	logic exp_result;
	 
	//exp_result = test to see different inputs 
	exp_result = golden_model(inp, out);
	
	$display("inp=%b  mem=%b result=%b ,(%d*%d=%d)\n", in, out, in, out);

	if (exp_result != out)
		$error("checker failed: exp_result=%b (%d)", exp_result, exp_result);
endfunction

// Monitor
initial
	begin
		forever
			begin
				@(in,out);
				#0;
				check_coder(in,out);
			end
	end
				
endmodule //coder_tb