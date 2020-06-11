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
	`permissions` Int( 64 ) NOT NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 20;
-- -------------------------------------------------------------


-- CREATE TABLE "category" -------------------------------------
CREATE TABLE `category`( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`name` VarChar( 255 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 5;
-- -------------------------------------------------------------


-- CREATE TABLE "joke" -----------------------------------------
CREATE TABLE `joke`( 
	`id` Int( 11 ) AUTO_INCREMENT NOT NULL,
	`joketext` Text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
	`rate` Int( 4 ) NOT NULL DEFAULT 0,
	`jokedate` Date NOT NULL,
	`authorid` Int( 11 ) NULL,
	PRIMARY KEY ( `id` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB
AUTO_INCREMENT = 30;
-- -------------------------------------------------------------


-- CREATE TABLE "joke_category" --------------------------------
CREATE TABLE `joke_category`( 
	`jokeId` Int( 11 ) NOT NULL,
	`categoryId` Int( 11 ) NOT NULL,
	PRIMARY KEY ( `jokeId`, `categoryId` ) )
CHARACTER SET = utf8
COLLATE = utf8_general_ci
ENGINE = InnoDB;
-- -------------------------------------------------------------


-- Dump data of "author" -----------------------------------
INSERT INTO `author`(`id`,`name`,`email`,`password`,`permissions`) VALUES 
( '15', 'andrei_password', 'andrei_password@gmail.com', '$2y$10$VGuADOFxl4/mEEa1NQqjqe48pC9vP93eq3tjOJp/onLebhHbBNf8S', '6' ),
( '16', 'test_password', 'test_password@mail.ru', '$2y$10$iiSnxK85laQAqG3sAKuxweKHPBWU17kGbD80lM66lol42QdHujrjm', '61' ),
( '17', 'vvv', 'vvv_password@gmail.com', '$2y$10$JY3n2FukMGU7iU5/0N8ky.Rp0eyV4zKkquGW8OdaXpaACIWD4cqJm', '4' ),
( '18', 'temp', 'temp@gmail.com', '$2y$10$MedhoF7DHm095Wd.tiDZ4uTRxeCA3YSVGL7pZzK2N8sikNi9FxjZS', '0' ),
( '19', 'temp2', 'temp2@gmail.com', '$2y$10$KeJFFqDgc8XAcIpBTgMjxujpQALZKbIGbIiQ9hBmQCphePjmlddmK', '0' );
-- ---------------------------------------------------------


-- Dump data of "category" ---------------------------------
INSERT INTO `category`(`id`,`name`) VALUES 
( '3', 'programming jokes' ),
( '4', 'one-liners' );
-- ---------------------------------------------------------


-- Dump data of "joke" -------------------------------------
INSERT INTO `joke`(`id`,`joketext`,`rate`,`jokedate`,`authorid`) VALUES 
( '6', 'pj', '3', '2020-05-17', '16' ),
( '9', '**link**
[MDN](https://developer.mozilla.org)', '5', '2020-05-31', '15' ),
( '10', '__test__ me', '2', '2020-05-30', '16' ),
( '18', 'joke 8', '0', '2020-05-31', '16' ),
( '19', 'joke 9', '0', '2020-05-31', '16' ),
( '20', 'joke 10', '0', '2020-05-31', '16' ),
( '21', 'joke 11', '0', '2020-05-31', '16' ),
( '22', 'joke 12', '0', '2020-05-31', '16' ),
( '23', 'joke 13', '0', '2020-05-31', '16' ),
( '24', 'joke 14', '0', '2020-05-31', '16' ),
( '25', 'joke 15', '0', '2020-05-31', '16' ),
( '26', 'joke 16', '0', '2020-05-31', '16' ),
( '27', 'joke 17', '0', '2020-05-31', '16' ),
( '28', 'joke 18', '3', '2020-05-31', '15' ),
( '29', 'scateboard_2', '5', '2020-06-01', '15' );
-- ---------------------------------------------------------


-- Dump data of "joke_category" ----------------------------
INSERT INTO `joke_category`(`jokeId`,`categoryId`) VALUES 
( '9', '4' ),
( '28', '3' ),
( '28', '4' ),
( '29', '4' );
-- ---------------------------------------------------------


-- CREATE INDEX "authorid" -------------------------------------
CREATE INDEX `authorid` USING BTREE ON `joke`( `authorid` );
-- -------------------------------------------------------------


-- CREATE LINK "joke_ibfk_1" -----------------------------------
ALTER TABLE `joke`
	ADD CONSTRAINT `joke_ibfk_1` FOREIGN KEY ( `authorid` )
	REFERENCES `author`( `id` )
	ON DELETE Restrict
	ON UPDATE Restrict;
-- -------------------------------------------------------------


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- ---------------------------------------------------------


