/*/|==========/=/|====================================/
|*|| Filename |*|| componentF0.sv 
|*|| Date     |*|| 2022-12-05
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentF0 extends uvm_component;
  // data or class properties
  uvm_nonblocking_put_imp #(item, componentF0) nbp_imp;

  `uvm_component_utils(componentF0)

  // initialization
  function new( string name="componentF0", uvm_component parent );
    super.new( name, parent );
  endfunction: new

  function void build_phase(uvm_phase phase);
    int file;
    super.build_phase(phase);
    nbp_imp = new( "nbp_imp", this );
    file = $fopen("item/compF0_item.list", "w");
    $fclose(file);
  endfunction: build_phase

  function int try_put(input item an_item);
    int file;
    `uvm_info( get_type_name(), $sformatf("\n---> New item received: %s", an_item.convert2string()), UVM_MEDIUM);
    file = $fopen("item/compF0_item.list", "a");
    $fdisplay(file, $sformatf("%s\n", an_item.convert2string()));
    $fclose(file);
    return 1 ;
  endfunction: try_put

  function int can_put();
    return 1 ;
  endfunction: can_put

endclass: componentF0
