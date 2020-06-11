-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: chorniih.mysql.ukraine.com.ua
-- Generation Time: Jun 11, 2020 at 03:39 PM
-- Server version: 5.7.16-10-log
-- PHP Version: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chorniih_ijdbsample`
--
CREATE DATABASE IF NOT EXISTS `chorniih_ijdbsample` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `chorniih_ijdbsample`;

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `permissions` int(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `name`, `email`, `password`, `permissions`) VALUES
(19, 'andrei', 'andrei@gmail.com', '$2y$10$wefZbP6wMEzsMJE6A71ss.B4Cd7FdkJxJ2RAF9BpXVfA7BUIapPkO', 63),
(20, 'andrei', 'andrei.chornii@gmail.com', '$2y$10$tf83n2ICG2KDFbod67zoM.FauKpeU1X2QCVItF08dd9HzM8Szzv6u', 0);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(3, 'programming jokes'),
(4, 'one-liners');

-- --------------------------------------------------------

--
-- Table structure for table `joke`
--

CREATE TABLE `joke` (
  `id` int(11) NOT NULL,
  `joketext` text,
  `rate` int(4) NOT NULL DEFAULT '0',
  `jokedate` date NOT NULL,
  `authorid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joke`
--

INSERT INTO `joke` (`id`, `joketext`, `rate`, `jokedate`, `authorid`) VALUES
(30, 'My parents grew to like my girlfriend so much, they take her as their own daughter. Now they started looking for a proper boyfriend for her.\r\n\r\nSource (don\'t copy without it): https://short-funny.com/', 2, '2020-06-09', 19),
(31, 'Doctor: \"I\'m sorry but you suffer from a terminal illness and have only 10 to live.\" Patient: \"What do you mean, 10? 10 what? Months? Weeks?!\" Doctor: \"Nine.\"\r\n\r\nSource (don\'t copy without it): https://short-funny.com/', 12, '2020-06-09', 19),
(32, 'My old aunts would come and tease me at weddings, “Well Sarah? Do you think you’ll be next?” - We’ve settled this quickly once I’ve started doing the same to them at funerals.\r\n\r\nSource (don\'t copy without it): https://short-funny.com/', 20, '2020-06-09', 19),
(33, 'A doctor accidentally prescribes his patient a laxative instead of a coughing syrup. - Three days later the patient comes for a check-up and the doctor asks: “Well? Are you still coughing?” - The patient replies: “No. I’m afraid to\r\n\r\nSource (don\'t copy without it): https://short-funny.com/', 0, '2020-06-09', 20);

-- --------------------------------------------------------

--
-- Table structure for table `joke_category`
--

CREATE TABLE `joke_category` (
  `jokeId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `joke_category`
--

INSERT INTO `joke_category` (`jokeId`, `categoryId`) VALUES
(30, 3),
(31, 4),
(32, 3),
(32, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `joke`
--
ALTER TABLE `joke`
  ADD PRIMARY KEY (`id`),
  ADD KEY `authorid` (`authorid`) USING BTREE;

--
-- Indexes for table `joke_category`
--
ALTER TABLE `joke_category`
  ADD PRIMARY KEY (`jokeId`,`categoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `joke`
--
ALTER TABLE `joke`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `joke`
--
ALTER TABLE `joke`
  ADD CONSTRAINT `joke_ibfk_1` FOREIGN KEY (`authorid`) REFERENCES `author` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
