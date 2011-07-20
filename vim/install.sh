echo "Configuring vim."

rm -rf ~/.vim ~/.vimrc

ln -s $ROOT/vim ~/.vim
ln -s $ROOT/vim/setup.vim ~/.vimrc

exit $?
