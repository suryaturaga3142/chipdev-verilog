`timescale 1ps/1ps

// Testbench for secondlargest module.

module secondlargest_tb #(
    DATA_WIDTH = 32
);

logic clk, resetn;
logic [DATA_WIDTH-1:0] din, dout;

model dut (
    .clk(clk),
    .resetn(resetn),
    .din(din),
    .dout(dout)
);

initial begin
    resetn = '0;
    din = 'h02;
    #1 resetn = '1;
    #2 din = 'h06;
    #2 din = 'h00;
    #2 din = 'h0e;
    #2 din = 'h0c;
    #2 din = 'h01;
    $finish;
end

initial clk = '0;
always #1 clk = ~clk;

initial begin
    #100 $finish;
end

initial begin
    $dumpfile("secondlargest_tb.vcd");
    $dumpvars(0, secondlargest_tb);
end

endmodule