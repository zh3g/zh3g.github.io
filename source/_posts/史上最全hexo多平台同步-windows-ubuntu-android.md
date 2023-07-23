---
title: 史上最全hexo多平台同步(windows+ubuntu+android)
date: 2023-07-21 20:10:38
tags: hexo
categories: 个人
top: true
---
说来惭愧,因为中间隔得时间有点长,导致我弄得漫不经心,但最终费九牛二虎之力最终弄好了(我一直是小白再这方面)~~还有马上开学了~~
<!-- toc -->
# 常用的md语法快捷键
- 现放一些博客常用的md语法以防忘记

  - 目录`<!-- toc -->`
  - 置顶`top: true`
  - 是否折叠`<!--more-->`
- 快捷键
  - ctrl+B
  - ctrl+I
  - 复制链接 选中文本后ctrl+v
好,进入正题
# windows
具体参考我的博客[《基本教程》](https://zh3g.github.io/2023/07/07/%E5%9F%BA%E6%9C%AC%E6%95%99%E7%A8%8B/)
## 基本流程
包括：安装git 和 node.js
安装Hexo
<!--more-->
## 安装git 和node.js
1 打开[git官网](https://git-scm.com/)点击download进行下载 选择电脑对应的版本[![pCbfe2V.md.png](https://s1.ax1x.com/2023/07/21/pCbfe2V.md.png)](https://imgse.com/i/pCbfe2V)
2 直接下一步即可,也可以更改安装目录
3 安装完后在桌面或文件夹右键出现git bash即可
4 安装nodejs 打开官网点击下载[![pCbfZ80.md.png](https://s1.ax1x.com/2023/07/21/pCbfZ80.md.png)](https://imgse.com/i/pCbfZ80)
5 同样下一步即可
6 判断安装是否成功:打开cmd 输入`node -v`出现版本号代表安装成功
## 安装[hexo](https://hexo.io/zh-cn/)
1 在本地新建一个文件夹用于安装博客的文件夹
2 进入文件夹右键点击GBH 打开一个git 窗口
3 将hexo官网的代码依次复制

```git
npm install hexo-cli -g
hexo init blog
cd blog
npm install
hexo server
```

4 `hexo sever<=>hexo s ; hexo generate<=>hexo g; hexo deploy <=>hexo d(hexo三件套 hexo clean; hexo g ;hexo d)`
5 复制地址`http://localhost:4000`注意复制是别用ctrl+c会终止服务,可以右键复制粘贴 或shift+insert
## 编辑个人博客
1 同样在gbh中输入`hexo new post "文章名字"`或`hexo new "文章名字"`即可创建第一篇文章(在source\_posts里的能看到) 用的是[markdown](https://markdown.com.cn/basic-syntax/)(轻量级标记语言)编辑的 
保存后 退出
2 运行 `hexo g`生成网页`hexo s`运行博客
3 打开博客就可以看见文章了
## 更改博客样式
即:添加第三方主题:如butterfly ayer next...
1 打开[hexo](https://hexo.io/zh-cn/) 点击探索主题
2 以ayer主题为例 进行进一步安装....(省略之后再补)
3 实质按照主题说明 在hexo根目录 gbh上敲代码即可成功
4 在根目录的config 文件中(不特殊说明都是根目录的config)将

```yml
theme: landscape
```

替换为
```yml
theme: ayer
```
(注意yml文件一般:后都有空格!)
保存退出
5 git窗口中输入hexo g 输入hexo s
点击`http://localhost:4000/`进行本地访问
## 修改主题配置
根据每个主题的配置指南
1 在themes文件夹下修改config文件 改成你喜欢的字即可(提醒:最好在改之前复制一份防止改错,对)
2 还可以修改config文件 同理
3 修改完后 用hexo clean hexo g hexo s
## 注册账号github/gitee(需要烦人的实名认证,估计跟腾讯学的)/gitlab(没用过)
太简单不教了
以github为例
1 新建仓库 名字一定设为xxx.github.io其他不用管直接默认即可
## 将博客上传到github中
1 按照github官方提示进行设置即可例如

    git config --global user.name "xxx"
    git config --global user.email "xxx@xxx.com"

    ssh-keygen -t rsa -C "xxx@xxx.com"
    (输入三次回车

    cat ~/.ssh/id_rsa.pub
复制显示的密钥到ssh公钥(github的个人设置中的 添加即可)

    ssh -T git@github.com
 用来验证  返回successfully代表成功 
 找到config文件
 最后输入
例如:

```
deploy:
  type: 'git'
  repository: git@github.com:xxx/xxx.github.io.git
  branch: master
```

```
npm install hexo-deployer-git --save
hexo g
hexo d
```

最后打开github仓库的settings里的pages等到有这样的标识是代表可以访问[![pCbfVCq.md.png](https://s1.ax1x.com/2023/07/21/pCbfVCq.md.png)](https://imgse.com/i/pCbfVCq)
## 更新博客
每次先写时:`hexo new post "文章"`
写完后:三件套 
这里给一个我写的bat程序

```bash
Echo start cmd /c "hexo clean&&hexo g&&hexo d "   

@Echo Off
```

!终于结束了
更多博客部署问题可以在博客中关于我中私信我,或者参考[视频](https://www.bilibili.com/video/BV1ts4y1f7Gu/?spm_id_from=333.337.search-card.all.click)
# ubuntu
这里是通过新建一个分支来保存博客源文件的(因为github上的master分支只有部分文件所以不能利用这个同步)
# windows上传源文件到hexo分支
参考1.[多台电脑同步更新Hexo博客](https://blog.csdn.net/qq_30105599/article/details/118302086?ops_request_misc=%257B%2522request%255Fid%2522%253A%2522168994957916800211581424%2522%252C%2522scm%2522%253A%252220140713.130102334..%2522%257D&request_id=168994957916800211581424&biz_id=0&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduend~default-1-118302086-null-null.142^v90^koosearch_v1,239^v3^insert_chatgpt&utm_term=hexo%E6%9B%B4%E6%96%B0%E5%8D%9A%E5%AE%A2%E6%80%8E%E4%B9%88%E5%90%8C%E6%AD%A5&spm=1018.2226.3001.4187)
# ubuntu配置:
## 搭建博客需要安装的软件：
git
node.js
hexo
## 先更新源：

获得源上的软件包列表信息
`sudo apt-get update`
更新本地软件
`sudo apt-get upgrade`
## Node安装
命令行安装：

```bash
sudo apt-get install nodejs
sudo apt install npm
```

查看nodejs工具是否安装成功：

```bash
nodejs -v
v8.10.0
```

## Git安装及配置
1 安装Git
使用命令安装Git工具：

`sudo apt install git`
查看是否安装成功：

`git --version`
`git version 2.17.1`

4. Hexo安装及配置
先创建一个hexo操作的文件目录
                                                                                                                                                                                                                                    
## 安装hexo
`npm install hexo-cli -g`
`npm install hexo -g`
检查hexo是否安装成功

```bash
$ hexo -v
hexo: 4.2.0
hexo-cli: 3.1.0
os: Linux 5.3.0-45-generic linux x64
http_parser: 2.7.1
node: 8.10.0
v8: 6.2.414.50
uv: 1.18.0
zlib: 1.2.11
ares: 1.14.0
modules: 57
nghttp2: 1.30.0
openssl: 1.0.2n
icu: 60.2
unicode: 10.0
cldr: 32.0.1
tz: 2017c
```
## git bash将远程仓库克隆到本地

`git clone 仓库地址`
然后进入项目目录，安装依赖启动博客服务器，生成静态文件

```bash
npm install hexo-deployer-git --save
hexo g
hexo s
```

执行以上指令后，便可以在浏览器通过http://localhost:4000/访问博客

另一台电脑发布文章

同之前的教程一样，写好文章后

```bash
hexo clean
hexo d -g
```

两台电脑同步写博客
我们的博客仓库有两个分支，master分支和hexo分支

其中，master分支用于存放Hexo生成的静态资源文件，hexo分支用于存放网站的原始文件

所以，我们在一台设备上写好一篇文章或进行了博客的修改后

执行以下命令，将master中的静态资源文件更新

在博客目录下的cmd中

`hexo clean`
`hexo d -g`


执行以下命令，将hexo中的网站原始文件更新

在博客目录下的git bash中

```bash
git pull
git add -A
git commit -m "描述"
git push origin hexo
```


大功告成！

## 注意事项
每次有新的操作的时候，别忘了在另一台电脑上更新

`git pull hexo`

# android
因为android能够调用底层的linux命令故可以用于搭建hexo
## 工具
termux [MT管理器](https://www.coolapk.com/apk/bin.mt.plus)(酷安下载)
## 准备
1 termux下载
[termux 搭建hexo博客教程](https://lanlan2017.github.io/blog/4a95e633/)
我这里进行补充:
1 在下载好node.js和git后
直接git clone 源代码
接着`npm install hexo-deployer-git --save`
一定要输

2 获取ssh秘钥
`git config --global user.name "xxx"`
`git config --global user.email "xxx@xxx.com"`
最好用tsu下进行
`ssh-keygen -t rsa -C "xxx@xxx.com"`
(输入三次回车
找到文件.pub打开复制ssh秘钥
再去github添加
3 验证`ssh -T git@github.com`
4 进行三件套
如果安装插件,就重新安装一遍即可
## 问题
1 非tsu用户下live2d里面的package.json显示权限不够
我先是用chmod改权限为777,发现不行后
安装tsu
执行`npm install hexo-deployer-git --save`
在运行正常
2 会显示node_modules文件出错,把正常npm复制替换后依然出错所以无法解决,可能是手机termux问题



# 同步统一步骤
## 上传
执行以下命令，将hexo中的网站原始文件更新

在博客目录下的git bash中

```bash
git pull
git add -A
git commit -m "描述"
git push origin hexo
```


## 更新
每次有新的操作的时候，别忘了在另一台电脑上更新

`git pull hexo`
