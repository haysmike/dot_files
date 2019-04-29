# color ls!
export CLICOLOR='yes'
export LSCOLORS='gxfxcxdxbxegedabagacad'

# case insensitve searching, handle color, keep output on screen
export LESS='-iRX'

# color grep matches
export GREP_OPTIONS='--color=auto'

# default editor
export EDITOR='nvim'

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

# git
if type git > /dev/null 2>&1; then
  alias g='git'
  alias s='git status --show-stash --untracked-files=all'
  alias l='git log --stat'
  alias lg='git log --oneline --graph'
  alias d='git diff'
  alias ds='git diff --staged'
  alias co='git checkout'
  alias p='git pull'
  alias ff='git merge --ff-only'
  alias a='git add'
  alias cv='git commit -v'
fi

# homebrew
if type brew > /dev/null 2>&1; then
  export PATH="/usr/local/bin:$PATH"
fi

# neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# ag
if type ag > /dev/null 2>&1; then
  alias ag='ag -C2 --ignore-dir .git --ignore-dir build --ignore-dir node_modules --pager less'
fi

# android
if [ -d '/Applications/Android Studio.app' ]; then
  export PATH="$PATH:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools"
fi

# yarn
if type yarn > /dev/null 2>&1; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  alias y='yarn'
fi

# nodenv
if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
  export PATH="./node_modules/.bin:$PATH"
fi

# rbenv
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# pyenv
if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
