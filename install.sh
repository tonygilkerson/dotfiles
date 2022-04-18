#!/usr/bin/env bash

set -x 

# mkdir -p ~/.vim/plugin
# curl -s https://raw.githubusercontent.com/bogado/file-line/master/plugin/file_line.vim > ~/.vim/plugin/file_line.vim

# install .vimrc ~/
# install .inputrc ~/
# install .bashrc.reddit ~/
# install .bashrc.local ~/
# install .bashrc.android ~/

install .bashrc.ps1 ~/

if [ "$(uname)" == "Darwin" ]; then
    install .bashrc.darwin ~/
    echo ". ~/.bashrc" > ~/.bash_profile
fi

cat > ~/.bashrc <<- EOF
# Installed by https://github.com/jamesonwilliams/dotfiles/blob/master/install.sh
[ -f ~/.bashrc.ps1 ] && . ~/.bashrc.ps1
[ -f ~/.bashrc.darwin ] && . ~/.bashrc.darwin
EOF

echo "Done! - to use 'source ~/.bashrc'"

