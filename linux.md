# Linux 使用

## Usage


### Config ZSH

1. 创建目录
    ```
    mkdir -p /data1/develop/aierui/config
    ```
2. 克隆仓库
    ```
    cd /data1/develop/aierui/config &&  git clone https://github.com/aierui/config.git ./
    ```
3. 安装
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
    :PlugInstall
    ```