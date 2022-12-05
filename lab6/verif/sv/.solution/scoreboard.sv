/*/|==========/=/|====================================/
|*|| Filename |*|| scoreboard.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_scoreboard extends uvm_scoreboard;
  // data or class properties
  uvm_analysis_imp #(seq_item, my_scoreboard) ana_exp;

  `uvm_component_utils(my_scoreboard)

  // initialization
  function new( string name="my_scoreboard", uvm_component parent );
    super.new( name, parent );
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ana_exp = new("ana_exp", this);
  endfunction: build_phase

  function void write(seq_item item);
    seq_item expect_item;
    `uvm_info( get_type_name(), "Get another item", UVM_HIGH);
    item.print();
    expect_item = predict(item);
    if (item.compare(expect_item)) begin
      `uvm_info( "PASS", "||||||||||||||||||", UVM_HIGH);
    end else begin
      expect_item.print();
      `uvm_info( "FAIL", "||||||||||||||||||", UVM_HIGH);
    end
  endfunction: write

  function seq_item predict(seq_item item);
    seq_item ref_item;
    $cast(ref_item, item.clone());
    if (!ref_item.rstn) begin
      {ref_item.carry, ref_item.sum} = ref_item.a + ref_item.b;
    end else begin
      {ref_item.carry, ref_item.sum} = 0;
    end
    return ref_item;
  endfunction: predict

endclass : my_scoreboard
