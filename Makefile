# User & File Configuration
ssh-dir=~/.ssh/myssh1
base=my_new
suff=_tb
extra_src=
extra_h=
# Language Configuration - Extensions, Compilers, Flags
# SystemVerilog
ext=sv
ext_h=sv
cc=iverilog
cc_flags=-g2012
# SystemVerilog / Verilog Simulation Specific
ext_wv=vcd
cc_wv=gtkwave
cc_wv_flags=
cc_linter=verilator
cc_linter_flags=--lint-only -Werror-WIDTH -Werror-SELRANGE -Werror-COMBDLY -Werror-LATCH -Werror-MULTIDRIVEN

# File Configuration
src=$(base).$(ext)#           base.ext
src_h=$(base).$(ext_h) #      base.ext_h
src_tb=$(base)$(suff).$(ext)# base_tb.ext
exec=$(base)$(suff)#          base_tb
exec_wv=$(exec).$(ext_wv)#    base_tb.ext_wv

# Targets
# Executable file compilation
$(exec): $(src) $(extra_src) $(src_tb) $(src_h) $(extra_h)
	$(cc_linter) $(src) $(extra_src) $(cc_linter_flags)
	$(cc) -o $@ $(src) $(extra_src) $(src_tb) $(cc_flags)
# Waveform executable check
$(exec_wv): $(exec)
# Run the executable file
test: $(exec)
	./$<
# Run waveforms
sim: hdl_guard $(exec_wv) test
	$(cc_wv) $(exec_wv) $(cc_wv_flags)
# Clean all test files
clean:
	rm -f $(exec) *.o *.$(ext-wv)
# ssh login
login:
	eval $(ssh-agent)
	ssh-add $(ssh-dir)
#######################

# PHONY Commands
.PHONY: test sim clean login