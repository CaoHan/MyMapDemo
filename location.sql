-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: 2016-07-07 10:09:13
-- 服务器版本： 5.5.42
-- PHP Version: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `location`
--
CREATE DATABASE IF NOT EXISTS `location` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `location`;

-- --------------------------------------------------------

--
-- 表的结构 `userLoc`
--

CREATE TABLE `userLoc` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_latitude` varchar(100) NOT NULL,
  `user_longitude` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `userLoc`
--

INSERT INTO `userLoc` (`user_id`, `user_name`, `user_latitude`, `user_longitude`) VALUES
(1, 'user1', '29.6958', '121.2833'),
(2, 'user2', '32.8000', '121.5500');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `userLoc`
--
ALTER TABLE `userLoc`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `userLoc`
--
ALTER TABLE `userLoc`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
