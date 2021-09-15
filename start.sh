echo -e "\n\Iniciando...\n\n"

echo -e "Setting up xclip"
if test ! $(which xclip); then
  echo -e "Installing xclip\n\n"
  sudo apt install xclip
else
  echo -e "xclip already instaled"
fi

echo -e "\n\nGerando chave SSH...\n\n"

ssh-keygen -t ed25519 -C "contato@adriano.dev"

echo -e "\n\nCadastre a chave ssh abaixo no seu Github"
echo -e "Acesse o endereço https://github.com/settings/ssh/new \n\n"

echo "A chave abaixo foi copiada para o clipboard"
xclip -sel clip < ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub

echo -e '\n\n'
read -rep $'Pressione [Enter] para continuar...'
echo -e '\n\n'

echo -e "Setting up git"
if test ! $(which git); then
  echo "Installing git"
  sudo apt-get install git-all
else
  echo "git already instaled"
fi

echo -e "\n\nClonando repositório dotfiles para ~/dotfiles\n\n"

git clone git@github.com:drianoaz/dotfiles.git ~/dotfiles