/*/|==========/=/|====================================/
|*|| Filename |*|| componentF1.sv 
|*|| Date     |*|| 2022-12-05
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentF1 extends uvm_component;
  // data or class properties
  uvm_nonblocking_put_export #(item) nbp_exp;

  componentF0 compF0;

  `uvm_component_utils(componentF1)

  // initialization
  function new( string name="componentF1", uvm_component parent );
    super.new( name, parent );
  endfunction: new

  function void build_phase(uvm_phase phase);
    nbp_exp = new( "nbp_exp", this ) ;
    compF0  = componentF0::type_id::create( "compF0", this )                         ;
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    nbp_exp.connect(compF0.nbp_imp);
  endfunction: connect_phase

endclass: componentF1
