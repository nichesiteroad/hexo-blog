---
title: 群晖NAS下载夸克网盘的内容
date: 2025-06-26 06:17:57
tags: 学习
categories: self
id: synology-alist-quark
description:
---

一直以来，下载内容都是通过迅雷，速度非常快，再不济也是利用百度云，只是速度慢一些。

但是还是有很多想要的数据被存放在其他网盘，而群晖的套件中心是无法直接安装这些网盘的，这种情况可以使用Alist服务，将各种网盘挂载在Alist服务上，然后将网盘内容存放到NAS，我以夸克网盘举例。

---

## 安装Alist

我们可以使用群晖内置的Docker应用，来进行Alist的安装。

> 群晖DSM7.2的版本，Docker更名为**Container Manager**。

### 下载镜像

![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260639612.png)

> 如果你是第一次使用群晖的Docker服务，那么可能会发现群晖 Container Manager中的注册表打不开，出现无法加载的情况。
> 
> ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260642383.png)
> 
> 这是由于Docker镜像源的问题，有两个办法可以解决：
> 
> *点击注册表界面的 设置 进行编辑以及新增的操作。*
> 
> 1. 如果你可以科学上网，那就将Docker的官方地址加入代理列表，让群晖通过代理直接访问Docker的官方镜像源进行镜像拉取。
>    
>    ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260649577.png)
> 
> 2. 使用国内提供的镜像源，但是很多国内的Docker镜像源已经关闭或者仅限内部使用了，推荐一家国内的Docker镜像源：[毫秒镜像]([Docker镜像极速下载服务 - 毫秒镜像](https://1ms.run/)) ，进行新增操作，然后使用此镜像源即可成功打开镜像列表。
>    
>    ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260656542.png)

### 安装镜像

- 在映像中点击Alist，启动后开始配置容器信息
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260718703.png)

- 配置端口映射，用于外部访问
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260722957.png)

- 配置存储空间，映射容器内的 /opt/alist/data
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260723446.png)

- 查看初始密码
  
  容器启动后，点击 **详情** 后在 **日志** 中找到初始化生成的密码。
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/%E5%AF%86%E7%A0%81.png)

## 登录Alist

### 初始登录

访问你的域名 + 端口号，使用 admin 和初始密码登录 Alist。

<img src="https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/%E7%99%BB%E5%BD%95%E7%95%8C%E9%9D%A2.png" title="" alt="" data-align="center">

### 修改密码

登录之后主页报错是正常现象，因为还没有配置存储信息，点击页面下方管理，先进行账户名和密码的修改。

![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/%E7%AE%A1%E7%90%86.png)

![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/%E5%AF%86%E7%A0%81%E4%BF%AE%E6%94%B9.png)

修改完成之后，点击保存，重新登录Alist即可完成账号密码的修改。

### 挂载夸克网盘

- 添加夸克网盘
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/%E5%A4%B8%E5%85%8B%E7%BD%91%E7%9B%981.png)

- 配置信息
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260749929.png)
  
  > - 挂载路径：/夸克网盘或者/quark
  > 
  > - Cookie：打开网页版本的夸克网盘，**F12** 打开开发者工具，切换到 **网络** 选项卡后刷新页面，找到 **sort？** 开头的请求，点击该请求，选择 **Headers** ，在下方找到Cookie字段，复制后面的值，这就是完整的Cookie。
  >   
  >   ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260803409.png)
  > 
  > - 其余选项根据自己的习惯填写即可。

- 成功挂载夸克网盘
  
  配置完成后，点击保存，访问Alist的主页，即可看到挂载的夸克网盘。
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/%E5%A4%B8%E5%85%8B%E7%BD%91%E7%9B%982.png)

### 下载内容到NAS

- 在Alist再创建一个本机存储，根文件夹路径设置为“/opt/alist/data”。
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260816099.png)

- 在夸克网盘和NAS之间复制文件
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260822531.png)
  
  <img src="https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260823625.png" title="" alt="" data-align="center">
  
  > 这里需要注意的是，页面马上会提醒成功，但是文件显然是不可能这么快复制完成的，你可以在Alist的 **管理 - 任务 - 复制** 看到实时进度，然后耐心等待就可以了。
  > 
  > ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/202506260827772.png)

恭喜你又Get了一项新技能。
