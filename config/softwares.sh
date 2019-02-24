#!/usr/bin/env bash

sudo apt-get update

echo "Setting up Snap"
if test ! $(which snap); then
  echo "Installing snap"
  sudo apt-get install snapd
else
  echo "Snap already instaled"
fi

#  Snap apps ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo "Installing apps with snap"
declare -a apps=(
	"chromium"
  "firefox"
  "docker"
  "vscode --classic"
  "spotify"
  "slack"
  "simplescreenrecorder-mardy"
  "vlc"
)

for app in "${apps[@]}"; do
  if test ! $(ls /snap | grep $app); then
		echo "Installing $app"
		sudo snap install $app
  else
		echo "Updating $app"
		sudo snap refresh $app
  fi
done
