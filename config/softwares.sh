#!/usr/bin/env bash

read -r -p "Do you want to install softwares? [y/N] " response

if [[ "$response" =~ ^([nN])+$ ]]; then
  return 0;
fi

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
  "slack --classic"
  "simplescreenrecorder-mardy"
  "vlc"
)

for app in "${apps[@]}"; do
  app_name=${app%" --classic"}
  if test ! [$(which $app_name)] && ! [$(ls /snap | grep ${app_name})]; then
		echo "Installing $app_name"
		sudo snap install $app
  else
		echo "Updating $app_name"
		sudo snap refresh $app
  fi
done
