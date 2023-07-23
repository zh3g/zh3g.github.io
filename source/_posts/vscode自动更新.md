---
title: vscode自动更新
date: 2023-07-07 16:48:48
tags: vscode
categories: 
- 个人
- 教程
---
# 论如何设置vscode自动更新
## - 打开VSCode设置界面,搜索框内输入 auto save

![Alt text](2023-7%E6%9C%88-07-17-01-53-164mage.png)


- afterDelay将在配置的 `files.autoSaveDelay` 后自动保存为保存的编辑器
- onFocusChange —— 当编辑器失去焦点时，将自动保存为保存的编辑器也就是鼠标不在VSCode里面时自动保存
- onWindowChange —— 当窗口失去焦点时，将自动保存为保存的编辑器（窗口可理解为每个代码脚本，当鼠标从 A 脚本转到 B 脚本时，自动保存脚本 A 的修改内容）

~最后：这里我用的是onWindowChange 自己喜欢哪个就用哪个！！！~
