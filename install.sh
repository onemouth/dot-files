#git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

#if [ -f "/etc/lsb-release" ]; then
#    wget -O ~/.zshrc https://raw.github.com/onemouth/dot-files/master/zshrc_ubuntu
#elif [ -f "/etc/rc.conf" ]; then
#    wget -O ~/.zshrc https://raw.github.com/onemouth/dot-files/master/zshrc_bsd
#else
#    wget -O ~/.zshrc https://raw.github.com/onemouth/dot-files/master/zshrc_mac
#fi


wget -O ~/.gitconfig https://raw.github.com/onemouth/dot-files/master/gitconfig
wget -O ~/.vimrc https://raw.github.com/onemouth/dot-files/master/vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

rm -f ~/.tmux.conf
wget -O ~/.tmux.conf https://raw.github.com/onemouth/dot-files/master/tmux.conf

sudo pip install flake8
