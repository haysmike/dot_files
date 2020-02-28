#!/usr/bin/env bash
set -e

input='/dev/tty'

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
if ! command -v brew; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < $input
fi
brew doctor || read -r -p 'There are issues with Homebrew. Please review and press Enter to continue. ' < $input
PATH=/usr/local/bin:$PATH

echo
echo 'Installing command-line utilities...'
# Homebrew tries to update itself every time a command is run, so call as few times as possible
brews=(git zsh neovim ripgrep proctools hub jq rmtrash shellcheck)
brew install "${brews[@]}" || brew upgrade "${brews[@]}"

echo
echo 'Installing apps...'
# `brew cask install` doesn't accept a list.
cask_install () {
  if ! [ -e "/Applications/$2.app" ]; then
    brew cask install "$1" || echo
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
  read -r -p 'Press Enter to continue. ' < $input
fi

echo
echo 'Installing dot files...'
link_dotfile () {
  if ! [ -e "$HOME/$1" ]; then
    ln -s "$HOME/code/dot_files/$1" "$HOME"
  fi
}
if ! [ -d "$HOME/code/dot_files" ]; then
  git clone git@github.com:murkey/dot_files.git "$HOME/code/dot_files"
fi
link_dotfile .profile
link_dotfile .zsh
link_dotfile .zshrc
link_dotfile .config
link_dotfile .psqlrc

echo
echo 'Switching to zsh...'
zsh_path='/usr/local/bin/zsh'
if ! grep --fixed-strings $zsh_path /etc/shells > /dev/null 2>&1; then
  sudo --preserve-env bash -c "echo $zsh_path >> /etc/shells"
fi
sudo chsh -s $zsh_path "$USER"

echo
echo 'Setting up Firefox'
if ! [ -d "$HOME/Library/Application Support/Firefox/Profiles" ] > /dev/null 2>&1; then
  open -a Firefox
  sleep 3
fi
find "$HOME/Library/Application Support/Firefox/Profiles" -type d -depth 1 -exec ln -s "$HOME/code/dot_files/firefox/chrome" {} \;

echo
echo 'Setting up Visual Studio Code...'
'/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' --install-extension 'shan.code-settings-sync'
if ! command -v code > /dev/null 2>&1; then
  echo $'CONFIGURE VISUAL STUDIO CODE

1. Use the command palette to install the `code` command (Cmd+Shift+P and search for "install code command")
4. Use the command palette to download settings via the Settings Sync extension (search for "download settings")
3. Close this file.' | '/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code' --wait -
fi

read -r -n 1 -p 'Update and restart [y/N]? ' yn < $input
echo
case $yn in
  [Yy]* ) sudo softwareupdate --install --all --restart;;
esac

sudo --reset-timestamp
