install:
	rm -rf ~/.vim ~/.vimrc
	ln -s ~/cfg/vim ~/.vim
	ln -s ~/cfg/vim/setup.vim ~/.vimrc

	rm -rf ~/.zsh ~/.zshrc
	ln -s ~/cfg/zsh ~/.zsh
	ln -s ~/cfg/zsh/setup.sh ~/.zshrc
