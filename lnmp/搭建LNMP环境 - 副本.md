
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

	yum install -y wget gcc gcc-c++ autoconf libjpeg libjpeg-devel perl perl* perl-CPAN libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers png jpeg autoconf gcc cmake make gcc-c++ gcc ladp ldap* ncurses ncurses-devel zlib zlib-devel zlib-static pcre pcre-devel pcre-static openssl openssl-devel perl libtoolt openldap-devel libxml2-devel ntpdate cmake gd* gd2 ImageMagick-devel jpeg jpeg* pcre-dev* fontconfig libpng libxml2 zip unzip gzip

yum install -y wget gcc gcc-c++ autoconf libjpeg libjpeg-devel perl perl* perl-CPAN libpng libpng-devel freetype 

freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel 

ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl 

openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers png jpeg autoconf gcc cmake 

make gcc-c++ gcc ladp ldap* ncurses ncurses-devel zlib zlib-devel zlib-static pcre pcre-devel pcre-static 

openssl openssl-devel perl libtoolt openldap-devel libxml2-devel ntpdate cmake gd* gd2 ImageMagick-devel jpeg 

jpeg* pcre-dev* fontconfig libpng libxml2 zip unzip gzip


### （3）安装mysql-5.5.53

下载mysql-5.5.53.tar.gz

groupadd mysql

useradd mysql -g mysql

tar -zxvf mysql-5.5.30.tar.gz

cd mysql-5.5.30

cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql \

-DMYSQL_UNIX_ADDR=/tmp/mysql.sock \

-DEXTRA_CHARSETS=all \

-DDEFAULT_CHARSET=utf8 \

-DDEFAULT_COLLATION=utf8_general_ci \

-DWITH_EXTRA_CHARSETS:STRING=utf8,gbk \

-DWITH_INNOBASE_STORAGE_ENGINE=1 \

-DWITH_READLINE=1 \

-DENABLED_LOCAL_INFILE=1 \

-DMYSQL_DATADIR=/data/mysql/ \

-DMYSQL_USER=mysql \

-DMYSQL_TCP_PORT=3306	

	cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_UNIX_ADDR=/tmp/mysql.sock -DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DWITH_EXTRA_CHARSETS:STRING=utf8,gbk -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_READLINE=1 -DENABLED_LOCAL_INFILE=1 -DMYSQL_DATADIR=/data/mysql/ -DMYSQL_USER=mysql -DMYSQL_TCP_PORT=3306

make && make install

mkdir -p /data/mysql

chown mysql.mysql -R /data/mysql

mv /etc/my.cnf /etc/my.cnf-old

cp support-files/my-medium.cnf /etc/my.cnf

chmod 755 scripts/mysql_install_db

scripts/mysql_install_db  --user=mysql  --basedir=/usr/local/mysql --datadir=/data/mysql/

cp support-files/mysql.server /etc/init.d/mysqld

chmod 755 /etc/init.d/mysqld

chkconfig mysqld on

service mysqld start

设置mysql的root密码为123456

/usr/local/mysql/bin/mysqladmin -u root password '123456'

### （4）安装php的扩展库：libiconv

tar zxvf libiconv-1.13.tar.gz

cd libiconv-1.13/

./configure --prefix=/usr/local

make && make install

### （5）安装php扩展库：libmcrypt

tar zxvf libmcrypt-2.5.8.tar.gz

cd libmcrypt-2.5.8/

./configure

make && make install

/sbin/ldconfig

#### 注：这里不要退出去了。

cd libltdl/

./configure --enable-ltdl-install

make && make install


### （6） 安装php扩展库：mhash

tar zxvf mhash-0.9.9.9.tar.gz

cd mhash-0.9.9.9/

./configure

make && make install


### （7） 做库的软连接：

ln -s /usr/local/lib/libmcrypt.la /usr/lib/libmcrypt.la

ln -s /usr/local/lib/libmcrypt.so /usr/lib/libmcrypt.so

ln -s /usr/local/lib/libmcrypt.so.4 /usr/lib/libmcrypt.so.4

ln -s /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib/libmcrypt.so.4.4.8

ln -s /usr/local/lib/libmhash.a /usr/lib/libmhash.a

ln -s /usr/local/lib/libmhash.la /usr/lib/libmhash.la

ln -s /usr/local/lib/libmhash.so /usr/lib/libmhash.so

ln -s /usr/local/lib/libmhash.so.2 /usr/lib/libmhash.so.2

ln -s /usr/local/lib/libmhash.so.2.0.1 /usr/lib/libmhash.so.2.0.1

ln -s /usr/lib64/libldap* /usr/lib/

### (8) 安装php扩展包：mcrypt

tar zxvf mcrypt-2.6.8.tar.gz

cd mcrypt-2.6.8/

/sbin/ldconfig

./configure

make && make install


### (9) 安装php-5.4.21：

tar -zxvf php-5.4.21.tar.gz

cd php-5.4.21

 ./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --with-mysql=/usr/local/mysql 

--with-mysqli=/usr/local/mysql/bin/mysql_config --with-iconv-dir=/usr/local --with-freetype-dir --with-jpeg-dir 

--with-png-dir --with-zlib --with-gd --enable-gd-native-ttf --with-libxml-dir=/usr --enable-xml --disable-rpath 

--enable-discard-path --enable-safe-mode --enable-bcmath --enable-shmop --enable-sysvsem --enable-inline-

optimization --with-curl --with-curlwrappers --enable-mbregex --enable-fastcgi --enable-fpm --enable-force-cgi-

redirect --enable-mbstring --with-mcrypt --with-openssl --with-mhash --enable-pcntl --enable-sockets --with-ldap 
 
--with-ldap-sasl --with-xmlrpc --enable-zip --enable-soap --without-pear

---
编译报错：
configure: error: Don't know how to define struct flock on this system, set --enable-opcache=no

解决： 安装 yum groupinstall "Development Tools" 

重新编译

configure: WARNING: unrecognized options: --enable-discard-path, --enable-safe-mode, --with-curlwrappers, --enable-fastcgi, --enable-force-cgi-redirect


如果加的参数有不支持的，提示比如：configure: WARNING: unrecognized options: --enable-discard-path, --enable-safe-mode, --enable-fastcgi, --enable-force-cgi-redirect

说明上述这些参数废弃了。

---

ln -s /usr/local/mysql/lib/libmysqlclient.so.18 /usr/lib64/

make ZEND_EXTRA_LIBS='-liconv'

make install

cp -f php.ini-production /usr/local/php/etc/php.ini

ln -s /usr/local/php/etc/php.ini /usr/local/php/php.ini

cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf

### (10) 安装php扩展库：memcache

tar zxvf memcache-2.2.5.tgz

cd memcache-2.2.5/

/usr/local/php/bin/phpize

./configure --with-php-config=/usr/local/php/bin/php-config

make && make install

### (11) 安装php加速：eaccelerator

tar -zxvf eaccelerator-eaccelerator-42067ac.tar.gz

cd eaccelerator-eaccelerator-42067ac

/usr/local/php/bin/phpize

./configure --enable-eaccelerator=shared --with-php-config=/usr/local/php/bin/php-config

make && make install

注：这里安装使用的是php5.6，eaccelerator并不兼容，则略过不安装


### （12） 修改php.ini增加memcache,ea等软件信息


添加memcache库的位置：

vim /usr/local/php/php.ini

extension_dir = "/usr/local/php/lib/php/extensions/no-debug-non-zts-20100525"

extension = "memcache.so"

extension = "pdo_mysql.so"

extension = "imagick.so"

### （13）安装php扩展库:PDO_MYSQL

tar zxvf PDO_MYSQL-1.0.2.tgz

cd PDO_MYSQL-1.0.2/

/usr/local/php/bin/phpize

./configure --with-php-config=/usr/local/php/bin/php-config --with-pdo-mysql=/usr/local/mysql

ln -s /usr/local/mysql/include/* /usr/local/include/

make && make install


### （14）安装ImageMagick服务

tar zxvf ImageMagick.tar.gz

cd ImageMagick-6.5.1-2/

./configure && make && make install


### （15）安装php扩展库：imagick

tar zxvf imagick-3.1.2.tgz

cd imagick-3.1.2/

/usr/local/php/bin/phpize

ln -s /usr/local/include/ImageMagick-6 /usr/local/include/ImageMagick

./configure --with-php-config=/usr/local/php/bin/php-config

make && make install

### （16）添加WWW用户，为系统运行nginx专用用户： 

/usr/sbin/groupadd www

/usr/sbin/useradd -g www www

mkdir -p /var/log/nginx

chmod +w /var/log/nginx

chown -R www:www /var/log/nginx

mkdir -p /data0/www

chmod +w /data0/www

chown -R www:www /data0/www

### （17）修改php-fpm.conf的配置：

vim /usr/local/php/etc/php-fpm.conf

#去掉/更改 配置文件中的;

pm.max_children = 64

pm.start_servers = 20

pm.min_spare_servers = 5

pm.max_spare_servers = 35

pm.max_requests = 1024

user = www

group = www


#检查语法是否正确

/usr/local/php/sbin/php-fpm -t

NOTICE: configuration file /usr/local/php/etc/php-fpm.conf test is successful

看到上面的信息 证明php配置文件正常，可以启动了。

### （18） 添加环境变量：

echo "export PATH=\$PATH:/usr/local/php/sbin/" >>/etc/profile

echo "export PATH=\$PATH:/usr/local/php/bin/" >>/etc/profile

./etc/profile

	注意：这里最后一步报错-bash: ./etc/profile: Permission denied


### 参考链接 1、 [centos 6.5 搭建lnmp环境](http://blog.csdn.net/u010098331/article/details/50749587)


2 下载所有使用到的软件：（13个）

wget http://ftp.gnu.org/gnu/libiclsonv/libiconv-1.13.tar.gz

手动下载 https://sourceforge.net/projects/mcrypt/files/Libmcrypt/2.5.8/ 

wget http://jaist.dl.sourceforge.NET/project/mcrypt/MCrypt/2.6.8/mcrypt-2.6.8.tar.gz

wget http://jaist.dl.sourceforge.Net/project/mhash/mhash/0.9.9.9/mhash-0.9.9.9.tar.gz

wget http://vps.googlecode.com/files/memcache-2.2.5.tgz

wget http://vps.googlecode.com/files/PDO_MYSQL-1.0.2.tgz

wget http://pecl.php.net/get/imagick-3.1.2.tgz

wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.21.tar.gz

wget http://netcologne.dl.sourceforge.net/project/mysql.mirror/MySQL%205.5.30/mysql-5.5.30.tar.gz（链接已失效，改为使用Sohu的镜像源）

wget http://mirror.aarnet.edu.au/pub/imagemagick/ImageMagick-6.9.8-0.tar.gz

wget http://pecl.php.net/get/imagick-3.1.2.tgz

wget http://us3.php.net/get/php-5.4.21.tar.gz/from/cn2.php.net/mirror

wget http://soft.vpser.net/web/eaccelerator/eaccelerator-eaccelerator-42067ac.tar.gz

wget http://nginx.org/download/nginx-1.4.0.tar.gz
	