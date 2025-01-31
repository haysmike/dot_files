export CLICOLOR='yes'
# Make directories cyan since blue is hard to see on dark backgrounds
export LSCOLORS='gxfxcxdxbxegedabagacad'

# Search using smart-case, verbose prompt, handle ANSI color characters, keep output on screen
export LESS='--ignore-case --LONG-PROMPT --RAW-CONTROL-CHARS --no-init'

export GREP_OPTIONS='--color=auto'

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

alias f='find . -iname'

eval "$(/opt/homebrew/bin/brew shellenv)"

# export PATH="$HOME/.cargo/bin:$PATH"
