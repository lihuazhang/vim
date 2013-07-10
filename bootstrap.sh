#!/usr/bin/env sh

endpath="$HOME/.my-vim"

echo "cloning vim"
git clone --recursive https://github.com/lihuazhang/vim.git $endpath

echo "setting up symlinks"
ln -sf $endpath/.vimrc $HOME/.vimrc
ln -sf $endpath/.vimrc.bundles $HOME/.vimrc.bundles

ln -sf $endpath/.vim $HOME/.vim
if [ ! -d $endpath/.vim/bundle ]; then
    mkdir -p $endpath/.vim/bundle
fi

if [ ! -e $HOME/.vim/bundle/vundle ]; then
    echo "Installing Vundle"
    git clone https://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle
fi

echo "update/install plugins using Vundle"
system_shell=$SHELL
export SHELL="/bin/sh"
vim -u $endpath/.vimrc.bundles +BundleInstall! +BundleClean +qall
export SHELL=$system_shell