ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.agignore ~/.agignore

for repo in $(find $HOME/src/github.com/Shopify -maxdepth 1 -mindepth 1); do
  ln -sf ~/dotfiles/.solargraph.yml $repo 
  ln -sf ~/dotfiles/repoinstall.sh $repo 
done

cat ~/dotfiles/.zshrc >> ~/.zshrc

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

sudo apt-get install -y silversearcher-ag
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
sudo update-alternatives --remove vim /usr/bin/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
