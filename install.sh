#!/bin/bash

# install needed package
sudo apt-get install -y ctags cscope

# install vim with ruby supported (for Command-T plugin)
sudo apt-get install -y ruby rubygems vim-nox

# copy vim setting to home
if [ -d "~/.vim" ]; then
    cp ./vim/* ~/.vim/
else
    cp -R ./vim ~/.vim
fi

cp vimrc ~/.vimrc

# sync needed vim plugin
vim +'PlugInstall --sync' +qa

# add bash alias
echo "alias gen-cscope='find . -iname '\''*.c'\'' -o -iname '\''*.cpp'\'' -o -iname '\''*.cc'\'' -o -iname '\''*.h'\'' -o -iname '\''*.hpp'\'' > cscope.files && cscope -b -i cscope.files -f cscope.out'" >> ~/.bashrc
echo "alias gen-tags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'" >> ~/.bashrc

source ~/.bashrc
