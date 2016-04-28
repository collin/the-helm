ln -s $(pwd)/vimrc $HOME/.vimrc
ln -s $(pwd)/vim $HOME/.vim
vim/bundle/YouCompleteMe/install.py --tern-completer
echo "Make sure $(pwd)/bin" is in your $PATH
