---
title: bilibili嵌入视频
date: 2023-07-07 21:39:03
tags: bilibili
categories: 视频嵌入
toc: false
password: bilibili
---

# 还有一个
```markdown
<iframe src="//player.bilibili.com/player.html?@@@@@@@@@&autoplay=0" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>
```

# 但是
## 改之后
```markdown
<div style="position: relative; padding: 30% 45%;">
<iframe style="position: absolute; width: 100%; height: 100%; left: 0; top: 0;" src="//player.bilibili.com/player.html?@@@@@@@@@@@@@@@@@@&autoplay=0&high_quality=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
</div>
```
# 对应@替换即可
### 示例:
<iframe src="//player.bilibili.com/player.html?aid=211010474&bvid=BV1Da411m7mc&cid=496825719&page=1&autoplay=0" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"> </iframe>

<div style="position: relative; padding: 30% 45%;">
<iframe style="position: absolute; width: 100%; height: 100%; left: 0; top: 0;" src="//player.bilibili.com/player.html?aid=211010474&bvid=BV1Da411m7mc&cid=496825719&page=1&autoplay=0&autoplay=0&high_quality=1" scrolling="no" border="0" frameborder="no" framespacing="0" allowfullscreen="true"></iframe>
</div>

~手机端好像没什么区别!
[流汗](0257B9A9.png)~