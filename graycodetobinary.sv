/*
PROMPT

Given a value, output its index in the standard Gray code sequence. 
This is known as converting a Gray code value to binary.

Each input value's binary representation is an element in the Gray 
code sequence, and your circuit should output the index of the Gray 
code sequence the input value corresponds to.

In the standard encoding the least significant bit follows a repetitive 
pattern of 2 on, 2 off ( ... 11001100 ... ); the next digit a pattern 
of 4 on, 4 off ( ... 1111000011110000 ... ); the nth least significant 
bit a pattern of 2n on 2n off.
*/

module model #(parameter
  DATA_WIDTH = 16
) (
  input [DATA_WIDTH-1:0] gray,
  output logic [DATA_WIDTH-1:0] bin
);

logic [DATA_WIDTH-1:0] sum, mask;
int i;
always @* begin
    mask = '0;
    sum = '0;
    for(i = DATA_WIDTH-1; i >= 0; i--) begin
        mask = (gray[i] == 1'b1) ? ~mask : mask;
        sum = sum + (mask & (1 << i));
    end
end
assign bin = sum;
endmodule