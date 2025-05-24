`timescale 1ps/1ps

module moduleName;

logic clk;

mod_src dut (

);

initial begin
    //Testing
end

//Clocking
initial clk = 1'b0;
always #1 clk = ~clk;

//Time control
initial #1000 $finish;

endmodule