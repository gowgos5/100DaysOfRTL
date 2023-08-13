module day2 (
    input  logic clk,
    input  logic reset,
    input  logic d_i,
    output logic q_norst_o,
    output logic q_syncrst_o,
    output logic q_asyncrst_o
);

always_ff @(posedge clk) begin : norst
  q_norst_o <= d_i;
end

always_ff @(posedge clk) begin : syncrst
  // synthesis produces same hardware
  // q_syncrst_o <= reset ? 1'b0 : d_i;
  if (reset) begin
    q_syncrst_o <= 1'b0;
  end else begin
    q_syncrst_o <= d_i;
  end
end

always_ff @(posedge clk or posedge reset) begin : asyncrst
  if (reset) begin
    q_asyncrst_o <= 1'b0;
  end else begin
    q_asyncrst_o <= d_i;
  end
end

endmodule
