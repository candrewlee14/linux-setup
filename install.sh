#!/bin/bash

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

if ! command -v apt-get update &> /dev/null
then 
    echo "Command apt-get not found. This setup script needs to be run with apt available."
    exit
fi


# install miniconda
cd $SCRIPTPATH
read -p "Install miniconda (y/n)?" choice
case "$choice" in 
  [Yy]* ) 
      echo "Installing Miniconda..."
      cd miniconda 
      sh ./miniconda_install.sh 
      cd ../
      ;;
  [Nn]* ) echo "Ignored Miniconda.";;
  * ) echo "Invalid input. Ignored Miniconda.";;
esac

# install neovim
cd $SCRIPTPATH
read -p "Install neovim (y/n)?" choice
case "$choice" in 
  [Yy]* ) echo "Installing Neovim..." 
      cd $SCRIPTPATH/neovim
      bash ./neovim_install.sh 
      ;;
  [Nn]* ) echo "Ignored Neovim.";;
  * ) echo "Invalid input. Ignored Neovim.";;
esac


cd ~
read -p "Install zsh (y/n)?" choice
case "$choice" in
  [Yy]* ) 
        echo "Installing zsh" 
        printf "\n\033[0;36mInstalling zsh\033[0;37m\n"
        apt-get install zsh

        # install oh my zsh
        printf  "\n\033[0;36mInstalling Oh My Zsh
        Exit after install to continue script\n"
        read -p "Press Enter to Continue"
        printf "\033[0m\n"

        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

        # install zsh-autosuggestions
        cp $SCRIPTPATH/zshrc ~/.zshrc

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
        cp p10k.zsh ~/.p10k.zsh
        printf "\n\033[0;36mInstalling powerlevel10k theme\033[37m\n\n"
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

        printf "\n\033[0;36mUpdating .zshrc\033[37m\n\n"
      ;;
  [Nn]* ) 
        echo "Skipping zsh install.";;
  * ) 
        echo "Invalid response. Skipping zsh install.";;
esac


