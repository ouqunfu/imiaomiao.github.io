---
title: lnmp下部署thinkphp5项目
date: 2017-03-22 23:40:09
tags:
---

## lnmp环境下部署thinkphp5 项目遇到的问题

### 1、

#### 2017/03/19 23:58:11 [error] 50459#0: *213 FastCGI sent in stderr: "PHP message: PHP Warning:  require(): open_basedir restriction in effect. File(/mnt/hgfs/www/imiaomiao.github.io/project/accounts/thinkphp/start.php) is not within the allowed path(s): (/mnt/hgfs/www/imiaomiao.github.io/project/accounts/public:/tmp/:/proc/) in /mnt/hgfs/www/imiaomiao.github.io/project/accounts/public/index.php on line 17
#### PHP message: PHP Warning:  require(/mnt/hgfs/www/imiaomiao.github.io/project/accounts/thinkphp/start.php): failed to open stream: Operation not permitted in /mnt/hgfs/www/imiaomiao.github.io/project/accounts/public/index.php on line 17

### 解决方法：
#### 在nginx.conf文件中增加，设置目录
#### fastcgi_param  PHP_VALUE  "open_basedir=/mnt/hgfs/www/imiaomiao.github.io/project/accounts/:/tmp/:/proc/";