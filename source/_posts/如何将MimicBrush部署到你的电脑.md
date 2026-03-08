---
title: 如何将MimicBrush部署到你的电脑
date: 2024-07-02 15:07:53
tags: mimicbrush 局部重绘
categories: self
id: mimicbrush
description: 本文介绍了如何将Github的MimicBrush项目部署到你的电脑。
---

当你看到这篇文章，对于MimicBrush项目应该已经有一定的了解了，想部署到自己的电脑上，跑一波看看，但是又苦于没有技术支撑？

我来帮助你。

## 一、安装Conda

MimicBrush这个项目是用Python语言编写的，因此你的电脑需要安装Python环境才可以，那么为什么要安装Conda呢？

这是为了方便你以后在本地跑其他的项目，既然你已经动了部署MimicBrush的贼心，我相信你以后也会恋上其他项目的。

但是很多项目使用的Python版本是不一样的，使用到的一些第三方库版本也不一样，如果你的电脑上只有一个Python环境，那么当你以后想跑其他的项目时，不可避免的就会出现报错，通过Conda，你可以在本地安装无数个彼此独立的Python环境，一劳永逸。

- [Conda官网](https://www.anaconda.com/download/success)下载合适的版本安装即可
  
  > Tips 1: 安装路径不要选择C盘，因为后续虚拟空间的项目会放在安装路径下的`envs`文件夹。
  > 
  > Tips 2: 安装Conda的时候会附带安装Python，切记勾选，不然你还得再单独安装一次Python。例如当下最新版本附带的都是`python3.12`![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/anacondainstall.png)
  > 
  > Tips 3: 如果有添加anaconda至环境变量的选项，建议勾选，省去后续自己配置的麻烦。

- 安装完成后，终端使用`conda -V`命令，如果输出Conda的版本信息，则安装成功。

- 如果你想要提高Conda下载包的速度，可以对Conda的下载源进行配置，打开`Anaconda`的控制台，输入`conda config`命令，系统会自动在当前用户的目录下`C:\Users\你的用户名`生成一个`.condarc`文件，打开之后添加合适的[镜像源](https://mirror.tuna.tsinghua.edu.cn/help/anaconda/)即可。
  
  > **不推荐，国内镜像源时不时会抽疯，莫名其妙喜提Bug**

## 二、安装Git环境

MimicBrush需要安装两个Checkpoints，并且提供了Git的下载链接，因此，如果你本地安装好Git环境，会事半功倍。

- 下载与本机系统匹配的Git客户端，并完成安装。

- 安装完成后，使用 `git --version` 命令查看本地Git版本信息，输出版本信息说明安装成功。

## 三、下载MimicBrush项目及Checkpoints到本地

- 使用Git命令将MimicBrush项目下载到本地电脑，为了避免文件名和`Checkpoints`中的`MimicBrush`冲突，建议将下载好的文件名命名为`Mimic`或者其他。

- 使用Git命令将MimicBrush项目的两个`Checkpoints`下载到本地电脑。

- 下载后的效果如图。`Mimic`为项目文件，`MimicBrush`和`cleansd`为项目依赖的两个Checkpoints。
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/projects.png)

## 四、安装项目相关依赖

这个步骤是最麻烦的，主要是Python环境与第三方库的版本匹配，以及第三方库彼此之间的版本匹配问题，一旦版本不匹配，就会报错，修复好一个报错，又会有另一个报错，不过没有关系，我已经为你摸索出来一个适配的Python环境，你可以按照这个环境去安装。

- 首先使用`conda create -n mimic python=3.10.14`命令，创建一个名为"mimic"的虚拟环境，并安装`Python 3.10.14`版本, 虚拟环境的名字你可以任意修改。
  
  > 项目中给的`Python==3.8.5`在安装`modelscope`时会报错。

- 将项目中的`requirements.txt`文件复制到虚拟环境文件夹下`\envs\mimic`。

- 在`Anaconda`的控制台中，激活你安装MimicBrush项目的虚拟环境，切换至虚拟环境文件目录，运行`pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/`命令安装依赖的第三方库。
  
  > Tips 1: 上面的镜像源是我实际测试出来最稳定的，安装包也比较齐全，强烈推荐。
  > 
  > Tips 2: `requirements.txt`中安装包的一些版本需要修改，项目中给定的版本安装时会报错，需要修改的安装包为`gradio==3.44.0`, `numpy==1.26.4`,如果还有其他的报错，你可以根据报错信息去针对性修改。

## 五、修改Checkpoints路径

你自然是要把Checkpoints的路径修改为你本地的路径，如何修改？

- 打开项目下的`./configs/inference.yaml`文件，修改为你的本地路径。
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/inference.png)

## 六、运行

终于到了激动人心的时刻了！

- 在`Anaconda`的控制台中，激活你安装MimicBrush项目的虚拟环境，切换至项目文件目录，运行`python run_gradio3_demo.py`命令。
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/prompt.png)

- 当跑出以下提示语时，就证明你已经部署成功了。
  
  > Tips 1: 可能会提示CUDA未安装的信息，不过不影响项目使用，如果你的电脑有使用英伟达显卡，不想看到报错信息的话，也可以根据你的显卡安装对应的CUDA，以后跑项目可能会比较快。
  > 
  > Tips 2: 可能会提示`Triton is not available`的信息，同样不影响项目使用，如果你有强迫症，也可以[下载](https://huggingface.co/r4ziel/xformers_pre_built/blob/main/triton-2.0.0-cp310-cp310-win_amd64.whl)安装。
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/runlocal.png)

- 在本地输入` http://127.0.0.1:7860`，就可以体验此项目了。
  
  ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/mimicbrush.png)
  
  **以上就是在本地部署MimicBrush项目的全过程，以下为conda常用命令行，没兴趣可略过。**

--------

## 其他、Conda常用命令

> conda create -n myenv python=3.8  
> 
> #创建一个名为"myenv"的虚拟环境，并安装`Python 3.8`版本
> 
> conda env list
> 
> #查看已安装的虚拟环境 
> 
> conda activate myenv
> 
> #激活名为"myenv"的虚拟环境
> 
> conda remove --name myenv --all
> 
> #删除名为"myenv"的虚拟环境
> 
> conda config --get channels
> 
> #列出 conda 中配置的 channels
> 
> conda install
> 
> #安装包
> 
> conda install -c bioconda presto
> 
> #指定在bioconda渠道安装presto
> 
> conda search beautifulsoup4
> 
> #检测是否可从 Anaconda 存储库中获得`beautifulsoup4`
