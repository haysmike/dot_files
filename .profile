# color ls!
export CLICOLOR='yes'
export LSCOLORS='gxfxcxdxbxegedabagacad'

# case insensitve searching, handle color, keep output on screen
export LESS='-iRX'

# color grep matches
export GREP_OPTIONS='--color=auto'

# thpppppppppppppppt!
export ACK_OPTIONS='--smart-case -C5'

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
