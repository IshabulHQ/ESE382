history clear
run_tcl -fg "//Mac/Home/Desktop/ESE382/Lab 8/Lattice/impl1/launch_synplify.tcl"
project -run  
set_option -result_file "//Mac/Home/Desktop/ESE382/Lab 8/Lattice/impl1/impl1.edn"
set_option -write_vhdl 1
project -run  
project -close "//Mac/Home/Desktop/ESE382/Lab 8/Lattice/impl1/impl1_syn.prj"
