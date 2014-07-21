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
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias .........='cd ../../../../../../../..'
alias o='open -a'

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
  export PATH=/usr/local/bin:$PATH
fi

if [ -d "/Applications/Android Studio.app" ]; then
  export PATH=$PATH:/Applications/Android\ Studio.app/sdk/tools:/Applications/Android\ Studio.app/sdk/platform-tools
fi

# rvm
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
  source "$HOME/.rvm/scripts/rvm"
fi

