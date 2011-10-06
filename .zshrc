autoload -U compinit && compinit

autoload -U colors && colors
PROMPT="%n@%m %{$fg[cyan]%}%~%{$reset_color%} %% "

source .profile
