/*/|==========/=/|====================================/
|*|| Filename |*|| test.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_test extends uvm_test;
  // data or class properties
  my_env          env;
  my_sequence     seq;
  virtual adder_if vif;
  virtual clk_if  vclk;

  `uvm_component_utils(my_test)

  // initialization
  function new( string name="my_test", uvm_component parent );
    super.new( name, parent );
  endfunction : new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env = my_env     ::type_id::create( "env", this );
    seq = my_sequence::type_id::create( "seq", this );
    if (!uvm_config_db #(virtual adder_if)::get(this, "", "vif" , vif ))
      `uvm_error( get_type_name(), "Cannot find any virtual interface typed dut_if");
    if (!uvm_config_db #(virtual clk_if)  ::get(this, "", "vclk", vclk))
      `uvm_error( get_type_name(), "Cannot find any virtual interface typed clk_if");
    uvm_config_db #(virtual adder_if)::set(this, "env.agt.*", "vif" , vif );
    uvm_config_db #(virtual clk_if)  ::set(this, "env.agt.*", "vclk", vclk);
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(seq);
    seq.start(env.agt.sqr);
    #50;
    phase.drop_objection(seq);
  endtask: run_phase

endclass : my_test
