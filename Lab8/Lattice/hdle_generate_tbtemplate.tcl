lappend auto_path "C:/lscc/diamond/3.11_x64/data/script"
package require tbtemplate_generation

set ::bali::Para(MODNAME) SPI_test_system_I
set ::bali::Para(PROJECT) lab8_2
set ::bali::Para(PACKAGE) {"C:/lscc/diamond/3.11_x64/cae_library/vhdl_packages/vdbs"}
set ::bali::Para(PRIMITIVEFILE) {"C:/lscc/diamond/3.11_x64/cae_library/synthesis/vhdl/xp.vhd"}
set ::bali::Para(TFT) {"C:/lscc/diamond/3.11_x64/data/templates/tstbch_f.tft"}
set ::bali::Para(OUTNAME) SPI_test_system_I_tb
set ::bali::Para(EXT) .vhd
set ::bali::Para(FILELIST) {"C:/My_Designs/Lab 8/lab8/task1/src/task3_tb.vhd=work" "C:/My_Designs/Lab 8/lab8/task1/src/send_pos_edge_det.vhd=work" "C:/My_Designs/Lab 8/lab8/task1/src/SPI_test_system_I.vhd=work" "C:/My_Designs/Lab 8/lab8/task1/src/spi_tx_shifter.vhd=work" }
set ::bali::Para(INCLUDEPATH) {}
puts "set parameters done"
::bali::GenerateTbTemplate
