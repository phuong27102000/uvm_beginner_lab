/*/|==========/=/|====================================/
|*|| Filename |*|| adder.v 
|*|| Date     |*|| 2022-09-29
|*|| Author   |*|| Nguyen Ha Nhat Phuong
|*|| Contact  |*|| phuong2710@gmail.com
|_|/==========|_|/===================================*/

module my_adder (input        rstn, 
                 input [7:0]  a,
                 input [7:0]  b,
                 output[7:0]  sum, 
                 output       carry);

  assign {carry, sum} = rstn ? 0 : (a + b);
endmodule
