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
alias o='open -a'

# git
if type git > /dev/null 2>&1; then
  alias g='git'
  alias s='git status --show-stash'
  alias sp='git show -p'
  alias l='git log --stat'
  alias lg='git log --oneline --graph'
  alias d='git diff'
  alias ds='git diff --staged'
  alias co='git checkout'
  alias a='git add'
  alias an='git add -N'
  alias ap='git add -p'
  alias cv='git commit -v'
  alias cn='git commit --amend --no-edit'
  alias ff='git merge --ff-only'
  alias p='git pull'
  alias pu='git push -u'
fi

# homebrew
if type brew > /dev/null 2>&1; then
  export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
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

# rbenv
if [ -d "$HOME/.rbenv" ]; then
  eval "$(rbenv init -)"
fi
