`default_nettype none
/*
PROMPT

Thermometer (a.k.a. unary) coding is frequently used in digital
systems applications to represent a natural number.  In a thermometer 
code, a N-bit binary number is represented by a (2 ** N)-bit digital 
word, which has m zeros followed by (N - m) ones or vice-versa.

In this question, implement a binary to thermometer decoder circuit 
using Verilog.  The input, din, is an 8-bit unsigned binary word, and 
the output dout is the thermometer code representation of the input at 
any time. The output is 256-bit long;  dout has m zeros followed by 
(256 - m) ones.
*/

module model (
    input [7:0] din,
    output [255:0] dout
);

assign dout = '1 >> (255 - din);

endmodule