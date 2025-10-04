`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//This is a testbench template to test your FSM module 
// Make sure to rename the inputs, outputs, and module name to match your designed Verilog source file
// NO need to insert any stimulus (testing vectors) 
// the input clkin is given as a clock of 50% duty cycle 
// the input ts is given as a clock of 5/6 duty cycle 
//////////////////////////////////////////////////////////////////////////////////


module FSM_test_bench;
// Inputs
     reg clkin;
     reg ts;
     reg sensor;
     reg reset;
// Outputs
     wire [1:0] state_out;

// Instantiate the Unit Under Test (UUT)
     fsm uut (   
                    .clkin(clkin), 
                    .ts(ts),
                    .sensor(sensor),
                    .reset(reset), 
                    .state_out(state_out)
                    );    
                    
localparam period = 50;                  // for testing purposes clkin period 
localparam ts_high_time = (period *5);   // high time fo ts 
localparam ts_low_time  = (period *1);   // low time for ts 
         
 initial begin   
         clkin  = 1;  // Initialize Input
         ts     = 1;  // Initialize Input
         sensor = 1;  // Initialize Input
         reset  = 0;  // Initialize Input
         
    forever #(period/2) clkin = ~clkin;   // clock input of 50ns period 
 end 
         
  always   // run till end of simulation 
    begin
      #ts_high_time;  // after high time 
       ts = 0;        // ts go to 0 
      #ts_low_time    // after low time 
       ts = 1;       // ts go back to 1  
         end
   
endmodule
