`default_nettype none

/*
PROMPT

Build a circuit that generates a Gray code sequence starting 
from 0 on the output (dout).

Gray code is an ordering of binary numbers such that two 
successive values only have one bit difference between them. 
For example, a Gray code sequence for a two bit value could be:

b00
b01
b11
b10

The Gray code sequence should use the standard encoding. In the 
standard encoding the least significant bit follows a repetitive 
pattern of 2 on, 2 off ( ... 11001100 ... ); the next digit a 
pattern of 4 on, 4 off ( ... 1111000011110000 ... ); the nth least 
significant bit a pattern of 2n on 2n off.

When the reset-low signal (resetn) goes to 0, the Gray code sequence 
should restart from 0.
*/


module model #(parameter
  DATA_WIDTH = 4
) (
  input clk,
  input resetn,
  output logic [DATA_WIDTH-1:0] out
);

logic [DATA_WIDTH-1:0] cntr, mask, gray;

always_ff @(posedge clk) begin
  if(!resetn) cntr <= '0;
  else begin
    cntr <= cntr + 1;
  end
end

always @* begin
  int i;
  logic dir = 1'b0;
  for (i = DATA_WIDTH-1; i >= 0; i--) begin
    gray[i] = cntr[i] ^ dir;
    dir = dir ^ gray[i];
  end
end

assign out = gray;

endmodule