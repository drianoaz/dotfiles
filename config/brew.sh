#!/usr/bin/env bash

# Setup Brew (http://linuxbrew.sh/) :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

# Brew ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo "Setting up Linuxbrew"
if test ! $(which brew); then
  echo "Installing Linuxbrew"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
else
  echo "Linuxbrew already instaled"
  echo "Updating Linuxbrew"
  brew update
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
  "nvm"
  "thefuck"
  "git"
  "tmux"
  "zsh"
  "zsh-completion"
)

for app in "${brew[@]}"; do
  echo "Installing $app"
  brew install $app
done
