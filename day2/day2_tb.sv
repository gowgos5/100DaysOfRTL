module day2_tb ();

localparam period = 10;

logic clk;
logic reset;
logic d_i;
logic q_norst_o;
logic q_syncrst_o;
logic q_asyncrst_o;

day2 dut (.*);

initial begin
  clk = 1'b0;
  reset = 1'b0;
  d_i = 1'b0;
  // @(posedge clk);
  #period;

  reset = 1'b0;
  d_i = 1'b1;
  #period;

  reset = 1'b1;
  d_i = 1'b1;
  #period;

  reset = 1'b0;
  d_i = 1'b1;
  #(period/2);

  reset = 1'b1;
  d_i = 1'b1;
  #(period);

  reset = 1'b1;
  d_i = 1'b0;
  #(period);

  reset = 1'b0;
  d_i = 1'b0;
  #(period);

  $finish;
end

always begin
  clk <= ~clk;
  #(period/2);
end

initial begin
  $dumpfile("day2.vcd");
  // <levels>, <module>
  $dumpvars(0, day2_tb);
end

endmodule
