---
title: 如何使用Hexo搭建个人博客
date: 2024-06-30 17:27:35
tags: Hexo 个人博客
categories: self
id: hexo-site
description: 本文介绍了如何使用Hexo以及Github Pages搭建个人博客。
---

一直都有写点什么的习惯，记录形式经历过日记本-印象笔记-金山文档-钉钉文档-微信公众号-WP网站的迭代 。前四种形式都偏私密，公众号开放程度太差，WP网站维护成本又比较高。

了解到Hexo+Github搭建静态网站这种形式，轻便易操作，省去了过多的维护工作，同时可定制化也很不错，就准备搭建一个静态网站，专门用作后续的内容创作了。

这篇文章就来整理下，如何使用Hexo+Github搭建专属个人博客，因本人也会持续使用这种形式进行内容创作，故与Hexo Blog使用过程中相关的一些学习也会一并记录。

因此本篇文章可能会比较臃肿，请见谅。

-----------------------------------------------------------------

## 一、创建Github Pages

进行博客搭建要借助 GitHub 为我们提供的仓库服务，并借用 GitHub 的仓库 Pages 功能来实现静态页面的显示，因此需要有一个 GitHub 账号。

### 1. 注册一个Github账号

### 2. 创建一个Github仓库

1. 进入Github账号，点击左上方的`Repositories`，然后点击右上方的`New`按钮。

2. 新创建一个仓库，按照如图所示去勾选，需要注意的是：**Repository name 必须是 [你的账户名称].github.io,** 之后点击右下方的 `Create repository`按钮。![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img/img/repository.png)

3. 进入当前仓库的 `Setting` 页面，左侧选择 `Pages` ，右侧就会展示 `GitHub Pages` 页面，点击链接，出现自己仓库的 readme.md 页面信息后表示创建成功。

## 二、本地安装Hexo

Hexo 依赖 Git 和 Node.js。因此需要先在本地安装 `Node.js` 和 `Git`环境之后，才可以使用`npm`来安装`Hexo` , 使用`Git` 进行后续博客的相关操作。

### 1. 安装Node.js 环境

1. 下载到本地后，双击应用安装即可。

2. 安装完成后，使用 `node -v` 命令查看本地 node.js 版本信息，输出版本信息说明安装成功。
   
   > 有网友推荐此处可以顺便设置一下国内镜像，增加后续下载资源包的速度，我的建议是没太大必要，我实测使用国内阿里云的镜像，下载时会报错，况且国外速度其实也不会慢很多。

### 2. 安装Git环境

1. 下载与本机系统匹配的Git客户端，并完成安装。

2. 安装完成后，使用 `git --version` 命令查看本地Git版本信息，输出版本信息说明安装成功。

3. 进行本地Git信息的配置，在任意文件夹鼠标右键打开`Git Bash Here`进行本地Git信息的配置。
   
   - 使用 `git config --global user.name"name"` 配置本地用户信息，name 为你的Git 账户名。
   
   - 使用 `git config --global user.email"eamil@xx.com"` 配置本地邮箱信息，email为你Git 账户的邮箱。
   
   - 使用 `ssh-keygen -t rsa -C"eamil@xx.com"` 命令在本地生成私钥和密钥信息。[大致需要四次回车，第二次回车输入`y`]
   
   - 密钥生成后，在本地 `~/.ssh` ，即用户路径的 .ssh 目录下找到 Git 的密钥和公钥 id_rsa.pub 文件。

4. 进行Git与GitHub 的授权认证。
   
   - 在 GitHub设置页面，选择左侧 `SSH and GPG keys` 内容，右侧新增一个 `SSH key `，上一步公钥文件内容作为 SSH 密钥添加到 GitHub 中，Title可以任意填写。![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/sshkey.png)
   
   - 填写完成之后点击下方的`Add SSH key`。
   
   - 使用控制台命令 `ssh -T git@github.com` 检查是否可以与远程通信，如果出现 Hi…  你的 GitHub 账户名称的内容，说明授权成功。

### 3. 安装Hexo

1. 在你的电脑上，选择一个本地存放Hexo Blog文件的位置，后续Hexo的文件将全部存放在此文件夹。

2. 进入到此文件夹中，右键选择 `Git Bash Here` 打开 Git 命令窗口。

3. 使用命令 `npm install -g hexo-cli` 下载安装 Hexo 项目。

4. 安装完成后，使用 `hexo -v` 命令查看本地hexo版本信息，输出版本信息说明安装成功。

### 4. 初始化本地Hexo Blog

1. 进入到存放Hexo Blog文件的文件夹，使用命令 `hexo init` 初始化 hexo 文件夹。

2. 使用命令 `npm install` 安装必备的组件。

3. 使用命令 `hexo g` 生成静态网页。

4. 使用 `hexo s` 打开本地服务器，开启后可在浏览器 `localhost:4000/` 查看本地博客效果。
   
   > 此处鼠标右键复制或者手动在浏览器输入上方链接，切勿直接使用`ctrl + c`命令复制，因为Git中`ctrl + c`是Stop的快捷键，会让本地服务器停止工作，`localhost:4000/`这个链接你是绝对不可能打的开的，我被这个困扰了很久...

## 三、部署到Github仓库

本地成功安装Hexo后，此刻你的个人博客还没有正式上线，你还需要将本地Hexo与GitHub仓库进行关联，才能通过访问Github Pages 查看博客内容。

1. 打开 hexo 目录下的 `_config.yml` 文件，修改配置内容。![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/deploy.png)

2. 修改完之后，使用命令`npm install --save hexo-deployer-git`安装Hexo部署插件。

3. 使用命令`hexo clean`清除缓存文件。

4. 使用命令 `hexo g` 生成静态网页。

5. 使用命令 `hexo d` 将项目部署到远程仓库。

6. 此刻你就可以通过访问Github Pages 查看博客内容了。

> 如果`hexo d`之后出现需要输入账号密码的对话框，账号直接输入GitHub账号即可，下一个对话框切记不要输入GitHub密码，此对话框需要输入的是Token,获取路径为GitHub-Setting-Developer Setting-Personal access tokens。![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/tokens.png)

**以上就是使用Hexo+GitHub搭建个人博客的全过程了，之后你可以根据需要安装主题，进行博客的装修，安装统计分析代码等等操作，让你的博客朝着你喜欢的方向前进。**

---------

**以下为搭建博客中可能遇到的一些Bug以及想运营好博客需要了解的一些知识，不感兴趣可以直接略过**

## 四、Bug及解决方案

### 1. 如果默认端口4000已经被占用

- 使用命令`hexoblog1 hexo s -p xxxx`指定合适的端口号

### 2. error：`spawn failed`

1. 删除根目录下的`.deploy_git`文件夹

2. 输入`git config --global core.autocrlf false`

3. 依次执行hexo三连：`hexo clean``hexo g``hexo d`

### 3. error: ` # YAMLException: can not read a block mapping entry; a multiline key may not be an implicit key at line 5, column 1`

1. 如果已经创建了文章，那就是文章的头部声明没有加空格。

2. 如果还没有创建文章，那么大概率是`scaffolds/post.md`文件中的格式有问题，想想你是不是在修改的时候，犯了这几个错误：使用的是中文状态下的冒号；冒号后面没有加空格，单词写错了。

## 五、Hexo Blog相关知识

### 1. npm命令行

> npm install -g         #全局安装
> npm install --save  #把xxx包安装到node_modules目录中

### 2. Hexo命令行

> hexo clean  #清除缓存文件
> hexo g         #生成文件
> hexo s         #本地预览
> hexo d        #部署至服务器
> hexo n        #新增post
> hexo new page  #新增页面

### 3. 自定义域名配置

如果你觉得Github Pages的域名太丑，那么可以将域名修改为你自己的域名，没有的话，可以去阿里云或者namecheap等域名网站购买。设置步骤如下。

1. 进入域名管理界面，做DNS配置。![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/dns.png)

2. 进入GitHub Pages 仓库，依次点击Setting-Pages，拉到页面下方，在此位置输入你的域名，点击`Save` 进行验证，验证成功后，你的域名已经设置成功，此时你会看到仓库根目录下出现了一个`CNAME`文件。![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/domain.png)

3. 还需要做最最最重要的一步！！！**在 `hexo` 生成的博客的 `source` 目录下新建一个 `CNAME` 文件，然后在这个文件中填入你的域名，否则当你再次执行`hexo d`命令时，GitHub Pages 仓库现有的`CNAME`文件就会被删除，域名关联自然就会消失。**
   
   > 此处还有一个需要注意的点：`CNAME`文件必须是无后缀文件，`CNAME.txt`也是不行的。请查看[如何去掉文本文档后面的txt。](https://jingyan.baidu.com/article/ed15cb1b17a3235ae269813e.html)

### 4. 自定义Url设置

Hexo文章默认的Url不利于SEO，因此最好是可以进行Url的自定义。

1. 打开 hexo 目录下的 `_config.yml` 文件，修改`permalink:`后面的内容, [可自定义变量。](https://hexo.io/zh-cn/docs/permalinks)

2. 为了防止遗忘，你可以打开hexo目录下的`scaffolds`文件夹，打开`post.md`文件，在此文件中修改你的文章默认头部声明。**注意: 英文状态下的冒号；冒号后面加空格；变量字母要写对**
   
   > 例如我将`permalink`修改为`permalink: :id/`, 那么在此文件中就需要增加`id: `这个变量。
   > 
   > ![](https://cdn.jsdelivr.net/gh/nichesiteroad/blog-img//img/postmd.png)

3. 后续当你创建文章的时候，文章头部声明就会是你上方的默认设置，将url填入你设置的变量即可。
