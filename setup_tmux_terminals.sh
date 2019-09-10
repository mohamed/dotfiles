#!/usr/bin/env sh

set -eu

session=proj
src=src
build=build
tests=tests

proj_dir="$HOME/develop/tools/proj"
sleep_time=2s

tmux new -s ${session} -d
echo "${session} session created"

tmux rename-window -t ${session}:0 "${src}"
tmux send-keys -t ${session}:${src} "cd ${proj_dir}/src" Enter

tmux new-window -P -c ${proj_dir} -t ${session}:1 -n "${build}"
tmux send-keys -t ${session}:${build} "cd ${HOME}/build" Enter

tmux new-window -P -c ${proj_dir} -t ${session}:2 -n "${tests}"
tmux send-keys -t ${session}:${tests} "cd tests" Enter

echo "All done"
