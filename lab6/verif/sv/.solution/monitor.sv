/*/|==========/=/|====================================/
|*|| Filename |*|| monitor.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_monitor extends uvm_monitor;
  // data or class properties
  virtual adder_if vif;
  virtual clk_if vclk;

  uvm_analysis_port #(seq_item) ana_port;

  `uvm_component_utils(my_monitor)

  // initialization
  function new( string name="my_monitor", uvm_component parent );
    super.new( name, parent );
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ana_port = new("ana_port", this);
    if (!uvm_config_db #(virtual adder_if)::get(this, "", "vif" , vif ))
      `uvm_error( get_type_name(), "Cannot find any virtual interface typed dut_if" );
    if (!uvm_config_db #(virtual clk_if)  ::get(this, "", "vclk", vclk))
      `uvm_error( get_type_name(), "Cannot find any virtual interface typed clk_if");
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    seq_item item;
    super.run_phase(phase);
    item = new("item");
    forever begin
      @(negedge vclk.tb_clk);
      vif_to_item(vif, item); 
      ana_port.write(item);
    end
  endtask: run_phase

  function void vif_to_item(virtual adder_if vif, seq_item item);
    item.rstn  = vif.rstn ;
    item.a     = vif.a    ;
    item.b     = vif.b    ;
    item.sum   = vif.sum  ;
    item.carry = vif.carry;
  endfunction: vif_to_item

endclass : my_monitor
