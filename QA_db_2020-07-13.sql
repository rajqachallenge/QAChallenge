# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.29)
# Database: QA_db
# Generation Time: 2020-07-13 13:54:12 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table client_message
# ------------------------------------------------------------

DROP TABLE IF EXISTS `client_message`;

CREATE TABLE `client_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `req_message` varchar(255) NOT NULL,
  `print_time` time NOT NULL,
  `isqueued` tinyint(1) DEFAULT '0',
  `isPrinted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

LOCK TABLES `client_message` WRITE;
/*!40000 ALTER TABLE `client_message` DISABLE KEYS */;

INSERT INTO `client_message` (`id`, `req_message`, `print_time`, `isqueued`, `isPrinted`)
VALUES
	(1,'Yay','21:11:12',1,1),
	(2,'Yay','21:11:02',1,1),
	(3,'Yay','21:11:08',1,1),
	(4,'Yay','21:11:07',1,1),
	(5,'Yay','21:11:06',1,1),
	(6,'Yay','21:11:15',1,1),
	(7,'Yay','21:13:15',1,1),
	(8,'Yay','21:13:05',1,1),
	(9,'Yay','21:13:00',1,1),
	(10,'Yay','21:13:09',1,1),
	(11,'Yay','21:13:06',1,1),
	(12,'Yay','21:13:08',1,1),
	(13,'Yay','21:15:08',1,0),
	(14,'Yay','21:16:08',1,1),
	(15,'Yay','09:00:08',1,1),
	(16,'Yay','09:02:08',1,1),
	(17,'Yay','09:08:08',1,1),
	(18,'Yay','09:00:00',1,1),
	(19,'Yay','09:00:04',1,1),
	(20,'Yay','09:00:08',1,1),
	(21,'Yay','09:00:07',1,1),
	(22,'Yay','10:03:07',1,1),
	(23,'Yay','10:03:17',1,1),
	(24,'Yay','10:03:08',1,1),
	(25,'Yay','10:03:02',1,1),
	(26,'Yay','10:03:09',1,1),
	(27,'Yay','10:05:09',1,1),
	(28,'Yay','10:03:01',1,1),
	(29,'Yay','10:03:00',1,1);

/*!40000 ALTER TABLE `client_message` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
