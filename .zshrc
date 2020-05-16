# this file where is? 
# ~/.zshrc

####################################
######export global variables ######
####################################

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
if [ "$(uname)"=="Darwin" ]; then
    export DEV_PATH=/Users/develop
  elif [ "$(expr substr $(uname -s) 1 5)"=="Linux" ]; then
    export DEV_PATH=/data1/develop
  elif [ "$(expr substr $(uname -s) 1 10)"=="MINGW32_NT" ]; then
    ## todo
    # export DEV_PATH=/data1/develop
fi
export PersonConfig=${DEV_PATH}/aierui/config

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  git
  osx
  zsh-syntax-highlighting
  zsh-autosuggestions
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

