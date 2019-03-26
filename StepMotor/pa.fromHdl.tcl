
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name step_motor -dir "D:/Document/step_motor/planAhead_run_3" -part xc3s100ecp132-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "StepMotorDriver.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {StepMotorDriver.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top StepMotorDriver $srcset
add_files [list {StepMotorDriver.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s100ecp132-4
