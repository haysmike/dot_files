PS1='\u@\h \[\033[36m\]\w \[\033[00m\]$ '

# color ls!
export CLICOLOR='yes'
export LSCOLORS='gxfxcxdxbxegedabagacad'

# case insensitve searching, handle color, keep output on screen
export LESS='-iRX'

# color grep matches
export GREP_OPTIONS='--color=auto'

# aliases
alias ll='ls -lAh'
alias ..='cd ..'
alias ...='cd ../..'

