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

# and my scripts please
if [ -d "$HOME/.scripts" ] ; then
    PATH="$HOME/.scripts:$PATH"
fi

# and shome Java for Jedit
JAVA_HOME=/usr/lib/jvm/java-6-sun/jre

# LFS root
export LFS=/mnt/lfs

# touchpad scrolly area that I keep hitting by mistake
synclient RightEdge=5600

# easier than hacking hosts
export XPHOME=192.168.11.2
export HISENSE=192.168.11.7

export CLASSPATH=$CLASSPATH:/usr/share/jedit/jedit.jar:/home/paul/.jedit/jars/ProjectViewer.jar

# gvfs-mount smb://192.168.1.1/downloads/

source /usr/local/bin/virtualenvwrapper.sh
export PATH

export TERM='xterm-256color'

