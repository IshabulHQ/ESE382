
########## Tcl recorder starts at 02/26/20 16:28:17 ##########

set version "2.0"
set proj_dir "F:/Spring 2020/ESE382/Lab 4/New Lab 4/ispLever/New folder"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"proj_1.edf\" -jhd \"proj_1.jhd\" -err automake.err -log \"proj_1.log\" -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@proj_1.esp\" -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/26/20 16:28:17 ###########


########## Tcl recorder starts at 02/26/20 16:28:19 ##########

set version "2.0"
set proj_dir "F:/Spring 2020/ESE382/Lab 4/New Lab 4/ispLever/New folder"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# VHDL Post-Route Simulation Model
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"proj_1.edf\" -out \"gray_bin.bl0\" -err automake.err -log \"proj_1.log\" -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@proj_1.esp\" -nbx -cvt YES"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" gray_bin.bl0 -o gray_bin.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj untitled -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gray_bin.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"gray_bin.bl1\" -o \"untitled.bl2\" -omod gray_bin -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" untitled.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" untitled.bl3 -pla -o untitled.tt2 -dev p22v10gc -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" untitled.tt2 -dev p22v10gc -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" untitled.tt3 -dev p22v10gc -o untitled.jed -ivec NoInput.tmv -rep untitled.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.psl w} rspFile] {
	puts stderr "Cannot create response file untitled.psl: $rspFile"
} else {
	puts $rspFile "-dev p22v10gc -part LAT GAL22LV10C-10LJ GAL -o untitled.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @untitled.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.psl
if [catch {open untitled._sp w} rspFile] {
	puts stderr "Cannot create response file untitled._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route VHDL Simulation Models
#insert --
#unixpath $proj_dir
#vcom untitled.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"untitled._sp\" \"untitled.vtd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled._sp
if [catch {open untitled._sp w} rspFile] {
	puts stderr "Cannot create response file untitled._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route VHDL Simulation Models
#insert #
#unixpath $proj_dir
#vcom untitled.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"untitled._sp\" \"untitled.vatd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled._sp
if [runCmd "\"$cpld_bin/j2svhdl\" untitled.jed -dly custom untitled.tim max -pldbus default gray_bin.btp -o untitled.vhq -module gray_bin -suppress -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/26/20 16:28:19 ###########


########## Tcl recorder starts at 02/26/20 16:36:11 ##########

set version "2.0"
set proj_dir "F:/Spring 2020/ESE382/Lab 4/New Lab 4/ispLever/New folder"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"proj_1.edf\" -jhd \"proj_1.jhd\" -err automake.err -log \"proj_1.log\" -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@proj_1.esp\" -nbx"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/26/20 16:36:11 ###########


########## Tcl recorder starts at 02/26/20 16:36:15 ##########

set version "2.0"
set proj_dir "F:/Spring 2020/ESE382/Lab 4/New Lab 4/ispLever/New folder"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# VHDL Post-Route Simulation Model
if [runCmd "\"$cpld_bin/edif2blf\" -edf \"proj_1.edf\" -out \"gray_bin.bl0\" -err automake.err -log \"proj_1.log\" -prj untitled -lib \"$install_dir/ispcpld/dat/mach.edn\" \"@proj_1.esp\" -nbx -cvt YES"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" gray_bin.bl0 -o gray_bin.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj untitled -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gray_bin.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"gray_bin.bl1\" -o \"untitled.bl2\" -omod gray_bin -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" untitled.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" untitled.bl3 -pla -o untitled.tt2 -dev p22v10gc -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" untitled.tt2 -dev p22v10gc -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" untitled.tt3 -dev p22v10gc -o untitled.jed -ivec NoInput.tmv -rep untitled.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open untitled.psl w} rspFile] {
	puts stderr "Cannot create response file untitled.psl: $rspFile"
} else {
	puts $rspFile "-dev p22v10gc -part LAT GAL22LV10C-10LJ GAL -o untitled.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @untitled.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled.psl
if [catch {open untitled._sp w} rspFile] {
	puts stderr "Cannot create response file untitled._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route VHDL Simulation Models
#insert --
#unixpath $proj_dir
#vcom untitled.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"untitled._sp\" \"untitled.vtd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled._sp
if [catch {open untitled._sp w} rspFile] {
	puts stderr "Cannot create response file untitled._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route VHDL Simulation Models
#insert #
#unixpath $proj_dir
#vcom untitled.vhq
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"untitled._sp\" \"untitled.vatd\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete untitled._sp
if [runCmd "\"$cpld_bin/j2svhdl\" untitled.jed -dly custom untitled.tim max -pldbus default gray_bin.btp -o untitled.vhq -module gray_bin -suppress -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/26/20 16:36:15 ###########

