STOW  := stow -t $(HOME)
MKDIR := mkdir -p

install:
	$(STOW) tmux
	$(STOW) git
	$(STOW) bash
	$(STOW) csh
	$(STOW) astyle
	$(STOW) gdb
	$(STOW) x11
	$(STOW) vim
	$(MKDIR) $(HOME)/.vim
	./setup_plugins.sh .vim
	# nvim uses .config
	$(MKDIR) $(HOME)/.config/nvim
	stow -t $(HOME)/.config/nvim nvim
	./setup_plugins.sh .config/nvim
