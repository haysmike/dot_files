# Dot Files

These are my macOS config files 🤷🏻‍♂️

## Useful Commands

Some useful commands when setting up a new computer...

### Disable "Press and Hold"

```sh
defaults write -g ApplePressAndHoldEnabled -bool FALSE
```

Then, log out and back in.

### Change Shell

```sh
sudo --preserve-env bash -c "echo /opt/homebrew/bin/zsh >> /etc/shells"
sudo chsh -s /opt/homebrew/bin/zsh "$USER"
```

