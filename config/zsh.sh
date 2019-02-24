#!/usr/bin/env bash

# Setup Oh My Zshell (https://ohmyz.sh/) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo "Installing Oh My Zshell"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Linkin .zshrc file"
ln -sf ~/dotfiles/.dotfiles/.zshrc ~/.zshrc

echo "Downloads unofficial plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions .dotfiles/plugins/zsh-autosuggestions

echo "Define zsh as default terminal"
chsh -s `which zsh`
