#!/bin/bash

echo "\n\n****Installing oh-my-zsh****"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "\n\n****Set zsh as default****"
echo 'chsh -s $(which zsh)' >> ~/.bashrc

echo "\n\n****copying zshrc****"
curl https://raw.githubusercontent.com/invacuo/dev-setup/master/.zshrc >> ~/.zshrc


if [ "$(uname)" == "Darwin" ]; then
  echo "\n\n****Installing homebrew for MacOS****"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "\n\n****installing firacode****"
  brew tap homebrew/cask-fonts
  brew cask install font-fira-code
else
  # echo "\n\n****Installing homebrew for linux****"
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /root/.profile
  # eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  echo "\n\n****installing firacode****"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/invacuo/dev-setup/master/linux-firacode-install.sh)"
fi


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


# echo "\n\n****installing hub for doing github stuff without going to github****"
# brew install hub

# echo "\n\n****installing tmux****"
# brew install tmux

echo "\n\n****copying personal shortcuts and add it to .zshrc****"
curl -fsSL -o ~/shortcuts.sh https://raw.githubusercontent.com/invacuo/dev-setup/master/shortcuts.sh

# echo "\n\n****installing rbenv****"
# brew install rbenv
# echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
# echo 'eval "$(rbenv init -)"' >> ~/.zshrc

#git config
git config --global push.default current

echo "\n\n****DONE****"
