#!/bin/bash

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install python

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# copy zshrc
curl -fsSL -o ~/.zshrc https://raw.githubusercontent.com/invacuo/dev-setup/master/.zshrc

# install powerline fonts
git clone https://github.com/powerline/fonts.git
. ~/fonts/install.sh
rm -rf ~/fonts.sh

#install powerline status
pip install --user powerline-status

#install hub for doing github stuff without going to github
brew install hub
brew install tmux

# copy personal shortcuts and add it to .zshrc
curl -fsSL -o ~/shortcuts.sh https://raw.githubusercontent.com/invacuo/git-shortcuts/master/shortcuts.sh

# install atom-packages
sh -c "$(curl -fsSL https://raw.githubusercontent.com/invacuo/dev-setup/master/atom-package-installer.sh)"

echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc

#git config
git config --global push.default current

# vim stuff
mkdir ~/.vim ~/.vim/colors
curl -o ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
curl https://raw.githubusercontent.com/invacuo/dev-setup/master/.vimrc >> ~/.vimrc
