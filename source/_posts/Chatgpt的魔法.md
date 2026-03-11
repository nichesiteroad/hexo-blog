---
title: Chatgpt的魔法
date: 2026-03-11 08:10:55
categories: work
id: chatgpt-magic
description:
---

Chatgpt又帮我解决了一个疑难杂症。

之前我的Hexo博客是部署在Github Pages上面的，但是不知因为什么原因，存放博客文章的仓库被封了，发邮件给官方也一直没有回复。

另外我这个仓库属于 **User Site** 仓库，而 GitHub Pages 有一个规则：一个账号 **只能有一个 User Site 仓库**。

这个仓库被封，自定义域名没有办法解绑，即使新建仓库，站点也属于 **Project Site**，网址会非常丑。

折腾几天之后，我决定放弃使用Github Pages，那么有其他免费静态网站托管服务吗？

根据Chatgpt的建议，Cloudflare Pages是最好的替代选项。

对于Cloudflare，我并不陌生，我的网站就使用了Cloudflare的免费CDN服务，另外Cloudflare Pages可以与Github仓库连通，感觉实现起来应该很简单。

如果放到以前，我可能会搜索相应的教程，同时打开很多网页，跟着教程去部署，以及不断搜索解决可能的Bug，成功部署至少得一天起步。

但是在Chatgpt的帮助下，不到一个小时就全部完成了，网站重新上线，网址还是那么简洁，网站内容完全没有变化，只是托管服务从Github Pages 替换成了 Cloudflare Pages。

部署过程中当然也遇到了很多问题，比如：

- 参数配置

- 路径设置错误

- Github仓库结构错误

- 缺少 package.json 文件

- 拉取 submodule 失败

- ...

中途很多次也想过放弃，但是抱着相信 Chatgpt 的信念，全程傻瓜化的根据 Chatgpt 的指导，把每一个Bug解决，最后网站成功上线的时候，不禁感叹：Chatgpt 太厉害了。

他就像一个知识渊博，同时又很有耐心的老师，他不会嫌弃你的问题太过于愚蠢，会很耐心的根据你的指令，一步步达到你想要的效果。

当然并不局限于技术层面，性格测试，职业规划，英语学习路径，产品设计等等，Chatgpt都可以帮助你更快更好的实现你的想法。

以上。
