COPY := cp -Rf

install:
	${COPY} .vimrc      ${HOME}/.vimrc
	${COPY} .gitconfig  ${HOME}/.gitconfig
	${COPY} .gvimrc     ${HOME}/.gvimrc
	${COPY} .alias      ${HOME}/.alias
	${COPY} .bashrc     ${HOME}/.bashrc
	${COPY} .profile    ${HOME}/.profile
	${COPY} .tmux.conf  ${HOME}/.tmux.conf
	${COPY} .Xresources  ${HOME}/.Xresources
	${COPY} .plan        ${HOME}/.plan
	mkdir -p ${HOME}/.config/nvim
	mkdir -p ${HOME}/.vim
	${COPY} init.vim ${HOME}/.config/nvim/
	${COPY} coc.vim ${HOME}/.config/nvim/
	${COPY} coc-settings.json ${HOME}/.config/nvim/
	${COPY} setup_plugins.sh ${HOME}/.config/nvim/
	${HOME}/.config/nvim/setup_plugins.sh
