#!/bin/bash
apt install neovim -y
pip3 install neovim
pip3 install pynvim --upgrade 


curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim

printf '\n\033[0;36mInstalling Plugin Manager and Plugins\033[0;37m\n'
nvim --headless +"PlugInstall" +qall

read -p "EXCLUDE CoC autocomplete and language server from installation? (y/n)?" choice
case "$choice" in
    [Nn]* ) echo "Installing nvim with CoC"
        apt install nodejs npm -y
        cp init.vim ~/.config/nvim/init.vim
        nvim --headless +"CocInstall -sync coc-json coc-tsserver coc-sh coc-prettier coc-css coc-explorer coc-python" +qall

        echo '{"coc.preferences.formatOnSaveFiletypes": ["css", "rust", "html", "markdown", "json", "javascript", "typescript", "python", "typescriptreact"],"explorer.icon.enableNerdfont": true, "prettier.tabWidth": 4, "python.jediEnabled": false}' > ~/.config/nvim/coc-settings.json
        ;;
    [Yy]* ) 
        cp no_coc_init.vim ~/.config/nvim/init.vim ;;
    * ) 
        cp no_coc_init.vim ~/.config/nvim/init.vim ;;
esac
nvim --headless +"PlugInstall" +qall
printf '\n\033[0;36mIgnore the PlugInstall errors. \nNeovim Installation Complete\033[0;37m\n'
