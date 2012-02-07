# color ls!
export CLICOLOR='yes'
export LSCOLORS='gxfxcxdxbxegedabagacad'

# case insensitve searching, handle color, keep output on screen
export LESS='-iRX'

# color grep matches
export GREP_OPTIONS='--color=auto'

# default editor
export EDITOR='vim'

# aliases
alias ll='ls -lAh'
alias ..='cd ..'
alias ...='cd ../..'

# tcl
[[ -n $(whence rlwrap) ]] && alias tclsh='rlwrap tclsh'

# git
if [[ -n $(whence git) ]]; then
  alias s='git status'
  alias d='git diff'
fi

# path
[[ -n $(whence brew) ]] && export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin'

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

