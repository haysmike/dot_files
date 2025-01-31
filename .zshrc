autoload -U compinit && compinit
unsetopt AUTO_MENU
unsetopt BEEP

autoload -U colors && colors
setopt prompt_subst
PS1='%n@%m %F{cyan}%~%f $($HOME/.zsh/git-prompt)%(?..%F{red})♪%f '

# Set the title to the current dir when the prompt renders.
# This is mostly to clear out "leftovers" from commands like `ssh` and `vim`.
precmd() {
  print -Pn - '\e]0;%~\a'
}

# Set to emacs mode just in case `EDITOR` is set to vim variant.
bindkey -e
# Delete (forward)
bindkey "\e[3~" delete-char

HISTSIZE=20000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE

# Treat any non-alphanumeric character as word boundary for forward-word/backward-word/delete-word.
WORDCHARS=''

# Don't remove spaces after auto-completion when next character is...
ZLE_SPACE_SUFFIX_CHARS='&|'

setopt INTERACTIVE_COMMENTS

. "$HOME/.profile"
