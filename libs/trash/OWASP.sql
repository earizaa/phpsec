-- phpMyAdmin SQL Dump
-- version 3.4.10.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 17, 2013 at 03:49 AM
-- Server version: 5.5.22
-- PHP Version: 5.3.10-1ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `OWASP`
--

-- --------------------------------------------------------

--
-- Table structure for table `SESSION`
--

CREATE TABLE IF NOT EXISTS `SESSION` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SESSION_ID` varchar(64) NOT NULL,
  `DATE_CREATED` int(10) NOT NULL,
  `LAST_ACTIVITY` int(10) NOT NULL,
  `USERID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SESSION_ID` (`SESSION_ID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=156 ;

--
-- Dumping data for table `SESSION`
--

INSERT INTO `SESSION` (`ID`, `SESSION_ID`, `DATE_CREATED`, `LAST_ACTIVITY`, `USERID`) VALUES
(144, '288981662', 1368776296, 1368776296, 1234),
(145, '1180806451', 1368776296, 1368776296, 1234),
(147, '1605394638', 1368776308, 1368776308, 1234),
(148, '825845023', 1368776308, 1368776308, 1234),
(150, '467826141', 1368776309, 1368776309, 1234),
(151, '885246487', 1368776309, 1368776309, 1234),
(153, '1728760163', 1368776311, 1368776311, 1234),
(154, '949485831', 1368776311, 1368776311, 1234);

-- --------------------------------------------------------

--
-- Table structure for table `SESSION_DATA`
--

CREATE TABLE IF NOT EXISTS `SESSION_DATA` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `SESSION_ID` varchar(64) NOT NULL,
  `KEY` varchar(32) NOT NULL,
  `VALUE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SESSION_ID` (`SESSION_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=298 ;

--
-- Dumping data for table `SESSION_DATA`
--

INSERT INTO `SESSION_DATA` (`ID`, `SESSION_ID`, `KEY`, `VALUE`) VALUES
(286, '288981662', 'lang1', 'japanese'),
(287, '1180806451', 'charset1', 'UTF-8'),
(288, '1180806451', 'lang2', 'hindi'),
(289, '1180806451', 'charset2', 'ASCII');

-- --------------------------------------------------------

--
-- Table structure for table `USER`
--

CREATE TABLE IF NOT EXISTS `USER` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERID` int(10) unsigned NOT NULL,
  `DATE_CREATED` int(10) NOT NULL,
  `TOTAL_SESSIONS` int(2) NOT NULL DEFAULT '0',
  `FIRST_NAME` varchar(20) DEFAULT NULL,
  `LAST_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERID` (`USERID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `USER`
--

INSERT INTO `USER` (`ID`, `USERID`, `DATE_CREATED`, `TOTAL_SESSIONS`, `FIRST_NAME`, `LAST_NAME`) VALUES
(1, 1234, 1368597301, 8, '', ''),
(2, 12, 1368597301, 0, NULL, NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `SESSION`
--
ALTER TABLE `SESSION`
  ADD CONSTRAINT `SESSION_ibfk_1` FOREIGN KEY (`USERID`) REFERENCES `USER` (`USERID`) ON DELETE NO ACTION;

--
-- Constraints for table `SESSION_DATA`
--
ALTER TABLE `SESSION_DATA`
  ADD CONSTRAINT `SESSION_DATA_ibfk_5` FOREIGN KEY (`SESSION_ID`) REFERENCES `SESSION` (`SESSION_ID`) ON DELETE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
