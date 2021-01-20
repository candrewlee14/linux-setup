#!/bin/bash
sudo apt install neovim -y
pip3 install neovim
pip3 install pynvim --upgrade 

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim +"PlugInstall" +qall

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

printf '\n\033[0;36mInstalling Plugin Manager and Plugins\033[0;37m\n'

nvim --headless +"PlugInstall" +qall
nvim --headless +"CocInstall -sync coc-json coc-tsserver coc-sh coc-prisma coc-prettier coc-css coc-explorer coc-python" +qall

echo '{"coc.preferences.formatOnSaveFiletypes": ["css", "html", "markdown", "json", "javascript", "typescript", "python", "typescriptreact"],"explorer.icon.enableNerdfont": true}' > ~/.config/nvim/coc-settings.json
printf '\n\033[0;36mIgnore the PlugInstall errors. \nNeovim Installation Complete\033[0;37m\n'
