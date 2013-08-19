#!/usr/bin/env sh

rm -rf .vim .viminfo .vimrc
rm -rf .my-vim
rm -rf .neocomplcache

endpath="$HOME/.my-vim"

echo "cloning vim"
git clone --recursive https://github.com/lihuazhang/vim.git $endpath

echo "setting up symlinks"
ln -sf $endpath/.vimrc $HOME/.vimrc

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
vim -u $endpath/.vimrc +BundleInstall! +BundleClean +qall
export SHELL=$system_shell

if [ ! -d $endpath/.vim/undofiles ]; then
    mkdir -p $endpath/.vim/undofiles
fi

mkdir -p $endpath/.vim/yankring
