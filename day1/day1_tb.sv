module day1_tb (
);

localparam period = 10;

// logic is a 1-bit, 4-state (1,0,x,z) data type
logic [7:0] a_i;
logic [7:0] b_i;
logic       sel_i;
logic [7:0] y_o;

// day1 dut(.*);
day1 dut(
  .a_i  (a_i),
  .b_i  (b_i),
  .sel_i(sel_i),
  .y_o  (y_o)
);

initial begin
  /* select a_i */
  sel_i = 1'b0;
  a_i = 8'h01;
  b_i = 8'h03;
  #period;

  // a_i changes, b_i remains the same
  sel_i = 1'b0;
  a_i = 8'h02;
  b_i = 8'h03;
  #period;

  // a_i remains the same, b_i changes
  sel_i = 1'b0;
  a_i = 8'h02;
  b_i = 8'h04;
  #period;

  /* select b_i */
  sel_i = 1'b1;
  a_i = 8'h01;
  b_i = 8'h03;
  #period;

  // a_i remains the same, b_i changes
  sel_i = 1'b1;
  a_i = 8'h01;
  b_i = 8'h04;
  #period;

  // a_i changes, b_i remains the same
  sel_i = 1'b1;
  a_i = 8'h02;
  b_i = 8'h04;
  #period;
end

initial begin
  $dumpfile("day1.vcd");
  // <levels>, <module>
  $dumpvars(0, day1_tb);
end

endmodule
