#!/usr/bin/env sh

set -eu

session=whc
whc_src=src
whc_build=build
whc_tests=tests
BOOST_ROOT=/hpc/shared/eb_apps/rhel6/boost/1.60.0-foss-2016a-Python-2.7.11


proj_dir="/pscratch/$USER/repo/motk"
setup_cmd="cd /pscratch/$USER/repo/motk && source $HOME/source_motk_modules.sh && source env-motk -r -c symbols -B $BOOST_ROOT && export PATH=$HOME/bin:$PATH && export LD_LIBRARY_PATH=$HOME/lib:$HOME/lib64:     $LD_LIBRARY_PATH"
sleep_time=2s

tmux new -s ${session} -d
echo "${session} session created"

tmux new-window -c ${proj_dir} -t ${session} -n "${whc_src}"
sleep ${sleep_time}
tmux send-keys -t ${whc_src} "${setup_cmd}" Enter
echo "${session}:${whc_src} window created"

tmux new-window -c ${proj_dir} -t ${session} -n "${whc_build}"
sleep ${sleep_time}
tmux send-keys -t ${whc_build} "${setup_cmd}" Enter
echo "${session}:${whc_build} window created"

tmux new-window -c ${proj_dir} -t ${session} -n "${whc_tests}"
sleep ${sleep_time}
tmux send-keys -t ${whc_tests} "${setup_cmd}" Enter
echo "${session}:${whc_tests} window created"
