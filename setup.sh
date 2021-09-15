#!/usr/bin/env bash

# Start all scripts at ./config folder
declare -a apps=(
  "softwares.sh"
  "git.sh"
  "zsh.sh"
)

for app in "${apps[@]}"; do
  source ./config/$app
done

read -r -p "Do you want to restart? [y/N] " response

if [[ "$response" =~ ^([yY][sS]|[yY])+$ ]]; then
  sudo shutdown -r 0
fi
