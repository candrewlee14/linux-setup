#!/bin/bash
sudo apt install neovim -y

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

nvim --headless +"PlugInstall" +qa || true
nvim --headless +"CocInstall coc-json coc-tsserver coc-sh coc-prisma coc-prettier coc-css coc-explorer coc-python" +qa || true

mkdir -p ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

nvim +qa
nvim +"PlugInstall" +qa || true
nvim +"CocInstall coc-json coc-tsserver coc-sh coc-prisma coc-prettier coc-css coc-explorer coc-python" +qa || true

echo '{"coc.preferences.formatOnSaveFiletypes": ["css", "html", "markdown", "json", "typescript", "python", "typescriptreact"]}' > ~/.config/nvim/coc-settings.json
printf '\n\033[0;36mIgnore the PlugInstall errors. \nNeovim Installation Complete\033[0;37m\n'
