/*
SQLyog v10.2 
MySQL - 5.5.27 : Database - oa_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oa_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oa_db`;

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` varchar(128) NOT NULL,
  `name` varchar(64) NOT NULL COMMENT '公司名称',
  `address` varchar(128) NOT NULL COMMENT '公司地址',
  `linkMan` varchar(32) NOT NULL COMMENT '联系人',
  `tel` char(11) NOT NULL COMMENT '联系人电话',
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  `isDeleted` int(1) DEFAULT '0' COMMENT '是否删除,0:未删除,1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

/*Data for the table `company` */

insert  into `company`(`id`,`name`,`address`,`linkMan`,`tel`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`,`isDeleted`) values ('8601','北京昌盛宏达科技股份有限公司','知春路101号','860001','12345678901','860000','860000','2017-11-10 12:16:03','2017-11-17 12:28:13','2017-11-10','2017-11-10',0),('8602','艾特小南庄','亿德大厦','860000','11111167865','860000','860001','2017-11-17 17:47:36','2017-11-20 09:59:52','2017-11-17','2017-11-20',0),('8603','北京国贸','北京朝阳建设路128号','860001','12567898765','860000','860000','2017-11-17 12:22:42','2017-11-17 12:28:51','2017-11-17','2017-11-17',0),('8604','北京昌平','平西府2楼','860001','78897909872','860000','860001','2017-11-17 16:09:41','2017-11-17 16:12:10','2017-11-17','2017-11-17',1),('8605','大学生实习基地','平西府3楼','860000','78897909872','860000','860000','2017-11-17 16:09:55','2017-11-20 09:59:14','2017-11-17','2017-11-20',0);

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否删除,0:未删除,1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`,`isDeleted`) values (1,'市场部','860000','860001','2017-11-10 12:14:43','2017-11-17 11:46:23','2017-11-10','2017-11-17',0),(8,'教学部','860000','860000','2017-11-17 11:44:48','2017-11-20 14:33:48','2017-11-17','2017-11-17',0),(9,'行政部','860001','860001','2017-11-27 16:01:09','2017-11-27 16:01:09','2017-11-27','2017-11-27',0);

/*Table structure for table `generaterule` */

DROP TABLE IF EXISTS `generaterule`;

CREATE TABLE `generaterule` (
  `type` varchar(32) NOT NULL COMMENT '类型',
  `serialNum` varchar(64) NOT NULL COMMENT '序号',
  `author` varchar(32) NOT NULL COMMENT '创建者',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否删除,0:未删除,1:删除',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='序号生成规则表';

/*Data for the table `generaterule` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `id` bigint(20) NOT NULL,
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,permission',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串,例如user:create代表用户新增',
  `parentID` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentIDs` varchar(128) DEFAULT NULL COMMENT '父结点id列表串，即从树根开始遍历，到该结点的路径',
  `sort` int(11) DEFAULT NULL COMMENT '排序号，用以决定在页面中显示的先后顺序',
  `isAvailable` char(1) DEFAULT '是' COMMENT '是否可用',
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否删除,0:未删除,1:删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源权限表';

/*Data for the table `permission` */

insert  into `permission`(`id`,`name`,`type`,`url`,`percode`,`parentID`,`parentIDs`,`sort`,`isAvailable`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`,`isDeleted`) values (0,'权限资源','',NULL,'',NULL,NULL,NULL,'是','860000','860000','2017-11-27 10:56:04','2017-11-27 11:45:11','2017-11-27','2017-11-27',0),(10,'部门管理','menu','/department','department',0,'0/10/',1,'是','860000','860000','2017-11-27 11:41:42','2017-11-27 14:45:43','2017-11-27','2017-11-27',0),(11,'添加部门','permission','/department/insertDepartment','department:insert',10,'0/10/11/',NULL,'是','860000','860000','2017-11-27 11:41:45','2017-11-27 11:56:03','2017-11-27','2017-11-27',0),(12,'修改部门','permission','/department/updateDepartment','department:update',10,'0/10/12/',NULL,'是','860000','860000','2017-11-27 11:41:47','2017-11-27 11:56:11','2017-11-27','2017-11-27',0),(13,'部门列表','permission','/department/queryAllDepartments','department:query',10,'0/10/13/',NULL,'是','860000','860000','2017-11-27 11:41:50','2017-11-27 11:56:13','2017-11-27','2017-11-27',0),(14,'删除部门','permission','/department/deleteDepartment','department:delete',10,'0/10/14/',NULL,'是','860000','860000','2017-11-27 11:41:52','2017-11-27 11:56:23','2017-11-27','2017-11-27',0),(20,'公司管理','menu','/company','company',0,'0/20/',2,'是','860000','860000','2017-11-27 11:41:54','2017-11-27 15:52:08','2017-11-27','2017-11-27',0),(21,'添加公司','permission','/company/insertCompany','company:insert',20,'0/20/21/',NULL,'是','860000','860000','2017-11-27 11:41:56','2017-11-27 11:57:10','2017-11-27','2017-11-27',0),(22,'公司列表','permission','/company/queryAllCompanies','company:query',20,'0/20/22/',NULL,'是','860000','860000','2017-11-27 11:41:58','2017-11-27 11:57:19','2017-11-27','2017-11-27',0),(23,'修改公司','permission','/company/updateCompany','company:update',20,'0/20/23/',NULL,'是','860000','860000','2017-11-27 11:42:00','2017-11-27 11:57:26','2017-11-27','2017-11-27',0),(24,'删除公司','permission','/company/deleteCompany','company:delete',20,'0/20/24/',NULL,'是','860000','860000','2017-11-27 11:42:02','2017-11-27 11:57:32','2017-11-27','2017-11-27',0),(30,'用户管理','menu','/user','user',0,'0/30/',3,'是','860000','860000','2017-11-27 11:42:04','2017-11-27 15:52:16','2017-11-27','2017-11-27',0),(31,'添加用户','permission','/user/insertUser','user:insert',30,'0/30/31/',NULL,'是','860000','860000','2017-11-27 11:42:07','2017-11-27 11:58:11','2017-11-27','2017-11-27',0),(32,'用户列表','permission','/user/queryAllUsers','user:query',30,'0/30/32/',NULL,'是','860000','860000','2017-11-27 11:42:08','2017-11-27 11:58:18','2017-11-27','2017-11-27',0),(33,'修改用户','permission','/user/updateUser','user:update',30,'0/30/33/',NULL,'是','860000','860000','2017-11-27 11:42:10','2017-11-27 11:58:25','2017-11-27','2017-11-27',0),(34,'删除用户','permission','/user/deleteUser','user:delete',30,'0/30/34/',NULL,'是','860000','860000','2017-11-27 11:42:12','2017-11-27 11:58:34','2017-11-27','2017-11-27',0),(35,'查询用户角色','permission','/user/queryRoleByAccount','user:queryRole',30,'0/30/35/',NULL,'是','860000','860000','2017-11-27 11:42:14','2017-11-27 11:58:58','2017-11-27','2017-11-27',0),(36,'修改用户角色','permission','/user/updateUserRole','user:updateRole',30,'0/30/36/',NULL,'是','860000','860000','2017-11-27 11:42:16','2017-11-27 11:59:13','2017-11-27','2017-11-27',0),(40,'个人中心','menu','/user/','me',0,'0/40/',4,'是','860000','860000','2017-11-27 11:42:17','2017-11-27 15:52:22','2017-11-27','2017-11-27',0),(41,'重置密码','permission','/user/resetPassword','password:reset',40,'0/40/41/',NULL,'是','860000','860000','2017-11-27 11:42:19','2017-11-27 11:58:45','2017-11-27','2017-11-27',0),(50,'角色管理','menu','/role','role',0,'0/50/',5,'是','860000','860000','2017-11-27 11:42:21','2017-11-27 15:52:29','2017-11-27','2017-11-27',0),(51,'添加角色','permission','/role/insertRole','role:insert',50,'0/50/51/',NULL,'是','860000','860000','2017-11-27 11:42:22','2017-11-27 12:00:14','2017-11-27','2017-11-27',0),(52,'角色列表','permission','/role/queryAllRoles','role:query',50,'0/50/52/',NULL,'是','860000','860000','2017-11-27 11:42:24','2017-11-27 12:00:22','2017-11-27','2017-11-27',0),(53,'修改角色可用性','permission','/role/updateRoleAvailable','role:updateIsAvailable',50,'0/50/53/',NULL,'是','860000','860000','2017-11-27 11:42:25','2017-11-27 12:00:38','2017-11-27','2017-11-27',0),(54,'查询角色权限','permission','/role/queryPermissionByRoleID','role:queryPermission',50,'0/50/54/',NULL,'是','860000','860000','2017-11-27 11:42:28','2017-11-27 11:59:58','2017-11-27','2017-11-27',0),(55,'修改角色权限','permission','/role/updateRolePermission','role:updatePermission',50,'0/50/55/',NULL,'是','860000','860000','2017-11-27 11:42:29','2017-11-27 12:00:05','2017-11-27','2017-11-27',0);

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '角色名',
  `isAvailable` char(1) DEFAULT '是' COMMENT '是否可用',
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否删除,0:未删除,1:删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`isAvailable`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`,`isDeleted`) values (1,'超级管理员','是','860000','860000','2017-11-27 12:11:04','2017-11-27 14:39:33','2017-11-27','2017-11-27',0),(2,'部门经理','是','860000','860000','2017-11-27 15:56:49','2017-11-27 15:56:49','2017-11-27','2017-11-27',0),(3,'董事会','是','860000','860000','2017-11-27 15:58:24','2017-11-27 15:58:24','2017-11-27','2017-11-27',0);

/*Table structure for table `role_permission` */

DROP TABLE IF EXISTS `role_permission`;

CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleID` int(11) NOT NULL COMMENT '角色ID',
  `permissionID` bigint(20) NOT NULL COMMENT '资源权限id',
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否删除,0:未删除,1:删除',
  PRIMARY KEY (`id`),
  KEY `FK_permission_id_fk` (`permissionID`),
  KEY `FK_role_id_fk` (`roleID`),
  CONSTRAINT `FK_permission_id_fk` FOREIGN KEY (`permissionID`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_role_id` FOREIGN KEY (`roleID`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='角色-资源权限表';

/*Data for the table `role_permission` */

insert  into `role_permission`(`id`,`roleID`,`permissionID`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`,`isDeleted`) values (1,1,10,'860000','860000','2017-11-27 14:40:58','2017-11-27 14:41:35','2017-11-27','2017-11-27',0),(2,1,11,'860000','860000','2017-11-28 10:06:42','2017-11-28 10:07:20','2017-11-28','2017-11-28',0),(3,1,12,'860000','860000','2017-11-28 10:06:57','2017-11-28 10:07:21','2017-11-28','2017-11-28',0),(4,1,13,'860000','860000','2017-11-27 14:42:18','2017-11-27 14:42:23','2017-11-27','2017-11-27',0),(5,1,14,'860000','860000','2017-11-27 14:42:32','2017-11-27 14:42:37','2017-11-27','2017-11-27',0),(6,1,20,'860000','860000','2017-11-27 14:42:53','2017-11-27 14:42:59','2017-11-27','2017-11-27',0),(7,1,21,'860000','860000','2017-11-27 14:43:10','2017-11-27 14:43:16','2017-11-27','2017-11-27',0),(8,1,22,'860000','860000','2017-11-27 15:18:24','2017-11-27 15:18:30','2017-11-27','2017-11-27',0),(9,1,23,'860000','860000','2017-11-27 15:18:41','2017-11-27 15:18:47','2017-11-27','2017-11-27',0),(10,1,24,'860000','860000','2017-11-27 15:19:02','2017-11-27 15:19:09','2017-11-27','2017-11-27',0),(11,1,30,'860000','860000','2017-11-27 15:19:23','2017-11-27 15:19:29','2017-11-27','2017-11-27',0),(12,1,31,'860000','860000','2017-11-27 15:19:40','2017-11-27 15:19:46','2017-11-27','2017-11-27',0),(13,1,32,'860000','860000','2017-11-27 15:19:57','2017-11-27 15:20:03','2017-11-27','2017-11-27',0),(14,1,33,'860000','860000','2017-11-27 15:20:13','2017-11-27 15:20:18','2017-11-27','2017-11-27',0),(15,1,34,'860000','860000','2017-11-27 15:20:28','2017-11-27 15:20:56','2017-11-27','2017-11-27',0),(16,1,35,'860000','860000','2017-11-27 15:20:45','2017-11-27 15:20:52','2017-11-27','2017-11-27',0),(17,1,36,'860000','860000','2017-11-27 15:21:07','2017-11-27 15:21:12','2017-11-27','2017-11-27',0),(18,1,40,'860000','860000','2017-11-27 15:21:34','2017-11-27 15:21:39','2017-11-27','2017-11-27',0),(19,1,41,'860000','860000','2017-11-27 15:22:01','2017-11-27 15:22:07','2017-11-27','2017-11-27',0),(20,1,50,'860000','860000','2017-11-27 15:22:22','2017-11-27 15:22:27','2017-11-27','2017-11-27',0),(21,1,51,'860000','860000','2017-11-27 15:22:43','2017-11-27 15:22:49','2017-11-27','2017-11-27',0),(22,1,52,'860000','860000','2017-11-27 15:22:59','2017-11-27 15:23:04','2017-11-27','2017-11-27',0),(23,1,53,'860000','860000','2017-11-27 15:23:14','2017-11-27 15:23:19','2017-11-27','2017-11-27',0),(24,1,54,'860000','860000','2017-11-27 15:23:32','2017-11-27 15:23:36','2017-11-27','2017-11-27',0),(26,1,55,'860000','860000','2017-11-27 15:54:38','2017-11-27 15:55:18','2017-11-27','2017-11-27',0),(75,2,10,'860000','860000','2017-11-28 11:13:31','2017-11-28 11:13:31','2017-11-28','2017-11-28',0),(76,2,11,'860000','860000','2017-11-28 11:13:31','2017-11-28 11:13:31','2017-11-28','2017-11-28',0),(77,2,12,'860000','860000','2017-11-28 11:13:31','2017-11-28 11:13:31','2017-11-28','2017-11-28',0),(78,2,13,'860000','860000','2017-11-28 11:13:31','2017-11-28 11:13:31','2017-11-28','2017-11-28',0),(79,2,14,'860000','860000','2017-11-28 11:13:31','2017-11-28 11:13:31','2017-11-28','2017-11-28',0),(80,2,40,'860000','860000','2017-11-28 11:13:31','2017-11-28 11:16:00','2017-11-28','2017-11-28',1),(81,2,41,'860000','860000','2017-11-28 11:13:31','2017-11-28 11:16:00','2017-11-28','2017-11-28',1),(82,3,10,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(83,3,11,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(84,3,12,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(85,3,13,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(86,3,14,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(87,3,20,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(88,3,21,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(89,3,22,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(90,3,23,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0),(91,3,24,'860000','860000','2017-11-28 11:13:49','2017-11-28 11:13:49','2017-11-28','2017-11-28',0);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `account` varchar(32) NOT NULL COMMENT '账号',
  `password` varchar(128) NOT NULL COMMENT '密码',
  `realName` varchar(32) NOT NULL COMMENT '账户使用者姓名',
  `salt` varchar(64) DEFAULT NULL COMMENT '盐,shiro框架登录认证时需要该字段',
  `locked` char(1) DEFAULT '否' COMMENT '账号是否锁定',
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  `tel` varchar(11) NOT NULL COMMENT '联系电话',
  `email` varchar(32) NOT NULL COMMENT '邮箱',
  `sex` char(1) NOT NULL COMMENT '性别',
  `deptID` int(11) NOT NULL COMMENT '所在部门',
  `companyID` varchar(128) NOT NULL COMMENT '所在公司',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否删除,0:未删除,1:删除',
  PRIMARY KEY (`account`),
  KEY `FK_company_id_fk` (`companyID`),
  KEY `FK_dept_id_fk` (`deptID`),
  CONSTRAINT `FK_company_id_fk` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_dept_id_fk` FOREIGN KEY (`deptID`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`account`,`password`,`realName`,`salt`,`locked`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`,`tel`,`email`,`sex`,`deptID`,`companyID`,`isDeleted`) values ('860000','1a068d31790f2fb7925e79b1eab7a527','admin','byebye','否','','','2017-11-01 14:31:30','2017-11-20 11:53:44','2017-11-01','2017-11-10','12345567890','538253@qq.com','女',1,'8601',0),('860001','c09460efb9cdebd15fa0dc033c20de44','张三','1511167003013','否','860000','860001','2017-11-09 13:39:52','2017-11-20 16:36:43','2017-11-09','2017-11-20','12346578911','31537153@qq.com','男',8,'8602',0),('860002','089159ce10664c409359f56d17175be6','李思','1511161378784','否','860000','860001','2017-11-20 15:02:58','2017-11-20 15:16:52','2017-11-20','2017-11-20','11111167234','1313131@163.com','女',8,'8601',0),('860003','aa8613a6ae66c5a9a4b797125f30802b','乔巴','1511507106358','否','860000','860000','2017-11-24 15:05:06','2017-11-24 15:05:06','2017-11-24','2017-11-24','11111167111','1313131111@163.com','男',8,'8603',0);

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) NOT NULL COMMENT '用户账号',
  `roleID` int(11) NOT NULL COMMENT '角色ID',
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  `isDeleted` int(11) DEFAULT '0' COMMENT '是否删除,0:未删除,1:删除',
  PRIMARY KEY (`id`),
  KEY `FK_role_id_fk` (`roleID`),
  KEY `FK_user_id_fk` (`account`),
  CONSTRAINT `FK_role_id_fk` FOREIGN KEY (`roleID`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_user_id_fk` FOREIGN KEY (`account`) REFERENCES `user` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`account`,`roleID`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`,`isDeleted`) values (1,'860000',1,'860000','860000','2017-11-27 14:40:30','2017-11-27 14:40:36','2017-11-27','2017-11-27',0),(2,'860001',2,'860000','860000','2017-11-27 15:59:20','2017-11-27 15:59:20','2017-11-27','2017-11-27',0),(3,'860002',2,'860000','860000','2017-11-27 15:59:46','2017-11-27 15:59:46','2017-11-27','2017-11-27',0),(4,'860003',3,'860000','860000','2017-11-27 16:00:01','2017-11-27 16:00:01','2017-11-27','2017-11-27',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
