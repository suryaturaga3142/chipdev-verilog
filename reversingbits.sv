`default_nettype none

/* PROMPT

Reverse the bits of an input value's binary representation.
*/

module model #(parameter
  DATA_WIDTH=32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

for (genvar i = 0; i < DATA_WIDTH; i++) begin
    assign dout[i] = din[DATA_WIDTH - i - 1];
end

endmodule