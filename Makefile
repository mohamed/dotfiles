STOW  := stow -t $(HOME)
MKDIR := mkdir -p

.PHONY: stow vim_plugins

stow:
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

vim_plugins:
	./setup_plugins.sh .vim
	./setup_plugins.sh .config/nvim
