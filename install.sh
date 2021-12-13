ln -sf ~/dotfiles/.vimrc ~/.vimrc

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

sudo apt-get install -y silversearcher-ag
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev 
sudo apt-get purge neovim vim 
sudo apt-get install vim
