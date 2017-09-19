#!/usr/bin/env sh

set -eu

session=bbtnr
device=device
system=system
tests=tests

setup_cmd="cd ~/master_ipu_models/icg-simulator-trunk && source set_project_env.sh -w IP_ipu_models -m ipu_models -p_sim ipu6_a0"
sleep_time=15s

tmux new -s ${session} -d
echo "${session} session created"

cmd="cd subIP/bb_ff/source/hive/devices/bbtnr/hss"
tmux new-window -n ${device} "${setup_cmd}"
sleep ${sleep_time}
tmux send-keys -t ${device} "${cmd}" Enter
echo "${device} window created"

cmd="cd subIP/bb_ff/source/hive/systems/ipu6/bbtnr_test_system"
tmux new-window -n ${system} "${setup_cmd}"
sleep ${sleep_time}
tmux send-keys -t ${system} "${cmd}" Enter
echo "${system} window created"

cmd="cd subIP/bb_ff/source/hive/systems/ipu6/bbtnr_test_system/tests"
tmux new-window -n ${tests} "${setup_cmd}"
sleep ${sleep_time}
tmux send-keys -t ${tests} "${cmd}" Enter
echo "${tests} window created"
