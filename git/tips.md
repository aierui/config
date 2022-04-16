
拉取 不在本地的分支 需要用如下方法拉取其他分支
# git clone --depth 1 https://github.com/aierui/xxxxxxx.git
$ git remote set-branches origin '5.7.fb'
$ git fetch --depth 1 origin 5.7.fb
$ git checkout 5.7.fb


git clone 时添加了 --depth 后，如何重新拉取所有全部的历史来获取完整的仓库 ？
git fetch --depth
git fetch --unshallow



# cat /etc/ssh/ssh_config

ssh/private_config


git branch -d 2016.11.3

$ git push <remote_name> --delete <branch_name>



1. 优雅的删除子模块

# 逆初始化模块，其中{MOD_NAME}为模块目录，执行后可发现模块目录被清空
git submodule deinit {MOD_NAME} 
# 删除.gitmodules中记录的模块信息（--cached选项清除.git/modules中的缓存）
git rm --cached {MOD_NAME} 
# 提交更改到代码库，可观察到'.gitmodules'内容发生变更
git commit -am "Remove a submodule." 


11725  rm -rf .git/modules/aws-common-runtime/
11726  git st
11727  git rm --cached  crt
11728  git rm --cached  crt/aws-crt-cpp




2. 修改某模块URL
修改'.gitmodules'文件中对应模块的”url“属性;
使用git submodule sync命令，将新的URL更新到文件.git/config；

dfdd@localhost: ~/app$ git submodule sync 
Synchronizing submodule url for 'gitmods/thinker_g/Helpers'
dfdd@localhost: ~/app$ # 运行后可观察到'.git/config'中对应模块的url属性被更新
dfdd@localhost: ~/app$ git commit -am "Update submodule url." # 提交变更







git diff 排除指定目录 如 忽略 lib 目录对比
git diff  base1 base2 ':!lib'   > base.diff
