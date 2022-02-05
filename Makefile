STOW := $(shell command -v stow 2> /dev/null)
ifndef STOW
DOWNLOAD_STOW  := 1
STOW_VER       := 2.3.1
STOW           := $(HOME)/bin/stow
endif

MKDIR := mkdir -p

.PHONY: stow vim_plugins deps tools tmux

stow: deps
	$(STOW) tmux
	$(STOW) git
	$(STOW) bash
	$(STOW) csh
	$(STOW) astyle
	$(STOW) gdb
	$(STOW) x11
	$(STOW) vim
	$(MKDIR) $(HOME)/.vim
# nvim uses .config
	$(MKDIR) $(HOME)/.config/nvim
	stow -t $(HOME)/.config/nvim nvim

tools:
	sudo apt-get install git cmake build-essential libtool flex \
	libtool-bin autotools-dev clang llvm gdb valgrind libevent-dev \
	ripgrep

tmux:
	cd $(HOME)/repo && git clone https://github.com/tmux/tmux
	cd $(HOME)/repo/tmux && git checkout 3.2a
	cd $(HOME)/repo/tmux && sh autogen.sh
	cd $(HOME)/repo/tmux && ./configure --prefix=$(HOME)
	make -C $(HOME)/repo/tmux install -j 4


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
