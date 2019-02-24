#!/usr/bin/env bash

# Start all scripts at ./config folder
declare -a apps=(
  "softwares.sh"
  "brew.sh"
	"zsh.sh"
)

for app in "${apps[@]}"; do
  source ./config/$app
done

sudo shutdown -r 0
