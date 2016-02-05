-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 05, 2016 at 06:39 PM
-- Server version: 5.5.46-0ubuntu0.14.04.2
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `itians`
--

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE IF NOT EXISTS `branch` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `no_track` int(10) NOT NULL,
  `no_stud` int(10) NOT NULL,
  `no_stuff` int(10) NOT NULL,
  `head_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `head_id` (`head_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `no_track`, `no_stud`, `no_stuff`, `head_id`) VALUES
(2, 'Mansoura', 3, 110, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE IF NOT EXISTS `lab` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `lab_num` int(11) NOT NULL,
  `max_no_stud` int(11) NOT NULL,
  `no_stud` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `track_id` (`track_id`,`branch_id`,`sup_id`),
  KEY `sup_id` (`sup_id`),
  KEY `branch_id` (`branch_id`),
  KEY `track_id_2` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `mail` varchar(80) COLLATE utf8_bin NOT NULL,
  `gender` varchar(20) COLLATE utf8_bin NOT NULL,
  `pic` varchar(150) COLLATE utf8_bin NOT NULL,
  `bod` date NOT NULL,
  `collage` varchar(50) COLLATE utf8_bin NOT NULL,
  `grades` float NOT NULL,
  `grad_year` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`,`track_id`),
  KEY `track_id` (`track_id`),
  KEY `branch_id_2` (`branch_id`),
  KEY `branch_id_3` (`branch_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `mail`, `gender`, `pic`, `bod`, `collage`, `grades`, `grad_year`, `branch_id`, `track_id`, `status`) VALUES
(2, 'ahmed salama', 'ahmed.salama1679@gmail.com', 'male', 'profilepic/1.jpg', '2016-02-02', 'science', 78, 2011, 2, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `sup_id` int(11) NOT NULL,
  `no_course` int(11) NOT NULL,
  `no_stud` int(11) NOT NULL,
  `leader_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sup_id` (`sup_id`,`leader_id`),
  KEY `leader_id` (`leader_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Dumping data for table `track`
--

INSERT INTO `track` (`id`, `name`, `sup_id`, `no_course`, `no_stud`, `leader_id`) VALUES
(3, 'SD', 3, 48, 55, 7),
(4, 'OS', 5, 49, 30, 8),
(5, 'EL', 9, 48, 25, 9);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  `mail` int(11) NOT NULL,
  `gender` varchar(20) COLLATE utf8_bin NOT NULL,
  `pic` varchar(150) COLLATE utf8_bin NOT NULL,
  `bod` date NOT NULL,
  `collage` varchar(50) COLLATE utf8_bin NOT NULL,
  `grades` float NOT NULL,
  `grad_year` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `lab_id` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `stuff` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `branch_id` (`branch_id`,`track_id`),
  KEY `lab_id` (`lab_id`),
  KEY `branch_id_2` (`branch_id`),
  KEY `track_id` (`track_id`),
  KEY `lab_id_2` (`lab_id`),
  KEY `track_id_2` (`track_id`),
  KEY `lab_id_3` (`lab_id`),
  KEY `branch_id_3` (`branch_id`),
  KEY `track_id_3` (`track_id`),
  KEY `lab_id_4` (`lab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `lab_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_ibfk_2` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lab_ibfk_3` FOREIGN KEY (`sup_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`track_id`) REFERENCES `track` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_3` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
