/*/|==========/=/|====================================/
|*|| Filename |*|| transaction_obj.sv 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

class Packet;
  // data or class properties
  rand bit rstn;
  rand bit [15:0] a;
  rand bit [15:0] b;
  bit [15:0] sum;
  bit carry;

  // Print contents of the data packets
  function void print (string tag="");
    $display("T = %0t [%10s] | rstn = 0x%0h | a = 0x%0h | b = 0x%0h | sum = 0x%0h | carry = 0x%0h", $time, tag, rstn, a, b, sum, carry);
  endfunction

  // This is a utility function to allow copying contents in
  // one Packet variable to another.
  function void copy(Packet tmp);
    this.a = tmp.a;
    this.b = tmp.b;
    this.rstn = tmp.rstn;
    this.sum = tmp.sum;
    this.carry = tmp.carry;
  endfunction: copy
endclass : Packet

