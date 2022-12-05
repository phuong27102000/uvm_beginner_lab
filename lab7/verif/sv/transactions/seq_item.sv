/*/|==========/=/|====================================/
|*|| Filename |*|| seq_item.sv 
|*|| Date     |*|| 2022-12-02
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class item extends uvm_sequence_item;
  // data or class properties
  rand bit [31:0] addr;
  rand bit [31:0] data;

  `uvm_object_utils_begin(item)
    `uvm_field_int(addr, UVM_DEFAULT)
    `uvm_field_int(data, UVM_DEFAULT)
  `uvm_object_utils_end

  // initialization
  function new( string name="item" );
    super.new( name );
  endfunction : new

  function string convert2string();
    return $sformatf("ADDR %h --- DATA %h", addr, data);
  endfunction: convert2string
  
endclass : item
