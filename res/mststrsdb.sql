-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 27, 2017 at 11:59 AM
-- Server version: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mststrsdb`
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

-- --------------------------------------------------------

--
-- Table structure for table `RoomFacilitiyUsage`
--

CREATE TABLE `RoomFacilitiyUsage` (
  `roomUsageId` int(8) NOT NULL,
  `roomFacilityId` int(4) NOT NULL,
  `accessedQuantity` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `RoomInform`
--

CREATE TABLE `RoomInform` (
  `informId` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `byStaffId` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
('M00000', 'Mrs', 'P. Nudee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 's', NULL, NULL);

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
('M00000', '1f7c381e83c87b875265b52adc64617a', 'a', 'a', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `StaffDepartment`
--

CREATE TABLE `StaffDepartment` (
  `departmentId` int(11) NOT NULL,
  `department` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Storing Department''s Name [Staff''s "division" Column]';

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
-- Indexes for table `RoomInform`
--
ALTER TABLE `RoomInform`
  ADD PRIMARY KEY (`informId`);

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
  MODIFY `roomId` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RoomFacilitiy`
--
ALTER TABLE `RoomFacilitiy`
  MODIFY `roomFacilityId` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RoomInform`
--
ALTER TABLE `RoomInform`
  MODIFY `informId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `RoomUsage`
--
ALTER TABLE `RoomUsage`
  MODIFY `usageId` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `StaffDepartment`
--
ALTER TABLE `StaffDepartment`
  MODIFY `departmentId` int(11) NOT NULL AUTO_INCREMENT;
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
