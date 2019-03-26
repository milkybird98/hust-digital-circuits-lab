
# PlanAhead Launch Script for Post-Synthesis pin planning, created by Project Navigator

create_project -name DigitalClock -dir "C:/Users/Administrator/Desktop/hust-digital-circuits-lab-master/DigitalClock/planAhead_run_5" -part xc3s100ecp132-4
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Administrator/Desktop/hust-digital-circuits-lab-master/DigitalClock/CloclSystem.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Administrator/Desktop/hust-digital-circuits-lab-master/DigitalClock} }
set_param project.pinAheadLayout  yes
set_property target_constrs_file "CloclSystem.ucf" [current_fileset -constrset]
add_files [list {CloclSystem.ucf}] -fileset [get_property constrset [current_run]]
link_design
