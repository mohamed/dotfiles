#!/usr/bin/env sh

set -eu

session=ev
editor=editor
build=build
tests=tests

proj_dir="/SCRATCH/mohamed/proj"
sleep_time=2s

tmux new -s ${session} -d
echo "${session} session created"

tmux rename-window -t ${session}:0 "${editor}"
tmux send-keys -t ${session}:${editor} "cd ${proj_dir}" Enter

tmux new-window -P -c ${proj_dir} -t ${session}:1 -n "${build}"
tmux send-keys -t ${session}:${build} "cd ${proj_dir}" Enter
tmux send-keys -t ${session}:${build} "source setup.sh" Enter
sleep ${sleep_time}

tmux split-window -h -c ${proj_dir} -t ${session}:${build}
tmux send-keys -t ${session}:${build}.1 "cd ${proj_dir}" Enter
tmux send-keys -t ${session}:${build}.1 "source setup.sh" Enter
sleep ${sleep_time}

tmux new-window -P -c ${proj_dir} -t ${session}:2 -n "${tests}"
tmux send-keys -t ${session}:${tests} "cd ${proj_dir}" Enter
tmux send-keys -t ${session}:${tests} "source setup.sh" Enter

echo "All done"
