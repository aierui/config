# this file where is? 
# ~/.zshrc

####################################
######export global variables ######
####################################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
if [[ "$OSTYPE" == "darwin"* ]];then
    export DEV_PATH=/Users/develop
elif [[ "$OSTYPE" == "linux-gnu"*  ]];then
	  export DEV_PATH=/data1/develop
elif [[ "$OSTYPE" == "freebsd"* ]]; then
    export DEV_PATH=/data1/develop
else
    ## todo
    # export DEV_PATH=/data1/develop
    echo "Other OS: ${OS}"
fi
export PersonConfig=${DEV_PATH}/aierui/config
export LC_ALL=en_US.UTF-8

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# cd $ZSH/custom/plugins/

plugins=(
  git
  osx
  zsh-syntax-highlighting ## git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  zsh-autosuggestions ##  git clone https://github.com/zsh-users/zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

### export private global variables
if [ -f ${PersonConfig}/private_export ]; then
	. ${PersonConfig}/private_export
fi

####################################
############ export end ############
####################################


####################################
###### source files (order) ########

source ${PersonConfig}/func.zsh
source ${PersonConfig}/go.zsh
source ${PersonConfig}/alias.zsh

####################################

