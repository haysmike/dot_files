autoload -U compinit && compinit

autoload -U colors && colors
PROMPT="%n@%m %{$fg[cyan]%}%~%{$reset_color%} %% "

bindkey "\e[1~" beginning-of-line
bindkey "\e[2~" quoted-insert
bindkey "\e[3~" delete-char
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history

source .profile

