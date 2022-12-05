/*/|==========/=/|====================================/
|*|| Filename |*|| componentF2.sv 
|*|| Date     |*|| 2022-12-05
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentF2 extends uvm_component;
  // data or class properties
  uvm_nonblocking_put_export #(item) nbp_exp;

  componentF1 compF1;

  `uvm_component_utils(componentF2)

  // initialization
  function new( string name="componentF2", uvm_component parent );
    super.new( name, parent );
  endfunction: new

  function void build_phase(uvm_phase phase);
    nbp_exp = new( "nbp_exp", this ) ;
    compF1  = componentF1::type_id::create( "compF1", this )                         ;
  endfunction: build_phase

  function void connect_phase(uvm_phase phase);
    nbp_exp.connect(compF1.nbp_exp);
  endfunction: connect_phase

endclass: componentF2
