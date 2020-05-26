# Linux 使用

## Usage

### Init

1. 安装环境依赖
    ```
    yum install -y git zsh
    ```

### Config ZSH

1. 创建目录并克隆仓库
    ```
    mkdir -p /data1/develop/aierui/config && cd /data1/develop/aierui/config &&  git clone https://github.com/aierui/config.git ./
    ```
2. 安装
    ```
    ./start.sh
    ```

### Config Vim

1. 安装 vim 包管理
   ```
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
   ```
2. 安装插件
    ```
    # 在 vim 中
    :PlugInstall
    ```

### Go Install

1. 安装 go 环境
    ```
    # linux
    mkdir -p $DEV_PATH/go-core-lib && cd $DEV_PATH/go-core-lib && wget https://dl.google.com/go/go$GOVERSION.linux-amd64.tar.gz && tar -zxvf go$GOVERSION* && mv go $GOVERSION
    # max os
    mkdir -p $DEV_PATH/go-core-lib && cd $DEV_PATH/go-core-lib && wget https://dl.google.com/go/go$GOVERSION.darwin-amd64.tar.gz && tar -zxvf go$GOVERSION* && mv go $GOVERSION
    ```
2. 安装 go bin 
    ```
    # 在 vim 中
    :GoInstallBinaries
    ```