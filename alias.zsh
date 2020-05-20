#######################
####### ALIAS #########
#######################

### IP
alias cm='chmod' # change mode
alias co='chown' # change owner
alias e='exit'
alias j='jobs'
alias o='open'
alias pb='pbcopy'
alias pbn='tr -d "\n" | pbcopy'
# alias rm='safe-rm'
alias rp='realpath'
alias p='pwd'
alias c='clear'

### cd: goto directory
alias zd='cd ${DEV_PATH}'
alias za='cd ${DEV_PATH}/aierui'
alias zp='cd ${DEV_PATH}/pingcap'
alias zw='cd ${DEV_PATH}/www'
alias zt='cd ${DEV_PATH}/tools'
alias zg='cd ${DEV_PATH}/go-training'
alias zc='cd ${DEV_PATH}/aierui/config'

### develop common tools
alias yc=$PersonConfig/cloud/login.sh

###### sina weibo dev env ########
if [ -f ${PersonConfig}/private_weibo ]; then
	. ${PersonConfig}/private_weibo
fi
###### sina weibo dev env ########


### list
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ds="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"


### Vim
alias v='vim'
alias vz='v ${PersonConfig}/.zshrc'
alias vv='v ${PersonConfig}/.vimrc'


### Git
### https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
alias push=$PersonConfig/git/push.sh
alias gu=$PersonConfig/git/user.sh


## PS 
### 获取占用CPU资源最多的10个进程
alias psc10='ps aux|head -1;ps aux|grep -v PID|sort -rn -k 3 | head'
### 获取占用内存资源最多的10个进程
alias psm10='ps aux|head -1;ps aux|grep -v PID|sort -rn -k 4 | head'

### mac supplement alias
if [[ "$OSTYPE" == "darwin"* ]];then

alias ip='ip_addr | tr -d "\n" | pb; ip_addr'
alias zd='cd ~/Desktop'
alias zl='cd ~/Downloads'
alias zo='cd ~/Documents'

### mac free 
alias free='top -l 1 | head -n 10'
### mac 隐藏所有的
alias showF='defaults write com.apple.finder AppleShowAllFiles -bool true;  killAll Finder'
alias hideF='defaults write com.apple.finder AppleShowAllFiles -bool false; killAll Finder'

fi

### php
alias phplint="find ./ -name '*.php' -exec php -l {} \;"
clear_php()
{
  ps -A | grep \.php$ | grep -v phpstorm | grep -v php-fpm | awk '{print $1}' | xargs kill -9 > /dev/null 2>&1
}


### doc

alias docs='docsify serve ./'

### 修改当前项目的 composer.json 配置文件：
alias ccm="composer config repo.packagist composer https://packagist.phpcomposer.com"
alias ccml="composer config repo.packagist composer https://packagist.laravel-china.org"

