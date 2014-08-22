# completion
autoload -U compinit && compinit
setopt no_auto_menu
setopt no_beep

# prompt
autoload -U colors && colors
setopt prompt_subst
PS1='%n@%m %F{cyan}%~%f $($HOME/.zsh/git-prompt)%(?..%F{red})%#%f '
RPS1='$($HOME/.zsh/rvm-prompt)%t'

# key bindings
bindkey -e
bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# history
HISTSIZE=2000
SAVEHIST=$HISTSIZE
HISTFILE=$HOME/.zsh_history
setopt append_history
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_no_store

# slashes aren't words
WORDCHARS=''

# comments are ok
setopt interactivecomments

source $HOME/.profile

