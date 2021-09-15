#!/usr/bin/env bash

read -r -p "Do you want to install softwares? [y/N] " response

if [[ "$response" =~ ^([nN])+$ ]]; then
  return 0;
fi

echo -e "\n\nAtualizando lista das versões dos pacotes disponíveis....\n\n"
sudo apt-get update


#  packages ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo -e "\n\nInstalling packages"
declare -a packages=(
  "gcc"
  "wget"
  "curl"
  "zsh"
  "tmux"
  "peco"
  "vim"
)

for package in "${packages[@]}"; do
  echo -e "\n\nInstalling $package \n\n"
  sudo apt install $package
done

#  Snap ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

echo -e "\n\nSetting up Snap"
if test ! $(which snap); then
  echo -e "Installing snap"
  sudo apt-get install snapd
else
  echo "Snap already instaled"
fi

echo -e "\n\nInstalling apps with snap\n\n"
declare -a apps=(
  "docker"
  "code --classic"
  "spotify"
  "slack --classic"
  "vlc"
  "insomnia"
)

for app in "${apps[@]}"; do
  app_name=${app%" --classic"}
  if test ! $(which $app_name) && ! $(ls /snap | grep ${app_name}); then
    echo -e "\n\nInstalling $app_name\n\n"
    sudo snap install $app
  else
    echo -e "\n\nUpdating $app_name\n\n"
    sudo snap refresh $app
  fi
done

echo -e "\n\nSetting up node\n\n"

echo "Setting up nvm"
if test ! $(command -v nvm); then
  echo -e "Installing nvm"
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

  ## force NVM to load
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
else
  echo "nvm already instaled"
fi

echo -e "\n\nInstalling up node\n\n"
nvm install --lts

echo -e "\n\nInstalling yarn\n\n"
npm i -g yarn

echo -e "\n\nInstalling google chrome\n\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
sudo apt-get install -f
