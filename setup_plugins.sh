#!/usr/bin/env bash

set -eu

declare -a plugins=("VundleVim/Vundle.vim"
    "neoclide/coc.nvim"
    "scrooloose/nerdtree"
    "majutsushi/tagbar"
    "nfvs/vim-perforce"
    "vim-airline/vim-airline"
    "vim-airline/vim-airline-themes"
    "rhysd/vim-clang-format"
    "junegunn/fzf"
)

server="https://github.com"
dest=$HOME/.config/nvim/pack/plugins/start/

#mkdir -p $dest
echo "$dest created..."

for p in "${plugins[@]}"
do
  repo=$server/$p
  echo "Cloning $repo"
  folder=`basename $p`
  git clone $repo $dest/$folder
done

# Handle coc.vim
cd $dest/coc.nvim && ./install.sh nightly
# Handle fzf
cd $dest/fzf && ./install --all
