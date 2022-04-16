Git 团队协作中经常我常见／常用的：

LGTM Looks Good To Me Riview 完别人的 PR ，没有问题
PTAL Please Take A Look 帮我看下，一般都是请别人 review 自己的 PR
TL;DR: Too Long; Don’t Read. PR 内容太多，没办法看
PR：Pull Request. 拉取请求，给其他项目提交代码
SGTM: Sounds Good To Me. 和上面那句意思差不多，也是已经通过了 review 的意思
WIP: Work In Progress. 告诉项目维护者这个功能还未完成，方便维护者前 review 已提交的代码
PTAL: Please Take A Look. 提示项目 Owner/contributor review
TBR: To Be Reviewed. 提示维护者进行 review
TBD: To Be Done (or Defined/Discussed/Decided/Determined). 根据语境不同意义有所区别，但一般都是还没搞定的意思
IMO: In My Opinion 在我看来、依我看、依我所见
IMHO: In My Humble Opinion IMO 谦虚的说法
LGT1: Looks Good To 1. 如果有一个回复 LGTM 则可以添加为 LGT1，1 代表目前有 1 个赞
LGT2: Looks Good To 2. 如果有两个回复 LGTM 则可以添加为 LGT2，2 代表目前有 2 个赞
DNM: Do not merge. 不要合并




拉取 不在本地的分支 需要用如下方法拉取其他分支
git clone --depth 1 https://github.com/aierui/xxxxxxx.git
$ git remote set-branches origin '5.7.fb'
$ git fetch --depth 1 origin 5.7.fb
$ git checkout 5.7.fb


git clone 时添加了 --depth 后，如何重新拉取所有全部的历史来获取完整的仓库 ？
git fetch --depth
git fetch --unshallow



cat /etc/ssh/ssh_config

ssh/private_config


git branch -d 2016.11.3

$ git push <remote_name> --delete <branch_name>



1. 优雅的删除子模块

逆初始化模块，其中{MOD_NAME}为模块目录，执行后可发现模块目录被清空
git submodule deinit {MOD_NAME} 
删除.gitmodules中记录的模块信息（--cached选项清除.git/modules中的缓存）
git rm --cached {MOD_NAME} 
提交更改到代码库，可观察到'.gitmodules'内容发生变更
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
dfdd@localhost: ~/app$ 运行后可观察到'.git/config'中对应模块的url属性被更新
dfdd@localhost: ~/app$ git commit -am "Update submodule url." 提交变更







git diff 排除指定目录 如 忽略 lib 目录对比
git diff  base1 base2 ':!lib'   > base.diff
