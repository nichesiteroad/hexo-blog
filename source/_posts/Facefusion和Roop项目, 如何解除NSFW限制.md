---
title: Facefusion和Roop项目, 如何解除NSFW限制
date: 2025-06-07 22:13:33
tags: 学习
categories: self
id: how-to-disable-nsfw-filter-in-facefusion-and-roop
description:
---

做亚马逊，经常会需要用到换脸工具，之前一直使用的是 [万能君的软件库]([万能君的软件库的个人空间-万能君的软件库个人主页-哔哩哔哩视频](https://space.bilibili.com/4228235/search?keyword=facefusion)) 作者封装好的安装包，但是版本是facefusion1.3.1，已经是很久之前的版本了，现在原作者已经更新到了 **[3.2.0](https://github.com/facefusion/facefusion)** ，就想着在本地直接部署到最新的版本。

另外了解到 **[Roop](https://github.com/s0md3v/roop)** 也是一款换脸工具，就一并安装了。

将项目部署到本地的过程比较简单，按照作者提供的教程一步步进行就好了。

> 运行FaceFusion：``python facefusion.py run --open-browser``
> 
> 运行Roop：``python run.py --execution-provider cuda``

安装好之后，这两个项目在本地就可以使用了。

但是，如果你还想要...，那么就需要解除这两个项目的NSFW限制。

## FaceFusion

1. 打开本地下载好的FaceFusion文件，进入到facefusion文件夹，打开``content_analyser.py`` 文件进行修改。

2. 找到这行代码 ``def detect_nsfw``。

3. 接着将``keep_indices = numpy.where(nsfw_scores_raw > 0.2)[0]`` 这行代码修改为``keep_indices = numpy.where(nsfw_scores_raw < 0.0)[0]``。
   
   > ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/facefusion.png)

4. 保存文件，重新启动项目，等待惊喜。

## Roop

1. 打开本地下载好的Roop文件，进入到roop文件夹，打开``predictor.py`` 文件进行修改。

2. 解除NSFW限制有两种办法：一种是修改数值，只要不超过某个数值，项目就无法检测图片/视频是否属于NSFW；另一种是直接删除NSFW相关的语句。
   
   这里我采用的是第二种。

3. 修改后的项目代码。
   
   > ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/roop.png)

4. 保存文件，重新启动项目，等待惊喜。

***探索新世界吧。***
