#!/usr/bin/env bash

# Brew ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo "Setting up Brew"
if test ! $(which brew); then
  echo "Installing Brew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
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
  "peco"
  "fzf"
  "fzy"
)

for app in "${brew[@]}"; do
  echo "Installing $app"
  brew install $app
done
