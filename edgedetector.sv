`default_nettype none

/* PROMPT

Build a circuit that pulses dout one cycle after the rising edge 
of din. A pulse is defined as writing a single-cycle 1 as shown 
in the examples below. When resetn is asserted, the value of din 
should be treated as 0.

Bonus - can you enhance your design to pulse dout on the same 
cycle as the rising edge? Note that this enhancement will not pass 
our test suite, but is still a useful exercise.
*/

// Bonus implemented. It will fail the website test cases.
module model (
  input clk,
  input resetn,
  input din,
  output dout
);

logic prev_din;

always_ff @( posedge clk ) begin
    if (!resetn) begin
        prev_din <= 1'b0;
    end else begin
        prev_din <= din;
    end
end

assign dout = ~prev_din & din;

endmodule