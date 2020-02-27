#!/usr/bin/env bash
set -e

sudo --validate

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
brew doctor || read -p 'There are issues with `brew`. Press Enter to continue. '
PATH=/usr/local/bin:$PATH

echo
echo 'Installing command-line utilities...'
brew_install () {
  brew install $1 || brew upgrade $1
}
brew_install git
brew_install zsh
brew_install neovim
brew_install ripgrep
brew_install proctools
brew_install hub
brew_install jq
brew_install rmtrash
brew_install shellcheck

echo
echo 'Installing apps...'
# `brew cask install` doesn't accept a list.
cask_install () {
  if ! [ -e "/Applications/$2.app" ]; then
    brew cask install $1 || echo
  fi
}
# Install 1Password first since lots of things depend on it.
cask_install 1password '1Password 7' # Not sure how to maintain this version number :/
cask_install iterm2 'iTerm'
cask_install visual-studio-code 'Visual Studio Code'
cask_install google-chrome 'Google Chrome'
cask_install firefox 'Firefox'
cask_install slack 'Slack'
cask_install docker 'Docker'

echo 'Creating SSH key...'
if ! [ -f ~/.ssh/id_rsa.pub ]; then
  # https://help.github.com/articles/connecting-to-github-with-ssh/
  ssh-keygen -t rsa -b 4096 -N '' -f ~/.ssh/id_rsa
  pbcopy < ~/.ssh/id_rsa.pub

  echo 'New SSH public key copied. Add it to your account here: https://github.com/settings/keys.'
  open -a Firefox https://github.com/settings/keys
  read -p 'Press Enter to continue. '
fi

echo
echo 'Installing dot files...'
link_dotfile () {
  if [ ! -e "$1" ]; then
    ln -s "$HOME/code/dot_files/$1" "$HOME"
  fi
}
if ! [ -d $HOME/code/dot_files ]; then
  git clone git@github.com:murkey/dot_files.git $HOME/code/dot_files
fi
link_dotfile .profile
link_dotfile .zsh
link_dotfile .zshrc
link_dotfile .config
link_dotfile .psqlrc

echo
echo 'Switching to zsh...'
zsh_path='/usr/local/bin/zsh'
if ! grep --fixed-strings $zsh_path < /etc/shells; then
  sudo --preserve-env bash -c "echo $zsh_path >> /etc/shells"
fi
sudo chsh -s $zsh_path $USER

echo
echo 'Setting up Visual Studio Code...'
'/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' --install-extension 'shan.code-settings-sync'
if ! type code > /dev/null 2>&1; then
  echo $'CONFIGURE VISUAL STUDIO CODE

1. Use the command palette to install the `code` command (Cmd+Shift+P and search for "install code command")
4. Use the command palette to download settings via the Settings Sync extension (search for "download settings")
3. Close this file.' | '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' --wait -
fi

read -p 'Update and restart [yN]? ' yn
case $yn in
  [Yy]* ) sudo softwareupdate --install --all --restart; break;;
esac

sudo --reset-timestamp
