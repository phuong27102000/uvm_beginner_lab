/*/|==========/=/|====================================/
|*|| Filename |*|| driver.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_driver extends uvm_driver #(seq_item);
  // data or class properties
  virtual adder_if vif ;
  virtual clk_if vclk;

  `uvm_component_utils(my_driver)

  // initialization
  function new( string name="my_driver", uvm_component parent );
    super.new( name, parent );
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db #(virtual adder_if)::get(this, "", "vif" , vif ))
      `uvm_error( get_type_name(), "Cannot find any virtual interface typed dut_if");
    if (!uvm_config_db #(virtual clk_if)  ::get(this, "", "vclk", vclk))
      `uvm_error( get_type_name(), "Cannot find any virtual interface typed clk_if");
  endfunction: build_phase
  
  task run_phase(uvm_phase phase);
    seq_item item;
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(item);
      @(posedge vclk.tb_clk);
      item_to_vif(item, vif);
      seq_item_port.item_done();
    end
  endtask: run_phase

  static function void item_to_vif(seq_item item, virtual adder_if vif);
    vif.rstn = item.rstn;
    vif.a    = item.a   ;
    vif.b    = item.b   ;
  endfunction: item_to_vif

endclass : my_driver
