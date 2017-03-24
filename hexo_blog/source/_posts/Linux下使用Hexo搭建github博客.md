---
title: Linux下使用Hexo搭建github博客
date: 2017-03-22 23:40:09
tags:
---

#### 参考链接 [Linux下使用Hexo搭建github博客](http://www.cnblogs.com/zhaoyu1995/p/6239950.html)

### 1、安装nodejs

#### 国内镜像源下载v4.2.2,这里下载的是已经编译好的，解压就可以使用了
	
	tar zxvf node-v4.2.2-linux-x64.tar.gz
	cd node-v4.2.2-linux-x64.tar.gz/bin
	ls
	./node -v
然后设置全局
	
	ln -s /home/ferry/www/service-file/node-v4.2.2-linux-x64/bin/node /usr/local/bin/node
	ln -s /home/ferry/www/service-file/node-v4.2.2-linux-x64/bin/npm /usr/local/bin/npm
这样就可以直接使用node命令了

### 2、Hexo安装

	执行：
	npm install hexo-cli -g 
	报错:
	node: command not found
	...
	解决：http://www.cnblogs.com/lidonghao/p/3543747.html
	npm config set user 0
	npm config set unsafe-perm true

设置全局

	ln -s /home/ferry/www/service-file/node-v4.2.2-linux-x64/bin/hexo /usr/local/bin/hexo

开始

	hexo init blog
	#这一步是真慢
	cd blog
	npm install

其中_config.yml是配置站点的文件	
配置站点的url和permalink，这两个分别是你的站点的url host地址以及文章的永久连接

    url: http://www.xxx.com
    root:/
    permalink::year/:month/:day/:title.html
    permalink_defaults:

deploy配置
	deploy:
	  type: git
	  repo: git@github.com:ouqunfu/imiaomiao.github.io.git
	  branch: master

新增文章
	hexo new'github-page-with-hexo'

生成html

    hexo clean
    hexo generate

把生成的public目录下的文件放到master分支下

或者配置deploy,发布到github

	hexo deploy
	出错：ERROR Deployer not found: git
	解决：npm install hexo-deployer-git --save
	hexo deploy
	出错：
	解决：用 sudo ssh-keygen -t rsa -C “xxx@xxx.com”加上sudo在linux的root目录下创建ssh。

	然后利用cat 命令 gedit 或者vim打开在root目录下的ssh。sudo cat /var/root/.ssh/id_rsa.pub
	
	在github上面进行ssh的粘贴。



