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
alias tclsh='rlwrap tclsh'

# git
alias s='git status'
alias d='git diff'

# path
export PATH='/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin'

[[ -s "/Users/chineseroommate/.rvm/scripts/rvm" ]] && source "/Users/chineseroommate/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
