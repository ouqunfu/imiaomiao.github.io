---
title: centos下安装编译安装git-2.3.0
date: 2017-03-22 23:40:09
tags:
---

Git是一款免费、开源的分布式版本控制系统，用于敏捷高效地处理任何或小或大的项目。

Git是一个开源的分布式版本控制系统，可以有效、高速的处理从很小到非常大的项目版本管理。[2]  Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。

git 安装

本机yum源的git是低版本的git-1.7.0,安装之后无法正常使用，所以在不更改yum源的情况下，选择编译安装2.3.0版本

生成 configure命令

make configure

报错： GIT_VERSION = 2.3.0
    GEN configure
/bin/sh: autoconf: command not found
make: *** [configure] Error 127

yum install autoconf automake libtool

./configure --prefix=/usr/local/git

make && make install


