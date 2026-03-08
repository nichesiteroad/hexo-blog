---
title: 如何解决群晖NAS更换网络后，无法访问的问题
date: 2024-09-01 16:14:58
tags: 群晖
categories: self
id: how-to-solove-synology-nas-network-after-replacement
description:
---

去年7月份左右，家里安装了一台群晖NAS，型号是DS720+，两块4T硬盘，组Raid1。

使用群晖的这一年，还是比较方便的，做了磁盘映射之后，相当于电脑上多出来4T的内存。

我使用的场景主要是三个：

1. 存放照片：手机安装相应App后，手机拍摄的照片，就可以及时备份到NAS中；

2. 下载影视剧：利用群晖后台下载影视剧，之后多设备都可以播放NAS里面的影视剧；

3. 存放文件：日常文件存储。

但是，前两天因为子网关出现问题，换了一套新的网关之后，可以正常上网，但是NAS无法正常访问，自然也进不去控制台，甚至用[http://find.synology.com/](http://jump.bdimg.com/safecheck/index?url=x+Z5mMbGPAt3cM3pWnRnxfOljX2z29afQjIj43fWSK2yOb55np2EpsVPznfuhlppKN9GPoU/CNyHhMJ5C4W1SvXkfP8wZFYwK+q6t9e9hi+e0C06/70+3c4fVHLs5MC0U9LI4CCJvs4wPGbuJnYGNA==)也找不到NAS。

今天这篇文章，就结合我的经验，整理一下遇到这种情况的处理办法。

---

首先造成这种问题，大概率是因为：***<u>更换网关之前，忘记将NAS的联网方式从静态IP切换成DHCP</u>*** 。

因此就会导致设备无法联网，自然也是没有办法通过IP直接访问NAS进行修改。

> 所以当你有意向更换路由器或者网关时，家里有装NAS，一定要先进入DSM，将网络配置修改为DHCP。
> 
> 修改路径：控制面板-网络-网络界面-局域网X，点击局域网X，选择` 编辑` ,将网络配置修改为DHCP。
> 
> ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/DSM.png)

但是，当你看到我这篇文章的时候，说明你已经犯了这个错误。

好吧，那就看看如何挽救吧。

## 1. 找到原先的路由器/网关，进入DSM修改

这当然是最简单的办法，如果你能找到之前的路由器或者网关，那就先替换掉现在的路由器/网关，输入原先访问NAS的IP，进入DSM平台，按照上述方法，将网络配置修改为DHCP。

然后再将新的路由器/网关安装好，利用网线将NAS安装好之后，下载群晖的Synology Assistant工具，点击` 搜索`，就会扫描到当前网络下面的NAS，箭头所示位置会显示新的访问IP，在浏览器中输入ip:5000/5001，就可以正常访问了。

![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/SA.png)

> 有两个需要注意的点：
> 
> 1. 最好从路由器/网关拉出两条网线，一条连接NAS，一条连接电脑，这样会更加方便扫描到。我一开始使用笔记本电脑连接这个网关的无线网络，发现能扫描出来，但是状态显示失败，后来用网线直连，这个问题就解决了。
> 
> 2. 如果提示未扫描到你的NAS设备，也不要慌，按照SA的提示去进行设置，比如：关掉防火墙；启用兼容性等。

## 2. 直连

好吧，第一个办法无法解决，那就使用稍微麻烦一些的吧。

<img src="https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/3.png" title="" alt="" data-align="center">

这个办法是Synology官方给到的回复，你也可以试试，我在没有拿回旧网关之前，使用过这个办法，没有奏效。

> 提一嘴，我是用第一个办法，解决NAS无法访问的问题的。

*使用这个办法时，需要注意的是，将NAS和计算机用一根网线连接，计算机不要连接无线。*

其中提到的电脑IP固定，如何设置可以去网上搜索一下。

## 3. 重置NAS

如果以上办法都不行的话，也不要气馁，你的NAS还是可以实现正常访问的。

说来也简单，但是后续，你需要重新设置的地方就比较多了，不到万不得已的情况下，最好不要使用这个办法。

那就是直接[重置NAS]([如何重置Synology NAS？ （适用于 DSM 6.2.4 或以上版本） - Synology 知识中心](https://kb.synology.cn/zh-cn/DSM/tutorial/How_to_reset_my_Synology_NAS_7#t1))，使用其中的模式一，是不会导致你硬盘里面的文件丢失的。

以上，希望这篇文章可以帮助到你。
