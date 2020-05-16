# 位置  ~/.zshrc

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

####################################
############export start############
####################################

# export global env
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export DEV_PATH=/Users/develop
export PersonConfig=${DEV_PATH}/aierui/config

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



##########
# GO ENV #
##########

# export GOROOT="/Users/develop/go-core-lib/1.11.9"
#export GOROOT="/Users/develop/go-core-lib/1.12.4"
#export GOROOT="/Users/develop/go-core-lib/1.12.6"
# export GOROOT="/Users/develop/go-core-lib/1.12.9"
# export GOROOT="/Users/develop/go-core-lib/1.13.0"
# export GOROOT="/Users/develop/go-core-lib/1.13.5"
export GOROOT="/Users/develop/go-core-lib/1.14.3"
export GOPATH="/Users/develop/www/go-training"
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOBIN
# Enable the go modules feature
# export GO111MODULE=on
# Set the GOPROXY environment variable
export GOPROXY=https://goproxy.cn,direct
# export GOPROXY=https://goproxy.cn
# export GOFLAGS=-mod=vendor


### export private global variables

if [ -f ${PersonConfig}/private_export ]; then
	. ${PersonConfig}/private_export
fi

####################################
############ export end#############
####################################


######
# IP #
######

function wip() {
    /sbin/ifconfig en0|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function aip() {
    /sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function ip_addr() {
    if [ -n "$(wip)" ]; then
        wip
    else
        aip
    fi
}



# g_os = 'unknown'

function os(){
  if [ "$(uname)"=="Darwin" ]; then
    g_os="Mac"
  elif [ "$(expr substr $(uname -s) 1 5)"=="Linux" ]; then
    g_os="Linux"
  elif [ "$(expr substr $(uname -s) 1 10)"=="MINGW32_NT" ]; then
    g_os="Win"
  fi
}

# echo $g_os;

function hostname(){
  if [ "$(uname)"=="Darwin" ]; then
    scutil --get ComputerName
  else
    echo "Not Support!"
    #exit
  fi
}


init_ip=$(ip_addr)


#########
# ALIAS #
#########

# IP
alias ip='ip_addr | tr -d "\n" | pb; ip_addr'


alias cm='chmod' # change mode
alias co='chown' # change owner
alias e='exit'
alias j='jobs'
alias o='open'
alias pb='pbcopy'
alias pbn='tr -d "\n" | pbcopy'
# alias rm='safe-rm'
alias rp='realpath'
alias c='clear'

# brew: Homebrew
alias brews='brew list -1'
alias bu='bug | bud'
alias bug='brew upgrade -vvv'
alias bud='brew update -vvv'

# cd: change directory
alias zd='cd ~/Desktop'
alias zl='cd ~/Downloads'
alias zo='cd ~/Documents'
alias zd='cd /Users/develop'
alias za='cd /Users/develop/aierui'
alias zp='cd /Users/develop/pingcap'
alias zw='cd /Users/develop/www'
alias zt='cd /Users/develop/tools'
alias zg='cd /Users/develop/go-training'


alias ze='cd /etc'
alias zc='cd /usr/local/Cellar'


# develop common tools
alias yc=$PersonConfig/cloud/login.sh

###### sina weibo dev env ########
if [ -f ${PersonConfig}/private_weibo ]; then
	. ${PersonConfig}/private_weibo
fi
###### sina weibo dev env ########


## list
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ds="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"


# Vim
alias v='vim'
alias sv='sudo v'
alias vh='v /etc/hosts'
alias vgi='v ./.gitignore'
alias vz='v ~/.zshrc'
alias vv='v ~/.vimrc'


## Git
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
alias push=$PersonConfig/git/push.sh


## PS 
# 获取占用CPU资源最多的10个进程
alias psc10='ps aux|head -1;ps aux|grep -v PID|sort -rn -k 3 | head'
# 获取占用内存资源最多的10个进程
alias psm10='ps aux|head -1;ps aux|grep -v PID|sort -rn -k 4 | head'

# free 
alias free='top -l 1 | head -n 10'

### mac 隐藏所有的
alias showF='defaults write com.apple.finder AppleShowAllFiles -bool true;  killAll Finder'
alias hideF='defaults write com.apple.finder AppleShowAllFiles -bool false; killAll Finder'
# alias dcp_log='/Users/develop/tools/docker/clearlog.sh'

## Appliction 

alias st='open -a /Applications/Sublime\ Text.app/'
alias vc='open -a /Applications/Visual\ Studio\ Code.app'
alias pss='open -a /Applications/PhpStorm.app/'
alias qq='open -a /Applications/QQ.app'
alias wx='open -a /Applications/WeChat.app'
alias phplint="find ./ -name '*.php' -exec php -l {} \;"

clear_php()
{
  ps -A | grep \.php$ | grep -v phpstorm | grep -v php-fpm | awk '{print $1}' | xargs kill -9 > /dev/null 2>&1
}


#### doc

alias docs='docsify serve ./'

## 修改当前项目的 composer.json 配置文件：
alias ccm="composer config repo.packagist composer https://packagist.phpcomposer.com"
alias ccml="composer config repo.packagist composer https://packagist.laravel-china.org"

