# ==================================================
# Filename: Makefile 
# Date    : 2022-09-24
# Author  : Nguyen Ha Nhat Phuong
# Contact : phuong2710@gmail.com
# ==================================================

all: build sim
	@printf "Done !!!\nDate: $$(date +'%Y/%m/%d')\nTime: $$(date +'%H:%M:%S')\n"

build:
	vcs -sverilog -f ben.list -ntb_opts uvm-1.2 | tee vcs.log

sim:
	./simv +UVM_TESTNAME=my_test | tee sim.log

clean:
	rm -r *.log simv* csrc ucli.key vc_hdrs.h
