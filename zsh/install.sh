echo "Configuring zsh."

rm -rf ~/.zsh ~/.zshrc

ln -s $ROOT/zsh ~/.zsh
ln -s $ROOT/zsh/setup.sh ~/.zshrc

exit $?
