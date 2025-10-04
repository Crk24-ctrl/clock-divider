`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//Clock divider will be used to reduce the frequency of the available oscillator 
//of Nexys 4 board from 100 MHz to 1 Hz (50 % duty cycle) 
/////////////////////////////////////////////////////////////////////////////////
// clkin will be connected to the 100 MHz oscillator 
// reset will be connected to a push-button. It will reset your design back to its 
//initial state in case of errors
//clkout: A clock with a one-second period (50 % duty cycle )
/////////////////////////////////////////////////////////////////////////////////

 module clock_divider(
    input clkin,
    input reset,
    output reg clkout   // it will be used under always procedural block 
    );

 reg[25:0] counter = 0;  // counter will be used to count the rising edges of input clk 
                         // 26 bits are enough to reach 50,000,000 cycles (max needed)
                         // in binary 10 1111 1010 1111 0000 1000 0000  
                                                       
 always@ (posedge clkin , posedge reset) // will run on the rising edge of clk or if reset is pressed (1)
  begin 
    if (reset == 1)        // if reset is pressed 
      begin
         clkout = 1;       // Initial value (default value)  
         counter = 0;     // counter back to zero 
      end
    else                  // if reset is not pressed 
      begin
         counter = counter +1;       //count the number of rising edges 
        if (counter == 50000000)     
           begin 
           clkout = ~clkout;         // flip the output 
           counter = 0;              // reset the counter 
           
        end // end for the above if statement
    end // end for the if-else statement  
 end  // end for always block 

endmodule
