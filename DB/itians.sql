-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 02, 2016 at 01:49 PM
-- Server version: 5.6.27-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

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
`id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `no_track` int(10) NOT NULL,
  `no_stud` int(10) NOT NULL,
  `no_stuff` int(10) NOT NULL,
  `head_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE IF NOT EXISTS `lab` (
`id` int(10) NOT NULL,
  `lab_num` int(11) NOT NULL,
  `max_no_stud` int(11) NOT NULL,
  `no_stud` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
`id` int(10) NOT NULL,
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
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `track`
--

CREATE TABLE IF NOT EXISTS `track` (
`id` int(10) NOT NULL,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `sup_id` int(11) NOT NULL,
  `no_course` int(11) NOT NULL,
  `no_stud` int(11) NOT NULL,
  `leader_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`id` int(10) NOT NULL,
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
  `stuff` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `head_id` (`head_id`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
 ADD PRIMARY KEY (`id`), ADD KEY `track_id` (`track_id`,`branch_id`,`sup_id`), ADD KEY `sup_id` (`sup_id`), ADD KEY `branch_id` (`branch_id`), ADD KEY `track_id_2` (`track_id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
 ADD PRIMARY KEY (`id`), ADD KEY `branch_id` (`branch_id`,`track_id`), ADD KEY `track_id` (`track_id`), ADD KEY `branch_id_2` (`branch_id`), ADD KEY `branch_id_3` (`branch_id`);

--
-- Indexes for table `track`
--
ALTER TABLE `track`
 ADD PRIMARY KEY (`id`), ADD KEY `sup_id` (`sup_id`,`leader_id`), ADD KEY `leader_id` (`leader_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`id`), ADD KEY `branch_id` (`branch_id`,`track_id`), ADD KEY `lab_id` (`lab_id`), ADD KEY `branch_id_2` (`branch_id`), ADD KEY `track_id` (`track_id`), ADD KEY `lab_id_2` (`lab_id`), ADD KEY `track_id_2` (`track_id`), ADD KEY `lab_id_3` (`lab_id`), ADD KEY `branch_id_3` (`branch_id`), ADD KEY `track_id_3` (`track_id`), ADD KEY `lab_id_4` (`lab_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `track`
--
ALTER TABLE `track`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
ADD CONSTRAINT `branch_ibfk_1` FOREIGN KEY (`head_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Constraints for table `track`
--
ALTER TABLE `track`
ADD CONSTRAINT `track_ibfk_1` FOREIGN KEY (`sup_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `track_ibfk_2` FOREIGN KEY (`leader_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
