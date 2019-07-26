#!/usr/bin/env bash

set -eu

declare -a plugins=(
    "neoclide/coc.nvim"
    "scrooloose/nerdtree"
    "majutsushi/tagbar"
    "nfvs/vim-perforce"
    "vim-airline/vim-airline"
    "vim-airline/vim-airline-themes"
    "rhysd/vim-clang-format"
    "junegunn/fzf"
)

SERVER="https://github.com"
DEST=$HOME/.config/nvim/pack/plugins/start/

mkdir -p $DEST
echo "$DEST created..."

function get_plugin() {
  repo=$SERVER/$1
  echo "Cloning $repo"
  folder=`basename $1`
  rm -rf $DEST/$folder
  git clone $repo $DEST/$folder
}

for p in "${plugins[@]}"
do
  get_plugin $p &
done

for job in `jobs -p`
do
  echo "Waiting for job $job to finish..."
  wait $job
done

# Handle coc.vim
cd $DEST/coc.nvim && ./install.sh nightly
# Handle fzf
cd $DEST/fzf && ./install --all

echo "$0 finished successfully..."
