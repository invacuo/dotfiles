#!/bin/bash

echo "\n\n****installing homebrew****"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "\n\n****installing python****"
brew install python

echo "\n\n****installing oh-my-zsh****"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "\n\n****copying zshrc****"
curl -fsSL -o ~/.zshrc https://raw.githubusercontent.com/invacuo/dev-setup/master/.zshrc

echo "\n\n****installing powerline fonts****"
if [ -d ~/fonts ]; then
  while true; do
    echo "Fonts directory already exists. Do you want to delete it $1? (y/n): "
    read yn
    case $yn in
      [Yy]* )
        echo "Deleting ~/fonts"
        rm -rf ~/fonts
        git clone https://github.com/powerline/fonts.git ~/fonts
        . ~/fonts/install.sh
        rm -rf ~/fonts.sh
        break
        ;;
      [Nn]* )
        echo "Skipping fonts installation. Powerline status may not work correctly."
        break
        ;;
      * )
        echo "Please answer yes or no."
        ;;
    esac
  done
fi

echo "\n\n****installing powerline status****"
pip3 install --user powerline-status

echo "\n\n****installing hub for doing github stuff without going to github****"
brew install hub

echo "\n\n****installing tmux****"
brew install tmux

echo "\n\n****installing firacode****"
brew tap homebrew/cask-fonts
brew cask install font-fira-code

echo "\n\n****copying personal shortcuts and add it to .zshrc****"
curl -fsSL -o ~/shortcuts.sh https://raw.githubusercontent.com/invacuo/git-shortcuts/master/shortcuts.sh

echo "\n\n****installing rbenv****"
brew install rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc

#git config
git config --global push.default current

echo "\n\n****doing vim stuff like setting colors and fonts and copying vimrc****"
mkdir ~/.vim ~/.vim/colors
curl -o ~/.vim/colors/monokai.vim https://raw.githubusercontent.com/sickill/vim-monokai/master/colors/monokai.vim
curl https://raw.githubusercontent.com/invacuo/dev-setup/master/.vimrc >> ~/.vimrc

echo "\n\n****DONE****"
