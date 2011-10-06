autoload -U compinit && compinit

autoload -U colors && colors
PS1="%n@%m %{$fg[cyan]%}%~%{$reset_color%} %% "

source .profile
