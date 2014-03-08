
if [-f /etc/lsb_release]; then
    wget -O ~/.zshrc https://raw.github.com/onemouth/dot-files/master/zshrc_ubuntu
elif [-f /etc/rc.conf]; then
    wget -O ~/.zshrc https://raw.github.com/onemouth/dot-files/master/zshrc_bsd
else 
    wget -O ~/.zshrc https://raw.github.com/onemouth/dot-files/master/zshrc_mac
fi

wget -O ~/.gitconfig https://raw.github.com/onemouth/dot-files/master/gitconfig
wget -O ~/.vimrc https://raw.github.com/onemouth/dot-files/master/vimrc


git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qall

rm -f ~/.tmuxrc
