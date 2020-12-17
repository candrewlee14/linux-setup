#!/bin/bash
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
cp ./zshrc ~/.zshrc

zsh
