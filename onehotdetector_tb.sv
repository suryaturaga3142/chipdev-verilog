`timescale 1ps/1ps

module onehotdetector_tb;

logic [31:0] din;
logic clk, onehot;

model dut (
    .din(din),
    .onehot(onehot)
);

initial begin
    din = 'hffff;
    #5 din = 'd4;
    #5 din = 'd1;
    #5 $finish;
end

//Clocking
initial clk = 1'b0;
always #1 clk = ~clk;

//Time control
initial #1000 $finish;

//Waveforms
initial begin
    $dumpfile("onehotdetector_tb.vcd");
    $dumpvars(0, onehotdetector_tb);
end

endmodule