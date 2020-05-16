#/bin/bash

dirPath=$(cd `dirname $0`; pwd)


# brew install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap mongodb/brew
brew install wget python python3 tree macvim node youtube-dl tmux pandoc cmake rmtrash reattach-to-user-namespace mongodb-community redis golang httpie jq
# nodejs install
npm install -g hexo-cli typescript
# python install
pip3 install virtualenv scipy numpy pandas jupyter tensorflow scikit-learn matplotlib seaborn pillow

# install zsh 
# install oh-my-zsh (before install zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
# install zsh theme
cd $ZSH/custom/plugins/ && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
cd $ZSH/custom/plugins/ && git clone https://github.com/zsh-users/zsh-autosuggestions.git

# zsh link
ln -sf ${dirPath}/.zshrc ~/.zshrc


## Links config file

# git config
ln -sf ${dirPath}/git/.gitconfig ~/.gitconfig


## vim https://github.com/BroQiang/vim-go-ide
ln -sf ${dirPath}/.vimrc ~/.vimrc

