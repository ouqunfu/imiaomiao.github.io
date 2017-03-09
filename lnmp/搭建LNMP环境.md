
## 1、centos 6.5 X86_64 VMware下编译安装搭建lnmp，架构web环境

&emsp;建议安装顺序：

&emsp;MySQL-------》》编译PHP----》》编译nginx

### （1）检查编译安装环境

####	&emsp;#查看httpd、mysql、php是否安装

####	&emsp;[root@localhost ~]#rpm -q httpd mysql php

####	&emsp;#如果已安装则卸载:
	
####	&emsp;[root@localhost ~]#rpm -e httpd --nodeps
	
####	&emsp;[root@localhost ~]#rpm -e mysql --nodeps
	
####	&emsp;[root@localhost ~]#rpm -e php --nodeps

####	&emsp;#删除相关文件
	
####	&emsp;find / -name php mysql nginx 
	
####	&emsp;rm -rf ***

### （2）安装解决依赖关系



	








### 参考链接 1、 [centos 6.5 搭建lnmp环境](http://blog.csdn.net/u010098331/article/details/50749587)
	