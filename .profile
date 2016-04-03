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
alias f='find . -iname'
alias o='open -a'

# git
if type git > /dev/null 2>&1; then
  alias s='git status'
  alias d='git diff'
  alias ds='git diff --staged'
  alias ff='git merge --ff-only'
fi

# homebrew
if type brew > /dev/null 2>&1; then
  export PATH="/usr/local/bin:$PATH"
fi

# git
if type git > /dev/null 2>&1; then
  alias s='git status'
  alias d='git diff'
  alias ds='git diff --staged'
  alias ff='git merge --ff-only'
fi

# android
if [ -d '/Applications/Android Studio.app' ]; then
  export PATH="$PATH:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools"
fi

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi
