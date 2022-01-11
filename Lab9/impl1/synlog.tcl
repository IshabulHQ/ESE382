history clear
run_tcl -fg //Mac/Home/Desktop/ESE382/lab9/impl1/launch_synplify.tcl
project -run  
add_file //Mac/Home/Desktop/ESE382/lab9/impl1/lab9.vhd
project -new //Mac/Home/Desktop/ESE382/lab9/impl1/proj_1.prj
project -close //Mac/Home/Desktop/ESE382/lab9/impl1/proj_1.prj
project -close //Mac/Home/Desktop/ESE382/lab9/impl1/impl1_syn.prj
project -new //Mac/Home/Desktop/ESE382/lab9/impl1/proj_1.prj
add_file -vhdl C:/My_Designs/lab09/lab09/src/SPI_test_system_II.vhd
impl -name //Mac/Home/Desktop/ESE382/lab9/impl1/lab9 -movedir
set_option -grade -4
set_option -package T100C
set_option -write_vhdl 1
project -run  
project -run  
project -close //Mac/Home/Desktop/ESE382/lab9/impl1/proj_1.prj
project -load "//Mac/Home/Desktop/ESE382/Lab 8/Synplify/proj_1.prj"
project_file -name "C:/My_Designs/Lab 8/lab8/task1/src/SPI_test_system_I.vhd" "C:/My_Designs/lab09/lab09/src/SPI_test_system_II.vhd"
project -run  
project -close "//Mac/Home/Desktop/ESE382/Lab 8/Synplify/proj_1.prj"
