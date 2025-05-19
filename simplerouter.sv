`default_nettype none

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
);

logic [DATA_WIDTH-1:0] zero;
assign {dout3, dout2, dout1, dout0, zero} = din << (DATA_WIDTH * din_en * (addr + 1));

endmodule