

wget -O ~/.zshrc https://raw.github.com/onemouth/dot-files/master/zshrc_ubuntu
wget -O ~/.vimrc https://raw.github.com/onemouth/dot-files/master/vimrc

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall
