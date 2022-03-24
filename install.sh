ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.agignore ~/.agignore
mkdir ~/.vim
ln -sf ~/dotfiles/.coc-settings.json ~/.vim/.coc-settings.json

cat ~/dotfiles/.zshrc >> ~/.zshrc

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

sudo apt-get install -y silversearcher-ag
sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
sudo update-alternatives --remove vim /usr/bin/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

for repo in $(find $HOME/src/github.com/Shopify -maxdepth 1 -mindepth 1); do
  cd $repo
  export GEM_HOME="$HOME/.gem"
  gem install ripper-tags
  export PATH=$PATH:$HOME/.gem/bin
  $HOME/.gem/bin/ripper-tags -R --exclude=vendor
done
