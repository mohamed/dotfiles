#!/usr/bin/env bash

set -eu

declare -a plugins=(
    "scrooloose/nerdtree"
    "majutsushi/tagbar"
#    "nfvs/vim-perforce"
    "vim-airline/vim-airline"
    "vim-airline/vim-airline-themes"
#    "rhysd/vim-clang-format"
    "junegunn/fzf"
    "junegunn/fzf.vim"
#    "jamespwilliams/bat.vim"
    "altercation/vim-colors-solarized"
#    "jackguo380/vim-lsp-cxx-highlight"
    "neovim/nvim-lspconfig"
    "nvim-lua/completion-nvim"
    "nvim-treesitter/nvim-treesitter"
)

SERVER="https://github.com"
[ -z "$1" ] && echo "No argument supplied" && exit 1
DEST=$HOME/${1}/pack/plugins/start/

rm -rf $DEST
echo "Deleting existing $DEST"

mkdir -p $DEST
echo "$DEST created..."

function get_plugin() {
  repo=$SERVER/$1
  echo "Cloning $repo"
  folder=`basename $1`
  git clone $repo $DEST/$folder
}

for p in "${plugins[@]}"
do
  get_plugin $p &
done

echo "### Waiting for pending jobs"
wait < <(jobs -p) || exit

# Handle coc.vim
#cd ${DEST} && curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz | tar xzfv -
# Handle fzf
cd $DEST/fzf && ./install --all

echo "$0 finished successfully..."
