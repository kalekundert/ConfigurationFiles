install:
	rm -rf ~/.vim ~/.vimrc
	ln -s /home/kale/cfg/vim ~/.vim
	ln -s /home/kale/cfg/vim/setup.vim ~/.vimrc

	rm -rf ~/.zsh ~/.zshrc
	ln -s /home/kale/cfg/zsh ~/.zsh
	ln -s /home/kale/cfg/zsh/setup.sh ~/.zshrc
