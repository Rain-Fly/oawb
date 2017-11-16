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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司表';

/*Data for the table `company` */

insert  into `company`(`id`,`name`,`address`,`linkMan`,`tel`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`) values ('8601','北京昌盛宏达科技股份有限公司','知春路101号','王小二','12345678901','admin','admin','2017-11-10 12:16:03','2017-11-10 12:28:41','2017-11-10','2017-11-10');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Data for the table `department` */

insert  into `department`(`id`,`name`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`) values (1,'市场部','admin','admin','2017-11-10 12:14:43','2017-11-10 12:14:51','2017-11-10','2017-11-10');

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
  `isAvailable` char(1) DEFAULT NULL COMMENT '是否可用',
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源权限表';

/*Data for the table `permission` */

insert  into `permission`(`id`,`name`,`type`,`url`,`percode`,`parentID`,`parentIDs`,`sort`,`isAvailable`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`) values (0,'权限','',NULL,'',0,'0/',0,'是','admin','admin','2017-11-03 14:35:00','2017-11-10 14:37:56','2017-11-03','2017-11-10'),(1,'客户管理','menu',NULL,'',0,'0/1/',1,'是','admin','admin','2017-11-04 14:36:10','2017-11-10 14:55:42','2017-11-04','2017-11-10'),(2,'订单管理','menu',NULL,NULL,0,'0/2',2,'是','admin','admin','2017-11-05 14:55:11','2017-11-10 14:55:28','2017-11-05','2017-11-10'),(9,'个人中心','menu',NULL,NULL,0,'0/9',9,'是','admin','admin','2017-11-03 15:13:10','2017-11-10 15:13:19','2017-11-03','2017-11-10'),(11,'添加客户','permission',NULL,'user:create',1,'0/1/11/',11,'是','admin','admin','2017-11-04 14:38:48','2017-11-10 14:57:31','2017-11-04','2017-11-10'),(12,'修改客户','permission',NULL,'user:update',1,'0/1/12/',12,'是','admin','admin','2017-11-04 14:39:54','2017-11-10 14:57:32','2017-11-04','2017-11-10');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '角色名',
  `isAvailable` char(1) DEFAULT NULL COMMENT '是否可用',
  `author` varchar(32) NOT NULL COMMENT '创建者(账号)',
  `updater` varchar(32) NOT NULL COMMENT '最后一次修改者(账号)',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改的时间',
  `createDate` date NOT NULL COMMENT '创建日期',
  `updateDate` date NOT NULL COMMENT '最后一次修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `role` */

insert  into `role`(`id`,`name`,`isAvailable`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`) values (1,'部门经理','是','admin','admin','2017-11-09 14:28:39','2017-11-10 14:28:42','2017-11-09','2017-11-10'),(2,'普通职员','是','admin','admin','2017-11-07 14:30:28','2017-11-10 14:30:36','2017-11-07','2017-11-10');

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
  PRIMARY KEY (`id`),
  KEY `FK_permission_id_fk` (`permissionID`),
  KEY `FK_role_id_fk` (`roleID`),
  CONSTRAINT `FK_permission_id_fk` FOREIGN KEY (`permissionID`) REFERENCES `permission` (`id`),
  CONSTRAINT `FK_role_id` FOREIGN KEY (`roleID`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色-资源权限表';

/*Data for the table `role_permission` */

insert  into `role_permission`(`id`,`roleID`,`permissionID`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`) values (1,1,1,'admin','admin','2017-11-05 14:58:21','2017-11-10 14:58:30','2017-11-05','2017-11-10'),(2,1,11,'admin','admin','2017-11-05 14:58:42','2017-11-10 14:58:50','2017-11-05','2017-11-10'),(3,1,12,'admin','admin','2017-11-05 14:58:59','2017-11-10 14:59:06','2017-11-05','2017-11-10'),(4,1,9,'admin','admin','2017-11-03 15:13:48','2017-11-10 15:13:57','2017-11-03','2017-11-10');

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
  PRIMARY KEY (`account`),
  KEY `FK_company_id_fk` (`companyID`),
  KEY `FK_dept_id_fk` (`deptID`),
  CONSTRAINT `FK_company_id_fk` FOREIGN KEY (`companyID`) REFERENCES `company` (`id`),
  CONSTRAINT `FK_dept_id_fk` FOREIGN KEY (`deptID`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`account`,`password`,`realName`,`salt`,`locked`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`,`tel`,`email`,`sex`,`deptID`,`companyID`) values ('860000','1a068d31790f2fb7925e79b1eab7a527','admin','byebye','否','','','2017-11-01 14:31:30','2017-11-10 14:32:10','2017-11-01','2017-11-10','12345567890','538253@qq.com','女',1,'8601'),('860001','1a068d31790f2fb7925e79b1eab7a527','张三','byebye','否','admin','admin','2017-11-09 13:39:52','2017-11-10 13:41:56','2017-11-09','2017-11-10','12345678901','3713717@qq.com','男',1,'8601');

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
  PRIMARY KEY (`id`),
  KEY `FK_role_id_fk` (`roleID`),
  KEY `FK_user_id_fk` (`account`),
  CONSTRAINT `FK_role_id_fk` FOREIGN KEY (`roleID`) REFERENCES `role` (`id`),
  CONSTRAINT `FK_user_id_fk` FOREIGN KEY (`account`) REFERENCES `user` (`account`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户角色表';

/*Data for the table `user_role` */

insert  into `user_role`(`id`,`account`,`roleID`,`author`,`updater`,`createTime`,`updateTime`,`createDate`,`updateDate`) values (1,'860001',1,'admin','admin','2017-11-09 14:29:50','2017-11-10 14:30:07','2017-11-09','2017-11-10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
