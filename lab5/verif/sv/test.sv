/*/|==========/=/|====================================/
|*|| Filename |*|| test.sv 
|*|| Date     |*|| 2022-09-30
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class my_test extends uvm_test;
  // data or class properties
  my_env env;
  seq sequ;
  uvm_factory factory;

  `uvm_component_utils(my_test)

  // initialization
  function new( string name="my_test", uvm_component parent );
    super.new(name, parent);
  endfunction : new

  virtual function void end_of_elaboration_phase(uvm_phase phase);
    uvm_factory factory = uvm_factory::get();
    factory.print();  
    uvm_top.print_topology();
  endfunction: end_of_elaboration_phase

  virtual function void build_phase(uvm_phase phase);
    env = my_env::type_id::create( "env", this );
    sequ = seq::type_id::create( "sequ" );
  endfunction: build_phase

  virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    sequ.start(env.agt.seqr);
    phase.drop_objection(this);
  endtask: run_phase

endclass : my_test
