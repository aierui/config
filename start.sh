#/bin/bash

dirPath=$(
  cd $(dirname $0)
  pwd
)

LOG_FILE=/tmp/aierui_config_start.log

function log() {
  echo ">> $(date) $*" >>${LOG_FILE}
}

function elog() {
  echo "$*"
  echo ">> $(date) $*" >>${LOG_FILE}
}

function run() {
  log "@$*"
  # shellcheck disable=SC2068
  $@ >>${LOG_FILE} 2>&1
}

function installDependentOnLinux() {
  log "start install that dependent soft ware"

  run yum install -y sysstat \
    dstat \
    iftop \
    iotop \
    telnet \
    net-tools \
    jq \
    vim \
    gcc \
    gcc-c++ \
    make \
    ctags \
    tree \
    zsh

  log "install finished that dependent soft ware"
}

function installDependentOnMac() {
  # brew install
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap mongodb/brew
  brew install wget python python3 tree node cmake vim jq
  # nodejs install
  npm install -g hexo-cli typescript
}

function installSoftWare() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    installDependentOnMac
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    installDependentOnLinux
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    installDependentOnLinux
  else
    exit
  fi
}

function installExtend() {
  # install zsh
  # install oh-my-zsh (before install zsh)
  wget -O /tmp/zsh_install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh && chmod +x /tmp/zsh_install.sh && /tmp/zsh_install.sh
  # install zsh theme
  cd ~/.oh-my-zsh/custom/plugins/ && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  cd ~/.oh-my-zsh/custom/plugins/ && git clone https://github.com/zsh-users/zsh-autosuggestions.git
  exit
  cd ${dirPath}
}

function linkFile() {
  # zsh link
  ln -sf ${dirPath}/.zshrc ~/.zshrc
  ## Links config file
  # git config
  ln -sf ${dirPath}/git/.gitconfig ~/.gitconfig
  ln -sf ${dirPath}/git/.gitignore_global ~/.gitignore_global
  ## vim https://github.com/BroQiang/vim-go-ide
  ln -sf ${dirPath}/.vimrc ~/.vimrc
}


function clean() {
  run rm -rf /root/.oh-my-zsh
  run rm -rf /tmp/zsh_install.sh
}

function start() {
  log "start configuration environmental"

  clean
  installSoftWare
  installExtend
  linkFile

  log "end of configuration environmental"
}

start
