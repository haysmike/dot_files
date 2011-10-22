# completion
autoload -U compinit && compinit
setopt no_auto_menu

# prompt
autoload -U colors && colors
PROMPT="%n@%m %{$fg[cyan]%}%~%{$reset_color%} %% "

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history

# history
export HISTSIZE=1024
export SAVEHIST=1024
export HISTFILE=~/.zsh_history
setopt append_history
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_no_store

source $HOME/.profile

