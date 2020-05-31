-- Valentina Studio --
-- MySQL dump --
-- ---------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- ---------------------------------------------------------


-- CREATE TABLE "author" ---------------------------------------
CREATE TABLE `author`( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`email` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`password` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 17;
-- -------------------------------------------------------------


-- CREATE TABLE "joke" -----------------------------------------
CREATE TABLE `joke`( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`joketext` Text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`jokedate` Date NOT NULL,
	`authorid` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 37;
-- -------------------------------------------------------------


-- Dump data of "author" -----------------------------------
INSERT INTO `author`(`id`,`name`,`email`,`password`) VALUES 
( '1', 'Kevin Yank', 'thatguy@kevinyank.com', NULL ),
( '2', 'Tom Butler', 'tom@r.je', NULL ),
( '3', 'Andrei', 'andrei.chornii@gmail.com', 'reg3rgpok32' ),
( '4', 'aaa', 'andrei.chornii2@gmail.com', 'wgwgwr' ),
( '5', 'wrgw', 'andrei.chornii3@gmail.com', 'rtjrsjth' ),
( '6', 'wrgw66', 'andrei.chornii4@gmail.com', 'ey534' ),
( '7', 'gf2gf2w', 'an.t@gmail.com', 'wfvwrgvr3w43' ),
( '8', 'aaa', 'eee@fff.vv', 'vfebe433' ),
( '9', 'fbsf', 'fbef@fs.dd', 'bdbdefb' ),
( '10', 'rrr', 'rrr@rr.r', 'wrghw53' ),
( '11', 'gergegr', 'rrr@rr.rv', 'grsget3e53' ),
( '12', 'fila', 'fila@gmail.com', 'vnwojnr2oje' ),
( '13', 'hash', 'hash@gmail.com', '$2y$10$vT6Ef3u4SAJXJt7X038tLOkF1FcY5cMrdaKdR9b5vnJnr5x/2euuy' ),
( '14', 'login', 'login@gmail.com', '$2y$10$BEADl8u8SsjMobKO8qExhuqEMSqzGcIgNirA4h2510LqduSpgkmWS' ),
( '15', 'andrei_password', 'andrei_password@gmail.com', '$2y$10$VGuADOFxl4/mEEa1NQqjqe48pC9vP93eq3tjOJp/onLebhHbBNf8S' ),
( '16', 'test_password', 'test_password@mail.ru', '$2y$10$iiSnxK85laQAqG3sAKuxweKHPBWU17kGbD80lM66lol42QdHujrjm' );
-- ---------------------------------------------------------


-- Dump data of "joke" -------------------------------------
INSERT INTO `joke`(`id`,`joketext`,`rate`,`jokedate`,`authorid`) VALUES 
( '34', 'login2', '7', '2020-04-04', '16' ),
( '35', 'andrei_password_joke333', '6', '2020-04-17', '15' ),
( '36', 'ready', '6', '2020-04-09', '16' ),
( '37', 'comae', '4', '2020-04-23', '15' );
-- ---------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


