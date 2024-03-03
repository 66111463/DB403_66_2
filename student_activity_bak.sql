-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db403-mysql
-- Generation Time: Mar 03, 2024 at 10:43 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student_activity`
--
CREATE DATABASE IF NOT EXISTS `student_activity` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `student_activity`;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `semester` tinyint NOT NULL,
  `edu_year` int NOT NULL,
  `cat_id` char(2) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `seats` int DEFAULT '50',
  `edited_by` char(6) NOT NULL,
  `edited_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `activities`
--

INSERT INTO `activities` (`id`, `name`, `semester`, `edu_year`, `cat_id`, `start`, `end`, `seats`, `edited_by`, `edited_on`) VALUES
(22, 'ลอยกระทง', 2, 2567, 'CL', '2024-11-27 17:00:00', '2024-11-27 22:00:00', 60, '000001', '2024-03-03 04:12:13'),
(23, 'แข่งขันลงทุน', 2, 2567, 'ED', '2024-04-01 09:00:00', '2024-04-01 16:00:00', 40, '000001', '2024-03-03 04:12:13'),
(24, 'ค่ายอาสา', 2, 2567, 'LS', '2024-06-10 09:00:00', '2024-06-13 17:00:00', 20, '000001', '2024-03-03 04:12:13');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` char(2) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
('CL', 'ศิลปะและวัฒนธรรม'),
('ED', 'วิชาการ'),
('EN', 'สันทนาการ'),
('LS', 'ไลฟ์สไตล์');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` char(2) NOT NULL,
  `name` varchar(100) NOT NULL,
  `fac_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `fac_id`) VALUES
('AC', 'นวัตกรรมการบัญชี', 4),
('BI', 'ธุรกิจนวัตนกรรม', 4),
('IS', 'ระบบสารสนเทศเพื่อธุรกิจดิจิทัล', 4);

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `stu_id` char(8) NOT NULL,
  `act_id` int NOT NULL,
  `enroll_on` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0',
  `approved_by` char(6) DEFAULT NULL,
  `approved_on` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`id`, `name`) VALUES
(1, 'CIBA'),
(2, 'CITE'),
(3, 'ANT'),
(4, 'IC');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` char(6) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `fullname`, `email`, `pic`, `password`) VALUES
('000001', 'มงคล สมรส', 'devil.t605@gmail.com', NULL, '$2y$10$tbGLLTpMUUIJ0vwwHt3fB.vvVTTNjz1AQf0bGnml2CNfvPy/Y/gSi');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` char(8) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(128) NOT NULL,
  `dep_id` char(2) NOT NULL,
  `pic` varchar(128) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `fullname`, `email`, `dep_id`, `pic`, `password`) VALUES
('66111463', 'วีรชัย สว่างโคกกรวด', '66111463@dpu.ac.th', 'IS', NULL, '$2y$10$AW7U39YJons7sIV4wNxUPOAS7RSi35YqrugbRksqvasv7ej9x2NHK'),
('66112233', 'ตะวัน ยอแสง', '66112233@dpu.ac.th', 'AC', NULL, '$2y$10$8MULRToKcIAByXCEI2mEwuS240TxBJ4cWLPUtwKkKuiTSMQ6QC3W6');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `edited_by` (`edited_by`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fac_id` (`fac_id`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`stu_id`,`act_id`),
  ADD KEY `act_id` (`act_id`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `dep_id` (`dep_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `activities_ibfk_2` FOREIGN KEY (`edited_by`) REFERENCES `staff` (`id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`fac_id`) REFERENCES `faculties` (`id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `enrollments_ibfk_1` FOREIGN KEY (`stu_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_2` FOREIGN KEY (`act_id`) REFERENCES `activities` (`id`),
  ADD CONSTRAINT `enrollments_ibfk_3` FOREIGN KEY (`approved_by`) REFERENCES `staff` (`id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
