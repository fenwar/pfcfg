#!/bin/bash
alias tma="tmux attach || tmux"

alias gd="clear && git diff"
alias gdc="clear && git diff --cached"
alias gap="clear && git add -p"
alias gs="git status"
alias gsu="git status -u"
alias gsi="git status -u --ignored"
alias gc="git commit"
alias gcm="git commit -m"
alias gpf="git pull --ff"

alias ap="aptitude"
alias sau="sudo aptitude update"
alias asus="sudo aptitude safe-upgrade -sy"
alias asuy="sudo aptitude safe-upgrade -y"
alias vpn="xdg-open ~/Desktop/vpn-parkway.desktop"
alias deletertidb="ant init.cleanup.db -Ddev.cleanup.db=True"
alias R=". rti"
alias apu="aptitude search ~U -F \"%c%S%M %a %p %v %V %t %r %d\""
alias gbn="git branch --no-merged"
alias gbm="git branch --merged"
alias stt=". set_term_title"
alias gfo="git fetch origin"
alias gfp="git fetch --prune"

alias ncsa="networkctl status -a"
alias srsn="sudo systemctl restart systemd-networkd.service"

# alias gffs="git flow feature start "
# alias gfff="#git flow feature finish "
# alias gffc="git flow feature checkout "
# alias gffp="git flow feature publish "
# alias gff="git flow feature "

# alias vims="vim --servername VIM"
# alias vimr="vim --servername VIM --remote"

alias GB="git rev-parse --symbolic-full-name --abbrev-ref HEAD"
alias gitup="cd \$(git rev-parse --show-toplevel)"
alias gu="cd \$(git rev-parse --show-toplevel)"
alias cdup="cd \$(git rev-parse --show-toplevel)"

# alias gbi="git branch --no-merged | xargs -i__ git log -1 --format=format:\"%w($(tput cols),0,81)__ %>|(80,mtrunc)%d %N\" __"
# alias gbi="git branch --no-merged | xargs -i__ git log -1 --format=format:\"%w($(tput cols),0,48)__%>>|(47,trunc)%h%d%n%N\" __"
alias gbi="git branch --no-merged | grep -v \"^  archive/\" | xargs -i__ git log -1 --format=format:\"__%>>|(47,trunc)%h%d%n%w($(tput cols),48,48)%N\" __"
alias gcln="git clean -dxn -e tags -e .*.sw? -e .venv"
alias gclf="git clean -dxf -e tags -e .*.sw? -e .venv"

alias gbmc="git branch --merged | grep -v \"^*\" | grep -Pv \"develop-\d\d\" | xargs -r git branch -d"

# List all source files, including unversioned but relevant files
# (so for example this lists unversioned .py files without including all the .pyc's):
alias gls="git ls-files -cmo --exclude-standard"

alias wd="dwdiff --profile=rich --diff-input | less -RFXm"
alias dw="dwdiff --profile=rich"

alias less="less -RFXm"

alias ha="history -a"
alias hn="history -n"

alias lsd='DISPLAY= cacademo'

alias dj='python src/manage.py'

alias va='. .venv/bin/activate'

alias hunkgrep="grepdiff --output-matching=hunk"
