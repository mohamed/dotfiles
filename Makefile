COPY := cp -Rf

install:
	# Files
	${COPY} .vimrc      ${HOME}/.vimrc
	${COPY} .gitconfig  ${HOME}/.gitconfig
	${COPY} .gvimrc     ${HOME}/.gvimrc
	${COPY} .alias      ${HOME}/.alias
	${COPY} .bashrc     ${HOME}/.bashrc
	${COPY} .profile    ${HOME}/.profile
	${COPY} .tmux.conf  ${HOME}/.tmux.conf
	${COPY} .Xresources  ${HOME}/.Xresources
	# Directories
	${COPY} .vim        ${HOME}/
