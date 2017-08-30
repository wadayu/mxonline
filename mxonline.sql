-- MySQL dump 10.13  Distrib 5.6.35, for Linux (x86_64)
--
-- Host: localhost    Database: mxonline
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can add group',3,'add_group'),(9,'Can change group',3,'change_group'),(10,'Can delete group',3,'delete_group'),(11,'Can view group',3,'view_group'),(12,'Can view permission',2,'view_permission'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add 用户信息',6,'add_userprofile'),(22,'Can change 用户信息',6,'change_userprofile'),(23,'Can delete 用户信息',6,'delete_userprofile'),(24,'Can add 邮箱验证码',7,'add_emailverifyrecord'),(25,'Can change 邮箱验证码',7,'change_emailverifyrecord'),(26,'Can delete 邮箱验证码',7,'delete_emailverifyrecord'),(27,'Can add 轮播图',8,'add_banner'),(28,'Can change 轮播图',8,'change_banner'),(29,'Can delete 轮播图',8,'delete_banner'),(30,'Can view 轮播图',8,'view_banner'),(31,'Can view 邮箱验证码',7,'view_emailverifyrecord'),(32,'Can view 用户信息',6,'view_userprofile'),(33,'Can add 课程',9,'add_course'),(34,'Can change 课程',9,'change_course'),(35,'Can delete 课程',9,'delete_course'),(36,'Can add 章节',10,'add_lesson'),(37,'Can change 章节',10,'change_lesson'),(38,'Can delete 章节',10,'delete_lesson'),(39,'Can add 视频',11,'add_video'),(40,'Can change 视频',11,'change_video'),(41,'Can delete 视频',11,'delete_video'),(42,'Can add 课程资源',12,'add_courseresource'),(43,'Can change 课程资源',12,'change_courseresource'),(44,'Can delete 课程资源',12,'delete_courseresource'),(45,'Can view 课程',9,'view_course'),(46,'Can view 课程资源',12,'view_courseresource'),(47,'Can view 章节',10,'view_lesson'),(48,'Can view 视频',11,'view_video'),(49,'Can add 城市',13,'add_citydict'),(50,'Can change 城市',13,'change_citydict'),(51,'Can delete 城市',13,'delete_citydict'),(52,'Can add 课程机构',14,'add_courseorg'),(53,'Can change 课程机构',14,'change_courseorg'),(54,'Can delete 课程机构',14,'delete_courseorg'),(55,'Can add 教师',15,'add_teacher'),(56,'Can change 教师',15,'change_teacher'),(57,'Can delete 教师',15,'delete_teacher'),(58,'Can view 城市',13,'view_citydict'),(59,'Can view 课程机构',14,'view_courseorg'),(60,'Can view 教师',15,'view_teacher'),(61,'Can add 用户咨询',16,'add_userask'),(62,'Can change 用户咨询',16,'change_userask'),(63,'Can delete 用户咨询',16,'delete_userask'),(64,'Can add 课程评论',17,'add_coursecomments'),(65,'Can change 课程评论',17,'change_coursecomments'),(66,'Can delete 课程评论',17,'delete_coursecomments'),(67,'Can add 用户收藏',18,'add_userfavorite'),(68,'Can change 用户收藏',18,'change_userfavorite'),(69,'Can delete 用户收藏',18,'delete_userfavorite'),(70,'Can add 用户消息',19,'add_usermessage'),(71,'Can change 用户消息',19,'change_usermessage'),(72,'Can delete 用户消息',19,'delete_usermessage'),(73,'Can add 用户课程',20,'add_usercourse'),(74,'Can change 用户课程',20,'change_usercourse'),(75,'Can delete 用户课程',20,'delete_usercourse'),(76,'Can view 课程评论',17,'view_coursecomments'),(77,'Can view 用户咨询',16,'view_userask'),(78,'Can view 用户课程',20,'view_usercourse'),(79,'Can view 用户收藏',18,'view_userfavorite'),(80,'Can view 用户消息',19,'view_usermessage'),(81,'Can add Bookmark',21,'add_bookmark'),(82,'Can change Bookmark',21,'change_bookmark'),(83,'Can delete Bookmark',21,'delete_bookmark'),(84,'Can add User Setting',22,'add_usersettings'),(85,'Can change User Setting',22,'change_usersettings'),(86,'Can delete User Setting',22,'delete_usersettings'),(87,'Can add User Widget',23,'add_userwidget'),(88,'Can change User Widget',23,'change_userwidget'),(89,'Can delete User Widget',23,'delete_userwidget'),(90,'Can add log entry',24,'add_log'),(91,'Can change log entry',24,'change_log'),(92,'Can delete log entry',24,'delete_log'),(93,'Can view Bookmark',21,'view_bookmark'),(94,'Can view log entry',24,'view_log'),(95,'Can view User Setting',22,'view_usersettings'),(96,'Can view User Widget',23,'view_userwidget'),(97,'Can add captcha store',25,'add_captchastore'),(98,'Can change captcha store',25,'change_captchastore'),(99,'Can delete captcha store',25,'delete_captchastore'),(100,'Can view captcha store',25,'view_captchastore');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `captcha_captchastore`
--

DROP TABLE IF EXISTS `captcha_captchastore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `captcha_captchastore`
--

LOCK TABLES `captcha_captchastore` WRITE;
/*!40000 ALTER TABLE `captcha_captchastore` DISABLE KEYS */;
INSERT INTO `captcha_captchastore` VALUES (236,'ZVQC','zvqc','ad96f8e322b17fa9f317a6649319f3911da3694b','2017-08-29 16:18:14.284722'),(241,'VQKR','vqkr','c05d53256510d8bc372f7e54018fe985635e554a','2017-08-29 16:22:31.929565');
/*!40000 ALTER TABLE `captcha_captchastore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(5) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `knows` varchar(300) NOT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_11456c5a` (`course_org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_cour_course_org_id_4d2c4aab_fk_organization_courseorg_id` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'django入门学习','django入门学习','django入门学习','cj',0,6,1,'courses/2017/07/540e57300001d6d906000338-240-135.jpg',18,'2017-07-25 09:41:00.000000',6,'后端开发','python',1,'敬老卡惊世毒妃','阿什顿发斯蒂芬',0),(2,'xadmin搭建配置','xadmin搭建配置','xadmin搭建配置','cj',0,1,2,'courses/2017/07/540e57300001d6d906000338-240-135_n0L8vbw.jpg',19,'2017-07-25 15:49:00.000000',6,'后端开发','python',1,'拉丝机发是开了','拉跨境电商了空间发',0),(3,'django入门2','django入门2','django入门2','zj',0,1,1,'courses/2017/07/130630220190632.jpg',12,'2017-07-27 10:13:00.000000',3,'后端开发','爱上',1,'爱上','暗室逢灯',0),(4,'django入门3','django入门3','django入门3','gj',0,1,1,'courses/2017/07/704-160PQ43458.png',37,'2017-07-27 10:14:00.000000',4,'后端开发','python',2,'啥饭','阿斯蒂芬',0),(5,'django入门4','django入门4','django入门4','cj',0,2,1,'courses/2017/07/130630220190632_mvP1Vcv.jpg',17,'2017-07-27 10:14:00.000000',5,'后端开发','python',2,'水果蛋糕','十多个',0),(6,'django入门5','django入门5','django入门5','zj',0,1,0,'courses/2017/07/8126152_233511681000_2.jpg',101,'2017-07-27 10:18:00.000000',6,'后端开发','python',1,'爱上','爱上',1),(7,'python高级开发','python高级开发','python高级开发','gj',0,4,2,'courses/2017/07/u31930062893802606706fm26gp0.jpg',33,'2017-07-27 10:18:00.000000',7,'后端开发','python',2,'必须认真听讲','有python基础',0),(8,'python爬虫入门','python爬虫入门','python爬虫入门','cj',0,0,0,'courses/2017/07/330613-14102400202545.jpg',49,'2017-07-27 10:19:00.000000',6,'后端开发','python',1,'必须有python基础','集啊快乐十分',1),(9,'flask框架入门教程','flask框架入门教程','flask框架入门教程','cj',0,2,3,'courses/2017/07/4838084_110353658135_2.jpg',197,'2017-07-27 11:09:00.000000',1,'后端开发','web开发',1,'你必须具有python基础，才可以学习此章节','在这里你会学习如何完成flask安装与配置，以及简单的url配置等。',1),(10,'go语言','go语言','go语言','zj',0,10,1,'courses/2017/08/15033883901.jpg',3,'2017-08-23 16:10:00.000000',1,'后端开发','go语言',1,'go语言','go语言',0);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_courseresource`
--

DROP TABLE IF EXISTS `courses_courseresource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_courseresource`
--

LOCK TABLES `courses_courseresource` WRITE;
/*!40000 ALTER TABLE `courses_courseresource` DISABLE KEYS */;
INSERT INTO `courses_courseresource` VALUES (1,'前端开发','course/resource/2017/07/xadmin-master.zip','2017-07-30 14:54:00.000000',9);
/*!40000 ALTER TABLE `courses_courseresource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_lesson`
--

DROP TABLE IF EXISTS `courses_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_lesson`
--

LOCK TABLES `courses_lesson` WRITE;
/*!40000 ALTER TABLE `courses_lesson` DISABLE KEYS */;
INSERT INTO `courses_lesson` VALUES (1,'第一章节 基础知识','2017-07-28 16:09:00.000000',9),(2,'第二章节  进阶开发','2017-07-28 16:10:00.000000',9),(3,'第一章节 基础知识','2017-07-28 16:10:00.000000',8),(4,'第二章节  进阶开发','2017-07-28 16:10:00.000000',8),(5,'第一章节 基础知识','2017-07-28 16:10:00.000000',7),(6,'第二章节  进阶开发','2017-07-28 16:11:00.000000',7),(7,'第一章节 基础知识','2017-07-28 16:11:00.000000',2),(8,'第二章节  进阶开发','2017-07-28 16:11:00.000000',2);
/*!40000 ALTER TABLE `courses_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_video`
--

DROP TABLE IF EXISTS `courses_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_video`
--

LOCK TABLES `courses_video` WRITE;
/*!40000 ALTER TABLE `courses_video` DISABLE KEYS */;
INSERT INTO `courses_video` VALUES (1,'1.1','2017-07-28 16:13:00.000000',1,'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4',0),(2,'1.2','2017-07-28 16:13:00.000000',1,'http://of66as8gb.bkt.clouddn.com/12.2%20xss%E6%94%BB%E5%87%BB%E5%8E%9F%E7%90%86%E5%8F%8A%E9%98%B2%E8%8C%83.mp4',0),(3,'2.1','2017-07-28 16:14:00.000000',2,'http://www.imooc.com/video/15238',0),(4,'2.2','2017-07-28 16:14:00.000000',2,'http://www.imooc.com/video/15238',0),(5,'1.1','2017-07-28 16:14:00.000000',3,'http://www.imooc.com/video/15238',0),(6,'1.2','2017-07-28 16:14:00.000000',3,'http://www.imooc.com/video/15238',0),(7,'2.1','2017-07-28 16:14:00.000000',4,'http://www.imooc.com/video/15238',0),(8,'2.2','2017-07-28 16:15:00.000000',4,'http://www.imooc.com/video/15238',0),(9,'1.1','2017-07-28 16:15:00.000000',5,'http://www.imooc.com/video/15238',0),(10,'1.2','2017-07-28 16:15:00.000000',5,'http://www.imooc.com/video/15238',0),(11,'2.1','2017-07-28 16:15:00.000000',6,'http://www.imooc.com/video/15238',0),(12,'2.2','2017-07-28 16:15:00.000000',6,'http://www.imooc.com/video/15238',0),(13,'1.1','2017-07-28 16:15:00.000000',7,'http://www.imooc.com/video/15238',0),(14,'1.2','2017-07-28 16:16:00.000000',7,'http://www.imooc.com/video/15238',0),(15,'2.1','2017-07-28 16:16:00.000000',8,'http://www.imooc.com/video/15238',0),(16,'2.2','2017-07-28 16:16:00.000000',8,'http://www.imooc.com/video/15238',0);
/*!40000 ALTER TABLE `courses_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(25,'captcha','captchastore'),(4,'contenttypes','contenttype'),(9,'courses','course'),(12,'courses','courseresource'),(10,'courses','lesson'),(11,'courses','video'),(17,'operation','coursecomments'),(16,'operation','userask'),(20,'operation','usercourse'),(18,'operation','userfavorite'),(19,'operation','usermessage'),(13,'organization','citydict'),(14,'organization','courseorg'),(15,'organization','teacher'),(5,'sessions','session'),(8,'users','banner'),(7,'users','emailverifyrecord'),(6,'users','userprofile'),(21,'xadmin','bookmark'),(24,'xadmin','log'),(22,'xadmin','usersettings'),(23,'xadmin','userwidget');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-07-12 16:51:34.729942'),(2,'contenttypes','0002_remove_content_type_name','2017-07-12 16:51:34.854955'),(3,'auth','0001_initial','2017-07-12 16:51:35.259720'),(4,'auth','0002_alter_permission_name_max_length','2017-07-12 16:51:35.369048'),(5,'auth','0003_alter_user_email_max_length','2017-07-12 16:51:35.369048'),(6,'auth','0004_alter_user_username_opts','2017-07-12 16:51:35.384676'),(7,'auth','0005_alter_user_last_login_null','2017-07-12 16:51:35.400302'),(8,'auth','0006_require_contenttypes_0002','2017-07-12 16:51:35.400302'),(9,'auth','0007_alter_validators_add_error_messages','2017-07-12 16:51:35.415929'),(10,'users','0001_initial','2017-07-12 16:51:35.873660'),(11,'admin','0001_initial','2017-07-12 16:51:36.045552'),(12,'admin','0002_logentry_remove_auto_add','2017-07-12 16:51:36.092433'),(13,'courses','0001_initial','2017-07-12 16:51:36.496430'),(14,'courses','0002_auto_20170712_1356','2017-07-12 16:51:36.637095'),(15,'courses','0003_auto_20170712_1631','2017-07-12 16:51:36.652696'),(16,'operation','0001_initial','2017-07-12 16:51:37.156105'),(17,'organization','0001_initial','2017-07-12 16:51:37.480305'),(18,'organization','0002_auto_20170712_1356','2017-07-12 16:51:37.496022'),(19,'organization','0003_auto_20170712_1631','2017-07-12 16:51:37.515319'),(20,'sessions','0001_initial','2017-07-12 16:51:37.561392'),(21,'users','0002_auto_20170711_1034','2017-07-12 16:51:37.655140'),(22,'users','0003_auto_20170711_1146','2017-07-12 16:51:37.706815'),(23,'users','0004_auto_20170712_1356','2017-07-12 16:51:37.776956'),(24,'users','0005_auto_20170712_1631','2017-07-12 16:51:37.808208'),(25,'xadmin','0001_initial','2017-07-12 16:51:38.352389'),(26,'xadmin','0002_log','2017-07-12 16:51:38.561626'),(27,'xadmin','0003_auto_20160715_0100','2017-07-12 16:51:38.658504'),(28,'captcha','0001_initial','2017-07-13 16:08:45.265265'),(29,'organization','0004_auto_20170719_1646','2017-07-19 16:46:50.313173'),(30,'organization','0005_auto_20170724_1036','2017-07-24 10:36:58.677007'),(31,'courses','0004_course_course_org','2017-07-25 09:38:59.639720'),(32,'organization','0006_teacher_image','2017-07-25 14:26:20.501496'),(33,'courses','0005_auto_20170727_1513','2017-07-27 15:13:14.766797'),(34,'courses','0006_auto_20170727_1657','2017-07-27 16:57:47.311543'),(35,'courses','0007_video_url','2017-07-28 16:01:51.657268'),(36,'courses','0008_video_learn_times','2017-07-30 14:43:31.901876'),(37,'courses','0009_course_teacher','2017-07-30 15:11:50.802776'),(38,'courses','0010_auto_20170730_1524','2017-07-30 15:24:35.766820'),(39,'organization','0007_teacher_age','2017-08-03 14:00:25.869651'),(40,'users','0006_auto_20170814_1350','2017-08-14 13:50:43.133226'),(41,'users','0007_auto_20170814_1538','2017-08-14 15:38:17.638610'),(42,'courses','0011_course_is_banner','2017-08-18 13:54:36.740107'),(43,'organization','0008_courseorg_tag','2017-08-18 14:37:44.576818');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('238x5o64wuxe2un2hjzec24m9lmopfmn','ZGExMTIzYjAyYzY3MDE2MDBiOWEwNGEyYjBiYjU3YmY0ODAyOTkwYjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3ZGMxODMyZjI4OWJkMmNkYTJhM2NlNTY3ZDU5MWZmZDcwMGU0ZjUzIiwiX2F1dGhfdXNlcl9pZCI6IjM4In0=','2017-09-12 16:15:53.268189'),('32n80q5662ekn0jxgoikxbzumocd6zyg','ZjgwYThjYWFlZDE1ZGM4OTU4ZDAwYTllODFhZDk1ZjZlZTg3Y2Q4Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiN2U2OWRiNDk3MTJiYzAxOTAwNjNmYzAwY2I1ZjFkN2YwYmVjZjg0IiwiX2F1dGhfdXNlcl9pZCI6IjE4In0=','2017-09-11 15:29:21.287075'),('up2pszqd1a09lrxvekcymo4eqkmxy4sx','NzQ4YmNiMjczMGVjMTI2MmQ0YjBjOGNmMzQ3Mjg5ZTQ4NDhjYWIzMDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmY2I3ODdjYTI0ZGVkNmZjYjBmMDVjMjY4NTI2ZGJkZGRjZmJlNGZmIiwiX2F1dGhfdXNlcl9pZCI6IjM2In0=','2017-09-12 16:17:56.643239');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_coursecomments`
--

DROP TABLE IF EXISTS `operation_coursecomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_coursecomments`
--

LOCK TABLES `operation_coursecomments` WRITE;
/*!40000 ALTER TABLE `operation_coursecomments` DISABLE KEYS */;
INSERT INTO `operation_coursecomments` VALUES (1,'asdfas','2017-07-27 17:37:42.000000',9,18),(2,'ertwertw','2017-07-30 18:07:43.209496',9,19),(3,'老师讲的不错啊','2017-07-30 18:08:26.707589',9,19),(4,'安慰','2017-07-30 18:08:45.518063',9,19),(5,'老师这个大傻逼，讲的一点都不好啊','2017-07-30 18:10:35.870537',9,19),(6,'哈哈哈哈加款来电实际付款啦','2017-07-30 18:11:38.300190',9,19),(7,'你妈','2017-08-01 16:25:35.567742',9,19);
/*!40000 ALTER TABLE `operation_coursecomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userask`
--

DROP TABLE IF EXISTS `operation_userask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userask`
--

LOCK TABLES `operation_userask` WRITE;
/*!40000 ALTER TABLE `operation_userask` DISABLE KEYS */;
/*!40000 ALTER TABLE `operation_userask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usercourse`
--

DROP TABLE IF EXISTS `operation_usercourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usercourse`
--

LOCK TABLES `operation_usercourse` WRITE;
/*!40000 ALTER TABLE `operation_usercourse` DISABLE KEYS */;
INSERT INTO `operation_usercourse` VALUES (1,'2017-07-27 16:15:00.000000',2,19),(5,'2017-07-27 16:19:00.000000',9,19),(6,'2017-07-31 16:30:27.541199',7,19),(7,'2017-08-01 14:25:02.147428',9,18),(8,'2017-08-01 16:15:13.268608',8,19),(9,'2017-08-01 16:24:14.134761',4,19),(10,'2017-08-01 16:26:38.965681',5,19),(11,'2017-08-07 16:28:23.598975',8,18),(12,'2017-08-15 14:54:57.650016',7,18),(13,'2017-08-17 15:11:31.183191',6,18),(14,'2017-08-18 14:23:09.251102',1,19),(15,'2017-08-18 14:23:26.036410',3,19),(16,'2017-08-18 16:03:52.348228',9,28),(17,'2017-08-25 16:31:07.372239',10,19);
/*!40000 ALTER TABLE `operation_usercourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_userfavorite`
--

DROP TABLE IF EXISTS `operation_userfavorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_userfavorite`
--

LOCK TABLES `operation_userfavorite` WRITE;
/*!40000 ALTER TABLE `operation_userfavorite` DISABLE KEYS */;
INSERT INTO `operation_userfavorite` VALUES (82,1,3,'2017-08-16 14:09:41.467989',19),(83,1,2,'2017-08-16 14:10:07.209615',19),(85,9,1,'2017-08-17 15:47:48.878747',18),(86,2,1,'2017-08-17 15:48:07.228946',18),(87,7,1,'2017-08-17 15:48:27.687491',18),(88,2,3,'2017-08-17 15:49:00.713565',18),(89,1,3,'2017-08-17 15:49:13.004590',18),(90,1,2,'2017-08-17 15:49:47.702365',18),(91,6,2,'2017-08-17 15:50:20.624945',18),(92,7,2,'2017-08-17 15:50:45.750482',18),(93,7,1,'2017-08-18 14:22:24.820762',19),(94,5,1,'2017-08-18 14:22:32.166799',19),(95,4,1,'2017-08-18 14:22:39.644855',19),(96,1,1,'2017-08-18 14:23:05.851868',19),(97,3,1,'2017-08-18 14:23:23.122345',19),(98,2,1,'2017-08-18 14:23:37.002812',19),(99,9,1,'2017-08-18 16:03:16.360785',28),(100,1,2,'2017-08-18 16:03:22.548996',28),(101,1,3,'2017-08-18 16:03:34.629161',28),(102,10,1,'2017-08-25 16:30:57.940988',19),(103,9,1,'2017-08-29 16:04:12.354478',36),(104,1,3,'2017-08-29 16:04:38.416870',36),(105,1,2,'2017-08-29 16:04:58.176165',36);
/*!40000 ALTER TABLE `operation_userfavorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operation_usermessage`
--

DROP TABLE IF EXISTS `operation_usermessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operation_usermessage`
--

LOCK TABLES `operation_usermessage` WRITE;
/*!40000 ALTER TABLE `operation_usermessage` DISABLE KEYS */;
INSERT INTO `operation_usermessage` VALUES (1,20,'欢迎注册慕学在线网',1,'2017-08-16 16:58:51.337292'),(2,18,'你好！',1,'2017-08-17 13:17:44.000000'),(3,18,'Hello World',1,'2017-08-17 13:19:17.000000'),(4,21,'欢迎注册慕学在线网',1,'2017-08-18 15:01:13.904715'),(5,22,'欢迎注册慕学在线网',0,'2017-08-18 15:03:23.739103'),(6,23,'欢迎注册慕学在线网',0,'2017-08-18 15:10:52.425326'),(7,24,'欢迎注册慕学在线网',0,'2017-08-18 15:54:51.014688'),(8,25,'欢迎注册慕学在线网',0,'2017-08-18 15:56:06.685912'),(9,26,'欢迎注册慕学在线网',0,'2017-08-18 15:58:24.051614'),(10,27,'欢迎注册慕学在线网',0,'2017-08-18 16:00:29.454593'),(11,28,'欢迎注册慕学在线网',1,'2017-08-18 16:02:05.916715'),(12,29,'欢迎注册慕学在线网',0,'2017-08-29 15:28:11.697725'),(13,30,'欢迎注册慕学在线网',0,'2017-08-29 15:38:00.898185'),(14,31,'欢迎注册慕学在线网',0,'2017-08-29 15:48:01.439766'),(15,32,'欢迎注册慕学在线网',0,'2017-08-29 15:49:19.919405'),(16,33,'欢迎注册慕学在线网',0,'2017-08-29 15:49:41.392326'),(17,34,'欢迎注册慕学在线网',0,'2017-08-29 15:50:43.354780'),(18,35,'欢迎注册慕学在线网',0,'2017-08-29 15:58:32.096100'),(19,36,'欢迎注册慕学在线网',1,'2017-08-29 16:02:54.390723'),(20,37,'欢迎注册慕学在线网',0,'2017-08-29 16:13:35.580955'),(21,38,'欢迎注册慕学在线网',0,'2017-08-29 16:15:21.298544'),(22,39,'欢迎注册慕学在线网',0,'2017-08-29 16:15:41.762684');
/*!40000 ALTER TABLE `operation_usermessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_citydict`
--

DROP TABLE IF EXISTS `organization_citydict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_citydict`
--

LOCK TABLES `organization_citydict` WRITE;
/*!40000 ALTER TABLE `organization_citydict` DISABLE KEYS */;
INSERT INTO `organization_citydict` VALUES (1,'北京市','北京市','2017-07-19 16:28:00.000000'),(2,'上海市','上海市','2017-07-19 16:29:00.000000'),(3,'天津市','天津市','2017-07-19 16:29:00.000000'),(4,'深圳市','深圳市','2017-07-19 16:29:00.000000'),(5,'广州市','广州市','2017-07-19 16:29:00.000000');
/*!40000 ALTER TABLE `organization_citydict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_courseorg`
--

DROP TABLE IF EXISTS `organization_courseorg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_courseorg`
--

LOCK TABLES `organization_courseorg` WRITE;
/*!40000 ALTER TABLE `organization_courseorg` DISABLE KEYS */;
INSERT INTO `organization_courseorg` VALUES (1,'慕课网1','慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',16,3,'org/2017/07/imooc.png','北京市','2017-07-19 16:47:00.000000',1,'pxjg',2,0,'知名高校'),(2,'慕课网2','慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',4,0,'org/2017/07/imooc_Q1oNAtr.png','北京市','2017-07-19 16:49:00.000000',1,'gr',0,0,'知名高校'),(3,'慕课网3','慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',2,0,'org/2017/07/imooc_D46tGNm.png','上海市','2017-07-19 16:50:00.000000',2,'gx',0,0,'知名高校'),(4,'慕课网4','慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',2,0,'org/2017/07/imooc_YTXT4WK.png','天津市','2017-07-19 16:50:00.000000',3,'pxjg',0,0,'知名高校'),(5,'慕课网5','慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',2,0,'org/2017/07/imooc_n3joMdG.png','深圳市','2017-07-19 16:51:00.000000',4,'gx',0,0,'知名高校'),(6,'慕课网6','慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',3,1,'org/2017/07/imooc_GehAsZH.png','广州市','2017-07-19 16:51:00.000000',5,'gr',0,0,'知名高校'),(7,'慕课网7','慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。',2,1,'org/2017/07/imooc_nxoaLDX.png','广州市','2017-07-19 16:53:00.000000',5,'gr',0,0,'知名高校'),(8,'慕课网8','python',2,0,'org/2017/07/imooc_i5ZUCSO.png','天津市','2017-07-19 16:53:00.000000',3,'gr',0,0,'知名高校');
/*!40000 ALTER TABLE `organization_courseorg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization_teacher`
--

DROP TABLE IF EXISTS `organization_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization_teacher`
--

LOCK TABLES `organization_teacher` WRITE;
/*!40000 ALTER TABLE `organization_teacher` DISABLE KEYS */;
INSERT INTO `organization_teacher` VALUES (1,'Jim',5,'京东科技','java工程师','幽默，青春，活力，性感',192,3,'2017-07-25 09:40:00.000000',6,'teacher/2017/07/QQ图片20170725142814.png',26),(2,'Tom',2,'百度科技','python开发','傻逼，经验欠缺',79,1,'2017-07-27 16:50:00.000000',1,'teacher/2017/07/20111106150919-719669443.jpg',32);
/*!40000 ALTER TABLE `organization_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_banner`
--

DROP TABLE IF EXISTS `users_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_banner`
--

LOCK TABLES `users_banner` WRITE;
/*!40000 ALTER TABLE `users_banner` DISABLE KEYS */;
INSERT INTO `users_banner` VALUES (1,'轮播图1','banner/2017/08/57a801860001c34b12000460.jpg','http://www.baidu.com',1,'2017-08-18 14:01:00.000000'),(2,'轮播图2','banner/2017/08/57aa86a0000145c512000460.jpg','http://www.sina.com.cn',2,'2017-08-18 14:03:00.000000'),(3,'轮播图3','banner/2017/08/8126152_233511681000_2.jpg','http://www.qq.com/',3,'2017-08-18 14:04:00.000000'),(4,'轮播图4','banner/2017/08/4838084_110353658135_2.jpg','http://www.163.com',4,'2017-08-18 14:07:00.000000'),(5,'轮播图5','banner/2017/08/timg.jpg','http://www.zhidianlife.com',5,'2017-08-18 14:07:00.000000');
/*!40000 ALTER TABLE `users_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_emailverifyrecord`
--

DROP TABLE IF EXISTS `users_emailverifyrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(50) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_emailverifyrecord`
--

LOCK TABLES `users_emailverifyrecord` WRITE;
/*!40000 ALTER TABLE `users_emailverifyrecord` DISABLE KEYS */;
INSERT INTO `users_emailverifyrecord` VALUES (19,'y24RtzIHzsbYsJHNdx','1059653878@qq.com','forget','2017-07-17 16:25:37.215247'),(20,'TmcD2POAQlYq2uHM5I','1059653878@qq.com','forget','2017-07-17 17:11:36.726786'),(21,'soyxddgGpHpixJ25Gh','1059653878@qq.com','forget','2017-07-17 17:38:11.458403'),(22,'2mGw8rMMfVh6isYMi8','1059653878@qq.com','forget','2017-07-17 17:41:14.140444'),(23,'ML6GlUpUMqeYSPADCx','1059653878@qq.com','forget','2017-07-17 18:01:04.170038'),(25,'jXSlI6bIi4zBvqYZ7z','1059653878@qq.com','forget','2017-07-19 09:46:10.324453'),(26,'8YMtp8mPWGiakIHLhz','1059653878@qq.com','forget','2017-07-19 10:09:44.167262'),(27,'8WHnVlIPc5MLa7FFRn','1059653878@qq.com','forget','2017-08-01 12:55:58.088488'),(28,'x6iD5hunyCBGmDA9QQ','1059653878@qq.com','forget','2017-08-11 11:00:49.912908'),(29,'HK1d','15801031556@139.com','update_email','2017-08-14 14:34:53.805603'),(30,'aCuR','15801031556@139.com','update_email','2017-08-14 15:03:00.965192'),(31,'7ECi','1559653878@qq.com','update_email','2017-08-14 15:06:44.927400'),(32,'SbQi','1059653878@qq.com','update_email','2017-08-14 15:06:56.977977'),(33,'SeaQ','15801031556@139.com','update_email','2017-08-14 15:07:32.529351'),(35,'TvamfgP0UijFcn703w','1059653878@139.com','register','2017-08-18 15:03:23.743130'),(37,'7sjBKXXgFtAwCmnWCm','893695711@qq.com','register','2017-08-18 15:54:51.019701'),(38,'Wt8bPmozQACAvqrLEQ','893695711@qq.com','register','2017-08-18 15:56:06.689954'),(39,'86oi6Dsh2hRnud4teN','893695711@qq.com','register','2017-08-18 15:58:24.055829'),(40,'mqUJZPbjRiKq2OQ30i','askldfja@163.com','register','2017-08-29 15:28:11.701565'),(41,'jH7TSRTBFuaSQQevKO','459294906@qq.com','register','2017-08-29 15:38:00.900640'),(42,'zJFnREpZBe6Zvbg9ga','1059653878@qq.com','register','2017-08-29 15:48:01.445350'),(43,'p8A2qTmFiL2T6WlKgP','459294906@qq.com','register','2017-08-29 15:49:19.926569'),(44,'cShg8hSsNgJ62Ckik2','1059653878@qq.com','register','2017-08-29 15:49:41.395687'),(45,'AjZA3x6ZeLd7PmfF2Y','1059653878@qq.com','register','2017-08-29 15:50:43.358803'),(46,'dgIDRkgrw1mGlP3cW8','1059653878@qq.com','register','2017-08-29 15:58:32.099060'),(48,'GohIlf6Jm8EqBQrtEW','459294906@qq.com','register','2017-08-29 16:13:35.583966'),(50,'jaI57LUv5QkXVsdSfs','sldjflak@163.com','register','2017-08-29 16:15:41.766550');
/*!40000 ALTER TABLE `users_emailverifyrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile`
--

DROP TABLE IF EXISTS `users_userprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birday` date DEFAULT NULL,
  `gender` varchar(8) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile`
--

LOCK TABLES `users_userprofile` WRITE;
/*!40000 ALTER TABLE `users_userprofile` DISABLE KEYS */;
INSERT INTO `users_userprofile` VALUES (18,'pbkdf2_sha256$24000$J3ew4CgVt2xx$pIDjlHsm2D30inpHntyvG+CyvEpmN+PNwrIF0PYs8vQ=','2017-08-28 15:29:21.282891',0,'15801031556@139.com','','','15801031556@139.com',0,1,'2017-07-17 16:23:00.000000','Tom','2007-02-17','male','北京市东城区北京东街8号信通大厦A座1201','15811012011','image/2017/08/130630220190632_HHGFDll.jpg'),(19,'pbkdf2_sha256$24000$oZkAn5SYja7B$XZKrTXbm9oaWkDDv8dGh46BA2bKMFK3IxHnEHjrZNcA=','2017-08-23 17:01:20.066875',1,'wadayu','','','wadayu@163.com',1,1,'2017-07-19 16:26:00.000000','刚子',NULL,'female','北京市','','image/2017/07/130630220190632.jpg'),(28,'pbkdf2_sha256$24000$A2SkHXCbcdp3$ZxYO7YdmSpSYOhx7dL3fB2+IKRfKrmhGlfGs963uuRA=','2017-08-18 16:03:06.979156',0,'893695711@qq.com','','','893695711@qq.com',0,1,'2017-08-18 16:02:05.889107','',NULL,'female','',NULL,'image/default.png'),(36,'pbkdf2_sha256$24000$6g2oeUDqprho$tUDprPHU729oEjulZp3XdBy8Tpr3NHqSDcqveWb0rD4=','2017-08-29 16:17:56.639694',0,'1059653878@qq.com','','','1059653878@qq.com',0,1,'2017-08-29 16:02:54.353567','ajklsjf','2017-07-31','male','北京市通州区','13121501103','image/default.png'),(38,'pbkdf2_sha256$24000$4GgNowl7PVv8$B2NfUXDY8w1LaokQVlZp3Zq8+85iVDjJENwbAK8ny54=','2017-08-29 16:15:53.264354',0,'459294906@qq.com','','','459294906@qq.com',0,1,'2017-08-29 16:15:21.261969','',NULL,'female','',NULL,'image/default.png');
/*!40000 ALTER TABLE `users_userprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_groups`
--

DROP TABLE IF EXISTS `users_userprofile_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_groups`
--

LOCK TABLES `users_userprofile_groups` WRITE;
/*!40000 ALTER TABLE `users_userprofile_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_userprofile_user_permissions`
--

DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_userprofile_user_permissions`
--

LOCK TABLES `users_userprofile_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_userprofile_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (5,'2017-07-19 16:27:44.415272','127.0.0.1',NULL,'','delete','批量删除 1 个 用户信息',NULL,19),(6,'2017-07-19 16:28:56.098832','127.0.0.1','1','北京市','create','已添加',13,19),(7,'2017-07-19 16:29:09.542530','127.0.0.1','2','上海市','create','已添加',13,19),(8,'2017-07-19 16:29:18.754049','127.0.0.1','3','天津市','create','已添加',13,19),(9,'2017-07-19 16:29:27.759949','127.0.0.1','4','深圳市','create','已添加',13,19),(10,'2017-07-19 16:29:40.369465','127.0.0.1','5','广州市','create','已添加',13,19),(11,'2017-07-19 16:49:21.782070','127.0.0.1','1','慕课网1','create','已添加',14,19),(12,'2017-07-19 16:50:03.750618','127.0.0.1','2','慕课网2','create','已添加',14,19),(13,'2017-07-19 16:50:34.950562','127.0.0.1','3','慕课网3','create','已添加',14,19),(14,'2017-07-19 16:51:08.001387','127.0.0.1','4','慕课网4','create','已添加',14,19),(15,'2017-07-19 16:51:32.409260','127.0.0.1','5','慕课网6','create','已添加',14,19),(16,'2017-07-19 16:52:09.539559','127.0.0.1','6','慕课网6','create','已添加',14,19),(17,'2017-07-19 16:52:31.845840','127.0.0.1','5','慕课网5','change','已修改 name 。',14,19),(18,'2017-07-19 16:53:26.779846','127.0.0.1','7','慕课网7','create','已添加',14,19),(19,'2017-07-19 16:54:12.420154','127.0.0.1','8','慕课网8','create','已添加',14,19),(20,'2017-07-25 09:41:28.938002','127.0.0.1','1','Teacher object','create','已添加',15,19),(21,'2017-07-25 09:45:05.301330','127.0.0.1','1','django入门学习','create','已添加',9,19),(22,'2017-07-25 14:28:27.441646','127.0.0.1','1','Teacher object','change','已修改 image 。',15,19),(23,'2017-07-25 14:29:15.951225','127.0.0.1','1','Tom','change','已修改 points 。',15,19),(24,'2017-07-25 14:29:56.028703','127.0.0.1','1','Jim','change','已修改 name 。',15,19),(25,'2017-07-25 15:50:12.809136','127.0.0.1','2','xadmin搭建配置','create','已添加',9,19),(26,'2017-07-26 14:47:51.495726','127.0.0.1','19','wadayu','change','已修改 last_login，nick_name 和 address 。',6,19),(27,'2017-07-26 14:48:00.116996','127.0.0.1','19','wadayu','change','已修改 image 。',6,19),(28,'2017-07-27 10:13:50.710024','127.0.0.1','1','django入门学习','change','已修改 course_org 。',9,19),(29,'2017-07-27 10:14:17.466484','127.0.0.1','3','django入门2','create','已添加',9,19),(30,'2017-07-27 10:14:40.329065','127.0.0.1','4','django入门3','create','已添加',9,19),(31,'2017-07-27 10:14:58.879010','127.0.0.1','5','django入门4','create','已添加',9,19),(32,'2017-07-27 10:18:53.254226','127.0.0.1','6','django入门5','create','已添加',9,19),(33,'2017-07-27 10:19:25.145449','127.0.0.1','7','python高级开发','create','已添加',9,19),(34,'2017-07-27 10:19:47.606068','127.0.0.1','8','python爬虫入门','create','已添加',9,19),(35,'2017-07-27 10:36:04.098929','127.0.0.1','4','django入门3','change','已修改 image 。',9,19),(36,'2017-07-27 10:36:14.896223','127.0.0.1','4','django入门3','change','没有字段被修改。',9,19),(37,'2017-07-27 11:09:37.282255','127.0.0.1','9','flask框架入门教程','create','已添加',9,19),(38,'2017-07-27 15:14:49.011291','127.0.0.1','9','flask框架入门教程','change','已修改 category 。',9,19),(39,'2017-07-27 15:14:55.986831','127.0.0.1','8','python爬虫入门','change','已修改 category 。',9,19),(40,'2017-07-27 15:15:03.342379','127.0.0.1','7','python高级开发','change','已修改 category 。',9,19),(41,'2017-07-27 15:15:10.399135','127.0.0.1','5','django入门4','change','已修改 category 。',9,19),(42,'2017-07-27 15:15:15.999019','127.0.0.1','1','django入门学习','change','已修改 category 。',9,19),(43,'2017-07-27 15:15:21.956856','127.0.0.1','2','xadmin搭建配置','change','已修改 category 。',9,19),(44,'2017-07-27 15:15:27.732206','127.0.0.1','3','django入门2','change','已修改 category 。',9,19),(45,'2017-07-27 15:15:33.784290','127.0.0.1','4','django入门3','change','已修改 category 。',9,19),(46,'2017-07-27 15:15:40.479084','127.0.0.1','5','django入门4','change','没有字段被修改。',9,19),(47,'2017-07-27 16:15:34.694770','127.0.0.1','1','UserCourse object','create','已添加',20,19),(48,'2017-07-27 16:19:24.743104','127.0.0.1','5','wadayu','create','已添加',20,19),(49,'2017-07-27 16:49:55.567636','127.0.0.1','1','Jim','change','已修改 org 。',15,19),(50,'2017-07-27 16:52:16.639619','127.0.0.1','2','tom','create','已添加',15,19),(51,'2017-07-27 17:14:46.456607','127.0.0.1','6','django入门5','change','已修改 category 和 tag 。',9,19),(52,'2017-07-27 17:14:58.290090','127.0.0.1','5','django入门4','change','已修改 tag 。',9,19),(53,'2017-07-27 17:15:20.047903','127.0.0.1','5','django入门4','change','没有字段被修改。',9,19),(54,'2017-07-27 17:15:32.013696','127.0.0.1','4','django入门3','change','已修改 tag 。',9,19),(55,'2017-07-28 16:10:00.475948','127.0.0.1','1','第一章节','create','已添加',10,19),(56,'2017-07-28 16:10:06.777452','127.0.0.1','2','第二章节','create','已添加',10,19),(57,'2017-07-28 16:10:34.878996','127.0.0.1','3','第一章节','create','已添加',10,19),(58,'2017-07-28 16:10:47.850984','127.0.0.1','4','第二章节','create','已添加',10,19),(59,'2017-07-28 16:11:04.285055','127.0.0.1','5','第一章节','create','已添加',10,19),(60,'2017-07-28 16:11:08.002140','127.0.0.1','6','第二章节','create','已添加',10,19),(61,'2017-07-28 16:11:23.963620','127.0.0.1','7','第一章节','create','已添加',10,19),(62,'2017-07-28 16:11:27.673353','127.0.0.1','8','第二章节','create','已添加',10,19),(63,'2017-07-28 16:13:36.091651','127.0.0.1','1','1.1','create','已添加',11,19),(64,'2017-07-28 16:13:50.246399','127.0.0.1','2','1.2','create','已添加',11,19),(65,'2017-07-28 16:14:18.192673','127.0.0.1','3','2.1','create','已添加',11,19),(66,'2017-07-28 16:14:24.941583','127.0.0.1','4','2.2','create','已添加',11,19),(67,'2017-07-28 16:14:42.349322','127.0.0.1','5','1.1','create','已添加',11,19),(68,'2017-07-28 16:14:48.982366','127.0.0.1','6','1.2','create','已添加',11,19),(69,'2017-07-28 16:15:00.621565','127.0.0.1','7','2.1','create','已添加',11,19),(70,'2017-07-28 16:15:06.652477','127.0.0.1','8','2.2','create','已添加',11,19),(71,'2017-07-28 16:15:22.073068','127.0.0.1','9','1.1','create','已添加',11,19),(72,'2017-07-28 16:15:28.546765','127.0.0.1','10','1.2','create','已添加',11,19),(73,'2017-07-28 16:15:38.797400','127.0.0.1','11','2.1','create','已添加',11,19),(74,'2017-07-28 16:15:45.215150','127.0.0.1','12','2.2','create','已添加',11,19),(75,'2017-07-28 16:15:59.746575','127.0.0.1','13','1.1','create','已添加',11,19),(76,'2017-07-28 16:16:05.280216','127.0.0.1','14','1.2','create','已添加',11,19),(77,'2017-07-28 16:16:13.237148','127.0.0.1','8','第二章节','change','没有字段被修改。',10,19),(78,'2017-07-28 16:16:21.280107','127.0.0.1','15','2.1','create','已添加',11,19),(79,'2017-07-28 16:16:28.817195','127.0.0.1','16','2.2','create','已添加',11,19),(80,'2017-07-28 16:27:55.198878','127.0.0.1','2','第二章节  进阶开发','change','已修改 name 。',10,19),(81,'2017-07-28 16:28:03.643100','127.0.0.1','1','第一章节 基础知识','change','已修改 name 。',10,19),(82,'2017-07-28 16:28:14.292661','127.0.0.1','4','第二章节  进阶开发','change','已修改 name 。',10,19),(83,'2017-07-28 16:28:18.450610','127.0.0.1','3','第一章节 基础知识','change','已修改 name 。',10,19),(84,'2017-07-28 16:28:27.027852','127.0.0.1','6','第二章节  进阶开发','change','已修改 name 。',10,19),(85,'2017-07-28 16:28:30.928873','127.0.0.1','5','第一章节 基础知识','change','已修改 name 。',10,19),(86,'2017-07-28 16:28:40.489312','127.0.0.1','8','第二章节  进阶开发','change','已修改 name 。',10,19),(87,'2017-07-28 16:28:44.709537','127.0.0.1','7','第一章节 基础知识','change','已修改 name 。',10,19),(88,'2017-07-30 14:54:52.253688','127.0.0.1','1','CourseResource object','create','已添加',12,19),(89,'2017-07-30 14:55:12.372170','127.0.0.1','1','CourseResource object','change','没有字段被修改。',12,19),(90,'2017-07-30 14:55:12.528092','127.0.0.1','1','CourseResource object','change','没有字段被修改。',12,19),(91,'2017-07-30 14:55:54.149920','127.0.0.1','1','前端开发','change','没有字段被修改。',12,19),(92,'2017-07-30 15:15:56.025426','127.0.0.1','9','flask框架入门教程','change','已修改 teacher 和 tag 。',9,19),(93,'2017-07-30 15:17:15.111867','127.0.0.1','2','Tom','change','已修改 name 。',15,19),(94,'2017-07-30 15:26:20.566059','127.0.0.1','9','flask框架入门教程','change','已修改 knows 和 teacher_tell 。',9,19),(95,'2017-07-30 17:50:42.753746','127.0.0.1','18','1059653878@qq.com','change','已修改 last_login，nick_name，address 和 image 。',6,19),(96,'2017-08-01 15:27:38.448843','127.0.0.1','1','1.1','change','已修改 url 。',11,19),(97,'2017-08-01 15:27:48.011926','127.0.0.1','2','1.2','change','已修改 url 。',11,19),(98,'2017-08-03 15:58:49.779260','127.0.0.1','8','python爬虫入门','change','已修改 teacher，tag，knows 和 teacher_tell 。',9,19),(99,'2017-08-03 15:59:07.787122','127.0.0.1','2','xadmin搭建配置','change','已修改 teacher，tag，knows 和 teacher_tell 。',9,19),(100,'2017-08-03 15:59:34.441330','127.0.0.1','1','django入门学习','change','已修改 teacher，tag，knows 和 teacher_tell 。',9,19),(101,'2017-08-03 16:19:56.125182','127.0.0.1','2','Tom','change','已修改 org 。',15,19),(102,'2017-08-03 16:22:35.594900','127.0.0.1','2','xadmin搭建配置','change','已修改 course_org 。',9,19),(103,'2017-08-03 16:22:56.692722','127.0.0.1','1','django入门学习','change','已修改 course_org 。',9,19),(104,'2017-08-03 16:23:05.853390','127.0.0.1','8','python爬虫入门','change','已修改 course_org 。',9,19),(105,'2017-08-03 16:24:08.416827','127.0.0.1','9','flask框架入门教程','change','已修改 course_org 。',9,19),(106,'2017-08-16 10:02:31.783659','127.0.0.1','7','python高级开发','change','已修改 teacher，tag，knows 和 teacher_tell 。',9,19),(107,'2017-08-16 10:03:14.379041','127.0.0.1','5','django入门4','change','已修改 teacher，knows 和 teacher_tell 。',9,19),(108,'2017-08-16 10:04:01.692877','127.0.0.1','4','django入门3','change','已修改 teacher，knows 和 teacher_tell 。',9,19),(109,'2017-08-16 10:11:29.432755','127.0.0.1','9','flask框架入门教程','change','已修改 teacher 。',9,19),(110,'2017-08-16 10:12:00.645822','127.0.0.1','6','django入门5','change','已修改 teacher，knows 和 teacher_tell 。',9,19),(111,'2017-08-16 10:12:34.052567','127.0.0.1','3','django入门2','change','已修改 teacher，tag，knows 和 teacher_tell 。',9,19),(112,'2017-08-18 13:55:26.695457','127.0.0.1','9','flask框架入门教程','change','已修改 is_banner 。',9,19),(113,'2017-08-18 13:55:33.882955','127.0.0.1','8','python爬虫入门','change','已修改 is_banner 。',9,19),(114,'2017-08-18 13:55:59.982854','127.0.0.1','8','python爬虫入门','change','没有字段被修改。',9,19),(115,'2017-08-18 13:56:37.312862','127.0.0.1','2','xadmin搭建配置','change','已修改 is_banner 。',9,19),(116,'2017-08-18 14:02:33.198962','127.0.0.1','1','Banner object','create','已添加',8,19),(117,'2017-08-18 14:03:25.372599','127.0.0.1','1','Banner object','change','没有字段被修改。',8,19),(118,'2017-08-18 14:03:50.118829','127.0.0.1','1','轮播图1','change','没有字段被修改。',8,19),(119,'2017-08-18 14:04:44.560799','127.0.0.1','2','轮播图2','create','已添加',8,19),(120,'2017-08-18 14:07:11.810321','127.0.0.1','3','轮播图3','create','已添加',8,19),(121,'2017-08-18 14:07:45.522795','127.0.0.1','4','轮播图4','create','已添加',8,19),(122,'2017-08-18 14:09:48.188034','127.0.0.1','5','轮播图5','create','已添加',8,19),(123,'2017-08-18 14:09:53.594352','127.0.0.1','5','轮播图5','change','没有字段被修改。',8,19),(124,'2017-08-18 14:16:53.985897','127.0.0.1','2','xadmin搭建配置','change','已修改 is_banner 。',9,19),(125,'2017-08-18 14:17:04.837605','127.0.0.1','6','django入门5','change','已修改 is_banner 。',9,19),(126,'2017-08-23 16:11:36.501392','127.0.0.1','1','慕课网1','change','已修改 course_nums 。',14,19);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (3,'dashboard:home:pos','',19),(4,'users_userprofile_editform_portal','box-0,box-1,box-2,box-3,box-4|box-5',19);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-23 19:12:23
