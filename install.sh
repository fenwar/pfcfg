#!/bin/bash
# Install basic symlinks only
# Assume git is already installed and we have sudo
# Other packages:
#  tmux
#  ack dwdiff diffutils patchutils entr
#  vim-nox vim-command-t vim-youcompleteme exuberant-ctags
#  tree rsync lm-sensors

REPO_PATH=$(realpath $(dirname $0))

ln -sf ${REPO_PATH}/.ackrc ${HOME}/.ackrc
ln -sf ${REPO_PATH}/.bash_aliases ${HOME}/.bash_aliases
ln -sf ${REPO_PATH}/.dwdiffrc ${HOME}/.dwdiffrc
ln -sf ${REPO_PATH}/.tmux.conf ${HOME}/.tmux.conf
ln -sf ${REPO_PATH}/.vimrc ${HOME}/.vimrc

git config --global core.excludesFile ${REPO_PATH}/.pf-gitignore
git config --global init.defaultBranch main
git config --global push.default current
