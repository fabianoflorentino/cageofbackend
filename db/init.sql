SET GLOBAL host_cache_size=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
SET NAMES utf8mb4;
SET @PASSWD := "<PASSWORD>";

CREATE DATABASE IF NOT EXISTS `cageofbackend_development`;
CREATE DATABASE IF NOT EXISTS `cageofbackend_test`;
CREATE DATABASE IF NOT EXISTS `cageofbackend`;

CREATE USER IF NOT EXISTS 'cage'@'%' IDENTIFIED BY @PASSWD;
CREATE USER IF NOT EXISTS 'cage'@'localhost' IDENTIFIED BY @PASSWD;

GRANT ALL PRIVILEGES ON *.* TO 'cage'@'%';
GRANT ALL PRIVILEGES ON *.* TO 'cage'@'localhost';
