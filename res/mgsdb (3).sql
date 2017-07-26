-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 21, 2017 at 05:49 PM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mgsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `Room`
--

CREATE TABLE `Room` (
  `roomId` int(4) NOT NULL,
  `roomName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `roomCode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `floor` int(3) DEFAULT NULL,
  `building` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isAvailable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Storing Room Informations';

--
-- Dumping data for table `Room`
--

INSERT INTO `Room` (`roomId`, `roomName`, `roomCode`, `description`, `floor`, `building`, `isAvailable`) VALUES
(1, 'Computer Science Common 1', 'CB2302', 'CS Student\'s Central.', 3, 'CB', 1),
(2, 'IT Meeting Central', 'CB2301', 'Study, Metting Purpose', 3, 'CB', 1),
(3, 'CS Common Meeting Room', 'CB2303', 'Play, Metting Purpose', 3, 'CB', 1),
(4, 'Small Lecture Room', 'CB2304', 'Studying Purpose', 3, 'CB', 1),
(5, 'Small Lecture Room II', 'CB2305', 'Studying Purpose', 3, 'CB', 1),
(6, 'Lecture Room I', 'CB2306', 'Studying, Neteting Purpose', 3, 'CB', 1),
(13, 'ห้องจำรัสพงศ์', NULL, 'เพื่อการประชุมและบวงสรวงพิธี', 2, 'CB', 1),
(16, 'Small Lecture Room III', NULL, 'For the Subject Exam and Study time', 3, 'CB', 1);

-- --------------------------------------------------------

--
-- Table structure for table `RoomFacilitiy`
--

CREATE TABLE `RoomFacilitiy` (
  `roomFacilityId` int(4) NOT NULL,
  `facility` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDevice` tinyint(1) NOT NULL,
  `quantity` int(5) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Storing the Facility''s Things';

--
-- Dumping data for table `RoomFacilitiy`
--

INSERT INTO `RoomFacilitiy` (`roomFacilityId`, `facility`, `description`, `isDevice`, `quantity`) VALUES
(1, 'Projector (3LCD)', 'ขนาดตัวเครื่องเท่ากระดาษ A4 พกพาสะดวกมากมาย\r\n3LCD Panel 0.63"', 1, 5),
(2, 'ปากกาดิจิตอล', 'สำหรับใช้งานร่วมกับไวท์บอร์ดดิจิตอล', 1, 3),
(11, 'Flipchart', 'stationery item consisting of a pad of large  10 paper sheets per one', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `RoomFacilitiyUsage`
--

CREATE TABLE `RoomFacilitiyUsage` (
  `roomUsageId` int(8) NOT NULL,
  `roomFacilityId` int(4) NOT NULL,
  `accessedQuantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `RoomFacilitiyUsage`
--

INSERT INTO `RoomFacilitiyUsage` (`roomUsageId`, `roomFacilityId`, `accessedQuantity`) VALUES
(47, 1, 1),
(47, 2, 3),
(48, 1, 1),
(48, 2, 1),
(49, 1, 1),
(49, 2, 1),
(49, 11, 3),
(58, 1, 1),
(58, 2, 1),
(58, 11, 0),
(57, 1, 1),
(57, 11, 3),
(50, 1, 7),
(50, 2, 9);

-- --------------------------------------------------------

--
-- Table structure for table `RoomUsage`
--

CREATE TABLE `RoomUsage` (
  `usageId` int(8) NOT NULL,
  `roomId` int(4) NOT NULL,
  `byStaffId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `purpose` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reservedDate` date NOT NULL,
  `accessBegin` time NOT NULL,
  `accessUntil` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keep Staff''s Room Usage';

--
-- Dumping data for table `RoomUsage`
--

INSERT INTO `RoomUsage` (`usageId`, `roomId`, `byStaffId`, `purpose`, `note`, `reservedDate`, `accessBegin`, `accessUntil`) VALUES
(1, 13, 'M00000', 'FLU Sprint Review and Meeting   ', 'There are many guesses this Event, So Please bring some Drinking water and Sweet.', '2017-07-08', '13:00:00', '14:00:00'),
(3, 13, 'M00000', 'Wingy\'s Software Discussion', 'Exclude the Facilities, I need more 2 Chairs in the Room, Thank you.', '2017-07-15', '15:00:00', '16:00:00'),
(4, 1, 'M00000', 'System M Project\'s Meeting', '', '2017-07-15', '13:00:00', '16:00:00'),
(5, 1, 'M00000', 'Marketing Annual Meeting', '', '2017-07-14', '08:00:00', '09:00:00'),
(6, 2, 'M00000', 'Previously Reservation Dummy', 'Please take care of the facilities I have booked, It\'s necessary on this Event.', '2017-07-07', '14:00:00', '16:00:00'),
(21, 16, 'M00000', 'Interview Junior Programmer', '2 laptops are required in the day, please bring these stuff for some.', '2017-07-29', '15:00:00', '17:00:00'),
(26, 16, 'M00000', 'SIT Hackathon Team Meeting', '', '2017-07-21', '16:00:00', '17:00:00'),
(29, 5, 'M00000', 'Angular MVC Traning', 'nope', '2017-07-26', '11:00:00', '17:00:00'),
(30, 1, 'M00000', 'Woody Apps Metting', '', '2017-07-14', '10:00:00', '13:00:00'),
(47, 1, 'M00000', 'Facilities Checking', '', '2017-07-13', '10:00:00', '11:00:00'),
(48, 5, 'M00000', 'Project O Sprint Meeting', '', '2017-07-14', '08:00:00', '11:00:00'),
(49, 13, 'M00000', 'Java Automation Unit Test Training ', '', '2017-07-22', '08:00:00', '11:00:00'),
(50, 16, 'M00000', 'Dream Catcher App Discussion', '', '2017-07-17', '08:00:00', '09:00:00'),
(53, 16, 'M00000', 'Jetbrain\'s Kotlin Tutorial (Edit Data)', '', '2017-07-20', '08:00:00', '09:00:00'),
(55, 1, 'M00000', 'Apache Solr Training', '', '2017-07-27', '08:00:00', '09:00:00'),
(56, 1, 'M00000', 'MEAN Stack Tutorial', '', '2017-07-21', '08:00:00', '09:00:00'),
(57, 1, 'M00000', 'Visual Studio IDE Review', '', '2017-07-21', '11:00:00', '12:00:00'),
(58, 1, 'M00000', 'Asynchronous Javascript & XML Technology Review', 'Please set the Project up for us in the room, best regards.', '2017-07-21', '16:00:00', '17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Staff`
--

CREATE TABLE `Staff` (
  `staffId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `honorific` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `nameLocale` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobileTel` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `division` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `protraitPath` text COLLATE utf8_unicode_ci,
  `hostManagerId` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staffType` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `startWorkingDate` date DEFAULT NULL,
  `birthDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Staff`
--

INSERT INTO `Staff` (`staffId`, `honorific`, `name`, `nameLocale`, `email`, `tel`, `mobileTel`, `division`, `position`, `protraitPath`, `hostManagerId`, `staffType`, `startWorkingDate`, `birthDate`) VALUES
('M00000', 'Mrs', 'Natta-ya Kitti', 'ณัฐตญา กิตติ', 'nudee.s@magicsoftware.co.th', '0223611111', '0845708980', 'Project Management Services Unit', 'Programmer', NULL, NULL, 's', '1990-02-13', '1990-02-13'),
('M32001', 'Mr', 'Udorn DuangNgoen', 'อุดร ดวงเงิน', 'udorn@magicsoftware.co.th', '9119888(601)', '0818232673', 'Technology & Support Services Unit', 'Director', '2017071120983848udorn.png', 'M57008', 'm', '1989-11-01', '1968-03-27'),
('M40001', 'Mrs', 'Sukanya Lerdtomornsakul', 'สุกัญญา เลิศโตมรสกุล', 'sukanya@magicsoftware.co.th', '9119888(201)', '0838948438', 'Finance & Administration', 'Director', '2017071106219397Sukanya_1.png', NULL, 's', '1997-01-01', '2017-07-11'),
('M47001', 'Mr', 'Bunrak Saraggananda', 'บุญรักษ์ สรัคคานนท์', 'bunrak@magicsoftware.co.th', '9119888(101)', '0818497393', 'Finance & Administration', 'Chairman & CEO', '2017071145456688bunrak.png', NULL, 'm', '2004-01-01', '1982-01-01'),
('M54004', 'Mr', 'Nabun Saraggananda', 'นาบุญ สรัคคานนท์', 'nabun@magicsoftware.co.th', '9119888(601)', '0866267806', 'Professional Services', 'Assistant CEO & PS. Manager', '2017071114122621Nabun_2.png', 'M47001', 'm', '2011-09-01', '1988-05-14'),
('M57008', 'Mr', 'Boonchuay Sanguanvorapong', 'บุญช่วย สงวนวงพงศ์', 'boonchuay@magicsoftware.co.th', '9119888(102)', '0898974707', 'Finance & Administration', 'Chief Operating Officer', '2017071159104335Image_436a250.jpg', 'M47001', 'm', '2014-07-01', '1996-04-20'),
('M59010', 'Mr', 'Damrongsak Tassamala', 'ดำรงศักดิ์ ทัศมาลา', 'damrongsak.t@magicsoftware.co.th', '9119888(303)', '0868902080', 'Project Management Services Unit', 'Director', '2017071150484681Damrongsak_1.png', 'M57008', 'm', '2016-11-21', '1968-07-11'),
('M60009', 'Mr', 'Takneekar  Saengsuwan', 'ทักนีการ์ แสงสุวรรณ', 'takneekar.s@magicsoftware.co.th', '029119877', '0894824846', 'Project Management Services Unit 11', 'Business Analyst Specialist', '2017071106072275Takneekar.jpg', 'M59010', 's', '1991-08-07', '1991-08-07');

-- --------------------------------------------------------

--
-- Table structure for table `StaffAccess`
--

CREATE TABLE `StaffAccess` (
  `staffId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stffpsRole` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Staff Profile System Role',
  `rmreservRole` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Room Reservation System Role',
  `timeSheetRole` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `StaffAccess`
--

INSERT INTO `StaffAccess` (`staffId`, `password`, `stffpsRole`, `rmreservRole`, `timeSheetRole`) VALUES
('M00000', '1f7c381e83c87b875265b52adc64617a', 'a', 'a', NULL),
('M32001', '21cc52c4a75f3e20844ff47755c136be', NULL, NULL, NULL),
('M40001', '9575b553207d49b1ba7f655080478571', NULL, NULL, NULL),
('M47001', '21cc52c4a75f3e20844ff47755c136be', NULL, NULL, NULL),
('M54004', '21cc52c4a75f3e20844ff47755c136be', NULL, NULL, NULL),
('M57008', '21cc52c4a75f3e20844ff47755c136be', NULL, NULL, NULL),
('M59010', '21cc52c4a75f3e20844ff47755c136be', NULL, NULL, NULL),
('M60009', '2a116278dc40d8ea869c1f632ed3a0e1', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `StaffDepartment`
--

CREATE TABLE `StaffDepartment` (
  `departmentId` int(11) NOT NULL,
  `department` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Storing Department''s Name [Staff''s "division" Column]';

--
-- Dumping data for table `StaffDepartment`
--

INSERT INTO `StaffDepartment` (`departmentId`, `department`) VALUES
(2, 'Finance & Administration'),
(5, 'Professional Services'),
(1, 'Project Management Services Unit'),
(3, 'Technology & Support Services Unit');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Room`
--
ALTER TABLE `Room`
  ADD PRIMARY KEY (`roomId`),
  ADD UNIQUE KEY `roomName` (`roomName`),
  ADD UNIQUE KEY `roomCode` (`roomCode`);

--
-- Indexes for table `RoomFacilitiy`
--
ALTER TABLE `RoomFacilitiy`
  ADD PRIMARY KEY (`roomFacilityId`),
  ADD UNIQUE KEY `facility` (`facility`);

--
-- Indexes for table `RoomFacilitiyUsage`
--
ALTER TABLE `RoomFacilitiyUsage`
  ADD KEY `roomUsageId` (`roomUsageId`),
  ADD KEY `roomFacilityId` (`roomFacilityId`);

--
-- Indexes for table `RoomUsage`
--
ALTER TABLE `RoomUsage`
  ADD PRIMARY KEY (`usageId`),
  ADD KEY `roomId` (`roomId`),
  ADD KEY `reservedByStaffId` (`byStaffId`);

--
-- Indexes for table `Staff`
--
ALTER TABLE `Staff`
  ADD PRIMARY KEY (`staffId`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `StaffAccess`
--
ALTER TABLE `StaffAccess`
  ADD UNIQUE KEY `staffId` (`staffId`);

--
-- Indexes for table `StaffDepartment`
--
ALTER TABLE `StaffDepartment`
  ADD PRIMARY KEY (`departmentId`),
  ADD UNIQUE KEY `department` (`department`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Room`
--
ALTER TABLE `Room`
  MODIFY `roomId` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `RoomFacilitiy`
--
ALTER TABLE `RoomFacilitiy`
  MODIFY `roomFacilityId` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `RoomUsage`
--
ALTER TABLE `RoomUsage`
  MODIFY `usageId` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `StaffDepartment`
--
ALTER TABLE `StaffDepartment`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `RoomFacilitiyUsage`
--
ALTER TABLE `RoomFacilitiyUsage`
  ADD CONSTRAINT `RoomFacilitiyUsage_ibfk_1` FOREIGN KEY (`roomFacilityId`) REFERENCES `RoomFacilitiy` (`roomFacilityId`),
  ADD CONSTRAINT `RoomFacilitiyUsage_ibfk_2` FOREIGN KEY (`roomUsageId`) REFERENCES `RoomUsage` (`usageId`);

--
-- Constraints for table `RoomUsage`
--
ALTER TABLE `RoomUsage`
  ADD CONSTRAINT `RoomUsage_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `Room` (`roomId`),
  ADD CONSTRAINT `RoomUsage_ibfk_2` FOREIGN KEY (`byStaffId`) REFERENCES `Staff` (`staffId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `StaffAccess`
--
ALTER TABLE `StaffAccess`
  ADD CONSTRAINT `StaffAccess_ibfk_1` FOREIGN KEY (`staffId`) REFERENCES `Staff` (`staffId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
