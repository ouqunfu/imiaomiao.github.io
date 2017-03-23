---
title: github-page-with-hexo
date: 2017-03-22 19:12:23
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

新增文章
	hexo new'github-page-with-hexo'

生成html

    hexo clean
    hexo generate

把生成的public目录下的文件放到master分支下