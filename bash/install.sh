echo "Configuring bash."

rm -rf ~/.bash ~/.bashrc

ln -s $ROOT/bash ~/.bash
ln -s $ROOT/bash/setup.sh ~/.bashrc

exit $?
