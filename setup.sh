#!/bin/bash

set -e
set -u

readonly THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
readonly TMUX_CONF_FILE_HOME="$HOME/.tmux.conf"
readonly TMUX_CONF_FILE_REPO="$THIS_SCRIPT_DIR/tmux.conf"

if [ -f "$TMUX_CONF_FILE_HOME" ]
then
	echo ".tmux.conf file exists: create backup file .tmux.conf.bak"
	mv "$TMUX_CONF_FILE_HOME" "$TMUX_CONF_FILE_HOME.bak"
fi

if [ -L "$TMUX_CONF_FILE_HOME" ]
then
	echo ".tmux.conf file is a symbolic link. Remove!"
	ls -l "$TMUX_CONF_FILE_HOME"
	rm -f  "$TMUX_CONF_FILE_HOME"
fi


pushd $HOME &> /dev/null
ln -s $TMUX_CONF_FILE_REPO $TMUX_CONF_FILE_HOME

