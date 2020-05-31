-- Dump created by MySQL pump utility, version: 5.7.29, Linux (x86_64)
-- Dump start time: Thu Apr 23 18:45:19 2020
-- Server version: 5.7.29

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET @@SESSION.SQL_LOG_BIN= 0;
SET @OLD_TIME_ZONE=@@TIME_ZONE;
SET TIME_ZONE='+00:00';
SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT;
SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS;
SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION;
SET NAMES utf8mb4;
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ijdb_sample_test` /*!40100 DEFAULT CHARACTER SET latin1 */;
CREATE TABLE `ijdb_sample_test`.`author` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) DEFAULT NULL,
`email` varchar(255) DEFAULT NULL,
`password` varchar(255) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8
;
CREATE TABLE `ijdb_sample_test`.`joke` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`joketext` text,
`rate` int(4) NOT NULL DEFAULT '0',
`jokedate` date NOT NULL,
`authorid` int(11) DEFAULT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8
;
INSERT INTO `ijdb_sample_test`.`author` VALUES (1,"Kevin Yank","thatguy@kevinyank.com",NULL),(2,"Tom Butler","tom@r.je",NULL),(3,"Andrei","andrei.chornii@gmail.com","reg3rgpok32"),(4,"aaa","andrei.chornii2@gmail.com","wgwgwr"),(5,"wrgw","andrei.chornii3@gmail.com","rtjrsjth"),(6,"wrgw66","andrei.chornii4@gmail.com","ey534"),(7,"gf2gf2w","an.t@gmail.com","wfvwrgvr3w43"),(8,"aaa","eee@fff.vv","vfebe433"),(9,"fbsf","fbef@fs.dd","bdbdefb"),(10,"rrr","rrr@rr.r","wrghw53"),(11,"gergegr","rrr@rr.rv","grsget3e53"),(12,"fila","fila@gmail.com","vnwojnr2oje"),(13,"hash","hash@gmail.com","$2y$10$vT6Ef3u4SAJXJt7X038tLOkF1FcY5cMrdaKdR9b5vnJnr5x/2euuy"),(14,"login","login@gmail.com","$2y$10$BEADl8u8SsjMobKO8qExhuqEMSqzGcIgNirA4h2510LqduSpgkmWS"),(15,"andrei_password","andrei_password@gmail.com","$2y$10$VGuADOFxl4/mEEa1NQqjqe48pC9vP93eq3tjOJp/onLebhHbBNf8S"),(16,"test_password","test_password@mail.ru","$2y$10$iiSnxK85laQAqG3sAKuxweKHPBWU17kGbD80lM66lol42QdHujrjm");
INSERT INTO `ijdb_sample_test`.`joke` VALUES (34,"login2",8,"2020-04-04",16),(35,"andrei_password_joke333",7,"2020-04-17",15),(36,"ready",9,"2020-04-09",16),(37,"comae",4,"2020-04-23",15);
SET TIME_ZONE=@OLD_TIME_ZONE;
SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT;
SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS;
SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET SQL_MODE=@OLD_SQL_MODE;
-- Dump end time: Thu Apr 23 18:45:21 2020
