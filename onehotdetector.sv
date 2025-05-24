`default_nettype none

/* PROMPT
One-hot values have a single bit that is a 1 with all
other bits being 0. Output a 1 if the input (din) is a
one-hot value, and output a 0 otherwise.
*/

module model #(parameter
  DATA_WIDTH = 32
) (
  input  [DATA_WIDTH-1:0] din,
  output logic onehot
);
logic [DATA_WIDTH-1:0] shift;
always @* begin
  shift = din;
  for(int i = 0; i < DATA_WIDTH; i++) begin
    if (~shift[0]) begin
        shift = shift >> 1;
    end else begin
        i = DATA_WIDTH;
    end
  end
  onehot = &{~shift[DATA_WIDTH-1:1], shift[0]};
end
endmodule