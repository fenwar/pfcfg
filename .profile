# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# include my HMRC tools and helpdesk scripts in my path
if [ -d "$HOME/hmrc-tools" ] ; then
    PATH="$HOME/hmrc-tools:$PATH"
fi
if [ -d "$HOME/helpdesk" ] ; then
    PATH="$HOME/helpdesk:$PATH"
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[00;32m\]\u@\h:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "(%s)")\[\033[00;32m\]\$\[\033[00m\] '

export EDITOR=vim

# only set TERM if it's not already arrived from the environment
if [[ "${TERM}" == "xterm" ]] ; then
    export TERM=gnome-256color
fi

export GTK2_RC_FILES=${HOME}/.gtkrc-2.0
#export PATH

#export ANT_HOME=/usr/share/ant
#export PYTHONSTARTUP=${HOME}/.pythonrc

export PYTHONSTARTUP=${HOME}/pfcfg/.pythonrc
