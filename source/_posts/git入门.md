---
title: git入门
date: 2023-07-10 14:06:34
tags: 日常学习
categories: 个人提升
---

> 选自bilibili [30分钟弄懂所有工作Git必备操作 / Git 入门教程](https://www.bilibili.com/video/BV1pX4y1S7Dq/?spm_id_from=333.337.search-card.all.click)
# git是什么
免费开源的分布式版本控制系统
版本管理
分布式 集中式svn
方面大家以后工作
github gitlab gitee区别
安装git
官网下载
[Windows和mac有区别]
(windows:右键打开gbh
mac直接打开终端窗口)
基础配置
$ git config --global user.name"your name"
$ git config --global user.email "your email"
(只是说明行的)
创建仓库:
去项目的文件夹输入
$ git init
(不需要联网)
用 git clone去克隆一个网络上的项目
例如: git clone https://github.com/torvalds/linux.git
(为所欲为)

创建完仓库后,每一个文件都有一个状态
git init
新建 状态:未跟踪
单独跟踪一个文件
$ git add <name>
删除:$ git rm <name> 或者用$ git rm --cache <name>(保留在目录里但不被跟踪)
修改
接下来用 git add <file-name>设置成缓存状态
假如*手滑* 不想把它设置成缓存状态用 git reset HEAD <name>来取消它的缓存状态
用 git commit命令来提交此次修改
一个文件的四个状态
![Alt text](image1.png)
补充:git commit
输入git commit 然后回车
终端自动跳到编辑器里(应该是vim)
- - 按i键输入模式
  - 编辑完成后按 ESC和:wq键保存并退出
版本提交完成
-或者按git commit -m "本次修改的大致内容"
接着按回车

突然不想提交怎么办用git reset head~ --soft来取消我们这次的提交(但第一次提交撤销不了,第二三次可以)
如何查看文件章台
用git status查看
红色是修改但没暂存,绿色是已暂存但没提交
查询命令(更细致)git diff
查询之前历史的提交 git log(commit后面的乱码是之前提交的哈希值接下来是提交作者,提交时间还有我们提交时输入的一些信息)
git log --pretty美化输出
git log --pretty=oneline(把每一次提交的信息都变成一行)
或自定义一个格式 $ git log --pretty=format:"%h-%an,%ar:%s"
(%h 简化哈希
%an 作者名字
%ar 修订日期(距今)
%ad 修订日期
%s 提交说明)
当然除了这样一条一条上传信息
还可以用git log --graph来以图形化的方式去呈现(主要表现为分支)-->这是本地
---------
远程仓库的一些使用:
代码托管平台:以github为例
右上角new repository
给原始仓库起名 公开 初始化
- 用https来复制一下这个远程仓库的链接
切换回本地
用git remote add 的命令来链接我们远程的一个仓库(一般名字叫origin)
git remote add origin +https的链接
可以git remote看一下(当出现origin是说明添加好了)
输错怎么办可以用git remote rename<原名><改之后名字> 这个命令来重命名
将本地代码推送之远程的仓库:用git push <一个远程仓库比如书origin> master
把本地的master分支推送过去
然后输入我们的用户名 密码(但有问题?)
回到github页面点击setting看到最后the developer settings然后点击personal access tokens
现在我们需要新建一个令牌去当我们的密码然后我们生成一个普通的经典的就可以
name 有效期 打开有关仓库的权限 点击生成
再次push一下用户名不变密码填我们复制的一个token
success
- 比较简单的方式通过ssh协议去健全
首先用~/ .sh进入目录
进去后我们可以通过ssh-keygen去生成一个ssh秘钥通过-t选择一个生成的算法比如用rsa 用-b选择一个生成的大小比如4096 然后通过-C添加的一个评论(github推荐个人的邮箱理论上想写啥就写啥)
回车 可以看到他让我们起一下这个秘钥的名字(咱就起一个test) 接下俩然我们输入密码:(可以不填)
ls看一下里面的文件 test私钥 test.pub为公钥
看一下公钥用cat test.pub将公钥复制下来
来到github的setting界面 然后选择ssh keys
添加一个秘钥 把我们刚才复制的test.pub复制过来可以起一个名字
回到我们之前的那个项目然后选择clone点击ssh复制一下
接下来回到我们的测试目录(这个目录是空的)我们来克隆一下我们刚才复制过来的ssh 用git clone <你的ssh>

>有关分支的概念:
>其实每次提交生成新版本是都会生成一个提交对象,每一个提交对象都有一个独一无二的哈希值,其实分支就是一个包含这个哈希值的一个文件,我们也可以简单理解为指向一个提交对象的指针,也就是说我们可以子啊一个提交对象上新建多个分支,因为分支是包含这个提交对象哈希值的一个文件.所以我想加多少就加多少,对不对
其实当我们最开始初始化本地仓库时就已经新建了一个master分支,我们每次提交操作都是在这个master分支上进行的
当我每次进行一个提交的时候我们的分支也跟着我们的提交对象一起进行向前的移动
![Alt text](image2.png)
那我新建那么多分支干嘛?<~~一个分支不好吗~~
介绍经典的git流模型
![Alt text](image3.png)
如何操作分支?
操作分支之前首先知道我们在哪个分支上
- zsh在前面就能看到你的分支
- 通过git log (开括号里就是我们的分支)(origin/master的意思:之前添加的远程仓库然后这个远程仓库里也有个master这个origin/master其实就代表表我们远程仓库的master分支)
head其实戴白我们现在所处的分支
- 还可用git status -->on branch master 就代表我们现在的master分支
- 或者我们可以通过git branch --list

怎么创建分支呢
可以用 git branch <比喻说feature1>
我们git branch --list

怎么切换分支呢?
可以通过:git take out feature1(查看分支 git a branch list)
用 vi来修改我们的代码(i键进入插入模式:按esc键然后:wq退出)
- 我们可以提交一下 git add test file
- 我们也可以用git commit -a直接把没有暂存的文件也提交了再加一个-m(或简写-am) "feature1"

用git log查看 用git log --pretty=one line
清一下屏 切换到master分支
我们可以新建一个feature2分支
- 用git branch feature2,再切换回master
- 或者git checkout -b feature2

用vi编辑器修改text file 文件
编辑好后再提交一下用git commit -am "festure2"
- 如果我们想看到所有分支的提交可以用git log --all
- 也可以用grabe:git log --all graph
接下来我们再切换回master分支
那么到目前为止我们新建分支和切换分支讲的都差不多了
--------
# 重头戏
如何来合并分支
例如:让master分支跟feature one合并
(现在是master分支)git merge feature1
查看我们的文件:cat test_file
查看:git log --all --graph
继续合并:git merge feature2(但出现了conflict因为feature1和feature2我们修改了同样的地方)--需要自己解决冲突
看看哪有冲突git status:都修改了test_file文件
解决办法:直接进到我们text_file文件:vi text_file
==上面是





























   
