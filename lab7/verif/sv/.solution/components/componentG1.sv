/*/|==========/=/|====================================/
|*|| Filename |*|| componentG1.sv 
|*|| Date     |*|| 2022-12-04
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentG1 extends uvm_component;
  // data or class properties
  uvm_analysis_imp #(item, componentG1) ana_imp ;

  `uvm_component_utils(componentG1)

  // initialization
  function new( string name="componentG1", uvm_component parent );
    super.new( name, parent ) ;
  endfunction: new

  function void build_phase(uvm_phase phase);
    ana_imp = new( "ana_imp", this );
  endfunction: build_phase

  function void write( input item an_item );
    `uvm_info( get_type_name(), $sformatf("\n---> New item received: %s", an_item.convert2string()), UVM_MEDIUM);
  endfunction: write

endclass: componentG1
