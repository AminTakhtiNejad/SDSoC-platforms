proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_param board.repoPaths C:/sam_work/git/digilent/vivado-boards/new/board_files
  create_project -in_memory -part xc7z020clg400-1
  set_property board_part_repo_paths C:/sam_work/git/digilent/vivado-boards/new/board_files [current_project]
  set_property board_part digilentinc.com:arty-z7-20:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir C:/sam_work/git/digilent/Arty-Z7-20-base/proj/Arty_Z7_20.cache/wt [current_project]
  set_property parent.project_path C:/sam_work/git/digilent/Arty-Z7-20-base/proj/Arty_Z7_20.xpr [current_project]
  set_property ip_repo_paths C:/sam_work/git/digilent/Arty-Z7-20-base/repo [current_project]
  set_property ip_output_repo C:/sam_work/git/digilent/Arty-Z7-20-base/repo/cache [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet C:/sam_work/git/digilent/Arty-Z7-20-base/proj/Arty_Z7_20.runs/synth_1/Arty_Z7_20_wrapper.dcp
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_dynclk_0_0/Arty_Z7_20_axi_dynclk_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_dynclk_0_0/Arty_Z7_20_axi_dynclk_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_hdmi_0/Arty_Z7_20_axi_gpio_hdmi_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_hdmi_0/Arty_Z7_20_axi_gpio_hdmi_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_led_0/Arty_Z7_20_axi_gpio_led_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_led_0/Arty_Z7_20_axi_gpio_led_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_1_0/Arty_Z7_20_axi_gpio_shield_1_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_1_0/Arty_Z7_20_axi_gpio_shield_1_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_2_0/Arty_Z7_20_axi_gpio_shield_2_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_2_0/Arty_Z7_20_axi_gpio_shield_2_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_sw_0/Arty_Z7_20_axi_gpio_sw_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_sw_0/Arty_Z7_20_axi_gpio_sw_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_vdma_0_0/Arty_Z7_20_axi_vdma_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_vdma_0_0/Arty_Z7_20_axi_vdma_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axis_subset_converter_0_0/Arty_Z7_20_axis_subset_converter_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axis_subset_converter_0_0/Arty_Z7_20_axis_subset_converter_0_0.dcp]
  add_files -quiet C:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_processing_system7_0_0/Arty_Z7_20_processing_system7_0_0.dcp
  set_property netlist_only true [get_files C:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_processing_system7_0_0/Arty_Z7_20_processing_system7_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xbar_0/Arty_Z7_20_xbar_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xbar_0/Arty_Z7_20_xbar_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rgb2dvi_0_0/Arty_Z7_20_rgb2dvi_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rgb2dvi_0_0/Arty_Z7_20_rgb2dvi_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_100M_0/Arty_Z7_20_rst_processing_system7_0_100M_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_100M_0/Arty_Z7_20_rst_processing_system7_0_100M_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_142M_0/Arty_Z7_20_rst_processing_system7_0_142M_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_142M_0/Arty_Z7_20_rst_processing_system7_0_142M_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_v_axi4s_vid_out_0_0/Arty_Z7_20_v_axi4s_vid_out_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_v_axi4s_vid_out_0_0/Arty_Z7_20_v_axi4s_vid_out_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_v_tc_0_0/Arty_Z7_20_v_tc_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_v_tc_0_0/Arty_Z7_20_v_tc_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xadc_wiz_0_0/Arty_Z7_20_xadc_wiz_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xadc_wiz_0_0/Arty_Z7_20_xadc_wiz_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xlconcat_0_0/Arty_Z7_20_xlconcat_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xlconcat_0_0/Arty_Z7_20_xlconcat_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xlconcat_1_0/Arty_Z7_20_xlconcat_1_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xlconcat_1_0/Arty_Z7_20_xlconcat_1_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xlconstant_0_0/Arty_Z7_20_xlconstant_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xlconstant_0_0/Arty_Z7_20_xlconstant_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_0/Arty_Z7_20_proc_sys_reset_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_0/Arty_Z7_20_proc_sys_reset_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_1/Arty_Z7_20_proc_sys_reset_0_1.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_1/Arty_Z7_20_proc_sys_reset_0_1.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_clk_wiz_0_0/Arty_Z7_20_clk_wiz_0_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_clk_wiz_0_0/Arty_Z7_20_clk_wiz_0_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_2/Arty_Z7_20_proc_sys_reset_0_2.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_2/Arty_Z7_20_proc_sys_reset_0_2.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_s00_regslice_0/Arty_Z7_20_s00_regslice_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_s00_regslice_0/Arty_Z7_20_s00_regslice_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_s00_data_fifo_0/Arty_Z7_20_s00_data_fifo_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_s00_data_fifo_0/Arty_Z7_20_s00_data_fifo_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_auto_pc_0/Arty_Z7_20_auto_pc_0.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_auto_pc_0/Arty_Z7_20_auto_pc_0.dcp]
  add_files -quiet c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_auto_pc_1/Arty_Z7_20_auto_pc_1.dcp
  set_property netlist_only true [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_auto_pc_1/Arty_Z7_20_auto_pc_1.dcp]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_axi_gpio_hdmi_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_hdmi_0/Arty_Z7_20_axi_gpio_hdmi_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_hdmi_0/Arty_Z7_20_axi_gpio_hdmi_0_board.xdc]
  read_xdc -ref Arty_Z7_20_axi_gpio_hdmi_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_hdmi_0/Arty_Z7_20_axi_gpio_hdmi_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_hdmi_0/Arty_Z7_20_axi_gpio_hdmi_0.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_axi_gpio_led_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_led_0/Arty_Z7_20_axi_gpio_led_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_led_0/Arty_Z7_20_axi_gpio_led_0_board.xdc]
  read_xdc -ref Arty_Z7_20_axi_gpio_led_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_led_0/Arty_Z7_20_axi_gpio_led_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_led_0/Arty_Z7_20_axi_gpio_led_0.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_axi_gpio_shield_1_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_1_0/Arty_Z7_20_axi_gpio_shield_1_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_1_0/Arty_Z7_20_axi_gpio_shield_1_0_board.xdc]
  read_xdc -ref Arty_Z7_20_axi_gpio_shield_1_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_1_0/Arty_Z7_20_axi_gpio_shield_1_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_1_0/Arty_Z7_20_axi_gpio_shield_1_0.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_axi_gpio_shield_2_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_2_0/Arty_Z7_20_axi_gpio_shield_2_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_2_0/Arty_Z7_20_axi_gpio_shield_2_0_board.xdc]
  read_xdc -ref Arty_Z7_20_axi_gpio_shield_2_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_2_0/Arty_Z7_20_axi_gpio_shield_2_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_shield_2_0/Arty_Z7_20_axi_gpio_shield_2_0.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_axi_gpio_sw_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_sw_0/Arty_Z7_20_axi_gpio_sw_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_sw_0/Arty_Z7_20_axi_gpio_sw_0_board.xdc]
  read_xdc -ref Arty_Z7_20_axi_gpio_sw_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_sw_0/Arty_Z7_20_axi_gpio_sw_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_gpio_sw_0/Arty_Z7_20_axi_gpio_sw_0.xdc]
  read_xdc -ref Arty_Z7_20_axi_vdma_0_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_vdma_0_0/Arty_Z7_20_axi_vdma_0_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_vdma_0_0/Arty_Z7_20_axi_vdma_0_0.xdc]
  read_xdc -ref Arty_Z7_20_processing_system7_0_0 -cells inst c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_processing_system7_0_0/Arty_Z7_20_processing_system7_0_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_processing_system7_0_0/Arty_Z7_20_processing_system7_0_0.xdc]
  read_xdc -ref Arty_Z7_20_rgb2dvi_0_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rgb2dvi_0_0/src/rgb2dvi.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rgb2dvi_0_0/src/rgb2dvi.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_rst_processing_system7_0_100M_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_100M_0/Arty_Z7_20_rst_processing_system7_0_100M_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_100M_0/Arty_Z7_20_rst_processing_system7_0_100M_0_board.xdc]
  read_xdc -ref Arty_Z7_20_rst_processing_system7_0_100M_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_100M_0/Arty_Z7_20_rst_processing_system7_0_100M_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_100M_0/Arty_Z7_20_rst_processing_system7_0_100M_0.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_rst_processing_system7_0_142M_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_142M_0/Arty_Z7_20_rst_processing_system7_0_142M_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_142M_0/Arty_Z7_20_rst_processing_system7_0_142M_0_board.xdc]
  read_xdc -ref Arty_Z7_20_rst_processing_system7_0_142M_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_142M_0/Arty_Z7_20_rst_processing_system7_0_142M_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rst_processing_system7_0_142M_0/Arty_Z7_20_rst_processing_system7_0_142M_0.xdc]
  read_xdc -ref Arty_Z7_20_xadc_wiz_0_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xadc_wiz_0_0/Arty_Z7_20_xadc_wiz_0_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_xadc_wiz_0_0/Arty_Z7_20_xadc_wiz_0_0.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_proc_sys_reset_0_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_0/Arty_Z7_20_proc_sys_reset_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_0/Arty_Z7_20_proc_sys_reset_0_0_board.xdc]
  read_xdc -ref Arty_Z7_20_proc_sys_reset_0_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_0/Arty_Z7_20_proc_sys_reset_0_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_0/Arty_Z7_20_proc_sys_reset_0_0.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_proc_sys_reset_0_1 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_1/Arty_Z7_20_proc_sys_reset_0_1_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_1/Arty_Z7_20_proc_sys_reset_0_1_board.xdc]
  read_xdc -ref Arty_Z7_20_proc_sys_reset_0_1 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_1/Arty_Z7_20_proc_sys_reset_0_1.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_1/Arty_Z7_20_proc_sys_reset_0_1.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_clk_wiz_0_0 -cells inst c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_clk_wiz_0_0/Arty_Z7_20_clk_wiz_0_0_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_clk_wiz_0_0/Arty_Z7_20_clk_wiz_0_0_board.xdc]
  read_xdc -ref Arty_Z7_20_clk_wiz_0_0 -cells inst c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_clk_wiz_0_0/Arty_Z7_20_clk_wiz_0_0.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_clk_wiz_0_0/Arty_Z7_20_clk_wiz_0_0.xdc]
  read_xdc -prop_thru_buffers -ref Arty_Z7_20_proc_sys_reset_0_2 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_2/Arty_Z7_20_proc_sys_reset_0_2_board.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_2/Arty_Z7_20_proc_sys_reset_0_2_board.xdc]
  read_xdc -ref Arty_Z7_20_proc_sys_reset_0_2 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_2/Arty_Z7_20_proc_sys_reset_0_2.xdc
  set_property processing_order EARLY [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_proc_sys_reset_0_2/Arty_Z7_20_proc_sys_reset_0_2.xdc]
  read_xdc C:/sam_work/git/digilent/Arty-Z7-20-base/src/constraints/ARTY_Z7.xdc
  read_xdc -ref Arty_Z7_20_axi_vdma_0_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_vdma_0_0/Arty_Z7_20_axi_vdma_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_axi_vdma_0_0/Arty_Z7_20_axi_vdma_0_0_clocks.xdc]
  read_xdc -ref Arty_Z7_20_rgb2dvi_0_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rgb2dvi_0_0/src/rgb2dvi_clocks.xdc
  set_property processing_order LATE [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_rgb2dvi_0_0/src/rgb2dvi_clocks.xdc]
  read_xdc -ref Arty_Z7_20_v_axi4s_vid_out_0_0 -cells inst c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_v_axi4s_vid_out_0_0/Arty_Z7_20_v_axi4s_vid_out_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_v_axi4s_vid_out_0_0/Arty_Z7_20_v_axi4s_vid_out_0_0_clocks.xdc]
  read_xdc -ref Arty_Z7_20_v_tc_0_0 -cells U0 c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_v_tc_0_0/Arty_Z7_20_v_tc_0_0_clocks.xdc
  set_property processing_order LATE [get_files c:/sam_work/git/digilent/Arty-Z7-20-base/src/bd/Arty_Z7_20/ip/Arty_Z7_20_v_tc_0_0/Arty_Z7_20_v_tc_0_0_clocks.xdc]
  link_design -top Arty_Z7_20_wrapper -part xc7z020clg400-1
  write_hwdef -file Arty_Z7_20_wrapper.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design -directive RuntimeOptimized
  write_checkpoint -force Arty_Z7_20_wrapper_opt.dcp
  catch { report_drc -file Arty_Z7_20_wrapper_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design -directive RuntimeOptimized
  write_checkpoint -force Arty_Z7_20_wrapper_placed.dcp
  catch { report_io -file Arty_Z7_20_wrapper_io_placed.rpt }
  catch { report_utilization -file Arty_Z7_20_wrapper_utilization_placed.rpt -pb Arty_Z7_20_wrapper_utilization_placed.pb }
  catch { report_control_sets -verbose -file Arty_Z7_20_wrapper_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design -directive RuntimeOptimized
  write_checkpoint -force Arty_Z7_20_wrapper_routed.dcp
  catch { report_drc -file Arty_Z7_20_wrapper_drc_routed.rpt -pb Arty_Z7_20_wrapper_drc_routed.pb -rpx Arty_Z7_20_wrapper_drc_routed.rpx }
  catch { report_methodology -file Arty_Z7_20_wrapper_methodology_drc_routed.rpt -rpx Arty_Z7_20_wrapper_methodology_drc_routed.rpx }
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file Arty_Z7_20_wrapper_timing_summary_routed.rpt -rpx Arty_Z7_20_wrapper_timing_summary_routed.rpx }
  catch { report_power -file Arty_Z7_20_wrapper_power_routed.rpt -pb Arty_Z7_20_wrapper_power_summary_routed.pb -rpx Arty_Z7_20_wrapper_power_routed.rpx }
  catch { report_route_status -file Arty_Z7_20_wrapper_route_status.rpt -pb Arty_Z7_20_wrapper_route_status.pb }
  catch { report_clock_utilization -file Arty_Z7_20_wrapper_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force Arty_Z7_20_wrapper_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force Arty_Z7_20_wrapper.mmi }
  write_bitstream -force -no_partial_bitfile Arty_Z7_20_wrapper.bit 
  catch { write_sysdef -hwdef Arty_Z7_20_wrapper.hwdef -bitfile Arty_Z7_20_wrapper.bit -meminfo Arty_Z7_20_wrapper.mmi -file Arty_Z7_20_wrapper.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

