STOW := $(shell command -v stow 2> /dev/null)
ifndef STOW
DOWNLOAD_STOW  := 1
STOW_VER       := 2.3.1
STOW           := $(HOME)/bin/stow
endif

MKDIR := mkdir -p
COPY  := cp -f

.PHONY: stow vim_plugins deps tools tmux

stow: deps
	$(MKDIR) $(HOME)/bin
	$(STOW) -t $(HOME) tmux
	$(STOW) -t $(HOME) git
	$(STOW) -t $(HOME) bash
	$(STOW) -t $(HOME) csh
	$(STOW) -t $(HOME) astyle
	$(STOW) -t $(HOME) gdb
	$(STOW) -t $(HOME) x11
	$(STOW) -t $(HOME) vim
	$(MKDIR) $(HOME)/.vim
# i3
	$(MKDIR) $(HOME)/.config/i3
	$(STOW) -t $(HOME)/.config/i3 i3
	$(COPY) i3-keyboard-layout $(HOME)/bin
	$(COPY) setup_tmux_terminals.sh $(HOME)/bin
# helix
	$(MKDIR) $(HOME)/.config/helix
	$(STOW) -t $(HOME)/.config/helix helix
# nvim uses .config
	$(MAKE) setup_nvim
#	$(MKDIR) $(HOME)/.config/nvim
#	$(STOW) -t $(HOME)/.config/nvim nvim

tools:
	sudo apt-get install git cmake build-essential libtool flex \
	libtool-bin autotools-dev clang llvm gdb valgrind libevent-dev \
	ripgrep htop micro gawk bison graphviz pkg-config tcl-dev \
	libreadline-dev gperf autoconf

tmux:
	cd $(HOME)/repo && git clone https://github.com/tmux/tmux
	cd $(HOME)/repo/tmux && git checkout 3.2a
	cd $(HOME)/repo/tmux && sh autogen.sh
	cd $(HOME)/repo/tmux && ./configure --prefix=$(HOME)
	make -C $(HOME)/repo/tmux install -j 4

setup_nvim:
	git clone https://github.com/NvChad/NvChad $(HOME)/.config/nvim --depth 1
#	nvim +'hi NormalFloat guibg=#1e222a' +PackerSync
	$(STOW) -t $(HOME)/.config/nvim nvim

rm_nvim:
	$(RM) -r $(HOME)/.config/nvim
	$(RM) -r $(HOME)/.local/share/nvim
	$(RM) -r $(HOME)/.cache/nvim

vim_plugins:
	./setup_plugins.sh .vim
	./setup_plugins.sh .config/nvim

deps:
ifdef DOWNLOAD_STOW
	$(info "stow is not available. Downloading it...")
	wget http://ftp.gnu.org/gnu/stow/stow-$(STOW_VER).tar.gz
	tar -xvzf stow-$(STOW_VER).tar.gz
	cd stow-$(STOW_VER) && autoreconf -iv
	cd stow-$(STOW_VER) && ./configure --prefix=$(HOME)
	make -C stow-$(STOW_VER) install
endif
