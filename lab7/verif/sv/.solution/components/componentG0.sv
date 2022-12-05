/*/|==========/=/|====================================/
|*|| Filename |*|| componentG0.sv 
|*|| Date     |*|| 2022-12-04
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentG0 extends uvm_component;
  // data or class properties
  uvm_analysis_imp #(item, componentG0) ana_imp ;

  `uvm_component_utils(componentG0)

  // initialization
  function new( string name="componentG0", uvm_component parent );
    super.new( name, parent ) ;
  endfunction: new

  function void build_phase(uvm_phase phase);
    int file;
    super.build_phase(phase);
    ana_imp = new( "ana_imp", this );
    file = $fopen("item/compG0_item.list", "w");
    $fclose(file);
  endfunction: build_phase

  function void write( input item an_item );
    int file;
    `uvm_info( get_type_name(), $sformatf("\n---> New item received: %s", an_item.convert2string()), UVM_MEDIUM);
    file = $fopen("item/compG0_item.list", "a");
    $fdisplay(file, $sformatf("%s\n", an_item.convert2string()));
    $fclose(file);
  endfunction: write

endclass: componentG0
