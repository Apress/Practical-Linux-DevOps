SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP DATABASE IF EXISTS `mydatabase`;
CREATE DATABASE `mydatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `mydatabase`;

DROP TABLE IF EXISTS `my_users`;
CREATE TABLE `my_users` (
  `user_id` int(3) NOT NULL AUTO_INCREMENT,
  `user_first` varchar(30) NOT NULL,
  `user_last` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `my_users` (`user_id`, `user_first`, `user_last`) VALUES
(1,	'Betsy',	'Ross'),
(2,	'George',	'Washington'),
(3,	'Ben',	'Franklin'),
(4,	'Thomas',	'Jefferson');

CREATE USER 'webuser'@'%' IDENTIFIED BY 'password';

GRANT CREATE, SELECT, INSERT, UPDATE, DELETE ON mydatabase.* TO 'webuser'@'%';

FLUSH PRIVILEGES;

