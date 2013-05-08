-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 23, 2013 at 07:28 PM
-- Server version: 5.5.24-log
-- PHP Version: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sb-swipe`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `CRN` varchar(5) NOT NULL COMMENT 'The course''s CRN',
  `meetingID` int(11) NOT NULL COMMENT 'FK to MEETING',
  `courseID` varchar(10) NOT NULL COMMENT 'FK to COURSE',
  `semesterID` varchar(5) NOT NULL COMMENT 'FK to SEMESTER',
  `professor` varchar(20) NOT NULL COMMENT 'Professor teaching this class',
  PRIMARY KEY (`CRN`),
  KEY `meetingID` (`meetingID`),
  KEY `semesterID` (`semesterID`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`CRN`, `meetingID`, `courseID`, `semesterID`, `professor`) VALUES
('10044', 7, 'CS150', 's2013', 'Ahmed'),
('10045', 15, 'CS150', 's2013', 'Ahmed'),
('10046', 21, 'CS150', 's2013', 'Ahmed'),
('10047', 4, 'CS180', 's2013', 'Robertson'),
('10048', 16, 'CS180', 's2013', 'Robertson'),
('10049', 23, 'CS180', 's2013', 'Babaian'),
('10050', 8, 'CS213', 's2013', 'Pepe'),
('10051', 11, 'CS213', 's2013', 'Pepe'),
('10052', 6, 'CS240', 's2013', 'Wong'),
('10053', 14, 'CS280', 's2013', 'Babaian'),
('10054', 2, 'CS350', 's2013', 'Topi'),
('10055', 22, 'CS350', 's2013', 'Topi'),
('10056', 9, 'CS360', 's2013', 'Xu'),
('10057', 13, 'CS360', 's2013', 'Xu'),
('10058', 20, 'CS460', 's2013', 'Wong'),
('10059', 12, 'CS480', 's2013', 'Pepe'),
('10060', 4, 'IT101', 's2013', 'Wong'),
('10061', 5, 'IT101', 's2013', 'VanderClock'),
('10062', 8, 'IT101', 's2013', 'Schiano'),
('10063', 9, 'IT101', 's2013', 'Wong'),
('10064', 3, 'IT101', 's2013', 'Macarty'),
('10065', 11, 'IT101', 's2013', 'VanderClock'),
('10066', 13, 'IT101', 's2013', 'VanderClock'),
('10067', 14, 'IT101', 's2013', 'Ahmed'),
('10068', 21, 'IT101', 's2013', 'Shah'),
('10069', 7, 'IT101', 's2013', 'Frydenberg'),
('10070', 6, 'IT101', 's2013', 'VanderClock'),
('10071', 15, 'IT101', 's2013', 'Frydenberg'),
('10949', 12, 'CS402', 's2013', 'Robertson');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE IF NOT EXISTS `course` (
  `courseID` varchar(7) NOT NULL COMMENT 'course code NO SPACES (e.g. IT101)',
  `desc` varchar(140) DEFAULT 'There is no description for this course' COMMENT 'description of the course',
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`courseID`, `desc`) VALUES
('CS150', 'Introduction to Data and Info. Management'),
('CS180', 'Programming Fundamentals'),
('CS213', 'The World Wide Web'),
('CS240', 'Business Processing and Communications Infrastructure'),
('CS280', 'Object-Oriented Application Development'),
('CS314', 'Web Technologies and Trends'),
('CS350', 'Database Management Systems'),
('CS360', 'Business Systems Analysis and Modeling'),
('CS401', 'Directed Study in Computer Systems'),
('CS402', 'Advanced Computing Topics Seminar'),
('CS420', 'Operating Systems Use, Technology, and Administration'),
('CS421', 'Internship in Computer Systems'),
('CS440', 'Advanced Net-Centric Computing'),
('CS460', 'Applied Software Management'),
('CS476', 'E-Business Infrastructure and Policy'),
('CS480', 'Advanced Application Development Technology'),
('IT101', 'Introduction to Information Technology');

-- --------------------------------------------------------

--
-- Table structure for table `day`
--

CREATE TABLE IF NOT EXISTS `day` (
  `DayID` int(11) NOT NULL COMMENT '0 as Monday, 6 as Sunday',
  `dayName` varchar(9) NOT NULL,
  PRIMARY KEY (`DayID`),
  UNIQUE KEY `dayName` (`dayName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `day`
--

INSERT INTO `day` (`DayID`, `dayName`) VALUES
(4, 'Friday'),
(0, 'Monday'),
(5, 'Saturday'),
(6, 'Sunday'),
(3, 'Thursday'),
(1, 'Tuesday'),
(2, 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `meeting_time`
--

CREATE TABLE IF NOT EXISTS `meeting_time` (
  `meetingID` int(11) NOT NULL COMMENT 'PK',
  `block` varchar(20) NOT NULL COMMENT 'Meeting times as string (e.g. TR 2:10)',
  PRIMARY KEY (`meetingID`),
  UNIQUE KEY `block` (`block`),
  KEY `block_2` (`block`),
  KEY `block_3` (`block`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meeting_time`
--

INSERT INTO `meeting_time` (`meetingID`, `block`) VALUES
(20, 'M 6:30'),
(6, 'M 9:55 R 11:20'),
(9, 'MR 12:45'),
(7, 'MW 11:20'),
(13, 'MW 3:35'),
(15, 'MW 5:00'),
(23, 'R 6:30'),
(21, 'T 6:30'),
(8, 'TF 11:20'),
(10, 'TF 12:45'),
(12, 'TR 2:10'),
(14, 'TR 3:35'),
(16, 'TR 5:00'),
(2, 'TR 8:30'),
(4, 'TR 9:55'),
(22, 'W 6:30'),
(11, 'WF 2:10'),
(3, 'WF 8:30'),
(5, 'WF 9:55');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE IF NOT EXISTS `room` (
  `roomID` varchar(8) NOT NULL COMMENT 'room name (SMI 234)',
  `roomName` varchar(20) NOT NULL COMMENT 'desc (CIS Sandbox)',
  PRIMARY KEY (`roomID`),
  UNIQUE KEY `roomName` (`roomName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomID`, `roomName`) VALUES
('SMI 212', 'CIS Quiet Study Room'),
('SMI 234', 'CIS Sandbox');

-- --------------------------------------------------------

--
-- Table structure for table `semester`
--

CREATE TABLE IF NOT EXISTS `semester` (
  `semesterID` varchar(5) NOT NULL COMMENT 'PK syyyy where s = {s,S,f} and yyyy is the year (e.g. s2013 = spring 2013)',
  `semesterCode` varchar(20) NOT NULL COMMENT 'String representation of the ID',
  PRIMARY KEY (`semesterID`),
  UNIQUE KEY `semesterCode` (`semesterCode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `semester`
--

INSERT INTO `semester` (`semesterID`, `semesterCode`) VALUES
('s2013', 'Spring 2013');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `studentID` varchar(8) NOT NULL COMMENT 'bentley ID without the ''@''',
  `firstName` varchar(20) NOT NULL COMMENT 'student''s first name',
  `lastName` varchar(20) DEFAULT NULL COMMENT 'student''s last name',
  `classCode` int(11) DEFAULT NULL COMMENT 'student''s class code',
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studentID`, `firstName`, `lastName`, `classCode`) VALUES
('03157556', 'Sam', 'Diament', NULL),
('03168669', 'Hailin', 'Kong', NULL),
('03177203', 'Katie', 'Lieb', NULL),
('03196224', 'Kunal', 'Deopare', NULL),
('03199353', 'Jiayn', 'Han', NULL),
('03205196', 'Brendan', 'Bourdeau', NULL),
('03224844', 'Conner', 'Charlebois', NULL),
('03226178', 'Dmitry', 'Veber', NULL),
('03236228', 'Nick', 'Hentschel', NULL),
('03268457', 'Anantakumar', 'Krishnakumar', NULL),
('03282702', 'Alican', 'Tanatmis', NULL),
('03320567', 'Menghan', 'Zhang', NULL),
('03352010', 'Vinay', 'Vijayan', NULL),
('12345678', 'Nick', 'Hentschel', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tutor`
--

CREATE TABLE IF NOT EXISTS `tutor` (
  `tutorID` varchar(8) NOT NULL COMMENT 'tutor ID',
  `studentID` varchar(8) NOT NULL COMMENT 'student ID',
  `imgPath` varchar(255) DEFAULT NULL COMMENT 'img name in the assets folder',
  PRIMARY KEY (`tutorID`),
  UNIQUE KEY `studentID` (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutor`
--

INSERT INTO `tutor` (`tutorID`, `studentID`, `imgPath`) VALUES
(':)', '03199353', NULL),
('Alican', '03282702', NULL),
('Anu', '03268457', NULL),
('BigChees', '03226178', NULL),
('Cats<3', '03177203', NULL),
('H3RM3Z', '03224844', NULL),
('kong_hai', '03168669', NULL),
('kunald', '03196224', NULL),
('M3RCURY', '03236228', NULL),
('Mavis', '03320567', NULL),
('Rhyptic', '03205196', NULL),
('VV', '03352010', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tutored_visit`
--

CREATE TABLE IF NOT EXISTS `tutored_visit` (
  `tutoredVisitID` int(11) NOT NULL,
  `tutorID` varchar(8) NOT NULL COMMENT 'FK to tutor',
  `timeTutored` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT 'time the tutor form was submitted',
  `classTutored` varchar(5) DEFAULT NULL COMMENT 'FK to CLASS (Course and Timeblock)',
  `notes` text COMMENT 'tutor''s comments ',
  PRIMARY KEY (`tutoredVisitID`),
  KEY `tutorID` (`tutorID`),
  KEY `classTutored` (`classTutored`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutored_visit`
--

INSERT INTO `tutored_visit` (`tutoredVisitID`, `tutorID`, `timeTutored`, `classTutored`, `notes`) VALUES
(25, 'H3RM3Z', '2013-03-27 02:00:02', '10057', 'this is a tutor form test'),
(30, 'BigChees', '2013-03-27 03:19:47', '10058', 'still a place to enter notes. weeew.'),
(32, 'kong_hai', '2013-03-29 01:40:40', '10060', 'htsvdfgf'),
(39, 'kong_hai', '2013-03-29 01:58:45', '10044', 'derp'),
(45, 'H3RM3Z', '2013-03-29 03:11:05', '10064', 'Hello!'),
(48, 'kong_hai', '2013-03-29 03:19:56', '10051', 'asdfsadf'),
(49, 'Rhyptic', '2013-03-29 04:28:46', '10067', 'blah blah blah'),
(51, 'H3RM3Z', '2013-03-29 05:54:44', '10044', 'what I did.'),
(53, 'H3RM3Z', '2013-04-02 20:22:35', '10059', 'I helped with web stuffs'),
(57, 'H3RM3Z', '2013-04-11 17:18:47', '10059', 'During our demo :)');

-- --------------------------------------------------------

--
-- Table structure for table `tutor_ability`
--

CREATE TABLE IF NOT EXISTS `tutor_ability` (
  `abilityID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'internal',
  `tutorID` varchar(8) NOT NULL COMMENT 'FK to TUTOR',
  `courseID` varchar(7) NOT NULL COMMENT 'FK to COURSE',
  PRIMARY KEY (`abilityID`),
  KEY `tutorID` (`tutorID`,`courseID`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `tutor_ability`
--

INSERT INTO `tutor_ability` (`abilityID`, `tutorID`, `courseID`) VALUES
(11, 'H3RM3Z', 'CS150'),
(12, 'H3RM3Z', 'CS180'),
(13, 'H3RM3Z', 'CS213'),
(10, 'H3RM3Z', 'IT101');

-- --------------------------------------------------------

--
-- Table structure for table `visit`
--

CREATE TABLE IF NOT EXISTS `visit` (
  `visitID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'internal',
  `roomID` varchar(8) NOT NULL COMMENT 'FK to ROOM',
  `studentID` varchar(8) NOT NULL COMMENT 'FK to STUDENT',
  `courseID` varchar(7) DEFAULT NULL COMMENT 'FK to COURSE',
  `timeIn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timeOut` timestamp NULL DEFAULT NULL,
  `needHelp` tinyint(1) NOT NULL COMMENT 'Did the student indicate that they need help?',
  PRIMARY KEY (`visitID`),
  KEY `roomID` (`roomID`,`studentID`),
  KEY `studentID` (`studentID`),
  KEY `courseID` (`courseID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=63 ;

--
-- Dumping data for table `visit`
--

INSERT INTO `visit` (`visitID`, `roomID`, `studentID`, `courseID`, `timeIn`, `timeOut`, `needHelp`) VALUES
(24, 'SMI 234', '03199353', 'CS401', '2013-03-27 01:57:40', '2013-03-27 02:05:13', 1),
(25, 'SMI 234', '12345678', 'CS360', '2013-03-27 01:58:50', '2013-03-27 02:00:15', 1),
(26, 'SMI 234', '03224844', NULL, '2013-03-27 02:03:47', '2013-03-27 02:03:58', 0),
(27, 'SMI 234', '03224844', NULL, '2013-03-27 02:04:05', '2013-03-27 02:04:09', 0),
(28, 'SMI 234', '03224844', NULL, '2013-03-27 02:11:31', '2013-03-27 02:11:36', 0),
(29, 'SMI 234', '03224844', NULL, '2013-03-27 03:12:41', '2013-03-27 03:13:51', 0),
(30, 'SMI 234', '03224844', 'CS460', '2013-03-27 03:15:04', '2013-03-27 03:20:40', 1),
(31, 'SMI 234', '12345678', NULL, '2013-03-27 03:15:47', '2013-03-27 03:20:41', 0),
(32, 'SMI 234', '03224844', 'IT101', '2013-03-29 01:39:39', '2013-03-29 01:40:51', 1),
(34, 'SMI 234', '03224844', NULL, '2013-03-29 01:40:57', '2013-03-29 01:41:02', 0),
(35, 'SMI 234', '03224844', NULL, '2013-03-29 01:43:19', '2013-03-29 01:43:24', 0),
(36, 'SMI 234', '12345678', NULL, '2013-03-29 01:46:55', '2013-03-29 01:47:01', 0),
(37, 'SMI 234', '12345678', NULL, '2013-03-29 01:48:10', '2013-03-29 01:48:15', 0),
(38, 'SMI 234', '12345678', 'IT101', '2013-03-29 01:55:22', '2013-03-29 01:55:30', 1),
(39, 'SMI 234', '12345678', 'CS150', '2013-03-29 01:58:32', '2013-03-29 01:58:49', 1),
(40, 'SMI 234', '03224844', NULL, '2013-03-29 01:59:46', '2013-03-29 02:00:15', 0),
(41, 'SMI 234', '12345678', NULL, '2013-03-29 03:00:30', '2013-03-29 03:02:09', 0),
(42, 'SMI 234', '12345678', NULL, '2013-03-29 03:03:24', '2013-03-29 03:03:28', 0),
(43, 'SMI 234', '03224844', NULL, '2013-03-29 03:03:41', '2013-03-29 03:04:05', 0),
(44, 'SMI 234', '03224844', NULL, '2013-03-29 03:05:20', '2013-03-29 03:08:12', 0),
(45, 'SMI 234', '12345678', 'IT101', '2013-03-29 03:10:30', '2013-03-29 03:11:10', 1),
(46, 'SMI 234', '12345678', 'CS213', '2013-03-29 03:17:24', '2013-03-29 03:17:53', 1),
(47, 'SMI 234', '12345678', NULL, '2013-03-29 03:19:09', '2013-03-29 03:19:15', 0),
(48, 'SMI 234', '12345678', 'CS213', '2013-03-29 03:19:28', '2013-03-29 03:20:17', 1),
(49, 'SMI 234', '12345678', 'IT101', '2013-03-29 04:21:29', '2013-03-29 04:28:53', 1),
(50, 'SMI 234', '03157556', NULL, '2013-03-29 04:24:20', '2013-03-29 04:28:00', 0),
(51, 'SMI 234', '12345678', 'CS150', '2013-03-29 05:54:10', '2013-04-02 20:13:33', 1),
(52, 'SMI 234', '12345678', NULL, '2013-04-02 20:13:44', '2013-04-02 20:14:12', 0),
(53, 'SMI 234', '12345678', 'CS480', '2013-04-02 20:20:19', '2013-04-02 20:22:45', 1),
(54, 'SMI 234', '12345678', 'IT101', '2013-04-02 20:22:57', '2013-04-02 20:23:05', 1),
(55, 'SMI 234', '12345678', NULL, '2013-04-02 20:23:16', '2013-04-02 20:33:20', 0),
(56, 'SMI 234', '12345678', 'IT101', '2013-04-02 21:04:26', '2013-04-11 17:05:29', 1),
(57, 'SMI 234', '12345678', 'CS480', '2013-04-11 17:11:01', '2013-04-11 17:18:57', 1),
(58, 'SMI 234', '03224844', NULL, '2013-04-11 17:22:19', '2013-04-11 17:22:37', 0),
(59, 'SMI 234', '03224844', NULL, '2013-04-11 17:25:05', '2013-04-11 17:25:09', 0),
(60, 'SMI 234', '03224844', NULL, '2013-04-11 17:54:21', '2013-04-11 17:54:26', 0),
(61, 'SMI 234', '12345678', 'CS150', '2013-04-11 17:57:23', '2013-04-11 17:57:51', 1),
(62, 'SMI 234', '12345678', 'IT101', '2013-04-11 17:58:18', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `work_visit`
--

CREATE TABLE IF NOT EXISTS `work_visit` (
  `workID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'FK to VISIT',
  `dayID` int(11) NOT NULL COMMENT 'FK to DAY',
  `tutorID` varchar(8) NOT NULL COMMENT 'FK to tutor',
  `startTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `endTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`workID`),
  KEY `dayID` (`dayID`,`tutorID`),
  KEY `tutorID` (`tutorID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `work_visit`
--

INSERT INTO `work_visit` (`workID`, `dayID`, `tutorID`, `startTime`, `endTime`) VALUES
(11, 3, 'H3RM3Z', '2013-03-28 23:20:12', '0000-00-00 00:00:00'),
(12, 4, 'H3RM3Z', '2013-03-29 00:12:15', '0000-00-00 00:00:00'),
(14, 4, 'H3RM3Z', '2013-03-29 00:22:32', '0000-00-00 00:00:00'),
(15, 4, 'H3RM3Z', '2013-03-29 01:54:17', '0000-00-00 00:00:00'),
(16, 1, 'H3RM3Z', '2013-04-02 20:24:23', '0000-00-00 00:00:00'),
(17, 3, 'H3RM3Z', '2013-04-11 17:20:12', '0000-00-00 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`meetingID`) REFERENCES `meeting_time` (`meetingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`semesterID`) REFERENCES `semester` (`semesterID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_ibfk_3` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tutor`
--
ALTER TABLE `tutor`
  ADD CONSTRAINT `tutor_ibfk_1` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tutored_visit`
--
ALTER TABLE `tutored_visit`
  ADD CONSTRAINT `tutored_visit_ibfk_1` FOREIGN KEY (`tutoredVisitID`) REFERENCES `visit` (`visitID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutored_visit_ibfk_2` FOREIGN KEY (`tutorID`) REFERENCES `tutor` (`tutorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutored_visit_ibfk_3` FOREIGN KEY (`classTutored`) REFERENCES `class` (`CRN`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tutor_ability`
--
ALTER TABLE `tutor_ability`
  ADD CONSTRAINT `tutor_ability_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tutor_ability_ibfk_2` FOREIGN KEY (`tutorID`) REFERENCES `tutor` (`tutorID`);

--
-- Constraints for table `visit`
--
ALTER TABLE `visit`
  ADD CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`roomID`) REFERENCES `room` (`roomID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`studentID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `visit_ibfk_3` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `work_visit`
--
ALTER TABLE `work_visit`
  ADD CONSTRAINT `work_visit_ibfk_1` FOREIGN KEY (`tutorID`) REFERENCES `tutor` (`tutorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `work_visit_ibfk_2` FOREIGN KEY (`dayID`) REFERENCES `day` (`DayID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;