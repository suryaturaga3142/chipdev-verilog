`default_nettype none

/*
PROMPT

Build a router circuit which forwards data from the input (din) to one of 
four outputs (dout0, dout1, dout2, or dout3), specified by the address input (addr). 

The address is a two bit value whose decimal representation determines which 
output value to use. Append to dout the decimal representation of addr to get 
the output signal name dout{address decimal value}. 

For example, if addr=b11 then the decimal representation of addr is 3, so the output 
signal name is dout3. The input has an enable signal (din_en), which allows the input 
to be forwarded to an output when enabled. If an output is not currently being driven 
to, then it should be set to 0.
*/

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  input  din_en,
  input  [1:0] addr,
  output logic [DATA_WIDTH-1:0] dout0,
  output logic [DATA_WIDTH-1:0] dout1,
  output logic [DATA_WIDTH-1:0] dout2,
  output logic [DATA_WIDTH-1:0] dout3
  // Would've been better to use output logic [DATA_WIDTH-1:0] dout [3:0]
);

logic [DATA_WIDTH-1:0] zero;
assign {dout3, dout2, dout1, dout0, zero} = din << (DATA_WIDTH * din_en * (addr + 1));

endmodule