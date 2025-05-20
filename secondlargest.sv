`default_nettype none

/*
PROMPT

Given a clocked sequence of unsigned values, output the second-largest 
value seen so far in the sequence. If only one value is seen, then the 
output (dout) should equal 0. Note that repeated values are treated as 
separate candidates for being the second largest value.

When the reset-low signal (resetn) goes low, all previous values seen 
in the input sequence should no longer be considered for the calculation 
of the second largest value, and the output dout should restart from 0 
on the next cycle.
*/

module model #(parameter
  DATA_WIDTH = 32
) (
  input clk,
  input resetn,
  input [DATA_WIDTH-1:0] din,
  output logic [DATA_WIDTH-1:0] dout
);

logic [DATA_WIDTH-1:0] max, nxt_max, nxt_dout; // dout = secmax

always_ff @( posedge clk, negedge resetn ) begin
  if(!resetn) begin
      dout <= '0;
      max <= '0;
  end else begin
      dout <= nxt_dout;
      max <= nxt_max;
  end
end

assign nxt_max  = !resetn ? '0 : din > max ? din : max;
assign nxt_dout = !resetn ? '0 : nxt_max > max ? max : din > dout ? din : dout;

endmodule