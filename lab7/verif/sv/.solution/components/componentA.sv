/*/|==========/=/|====================================/
|*|| Filename |*|| componentA.sv 
|*|| Date     |*|| 2022-12-02
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class componentA extends uvm_component;
  // data or class properties
  uvm_blocking_put_port #(item) bp_port;

  event done;

  `uvm_component_utils(componentA)

  // initialization
  function new( string name="componentA", uvm_component parent );
    super.new( name, parent );
  endfunction: new

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    bp_port = new( "bp_port", this );
  endfunction: build_phase

  task run_phase(uvm_phase phase);
    item  an_item      ;
    int   loop    = 10 ;
    int   file         ;

    super.run_phase(phase);
   
    file = $fopen("item/compA_item.list", "w");
    if ($test$plusargs("LOOP")) begin
      $value$plusargs("LOOP = %d", loop); 
    end
    for (int i = 0; i < loop; i++) begin
      an_item = item::type_id::create( "an_item" );
      an_item.randomize();
      $fdisplay(file, $sformatf("%s\n", an_item.convert2string()));
      `uvm_info( get_type_name(), $sformatf("\n---> Loop: %d/%d", i, loop), UVM_MEDIUM);
      `uvm_info( get_type_name(), $sformatf("\n---> New item created: %s", an_item.convert2string()), UVM_MEDIUM);
      bp_port.put(an_item);
      `uvm_info( get_type_name(), "\n---> Already put the item", UVM_MEDIUM);
    end
    $fclose(file);

    ->done;
  endtask: run_phase

endclass: componentA
