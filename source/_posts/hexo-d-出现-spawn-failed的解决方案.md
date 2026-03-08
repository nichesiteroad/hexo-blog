---
title: hexo d 出现 spawn failed的解决方案
date: 2024-12-12 17:41:25
tags: hexo
categories: self
id: spawn-failed
description:
---

好几次执行 `hexo d` 命令时，都会出现 spawn failed 这个报错，之前一直没有在意，但是最近几次总是频繁的出现，导致写好的文章都没有办法正常上传，那么就有必要解决一下了。

网上的很多教程都提到删除`.deploy_git` 文件，但是我试了很多次之后，发现并不行，直到在网上搜索到一篇教程，这个Bug终于算是彻底解决了。

整理一下解决方案，希望可以帮助到更多的人。

----

## *一、是否可以正常连接到服务器*

- 在Git控制台执行 `ssh -T git@github.com` 命令，检查是否可以与远程通信，如果出现 Hi…  你的 GitHub 账户名称的内容，说明可以正常连接。

- 如果出现无法连接的情况，可以参考我这篇 **[文章]([如何使用Hexo搭建个人博客](https://zlbin.cc/hexo-site/))** ，重新进行SSH key的设置。

- 如果重新设置之后，仍然无法正常连接，可以在存放Key的目录下新建一个config文件。
  
  <img title="" src="https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/config%E6%96%87%E4%BB%B6.png" alt="" data-align="inline">
  
  然后在这个文件里面填入以下内容，再执行 `ssh -T git@github.com` 命令，应该就可以解决。
  
  Host github.com 
  User 你GitHub的邮箱 
  Hostname ssh.github.com 
  PreferredAuthentications publickey 
  IdentityFile ~/.ssh/id_rsa 
  Port 443

## *二、永久解决 spawn failed 报错*

- 打开_config.yml配置文件

- 修改以下内容
  
    deploy:
    type: git
    repo: https://github.com/yourname/yourname.github.io.git
    branch: main

将其中的repo修改为

`git@github.com:yourname/yourname.github.io.git`

---

***希望可以帮助到你。***
