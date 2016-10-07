COPY := cp -Rf

install:
	# Files
	${COPY} .vimrc      ${HOME}/.vimrc
	${COPY} .gitconfig  ${HOME}/.gitconfig
	${COPY} .gvimrc     ${HOME}/.gvimrc
	${COPY} .alias      ${HOME}/.alias
	${COPY} .bashrc     ${HOME}/.bashrc
	# Directories
	${COPY} .vim        ${HOME}/
