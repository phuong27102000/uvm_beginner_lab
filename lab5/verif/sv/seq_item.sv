/*/|==========/=/|====================================/
|*|| Filename |*|| seq_item.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class seq_item extends uvm_sequence_item;
  // data or class properties
  rand enum int {Anh, Binh, Chau, Duy, Giang, Huy, Khang, Linh, Minh, Nhan, Oanh, Phuong, Quang, Son, Thanh, Uyen, Vinh, Yen} name; 
  rand int age;

  constraint c1 { age < 30;
                  age > 19;} 

  `uvm_object_utils(seq_item)

  // initialization
  function new( string name="seq_item" );
    super.new(name);
  endfunction : new

  function void do_print(uvm_printer printer);
    set_use_sequence_info(0);
    super.do_print(printer);
    printer.print_string("Name", name.name());
    printer.print_field_int("Age", age, 32, UVM_DEC);
  endfunction: do_print
endclass : seq_item
