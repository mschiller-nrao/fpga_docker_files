# fpga_docker_files
The intent of this is to share EXAMPLE Dockers for commercial and opensource FPGA tools
These examples should be forked and used locally, as some things need customization.  Read each file you use for comments on customization that might be needed (eg License files) or where to download commercial tools to make docker work

For reference here's some known working example .gitlab ci yml files (Sorry I don't have the github action version written)

For Vivado Vol:
VivadoSynthesisWBFFT:
  variables:
    GIT_CLONE_PATH: $CI_BUILDS_DIR/$CI_CONCURRENT_ID/vivado/casper_dspdevel
    GIT_SUBMODULE_STRATEGY: recursive
  stage: VivadoSynthesis
  image : vivado_vol:2023.2
  needs: []
  tags:
    - vivado_vol
  script :
    - echo Starting Vivado Synthesis WBFFT
    - cd /tmp
    - git clone https://github.com/Xilinx/XilinxTclStore.git
    - cd $GIT_CLONE_PATH/casper_wb_fft/ngvla_test_proj
    - export LM_LICENSE_FILE=2100@cv-flexserverB.ad.nrao.edu:1717@cv-flexserverB.ad.nrao.edu
    - export XILINX_TCLAPP_REPO=/tmp/XilinxTclStore
    - export XILINX_LOCAL_USER_DATA=NO
    - rm -f *.jou
    - rm -f *.log
    - rm -f synth_output/post_synth.dcp
    - LD_PRELOAD=/lib/x86_64-linux-gnu/libudev.so.1 vivado -mode batch -source ngVLA_wbfft_test.tcl
  when: manual
  artifacts:
    when: always
    paths:
      - $GIT_CLONE_PATH/casper_wb_fft/ngvla_test_proj/*.jou
      - $GIT_CLONE_PATH/casper_wb_fft/ngvla_test_proj/*.log
      - $GIT_CLONE_PATH/casper_wb_fft/ngvla_test_proj/hs_err*
      - $GIT_CLONE_PATH/casper_wb_fft/ngvla_test_proj/report.xml
      - $GIT_CLONE_PATH/casper_wb_fft/ngvla_test_proj/synth_output/post_synth.dcp
    reports:
      junit: $GIT_CLONE_PATH/casper_wb_fft/ngvla_test_proj/report.xml
