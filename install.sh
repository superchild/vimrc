#!/bin/bash

# install needed package
sudo apt-get install -y ctags cscope

# copy vim setting to home
cp -R ./vim ~/.vim
cp vimrc ~/.vimrc

# sync needed vim plugin
vim +'PlugInstall --sync' +qa

# add bash alias
echo "alias gen-cscope='find . -iname '\''*.c'\'' -o -iname '\''*.cpp'\'' -o -iname '\''*.cc'\'' -o -iname '\''*.h'\'' -o -iname '\''*.hpp'\'' > cscope.files && cscope -b -i cscope.files -f cscope.out'" >> ~/.bashrc
echo "alias gen-tags='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'" >> ~/.bashrc

source ~/.bashrc
