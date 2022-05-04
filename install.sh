#ln -sf ~/dotfiles/.vimrc ~/.vimrc
#ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
#ln -sf ~/dotfiles/.agignore ~/.agignore
#mkdir ~/.config/nvim
#ln -sf ~/dotfiles/.config/nvim/.coc-settings.json ~/.config/nvim/.coc-settings.json
#ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
#
#cat ~/dotfiles/.zshrc >> ~/.zshrc
#
#if ! command -v fzf &> /dev/null; then
#  sudo apt-get install -y fzf
#fi

#sudo apt-get install -y silversearcher-ag
#sudo apt-get install -y automake pkg-config libpcre3-dev zlib1g-dev liblzma-dev
#curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#nvim +PlugInstall +qall
#
#for repo in $(find $HOME/src/github.com/Shopify -maxdepth 1 -mindepth 1); do
#  cd $repo
#  export GEM_HOME="$HOME/.gem"
#  gem install ripper-tags
#  export PATH=$PATH:$HOME/.gem/bin
#  $HOME/.gem/bin/ripper-tags -R --extra=q --exclude=.git --exclude=log --exclude=tmp --exclude=vendor --exclude=node_modules --exclude=.dev . $(bundle list --paths | sed s@`pwd`\/@@)
#done
