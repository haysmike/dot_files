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
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'

# tcl
if type rlwrap > /dev/null 2>&1; then
  alias tclsh='rlwrap tclsh'
fi

# git
if type git > /dev/null 2>&1; then
  alias s='git status'
  alias d='git diff'
  alias ds='git diff --staged'
fi

# path
if type brew > /dev/null 2>&1; then
  export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin'
fi

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

