# shellcheck shell=sh

# color ls!
export CLICOLOR='yes'
export LSCOLORS='gxfxcxdxbxegedabagacad'

# smart-case searching, verbose prompt, handle ANSI color characters, keep output on screen
export LESS='--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --no-init'

# color grep matches
export GREP_OPTIONS='--color=auto'

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

# git
if type git > /dev/null 2>&1; then
  alias g='git'

  alias a='git add'
  alias ci='git commit'
  alias co='git checkout'
  alias d='git diff'
  alias ds='git diff --staged'
  alias ff='git merge --ff-only'
  alias l='git log --stat'
  alias lg='git log --oneline --graph'
  alias p='git pull'
  alias s='git status --show-stash --untracked-files=all'
fi

# homebrew
if type brew > /dev/null 2>&1; then
  export PATH="/usr/local/bin:$PATH"
fi

# neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# ripgrep
if type rg > /dev/null 2>&1; then
  # https://github.com/BurntSushi/ripgrep/issues/86
  rg() {
    if [ -t 1 ]; then
      command rg --smart-case --hidden -B2 -A2 --pretty "$@" | less
    else
      command rg "$@"
    fi
  }
  alias f='rg --files --iglob'
else
  alias f='find . -iname'
fi

# android
if [ -d '/Applications/Android Studio.app' ]; then
  export PATH="$PATH:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools"
fi

# JavaScript
# yarn
if type yarn > /dev/null 2>&1; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
  alias y='yarn'
fi
# nodenv
if type nodenv > /dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
# node-build-update-defs
if [ -d '/usr/local/opt/node-build-update-defs/share/node-build' ] > /dev/null 2>&1; then
  NODE_BUILD_DEFINITIONS="$(brew --prefix node-build-update-defs)/share/node-build"
  export NODE_BUILD_DEFINITIONS
fi
# needs to come after yarn/nodenv config
# TODO should probably check for node/npm/yarn....?
export PATH="./node_modules/.bin:$PATH"

# rbenv
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# pyenv
if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# rust
if [ -d "$HOME/.cargo/bin" ] > /dev/null 2>&1; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi
