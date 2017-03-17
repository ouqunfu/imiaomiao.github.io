-- phpMyAdmin SQL Dump
-- version 4.0.10.16
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017-03-17 02:34:56
-- 服务器版本: 5.1.70-log
-- PHP 版本: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `accounts`
--

-- --------------------------------------------------------

--
-- 表的结构 `ac_record`
--

CREATE TABLE IF NOT EXISTS `ac_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `order_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0-支出 1-收入',
  `tid` tinyint(1) unsigned NOT NULL COMMENT '记录类型id',
  `money` decimal(10,2) unsigned NOT NULL COMMENT '金额',
  `remark` text NOT NULL COMMENT '备注',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`,`create_time`,`update_time`,`user_id`),
  KEY `order_type` (`order_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记录表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ac_type`
--

CREATE TABLE IF NOT EXISTS `ac_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '类型名称',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '记录类型 0-支出类型 1-收入类型',
  `fid` int(10) NOT NULL DEFAULT '0' COMMENT '所属父级类型',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `tid` (`fid`),
  KEY `sort` (`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='记账类型表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `ac_user`
--

CREATE TABLE IF NOT EXISTS `ac_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '登录用户名',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `login_time` int(10) NOT NULL COMMENT '最近登录时间',
  PRIMARY KEY (`id`),
  KEY `create_time` (`create_time`),
  KEY `login_time` (`login_time`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
