`default_nettype none

/* PROMPT
Find the number of trailing 0s in the binary representation 
of the input (din). If the input value is all 0s, the number 
of trailing 0s is the data width (DATA_WIDTH).
*/

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [$clog2(DATA_WIDTH):0] dout
);
logic [$clog2(DATA_WIDTH):0] sum;
logic trailing;
always @* begin
  trailing = 1'b1;
  sum = '0;
  for(int i = 0; i < DATA_WIDTH; i++) begin
    trailing = trailing & ~din[i];
    sum = sum + trailing;
  end
end
assign dout = sum;
endmodule