
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


	yum install -y wget gcc gcc-c++ autoconf libjpeg libjpeg-devel perl perl* perl-CPAN libpng libpng-devel freetype 
	freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel 
	ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl 
	openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers png jpeg autoconf gcc cmake 
	make gcc-c++ gcc ladp ldap* ncurses ncurses-devel zlib zlib-devel zlib-static pcre pcre-devel pcre-static 
	openssl openssl-devel perl libtoolt openldap-devel libxml2-devel ntpdate cmake gd* gd2 ImageMagick-devel jpeg 
	jpeg* pcre-dev* fontconfig libpng libxml2 zip unzip gzip
	

### (3) yum源安装mysql5.1.73

	yum install mysql mysql-server mysql-devel

#### 重置mysql密码


	mysql > use mysql;
	mysql > update user set password=password('123456') where user='root';
	mysql > exit;

#### 重启mysql服务

	[root@localhost /]# service mysqld restart





### 参考链接 1、 [centos 6.5 搭建lnmp环境](http://blog.csdn.net/u010098331/article/details/50749587)
	