ln -sf ~/dotfiles/.vimrc ~/.vimrc

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

sudo apt-get install -y silversearcher-ag
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
sudo update-alternatives --remove vim /usr/bin/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
