#!/usr/bin/env bash

# Setup Brew (http://linuxbrew.sh/) :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Brew ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo "Setting up Linuxbrew"
if test ! $(which brew); then
  echo "Installing Linuxbrew"
  sudo apt-get install curl build-essential
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
  test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
  test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
  echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
  source ~/.bash_profile
fi

# Brew tap ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo "Tapping repos with brew"
declare -a taps=(
  "cjbassi/gotop"
)

for tap in "${taps[@]}"; do
  echo "Tapping $tap"
  brew tap $tap
done

# Brew apps :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo "Installing apps with brew"
declare -a brew=(
  "gcc"
  "git"
  "nvm"
  "thefuck"
  "tmux"
  "zsh"
  "zsh-completion"
)

for app in "${brew[@]}"; do
  echo "Installing $app"
  brew install $app
done
