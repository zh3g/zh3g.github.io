---
title: 多端同步hexo
date: 2023-07-23 21:50:56
tags: hexo
categories: 个人
---
 *又是一句:说来惭愧* 明明已经说过了,最终还是错了
windows:在一个空白的文件夹下
git clone git@(就是你博客hexo分支的ssh地址)
~~应该都新建了hexo 分支吧~~,这里就不再赘述
将.git 覆盖到你博客的.git文件上
进行 

```bush
git add .
git commit -m "备份hexo"
git pull origin hexo
```
应该就可以了