#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

cd ~

printf "\n\033[0;36mInstalling zsh\033[0;37m\n"
sudo apt-get install zsh

# install oh my zsh
printf  "\n\033[0;36mInstalling Oh My Zsh
Exit after install to continue script\n"
read -p "Press Enter to Continue"
printf "\033[0m\n"

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install zsh-autosuggestions

printf "\n\033[0;36mInstalling zsh-autosuggestions\033[0;37m\n\n"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install fzf
printf "\n\033[0;36mInstalling fzf\033[0;37m\n\n"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install 

# install zsh-syntax-highlighting
printf "\n\033[0;36mInstalling zsh-syntax-highlighting\033[0;37m\n\n"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install powerlevel10k
printf "\n\033[0;36mInstalling powerlevel10k theme\033[37m\n\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

printf "\n\033[0;36mUpdating .zshrc\033[37m\n\n"
cp $SCRIPTPATH/zshrc ~/.zshrc


# install miniconda
read -p "Install miniconda (y/n)?" -n 1 choice
case "$choice" in 
  y|Y ) echo "Installing Miniconda..." && cd miniconda && sh ./miniconda_install.sh && cd ../;;
  n|N ) echo "Ignored Miniconda.";;
  * ) echo "Invalid input. Ignored Miniconda.";;
esac

# install neovim
read -p "Install neovim (y/n)?" -n 1 choice
case "$choice" in 
  y|Y ) echo "Installing Neovim..." && cd neovim && sh ./neovim/neovim_install.sh && sh ./neovim/neovim_install.sh && cd ../;;
  n|N ) echo "Ignored Neovim.";;
  * ) echo "Invalid input. Ignored Neovim.";;
esac

zsh
