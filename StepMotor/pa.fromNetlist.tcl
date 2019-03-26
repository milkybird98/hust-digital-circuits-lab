
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name step_motor -dir "D:/Document/step_motor/planAhead_run_2" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "D:/Document/step_motor/StepMotorDriver.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {D:/Document/step_motor} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "StepMotorDriver.ucf" [current_fileset -constrset]
add_files [list {StepMotorDriver.ucf}] -fileset [get_property constrset [current_run]]
link_design
