/*/|==========/=/|====================================/
|*|| Filename |*|| seq.sv 
|*|| Date     |*|| 2022-10-09
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class seq_item extends uvm_sequence_item;
  // data or class properties
  rand bit       rstn;
  rand bit [7:0] a;
  rand bit [7:0] b;
  rand bit [7:0] sum;
  rand bit       carry;

  `uvm_object_utils(seq_item)

  // initialization
  function new( string name="seq_item" );
    super.new( name );
  endfunction : new

  function void do_print(uvm_printer printer);
    super.do_print(printer);
    printer.print_field_int("rstn" , rstn , 1);
    printer.print_field_int("a"    , a    , 8);
    printer.print_field_int("b"    , b    , 8);
    printer.print_field_int("sum"  , sum  , 8);
    printer.print_field_int("carry", carry, 1);
  endfunction: do_print

  function void do_copy(uvm_object rhs);
    seq_item item     ;
    super.do_copy(rhs);
    $cast(item, rhs)  ;
    rstn = item.rstn  ;
    a    = item.a     ;
    b    = item.b     ;
  endfunction: do_copy

  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    seq_item item                                ;
    do_compare  = super.do_compare(rhs, comparer);
    $cast(item, rhs)                             ;
    do_compare &= (item.sum   == sum  )          ;
    do_compare &= (item.carry == carry)          ;
  endfunction: do_compare

endclass : seq_item
