#!/usr/bin/env bash
set -e

sudo --validate || sudo --prompt='Password: ' echo "Granted sudo access by $(whoami)"

echo
echo 'Setting preferences...'
# Normal scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool 'NO'

# Disable prompt when double-tapping fn
defaults write com.apple.HIToolbox AppleDictationAutoEnable -int '0'

# Show all files
defaults write com.apple.finder AppleShowAllFiles -bool 'YES'

# Normal key repeat
defaults write -g ApplePressAndHoldEnabled -bool 'NO'

echo
echo 'Installing Homebrew...'
if ! which -s brew; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/HomeBrew/install/master/install)" < $input
fi
brew doctor
PATH=/usr/local/bin:$PATH

echo
echo 'Installing command-line utilities...'
brew install git
brew install zsh neovim ripgrep pgrep pkill hub jq

# need 1password installed to log into github before setting up ssh keys
echo
echo 'Installing apps...'
cask_install () {
  brew cask install $1 || echo
}
export HOMEBREW_CASK_OPTS='--appdir=/Applications'
brew tap caskroom/cask
cask_install 1password
cask_install iterm2
cask_install visual-studio-code
cask_install google-chrome
cask_install firefox
cask_install slack

echo 'Creating SSH key...'
if ! [ -f ~/.ssh/id_rsa.pub ]; then
  # https://help.github.com/articles/connecting-to-github-with-ssh/
  ssh-keygen -t rsa -b 4096 -N '' -f ~/.ssh/id_rsa
  pbcopy < ~/.ssh/id_rsa.pub

  echo 'New SSH public key copied. Add it to your account here: https://github.com/settings/keys.'
  read -p 'Press Enter to continue'
fi

echo
echo 'Installing dot files...'
link_dottile () {
  if [[ ! -e "$1" ]]; then
    ln -s "$HOME/code/dot_files/$1" "$HOME"
  fi
}
if ! [ -d $HOME/code/dot_files ]; then
  git clone git@github.com:murkey/dot_files.git $HOME/code/dot_files
fi
link_dottile .profile
link_dottile .zsh
link_dottile .zshrc

echo
echo 'Switching to zsh...'
zsh_path='/usr/local/bin/zsh'
if ! grep --fixed-strings $zsh_path < /etc/shells; then
  sudo --preserve-env bash -c "echo $zsh_path >> /etc/shells"
fi
sudo chsh -s $zsh_path $USER

sudo softwareupdate --install --all --restart

sudo -k
