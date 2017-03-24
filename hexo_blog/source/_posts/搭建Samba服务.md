---
title: 搭建Samba服务
date: 2017-03-22 23:40:09
tags:
---

#### Samba是在Linux和UNIX系统上实现SMB协议的一个免费软件，由服务器及客户端程序构成。

#### 为了实现Windows主机与Linux服务器之间的资源共享，Linux操作系统提供了Samba服务，Samba服务为两种不同的操作系统架起了一座桥梁，使Linux系统和Windows系统之间能够实现互相通信，为广泛的Linux爱好者提供了极大方便。

# centos 搭建Samba服务环境

## 1、临时关闭防火墙iptables和SELinux

####	&emsp;	开启： service iptables start
####	&emsp;	关闭： service iptables stop

####	&emsp;	setenforce 1 设置SELinux 成为enforcing模式
####	&emsp;	setenforce 0 设置SELinux 成为permissive模式 

## 2、yum源安装Samba服务

### （1）安装状况

####	&emsp;	[root@localhost bin]# rpm -qa|grep samba
####	&emsp;	samba-winbind-clients-3.6.23-36.el6_8.x86_64
####	&emsp;	samba-client-3.6.23-36.el6_8.x86_64
####	&emsp;	samba-3.6.23-36.el6_8.x86_64
####	&emsp;	samba-common-3.6.23-36.el6_8.x86_64
####	&emsp;	samba-swat-3.6.23-36.el6_8.x86_64
####	&emsp;	samba-winbind-3.6.23-36.el6_8.x86_64
####	&emsp;	[root@localhost bin]# 

### （2）安装包说明

####	&emsp;	samba-common-3.5.10-125.el6.x86_64               //主要提供samba服务器的设置文件与设置文件语法检验程序testparm

####	&emsp;	samba-client-3.5.10-125.el6.x86_64                    //客户端软件，主要提供linux主机作为客户端时，所需要的工具指令集

####	&emsp;	samba-swat-3.5.10-125.el6.x86_64                    //基于https协议的samba服务器web配置界面

####	&emsp;	samba-3.5.10-125.el6.x86_64                            //服务器端软件，主要提供samba服务器的守护程序，共享文档，日志的轮替，开机

### （3）启动Samba服务器

####	&emsp;通过/etc/init.d/smb start/stop/restart来启动、关闭、重启Samba服务

### （4）查看Samba服务启动情况

####	&emsp;service smb status

### （5）设置开机自启动

####	&emsp;chkconfig --level 35 smb on             //在3、5级别上自动运行samba服务

## 3、配置Samba服务

#### Samba的主配置文件为/etc/samba/smb.conf

#### 主配置文件由两部分构成

Global Settings (55-245行)
#### 该设置都是与Samba服务整体运行环境有关的选项，它的设置项目是针对所有共享资源的。

Share Definitions （246-尾行）
#### 该设置针对的是共享目录个别的设置，只对当前的共享资源起作用。

#### (1)备份配置文件，配置自己的选项
	#cp -p /etc/samba/smb.conf    /etc/samba/smb.conf.backup

#### (2) 设置共享目录为/share
	# 设置匿名用户可以下载或上传共享文件，给/share目录授权为nobody权限
	# chown -R nobody:nobody share/
	
	# smb.conf配置文件增加
	[public]                                          #设置针对的是共享目录个别的设置，只对当前的共享资源起作用
    comment = Public Stuff                            #对共享目录的说明文件，自己可以定义说明信息
    path = /share                                     #用来指定共享的目录，必选项
    public = yes                                      #所有人可查看,等效于guest ok = yes

#### (3) 重启smb服务
	/etc/init.d/smb restart
	/etc/init.d/nmb restart

#### (4)测试smb.conf配置是否正确
	testparm

#### (5) 访问Samba服务器的共享文件

在Linux下访问Samba服务器的共享文件\

	# smbclient //192.168.247.131/public
	#出错：session setup failed: NT_STATUS_LOGON_FAILURE
	#原因：执行smbclient命令的用户ID没有成为samba服务的用户
	# smbpasswd -a root

在windows下访问Samba服务器的共享文件

	# \\192.168.247.131	
	


### 参考链接  1、 [CentOS 6.3下Samba服务器的安装与配置](http://www.cnblogs.com/mchina/archive/2012/12/18/2816717.html)



