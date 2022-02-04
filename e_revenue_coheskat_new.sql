-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2022 at 11:14 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_revenue_coheskat_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `application_profile`
--

CREATE TABLE `application_profile` (
  `std_id` int(11) NOT NULL,
  `std_logid` int(11) NOT NULL,
  `app_no` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `othernames` varchar(100) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `marital_status` varchar(10) NOT NULL,
  `birthdate` date NOT NULL,
  `local_gov` varchar(100) NOT NULL,
  `state_of_origin` varchar(100) NOT NULL,
  `contact_address` varchar(255) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_homeaddress` varchar(255) NOT NULL,
  `student_mobiletel` varchar(100) NOT NULL,
  `next_of_kin` varchar(255) NOT NULL,
  `nok_address` varchar(255) NOT NULL,
  `nok_tel` varchar(100) NOT NULL,
  `stdprogramme_id` int(11) NOT NULL,
  `stdcourse` int(11) NOT NULL,
  `stdcourse2` int(11) NOT NULL,
  `biodata` int(11) NOT NULL COMMENT 'biodata',
  `std_photo` varchar(50) NOT NULL,
  `std_custome5` int(11) NOT NULL DEFAULT 0 COMMENT 'schoolattended',
  `std_custome6` int(11) NOT NULL DEFAULT 0 COMMENT 'olevels',
  `std_custome7` int(11) NOT NULL DEFAULT 0 COMMENT 'employment_history',
  `std_custome8` int(11) NOT NULL DEFAULT 0 COMMENT 'declaration',
  `std_custome9` int(11) NOT NULL COMMENT 'appsubmit',
  `appsubmitdate` date NOT NULL,
  `evenue` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `applogin`
--

CREATE TABLE `applogin` (
  `log_id` int(11) NOT NULL,
  `log_surname` varchar(150) NOT NULL,
  `log_firstname` varchar(150) NOT NULL,
  `log_othernames` varchar(255) NOT NULL,
  `log_username` varchar(80) NOT NULL,
  `log_email` varchar(80) NOT NULL,
  `log_password` varchar(255) NOT NULL,
  `log_gsm` varchar(25) NOT NULL,
  `datereg` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_current_session`
--

CREATE TABLE `app_current_session` (
  `cs_id` int(11) NOT NULL,
  `cs_session` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `prog_id` int(2) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(10) UNSIGNED NOT NULL,
  `certname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `certdesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `etype` varchar(6) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `certname`, `certdesc`, `etype`) VALUES
(1, 'PRIMARY SCHOOL CERTIFICATE', 'PRIMARY SCHOOL CERTIFICATE', 'FSLC'),
(2, 'SECONDARY SCHOOL CERTIFCATE', 'SECONDARY SCHOOL CERTIFCATE', 'OL'),
(3, 'ENVIRONMENTAL HEALTH ASSISTANT (EHA) CERTIFICATE', 'ENVIRONMENTAL HEALTH ASSISTANT (EHA) CERTIFICATE', 'HL'),
(4, 'COMMUNITY HEALTH CERTIFICATE (JCHEW)', 'COMMUNITY HEALTH CERTIFICATE (JCHEW)', 'HL'),
(5, 'ENVIRONMENTAL HEALTH TECHNICIAN (EVT) CERTIFICATE', 'ENVIRONMENTAL HEALTH TECHNICIAN (EVT) CERTIFICATE', 'HL'),
(6, 'DENTAL HEALTH TECHNICIAN (DHT) CERTIFICATE', 'DENTAL HEALTH TECHNICIAN (DHT) CERTIFICATE', 'HL');

-- --------------------------------------------------------

--
-- Table structure for table `degree`
--

CREATE TABLE `degree` (
  `degree_id` int(100) NOT NULL,
  `degree_name` varchar(255) NOT NULL,
  `programme_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `degree`
--

INSERT INTO `degree` (`degree_id`, `degree_name`, `programme_id`) VALUES
(1, 'CHEW', 1),
(2, 'JCHEW', 2),
(3, 'RE-CHEW', 2),
(4, 'DT', 2),
(5, 'DHT', 2),
(6, 'HIM', 2),
(7, 'EHA', 1),
(8, 'RE-EVT', 2),
(9, 'EVT', 2),
(10, 'NDHND-EHT', 3),
(11, 'DHPE', 2),
(12, 'MLT', 2),
(13, 'PT', 2);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `departments_id` int(2) NOT NULL,
  `departments_name` varchar(33) DEFAULT NULL,
  `fac_id` int(1) DEFAULT NULL,
  `departments_code` varchar(25) NOT NULL,
  `d_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`departments_id`, `departments_name`, `fac_id`, `departments_code`, `d_status`) VALUES
(1, 'COMMUNITY HEALTH', 1, 'CH', 1),
(2, 'DENTAL HEALTH', 1, 'DH', 1),
(3, 'HEALTH INFORMATION MANAGEMENT', 1, 'HIM', 1),
(4, 'GENERAL STUDIES', 1, 'GS', 0),
(5, 'ENVIRONMENTAL HEALTH', 2, 'EH', 1),
(6, 'MEDICAL LABORATORY SCIENCE', 2, 'MLS', 1),
(7, 'PHARMACY', 2, 'PH', 1),
(8, 'REMEDIAL REFRESHER STUDIES', 2, 'RS', 0),
(9, 'GENERAL STUDIES', 2, 'GS', 0),
(10, 'COMMUNITY HEALTH', 2, 'CH', 1),
(12, 'NUTRITION AND DIETETICS ', 2, 'ND', 1);

-- --------------------------------------------------------

--
-- Table structure for table `dept_options`
--

CREATE TABLE `dept_options` (
  `do_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `programme_option` varchar(100) NOT NULL,
  `duration` varchar(15) NOT NULL,
  `prog_id` int(11) NOT NULL,
  `deptcode` varchar(15) NOT NULL,
  `d_status` int(11) NOT NULL DEFAULT 0,
  `examdates` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dept_options`
--

INSERT INTO `dept_options` (`do_id`, `dept_id`, `programme_option`, `duration`, `prog_id`, `deptcode`, `d_status`, `examdates`) VALUES
(1, 1, 'DIPLOMA IN COMMUNITY HEALTH (CHEW) ', '3', 2, 'CHEW', 1, '2021-04-13 08:00:00'),
(2, 1, 'COMMUNITY HEALTH  CERTIFICATE (JCHEW)', '2', 1, 'JCHEW', 1, '2021-04-12 08:00:00'),
(3, 1, 'COMMUNITY HEALTH  RE-TRAINING (RE-CHEW)', '2', 2, 'RE-CHEW', 1, '2021-04-12 08:00:00'),
(4, 2, 'ND/HND DENTAL THERAPY (DT)', '4', 3, 'DT', 1, '2021-04-10 08:00:00'),
(5, 2, 'DENTAL SURGERY TECHNICIAN (DST)', '3', 2, 'DHT', 1, '2021-04-10 08:00:00'),
(6, 3, 'HEALTH INFORMATION MANAGEMENT (HIM)', '3', 2, 'HIM', 1, '2021-04-11 08:00:00'),
(9, 5, 'ENVIRONMENTAL HEALTH ASSISTANT (EHA)', '2', 1, 'EHA', 1, '2021-04-12 08:00:00'),
(10, 5, 'ENVIRONMENTAL HEALTH TECHNICIAN RE-TRAINING (RE-EVT)', '2', 2, 'RE-EVT', 1, '2021-04-12 08:00:00'),
(11, 5, 'ENVIRONMENTAL HEALTH TECHNICIAN (EVT) ', '3', 2, 'EVT', 1, '2021-04-10 08:00:00'),
(12, 5, 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', '4', 3, 'NDHND-EHT', 1, '2021-04-10 08:00:00'),
(13, 5, 'HEALTH PROMOTION AND EDUCATION (DHPE)', '2', 2, 'DHPE', 1, '2021-04-10 08:00:00'),
(14, 6, 'MEDICAL LABORATORY TECHNICIAN (MLT)', '3', 2, 'MLT', 1, '2021-04-11 08:00:00'),
(15, 7, 'PHARMACY  TECHNICIAN (PT)', '3', 2, 'PT', 1, '2021-04-12 08:00:00'),
(16, 10, 'DIPLOMA IN COMMUNITY HEALTH (CHEW)', '3', 2, 'CHEW', 1, '2021-04-13 08:00:00'),
(17, 10, 'COMMUNITY HEALTH  CERTIFICATE (JCHEW)', '2', 1, 'JCHEW', 1, '2021-04-12 08:00:00'),
(18, 10, 'COMMUNITY HEALTH  RE-TRAINING (RE-CHEW) DIPLOMA', '2', 2, 'RE-CHEW', 1, '2021-04-12 08:00:00'),
(19, 1, '  HEALTH AND SOCIAL REHABILITATION', '2', 2, 'HSR', 1, '0000-00-00 00:00:00'),
(20, 10, 'HEALTH AND SOCIAL REHABILITATION', '2', 2, 'HSR', 1, '0000-00-00 00:00:00'),
(21, 12, ' ND NUTRITION AND DIETETICS (NUT)', '2', 2, 'NUT', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `eduhistory`
--

CREATE TABLE `eduhistory` (
  `eh_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `schoolname` varchar(250) NOT NULL,
  `examno` varchar(50) NOT NULL,
  `certname` varchar(25) NOT NULL,
  `fromdate` varchar(4) NOT NULL,
  `todate` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `exam_officers`
--

CREATE TABLE `exam_officers` (
  `examofficer_id` int(11) NOT NULL,
  `eo_username` varchar(100) NOT NULL,
  `eo_password` varchar(100) NOT NULL,
  `eo_surname` varchar(100) NOT NULL,
  `eo_firstname` varchar(100) NOT NULL,
  `eo_status` int(2) NOT NULL,
  `eo_group` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exam_officers`
--

INSERT INTO `exam_officers` (`examofficer_id`, `eo_username`, `eo_password`, `eo_surname`, `eo_firstname`, `eo_status`, `eo_group`) VALUES
(1, 'cohesadmin', 'Cohes2021$', 'Administrator', 'Administrator', 1, 1),
(2, 'superadmin', 'Cohes2021$', 'Admin', 'Portal', 0, 14),
(3, 'BursarAdmin', 'Burs3498T', 'Coe', 'Bursar', 1, 12),
(5, 'cohadmin', 'GTj876R', 'Admin', 'Portal', 0, 14);

-- --------------------------------------------------------

--
-- Table structure for table `expirydate`
--

CREATE TABLE `expirydate` (
  `expid` int(11) NOT NULL,
  `stdtype` varchar(25) NOT NULL,
  `pstatus` int(11) NOT NULL,
  `latereg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `expirydate`
--

INSERT INTO `expirydate` (`expid`, `stdtype`, `pstatus`, `latereg`) VALUES
(1, 'new', 0, 1),
(2, 'returning', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `faculties`
--

CREATE TABLE `faculties` (
  `faculties_id` int(100) NOT NULL,
  `faculties_name` varchar(255) NOT NULL,
  `fcode` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculties`
--

INSERT INTO `faculties` (`faculties_id`, `faculties_name`, `fcode`) VALUES
(1, 'SANI ZANGON DAURA SCHOOL OF HEALTH TECHNOLOGY DAURA', 'SHTD'),
(2, 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'SHTK');

-- --------------------------------------------------------

--
-- Table structure for table `fees_amt_pass`
--

CREATE TABLE `fees_amt_pass` (
  `fee_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `prog_id` int(11) NOT NULL,
  `fac_id` int(11) NOT NULL,
  `dept_id` int(11) NOT NULL,
  `nation_catid` int(11) NOT NULL,
  `new_return` varchar(50) NOT NULL,
  `level_id` int(11) NOT NULL,
  `sessionyear_id` int(11) NOT NULL,
  `resident_status` varchar(15) NOT NULL,
  `stdcourse` int(11) NOT NULL,
  `semester` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fees_amt_pass`
--

INSERT INTO `fees_amt_pass` (`fee_id`, `item_id`, `amount`, `prog_id`, `fac_id`, `dept_id`, `nation_catid`, `new_return`, `level_id`, `sessionyear_id`, `resident_status`, `stdcourse`, `semester`) VALUES
(57, 3, 5000, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(56, 3, 5000, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(55, 3, 5000, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(58, 4, 500, 1, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(59, 4, 500, 2, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(64, 6, 1000, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(101, 6, 1000, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(61, 5, 500, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(52, 2, 5000, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(53, 2, 5000, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(67, 7, 500, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(66, 7, 500, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(65, 7, 500, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(70, 8, 1000, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(69, 8, 1000, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(68, 8, 1000, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(73, 9, 500, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(72, 9, 500, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(71, 9, 500, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(76, 10, 300, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(75, 10, 300, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(74, 10, 300, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(79, 11, 300, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(78, 11, 300, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(77, 11, 300, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(82, 12, 1000, 3, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(81, 12, 1000, 2, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(80, 12, 1000, 1, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(85, 13, 600, 3, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(84, 13, 600, 2, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(83, 13, 600, 1, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(87, 14, 50000, 2, 0, 0, 2, 'general', 0, 2021, '', 0, 'First Semester'),
(86, 14, 50000, 1, 0, 0, 2, 'general', 0, 2021, '', 0, 'First Semester'),
(97, 17, 2000, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(96, 17, 2000, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(95, 17, 2000, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(100, 18, 1000, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(99, 18, 1000, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(98, 18, 1000, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(62, 6, 1000, 1, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(50, 5, 500, 2, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(51, 5, 500, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(54, 2, 5000, 3, 0, 0, 0, 'general', 0, 2021, '', 0, 'First Semester'),
(60, 4, 500, 3, 0, 0, 0, 'new', 0, 2021, '', 0, 'First Semester'),
(88, 14, 50000, 3, 0, 0, 2, 'general', 0, 2021, '', 0, 'First Semester');

-- --------------------------------------------------------

--
-- Table structure for table `field_pass`
--

CREATE TABLE `field_pass` (
  `field_id` int(100) NOT NULL,
  `field_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `field_pass`
--

INSERT INTO `field_pass` (`field_id`, `field_name`) VALUES
(1, 'Application Form'),
(2, 'Central Registration Fee'),
(3, 'Examination Fee'),
(4, 'ID Card'),
(5, 'Games'),
(6, 'Clinic'),
(7, 'Caution Fee'),
(8, 'Practical Supervision Fee'),
(9, 'Library Fee'),
(10, 'SUG Fee'),
(11, 'MSSN Fee'),
(12, 'Log Book Fee'),
(13, 'Student Hand Book Fee'),
(14, 'Tuition Fees'),
(17, 'Late Registration Fee'),
(18, 'ICT Fee');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` int(10) UNSIGNED NOT NULL,
  `gradecode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `gradecode`) VALUES
(1, 'A1'),
(2, 'AR'),
(3, 'B2'),
(4, 'B3'),
(5, 'C4'),
(6, 'C5'),
(7, 'C6'),
(8, 'D7'),
(9, 'D8'),
(10, 'F9'),
(11, 'ABS'),
(12, 'A'),
(13, 'B'),
(14, 'C'),
(15, 'D'),
(16, 'E'),
(17, 'F'),
(18, 'E8'),
(19, 'P');

-- --------------------------------------------------------

--
-- Table structure for table `group_table`
--

CREATE TABLE `group_table` (
  `group_id` int(10) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `group_description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `group_table`
--

INSERT INTO `group_table` (`group_id`, `group_name`, `group_description`) VALUES
(1, 'Super Administrator', 'Has overall control to the administrative modules'),
(12, 'Bursary', 'Handles All Payments For The School, Can Monitor The Flow Of Money Or Transactions In The System'),
(14, 'Administrator', 'Has limited privileges and can perform some of the tasks of a Super Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `b_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `empname` varchar(250) NOT NULL,
  `jobrole` varchar(250) NOT NULL,
  `salary` varchar(12) NOT NULL,
  `fdate` varchar(25) NOT NULL,
  `tdate` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lastsession`
--

CREATE TABLE `lastsession` (
  `id` int(11) NOT NULL,
  `sid` varchar(100) NOT NULL,
  `aid` varchar(250) NOT NULL,
  `value` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `level_id` int(100) NOT NULL,
  `level_name` varchar(255) NOT NULL,
  `programme_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`level_id`, `level_name`, `programme_id`) VALUES
(1, '100', 1),
(2, '200', 2),
(3, '300', 3),
(4, '400', 4),
(5, 'HND 1', 3),
(6, 'HND 2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `lga`
--

CREATE TABLE `lga` (
  `lga_id` int(10) UNSIGNED NOT NULL,
  `state_id` int(11) NOT NULL,
  `lga_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lga`
--

INSERT INTO `lga` (`lga_id`, `state_id`, `lga_name`) VALUES
(1, 1, 'Aba North'),
(2, 1, 'Aba South'),
(3, 1, 'Arochukwu'),
(4, 1, 'Bende'),
(5, 1, 'Ikwuano'),
(6, 1, 'Isiala-Ngwa North'),
(7, 1, 'Isiala-Ngwa South'),
(8, 1, 'Isikwuato'),
(9, 1, 'Nneochi'),
(10, 1, 'Obi-Ngwa'),
(11, 1, 'Ohafia'),
(12, 1, 'Osisioma'),
(13, 1, 'Ugwunagbo'),
(14, 1, 'Ukwa East'),
(15, 1, 'Ukwa West'),
(16, 1, 'Umuahia North'),
(17, 1, 'Umuahia South'),
(18, 2, 'Demsa'),
(19, 2, 'Fufore'),
(20, 2, 'Genye'),
(21, 2, 'Girei'),
(22, 2, 'Gombi'),
(23, 2, 'guyuk'),
(24, 2, 'Hong'),
(25, 2, 'Jada'),
(26, 2, 'Jimeta'),
(27, 2, 'Lamurde'),
(28, 2, 'Madagali'),
(29, 2, 'Maiha'),
(30, 2, 'Mayo Belwa'),
(31, 2, 'Michika'),
(32, 2, 'Mubi North'),
(33, 2, 'Mubi South'),
(34, 2, 'Numan'),
(35, 2, 'Shelleng'),
(36, 2, 'Song'),
(37, 2, 'Toungo'),
(38, 2, 'Yola'),
(39, 3, 'Abak'),
(40, 3, 'Eastern-Obolo'),
(41, 3, 'Eket'),
(42, 3, 'Ekpe-Atani'),
(43, 3, 'Essien-Udim'),
(44, 3, 'Esit Ekit'),
(45, 3, 'Etim-Ekpo'),
(46, 3, 'Etinan'),
(47, 3, 'Ibeno'),
(48, 3, 'Ibesikpo-Asutan'),
(49, 3, 'Ibiono-Ibom'),
(50, 3, 'Ika'),
(51, 3, 'Ikono'),
(52, 3, 'Ikot-Abasi'),
(53, 3, 'Ikot-Ekpene'),
(54, 3, 'Ini'),
(55, 3, 'Itu'),
(56, 3, 'Mbo'),
(57, 3, 'Mkpat-Enin'),
(58, 3, 'Nsit-Ibom'),
(59, 3, 'Nsit-Ubium'),
(60, 3, 'Obot-Akara'),
(61, 3, 'Okobo'),
(62, 3, 'Onna'),
(63, 3, 'Oron'),
(64, 3, 'Oruk-Anam'),
(65, 3, 'Udung-Uko'),
(66, 3, 'Ukanefun'),
(67, 3, 'Uru Offong Oruko'),
(68, 3, 'Uruan'),
(69, 3, 'Uquo Ibene'),
(70, 3, 'Uyo'),
(71, 4, 'Aguata'),
(72, 4, 'Anambra'),
(73, 4, 'Anambra West'),
(74, 4, 'Anocha'),
(75, 4, 'Awka- North'),
(76, 4, 'Awka-South'),
(77, 4, 'Ayamelum'),
(78, 4, 'Dunukofia'),
(79, 4, 'Ekwusigo'),
(80, 4, 'Idemili-North'),
(81, 4, 'Idemili-South'),
(82, 4, 'Ihiala'),
(83, 4, 'Njikoka'),
(84, 4, 'Nnewi-North'),
(85, 4, 'Nnewi-South'),
(86, 4, 'Ogbaru'),
(87, 4, 'Onisha North'),
(88, 4, 'Onitsha South'),
(89, 4, 'Orumba North'),
(90, 4, 'Orumba South'),
(91, 4, 'Oyi'),
(92, 5, 'Alkaleri'),
(93, 5, 'Bauchi'),
(94, 5, 'Bogoro'),
(95, 5, 'Damban'),
(96, 5, 'Darazo'),
(97, 5, 'Dass'),
(98, 5, 'Gamawa'),
(99, 5, 'Ganjuwa'),
(100, 5, 'Giade'),
(101, 5, 'Itas/Gadau'),
(103, 5, 'Katagum'),
(104, 5, 'Kirfi'),
(105, 5, 'Misau'),
(106, 5, 'Ningi'),
(107, 5, 'Shira'),
(108, 5, 'Tafawa-Balewa'),
(109, 5, 'Toro'),
(110, 5, 'Warji'),
(111, 5, 'Zaki'),
(112, 6, 'Brass'),
(113, 6, 'Ekerernor'),
(114, 6, 'Kolokuma/Opokuma'),
(115, 6, 'Nembe'),
(116, 6, 'Ogbia'),
(117, 6, 'Sagbama'),
(118, 6, 'Southern-Ijaw'),
(119, 6, 'Yenegoa'),
(120, 6, 'Kembe'),
(121, 7, 'Ado'),
(122, 7, 'Agatu'),
(123, 7, 'Apa'),
(124, 7, 'Buruku'),
(125, 7, 'Gboko'),
(126, 7, 'Guma'),
(127, 7, 'Gwer-East'),
(128, 7, 'Gwer-West'),
(129, 7, 'Katsina-Ala'),
(130, 7, 'Konshisha'),
(131, 7, 'Kwande'),
(132, 7, 'Logo'),
(133, 7, 'Makurdi'),
(134, 7, 'Obi'),
(135, 7, 'Ogbadibo'),
(136, 7, 'Ohimini'),
(137, 7, 'Oju'),
(138, 7, 'Okpokwu'),
(139, 7, 'Otukpo'),
(140, 7, 'Tarkar'),
(141, 7, 'Vandeikya'),
(142, 7, 'Ukum'),
(143, 7, 'Ushongo'),
(144, 8, 'Abadan'),
(145, 8, 'Askira-Uba'),
(146, 8, 'Bama'),
(147, 8, 'Bayo'),
(148, 8, 'Biu'),
(149, 8, 'Chibok'),
(150, 8, 'Damboa'),
(151, 8, 'Dikwa'),
(152, 8, 'Gubio'),
(153, 8, 'Guzamala'),
(154, 8, 'Gwoza'),
(155, 8, 'Hawul'),
(156, 8, 'Jere'),
(157, 8, 'Kaga'),
(158, 8, 'Kala/Balge'),
(159, 8, 'Kukawa'),
(160, 8, 'Konduga'),
(161, 8, 'Kwaya-Kusar'),
(162, 8, 'Mafa'),
(163, 8, 'Magumeri'),
(164, 8, 'Maiduguri'),
(165, 8, 'Marte'),
(166, 8, 'Mobbar'),
(167, 8, 'Monguno'),
(168, 8, 'Ngala'),
(169, 8, 'Nganzai'),
(170, 8, 'Shani'),
(171, 9, 'Abi'),
(172, 9, 'Akamkpa'),
(173, 9, 'Akpabuyo'),
(174, 9, 'Bakassi'),
(175, 9, 'Bekwara'),
(176, 9, 'Biase'),
(177, 9, 'Boki'),
(178, 9, 'Calabar-Municipal'),
(179, 9, 'Calabar-South'),
(180, 9, 'Etung'),
(181, 9, 'Ikom'),
(182, 9, 'Obanliku'),
(183, 9, 'Ogoja'),
(184, 9, 'Ugep North'),
(185, 9, 'Yakurr'),
(186, 9, 'Yala'),
(187, 10, 'Aniocha North'),
(188, 10, 'Aniocha South'),
(189, 10, 'Bomadi'),
(190, 10, 'Burutu'),
(191, 10, 'Ethiope East'),
(192, 10, 'Ethiope West'),
(193, 10, 'Ika North East'),
(194, 10, 'Ika South'),
(195, 10, 'Isoko North'),
(196, 10, 'Isoko South'),
(197, 10, 'Ndokwa East'),
(198, 10, 'Ndokwa West'),
(199, 10, 'Okpe'),
(200, 10, 'Oshimili North'),
(201, 10, 'Oshimili South'),
(202, 10, 'Patani'),
(203, 10, 'Sapele'),
(204, 10, 'Udu'),
(205, 10, 'Ughilli North'),
(206, 10, 'Ughilli South'),
(207, 10, 'Ukwuani'),
(208, 10, 'Uvwie'),
(209, 10, 'Warri Central'),
(210, 10, 'Warri North'),
(211, 10, 'Warri South'),
(212, 11, 'Abakaliki'),
(213, 11, 'Afikpo North'),
(214, 11, 'Afikpo South'),
(215, 11, 'Ebonyi'),
(216, 11, 'Ezza North'),
(217, 11, 'Ezza South'),
(218, 11, 'ikwo'),
(219, 11, 'Ishielu'),
(220, 11, 'Ivo'),
(221, 11, 'Izzi'),
(222, 11, 'Ohaukwu'),
(223, 11, 'Ohaozara'),
(224, 11, 'Onicha'),
(225, 12, 'Akoko Edo'),
(226, 12, 'Egor'),
(227, 12, 'Esan Central'),
(228, 12, 'Esan North East'),
(229, 12, 'Esan South East'),
(230, 12, 'Esan West'),
(231, 12, 'Etsako-Central'),
(232, 12, 'Etsako-West'),
(233, 12, 'Igueben'),
(234, 12, 'Ikpoba-Okha'),
(235, 12, 'Oredo'),
(236, 12, 'Orhionmwon'),
(237, 12, 'Ovia North East'),
(238, 12, 'Ovia South West'),
(239, 12, 'owan east'),
(240, 12, 'Owan West'),
(241, 12, 'Umunniwonde'),
(242, 13, 'Ado Ekiti'),
(243, 13, 'Aiyedire'),
(244, 13, 'Efon'),
(245, 13, 'Ekiti-East'),
(246, 13, 'Ekiti-South West'),
(247, 13, 'Ekiti West'),
(248, 13, 'Emure'),
(249, 13, 'Ido Osi'),
(250, 13, 'Ijero'),
(251, 13, 'Ikere'),
(252, 13, 'Ikole'),
(253, 13, 'Ilejemeta'),
(254, 13, 'Irepodun/Ifelodun'),
(255, 13, 'Ise Orun'),
(256, 13, 'Moba'),
(257, 13, 'Oye'),
(258, 14, 'Aninri'),
(259, 14, 'Awgu'),
(260, 14, 'Enugu East'),
(261, 14, 'Enugu North'),
(262, 14, 'Enugu South'),
(263, 14, 'Ezeagu'),
(264, 14, 'Igbo Etiti'),
(265, 14, 'Igbo Eze North'),
(266, 14, 'Igbo Eze South'),
(267, 14, 'Isi Uzo'),
(268, 14, 'Nkanu East'),
(269, 14, 'Nkanu West'),
(270, 14, 'Nsukka'),
(271, 14, 'Oji-River'),
(272, 14, 'Udenu'),
(273, 14, 'Udi'),
(274, 14, 'Uzo Uwani'),
(275, 15, 'Akko'),
(276, 15, 'Balanga'),
(277, 15, 'Billiri'),
(278, 15, 'Dukku'),
(279, 15, 'Funakaye'),
(280, 15, 'Gombe'),
(281, 15, 'Kaltungo'),
(282, 15, 'Kwami'),
(283, 15, 'Nafada/Bajoga'),
(284, 15, 'Shomgom'),
(285, 15, 'Yamltu/Deba'),
(286, 16, 'Ahiazu-Mbaise'),
(287, 16, 'Ehime-Mbano'),
(288, 16, 'Ezinihtte'),
(289, 16, 'Ideato North'),
(290, 16, 'Ideato South'),
(291, 16, 'Ihitte/Uboma'),
(292, 16, 'Ikeduru'),
(293, 16, 'Isiala-Mbano'),
(294, 16, 'Isu'),
(295, 16, 'Mbaitoli'),
(296, 16, 'Ngor-Okpala'),
(297, 16, 'Njaba'),
(298, 16, 'Nkwerre'),
(299, 16, 'Nwangele'),
(300, 16, 'obowo'),
(301, 16, 'Oguta'),
(302, 16, 'Ohaji-Eggema'),
(303, 16, 'Okigwe'),
(304, 16, 'Onuimo'),
(305, 16, 'Orlu'),
(306, 16, 'Orsu'),
(307, 16, 'Oru East'),
(308, 16, 'Oru West'),
(309, 16, 'Owerri Municipal'),
(310, 16, 'Owerri North'),
(311, 16, 'Owerri West'),
(312, 17, 'Auyu'),
(313, 17, 'Babura'),
(314, 17, 'Birnin Kudu'),
(315, 17, 'Birniwa'),
(316, 17, 'Bosuwa'),
(317, 17, 'Buji'),
(318, 17, 'Dutse'),
(319, 17, 'Gagarawa'),
(320, 17, 'Garki'),
(321, 17, 'Gumel'),
(322, 17, 'Guri'),
(323, 17, 'Gwaram'),
(324, 17, 'Gwiwa'),
(325, 17, 'Hadejia'),
(326, 17, 'Jahun'),
(327, 17, 'Kafin Hausa'),
(328, 17, 'Kaugama'),
(329, 17, 'Kazaure'),
(330, 17, 'Kirikasanuma'),
(331, 17, 'Kiyawa'),
(332, 17, 'Maigatari'),
(333, 17, 'Malam Maduri'),
(334, 17, 'Miga'),
(335, 17, 'Ringim'),
(336, 17, 'Roni'),
(337, 17, 'Sule Tankarkar'),
(338, 17, 'Taura'),
(339, 17, 'Yankwashi'),
(340, 18, 'Birnin-Gwari'),
(341, 18, 'Chikun'),
(342, 18, 'Giwa'),
(343, 18, 'Gwagwada'),
(344, 18, 'Igabi'),
(345, 18, 'Ikara'),
(346, 18, 'Jaba'),
(348, 18, 'Kachia'),
(349, 18, 'Kaduna North'),
(350, 18, 'Kagarko'),
(351, 18, 'Kajuru'),
(352, 18, 'Kaura'),
(353, 18, 'Kauru'),
(354, 18, 'Koka/Kawo'),
(355, 18, 'Kubah'),
(356, 18, 'Kudan'),
(357, 18, 'Lere'),
(358, 18, 'Makarfi'),
(359, 18, 'Sabon Gari'),
(360, 18, 'Sanga'),
(361, 18, 'Sabo'),
(362, 18, 'Tudun-Wada/Makera'),
(363, 18, 'Zango-Kataf'),
(364, 18, 'Zaria'),
(365, 19, 'Ajingi'),
(366, 19, ' Albasu'),
(367, 19, 'Bagwai'),
(368, 19, 'Bebeji'),
(369, 19, 'Bichi'),
(370, 19, 'Bunkure'),
(371, 19, 'Dala'),
(372, 19, 'Dambatta'),
(373, 19, 'Dawakin Kudu'),
(374, 19, 'Dawakin Tofa'),
(375, 19, 'Doguwa'),
(376, 19, 'Fagge'),
(377, 19, 'Gabasawa'),
(378, 19, 'Garko'),
(379, 19, 'Garun-Mallam'),
(380, 19, 'Gaya'),
(381, 19, 'Gezawa'),
(382, 19, 'Gwale'),
(383, 19, 'Gwarzo'),
(384, 19, 'Kabo'),
(385, 19, 'Kano Municipal'),
(386, 19, 'Karaye'),
(387, 19, 'Kibiya'),
(388, 19, 'Kiru'),
(389, 19, 'Kumbotso'),
(390, 19, 'Kunchi'),
(391, 19, 'Kura'),
(392, 19, 'Madobi'),
(393, 19, 'Makoda'),
(394, 19, 'Minjibir'),
(395, 19, 'Nasarawa'),
(396, 19, 'Rano'),
(397, 19, 'Rimin Gado'),
(398, 19, 'Rogo'),
(399, 19, 'Shanono'),
(400, 19, 'Sumaila'),
(401, 19, 'Takai'),
(402, 19, 'Tarauni'),
(403, 19, 'Tofa'),
(404, 19, 'Tsanyawa'),
(405, 19, 'Tudun Wada'),
(406, 19, 'Ngogo'),
(407, 19, 'Warawa'),
(408, 19, 'Wudil'),
(409, 20, 'Bakori'),
(410, 20, 'Batagarawa'),
(411, 20, 'Batsari'),
(412, 20, 'Baure'),
(413, 20, 'Bindawa'),
(414, 20, 'Charanchi'),
(415, 20, 'Danja'),
(416, 20, 'Danjume'),
(417, 20, 'Dan-Musa'),
(418, 20, 'Daura'),
(419, 20, 'Dutsi'),
(420, 20, 'Dutsinma'),
(421, 20, 'Faskari'),
(422, 20, 'Funtua'),
(423, 20, 'Ingawa'),
(424, 20, 'Jibia'),
(425, 20, 'Kafur'),
(426, 20, 'Kaita'),
(427, 20, 'Kankara'),
(428, 20, 'Kankia'),
(429, 20, 'Katsina'),
(430, 20, 'Kurfi'),
(431, 20, 'Kusada'),
(432, 20, 'Mai Adua'),
(433, 20, 'Malumfashi'),
(434, 20, 'Mani'),
(435, 20, 'Mashi'),
(436, 20, 'Matazu'),
(437, 20, 'Musawa'),
(438, 20, 'Rimi'),
(439, 20, 'Sabuwa'),
(440, 20, 'Safana'),
(441, 20, 'Sandamu'),
(442, 20, 'Zango'),
(443, 21, 'Aleira'),
(444, 21, 'Arewa'),
(445, 21, 'Argungu'),
(446, 21, 'Augie'),
(447, 21, 'Bagudo'),
(448, 21, 'Birnin-Kebbi'),
(449, 21, 'Bumza'),
(450, 21, 'Dandi'),
(451, 21, 'Danko'),
(452, 21, 'Fakai'),
(453, 21, 'Gwandu'),
(454, 21, 'Jega'),
(455, 21, 'Kalgo'),
(456, 21, 'Koko-Besse'),
(457, 21, 'Maiyama'),
(458, 21, 'Ngaski'),
(459, 21, 'Sakaba'),
(460, 21, 'Shanga'),
(461, 21, 'Suru'),
(462, 21, 'Wasagu'),
(463, 21, 'Yauri'),
(464, 21, 'Zuru'),
(465, 22, 'Adavi'),
(466, 22, 'Ajaokuta'),
(467, 22, 'Ankpa'),
(468, 22, 'Bassa'),
(469, 22, 'Dekina'),
(470, 22, 'Ibaji'),
(471, 22, 'Idah'),
(472, 22, 'Igalamela'),
(473, 22, 'Ijumu'),
(474, 22, 'Kabba/Bunu'),
(475, 22, 'Kogi'),
(476, 22, 'Lokoja'),
(477, 22, 'Mopa-Muro-Mopi'),
(478, 22, 'Ofu'),
(479, 22, 'Ogori/Magongo'),
(480, 22, 'Okehi'),
(481, 22, 'Okene'),
(482, 22, 'Olamaboro'),
(483, 22, 'Omala'),
(484, 22, 'Oyi'),
(485, 22, 'Yagba-East'),
(486, 22, 'Yagba-West'),
(487, 23, 'Asa'),
(488, 23, 'Baruten'),
(489, 23, 'Edu'),
(490, 23, 'Ekiti'),
(491, 23, 'Ifelodun'),
(492, 23, 'Ilorin East'),
(493, 23, 'Ilorin South'),
(494, 23, 'Ilorin West'),
(495, 23, 'Irepodun'),
(496, 23, 'Isin'),
(497, 23, 'Kaiama'),
(498, 23, 'Moro'),
(499, 23, 'Offa'),
(500, 23, 'Oke-Ero'),
(501, 23, 'Oyun'),
(502, 23, 'Pategi'),
(503, 24, 'Agege'),
(504, 24, 'Ajeromi-Ifelodun'),
(505, 24, 'Alimosho'),
(506, 24, 'Amuwo-Odofin'),
(507, 24, 'Apapa'),
(508, 24, 'Bagagry'),
(509, 24, 'Epe'),
(510, 24, 'Eti-Osa'),
(511, 24, 'Ibeju-Lekki'),
(512, 24, 'Ifako-Ijaiye'),
(513, 24, 'Ikeja'),
(514, 24, 'Ikorodu'),
(515, 24, 'Kosofe'),
(516, 24, 'Lagos-Island'),
(517, 24, 'Lagos-Mainland'),
(518, 24, 'Mushin'),
(519, 24, 'Ojo'),
(520, 24, 'Oshodi-Isolo'),
(521, 24, 'Shomolu'),
(522, 24, 'Suru-Lere'),
(523, 25, 'Akwanga'),
(524, 25, 'Awe'),
(525, 25, 'Doma'),
(526, 25, 'Karu'),
(527, 25, 'Keana'),
(528, 25, 'Keffi'),
(529, 25, 'Kokona'),
(530, 25, 'Lafia'),
(531, 25, 'Nassarawa'),
(532, 25, 'Nassarawa Eggor'),
(533, 25, 'Obi'),
(534, 25, 'Toto'),
(535, 25, 'Wamba'),
(536, 26, 'Agaie'),
(537, 26, 'Agwara'),
(538, 26, 'Bida'),
(539, 26, 'Borgu'),
(540, 26, 'Bosso'),
(541, 26, 'Chanchaga'),
(542, 26, 'Edati'),
(543, 26, 'Gbako'),
(544, 26, 'Gurara'),
(545, 26, 'Katcha'),
(546, 26, 'Kontagora'),
(547, 26, 'Lapai'),
(548, 26, 'Lavum'),
(549, 26, 'Magama'),
(550, 26, 'Mariga'),
(551, 26, 'Mashegu'),
(552, 26, 'Mokwa'),
(553, 26, 'Muya'),
(554, 26, 'Paikoro'),
(555, 26, 'Rafi'),
(556, 26, 'Rajau'),
(557, 26, 'Shiroro'),
(558, 26, 'Suleja'),
(559, 26, 'Tafa'),
(560, 26, 'Wushishi'),
(561, 27, 'Abeokuta -North'),
(562, 27, 'Abeokuta -South'),
(563, 27, 'Ado-Odo/Ota'),
(564, 27, 'Yewa-North'),
(565, 27, 'Yewa-South'),
(566, 27, 'Ewekoro'),
(567, 27, 'Ifo'),
(568, 27, 'Ijebu East'),
(569, 27, 'Ijebu North'),
(570, 27, 'Ijebu North-East'),
(571, 27, 'Ijebu-Ode'),
(572, 27, 'Ikenne'),
(573, 27, 'Imeko-Afon'),
(574, 27, 'Ipokia'),
(575, 27, 'Obafemi -Owode'),
(576, 27, 'Odeda'),
(577, 27, 'Odogbolu'),
(578, 27, 'Ogun-Water Side'),
(579, 27, 'Remo-North'),
(580, 27, 'Shagamu'),
(581, 28, 'Akoko-North-East'),
(582, 28, 'Akoko-North-West'),
(583, 28, 'Akoko-South-West'),
(584, 28, 'Akoko-South-East'),
(585, 28, 'Akure- South'),
(586, 28, 'Akure-North'),
(587, 28, 'Ese-Odo'),
(588, 28, 'Idanre'),
(589, 28, 'Ifedore'),
(590, 28, 'Ilaje'),
(591, 28, 'Ile-Oluji-Okeigbo'),
(592, 28, 'Irele'),
(593, 28, 'Odigbo'),
(594, 28, 'Okitipupa'),
(595, 28, 'Ondo-West'),
(596, 28, 'Ondo East'),
(597, 28, 'Ose'),
(598, 28, 'Owo'),
(599, 29, 'Atakumosa'),
(600, 29, 'Atakumosa East'),
(601, 29, 'Ayeda-Ade'),
(602, 29, 'Ayedire'),
(603, 29, 'Boluwaduro'),
(604, 29, 'Boripe'),
(605, 29, 'Ede'),
(606, 29, 'Ede North'),
(607, 29, 'Egbedore'),
(608, 29, 'Ejigbo'),
(609, 29, 'Ife'),
(610, 29, 'Ife East'),
(611, 29, 'Ife North'),
(612, 29, 'Ife South'),
(613, 29, 'Ifedayo'),
(614, 29, 'Ifelodun'),
(615, 29, 'Ila'),
(616, 29, 'Ilesha'),
(617, 29, 'Ilesha-West'),
(618, 29, 'Irepodun'),
(619, 29, 'Irewole'),
(620, 29, 'Isokun'),
(621, 29, 'Iwo'),
(622, 29, 'Obokun'),
(623, 29, 'Odo-Otin'),
(624, 29, 'Ola Oluwa'),
(625, 29, 'Olorunda'),
(626, 29, 'Ori-Ade'),
(627, 29, 'Orolu'),
(628, 29, 'Osogbo'),
(629, 30, 'Afijio'),
(630, 30, 'Akinyele'),
(631, 30, 'Atiba'),
(632, 30, 'Atisbo'),
(633, 30, 'Egbeda'),
(634, 30, 'Ibadan-Central'),
(635, 30, 'Ibadan-North-East'),
(636, 30, 'Ibadan-North-West'),
(637, 30, 'Ibadan-South-East'),
(638, 30, 'Ibadan-South West'),
(639, 30, 'Ibarapa-Central'),
(640, 30, 'Ibarapa-East'),
(641, 30, 'Ibarapa-North'),
(642, 30, 'Ido'),
(643, 30, 'Ifedayo'),
(644, 30, 'Ifeloju'),
(645, 30, 'Irepo'),
(646, 30, 'Iseyin'),
(647, 30, 'Itesiwaju'),
(648, 30, 'Iwajowa'),
(649, 30, 'Kajola'),
(650, 30, 'Lagelu'),
(651, 30, 'Odo-Oluwa'),
(652, 30, 'Ogbomoso-North'),
(653, 30, 'Ogbomosho-South'),
(654, 30, 'Olorunsogo'),
(655, 30, 'Oluyole'),
(656, 30, 'Ona-Ara'),
(657, 30, 'Orelope'),
(658, 30, 'Ori-Ire'),
(659, 30, 'Oyo East'),
(660, 30, 'Oyo West'),
(661, 30, 'saki east'),
(662, 30, 'Saki West'),
(663, 30, 'Surulere'),
(664, 31, 'Barkin Ladi'),
(665, 31, 'Bassa'),
(666, 31, 'Bokkos'),
(667, 31, 'Jos-East'),
(668, 31, 'Jos-South'),
(669, 31, 'Jos-North'),
(670, 31, 'Kanam'),
(671, 31, 'Kanke'),
(672, 31, 'Langtang North'),
(673, 31, 'Langtang South'),
(674, 31, 'Mangu'),
(675, 31, 'Mikang'),
(676, 31, 'Pankshin'),
(678, 31, 'Riyom'),
(679, 31, 'Shendam'),
(680, 31, 'Wase'),
(681, 32, 'Abua/Odual'),
(682, 32, 'Ahoada East'),
(683, 32, 'Ahoada West'),
(684, 32, 'Akukutoru'),
(685, 32, 'Andoni'),
(686, 32, 'Asari-Toro'),
(687, 32, 'Bonny'),
(688, 32, 'Degema'),
(689, 32, 'Eleme'),
(690, 32, 'Emuoha'),
(691, 32, 'Etche'),
(692, 32, 'Gokana'),
(693, 32, 'Ikwerre'),
(694, 32, 'Khana'),
(695, 32, 'Obio/Akpor'),
(696, 32, 'Ogba/Egbama/Ndoni'),
(697, 32, 'Ogu/Bolo'),
(698, 32, 'Okrika'),
(699, 32, 'Omuma'),
(700, 32, 'Opobo/Nkoro'),
(701, 32, 'Oyigbo'),
(702, 32, 'Port-Harcourt'),
(703, 32, 'Tai'),
(704, 33, 'Binji'),
(705, 33, 'Bodinga'),
(706, 33, 'Dange-Shuni'),
(707, 33, 'Gada'),
(708, 33, 'Goronyo'),
(709, 33, 'Gudu'),
(710, 33, 'Gwadabawa'),
(711, 33, 'Illela'),
(712, 33, 'Isa'),
(713, 33, 'Kebbe'),
(714, 33, 'Kware'),
(715, 33, 'Raba'),
(716, 33, 'Sabon-Birni'),
(717, 33, 'Shagari'),
(718, 33, 'Silame'),
(719, 33, 'Sokoto North'),
(720, 33, 'Sokoto South'),
(721, 33, 'Tambuwal'),
(722, 33, 'Tanzaga'),
(723, 33, 'Tureta'),
(724, 33, 'Wamakko'),
(725, 33, 'Wurno'),
(726, 33, 'Yabo'),
(727, 34, 'Ardo Kola'),
(728, 34, 'Bali'),
(729, 34, 'Donga'),
(730, 34, 'Gashaka'),
(731, 34, 'Gassol'),
(732, 34, 'Ibi'),
(733, 34, 'Jalingo'),
(734, 34, 'Karim-Lamido'),
(735, 34, 'Kurmi'),
(736, 34, 'Lau'),
(737, 34, 'Sardauna'),
(738, 34, 'Takuni'),
(739, 34, 'Ussa'),
(740, 34, 'Wukari'),
(741, 34, 'Yarro'),
(742, 34, 'Zing'),
(743, 35, 'Bade'),
(744, 35, 'Bursali'),
(745, 35, 'Damaturu'),
(746, 35, 'Fuka'),
(747, 35, 'Fune'),
(748, 35, 'Geidam'),
(749, 35, 'Gogaram'),
(750, 35, 'Gujba'),
(751, 35, 'Gulani'),
(752, 35, 'Jakusko'),
(753, 35, 'Karasuwa'),
(754, 35, 'Machina'),
(755, 35, 'Nangere'),
(756, 35, 'Nguru'),
(757, 35, 'Potiskum'),
(758, 35, 'Tarmua'),
(759, 35, 'Yunisari'),
(760, 35, 'Yusufari'),
(761, 36, 'Anka'),
(762, 36, 'Bakure'),
(763, 36, 'Bukkuyum'),
(764, 36, 'Bungudo'),
(765, 36, 'Gumi'),
(766, 36, 'Gusau'),
(767, 36, 'Isa'),
(768, 36, 'Kaura-Namoda'),
(769, 36, 'Kiyawa'),
(770, 36, 'Maradun'),
(771, 36, 'Marau'),
(772, 36, 'Shinkafa'),
(773, 36, 'Talata-Mafara'),
(774, 36, 'Tsafe'),
(775, 36, 'Zurmi'),
(776, 9, 'Obudu'),
(777, 37, 'Abaji'),
(778, 37, 'Bwari'),
(779, 37, 'Gwagwalada'),
(780, 37, 'Kuje'),
(781, 37, 'Kwali'),
(782, 37, 'Municipal'),
(783, 12, 'Etsako-East'),
(784, 16, 'Ahiazu-Mbaise'),
(785, 38, 'Foreign'),
(786, 18, 'Kaduna South'),
(787, 16, 'Aboh-Mbaise'),
(788, 9, 'Odukpani'),
(789, 9, 'Obubra'),
(790, 9, 'Ishietown'),
(791, 3, 'Nsit Atai');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `log_id` int(11) NOT NULL,
  `log_surname` varchar(150) NOT NULL,
  `log_firstname` varchar(150) NOT NULL,
  `log_othernames` varchar(255) DEFAULT NULL,
  `log_username` varchar(80) NOT NULL,
  `log_email` varchar(80) NOT NULL,
  `log_password` varchar(255) NOT NULL,
  `log_programmeid` tinyint(4) NOT NULL,
  `log_gsm` varchar(89) NOT NULL,
  `datereg` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`log_id`, `log_surname`, `log_firstname`, `log_othernames`, `log_username`, `log_email`, `log_password`, `log_programmeid`, `log_gsm`, `datereg`) VALUES
(6, 'USMAN', 'MAMUDA', NULL, '0000821', 'owo@yahoo.com', '$2y$10$0XePfU7Syf47WNRTOZHpDe/irXAcVPfvRlWvFvsW2xenDp7Q5ySwy', 18, '07069491035', '2022-01-27 09:32:30'),
(7, 'MUAWIYA', 'ILIYASU', NULL, '0003505', 'mua@yahoo.com', '$2y$10$AYOqqPtMC3vYxJRdCGkiE.qI.K1yKVEo.NFI9TkLs99u9jvJm30um', 5, '08063327410', '2022-01-27 10:01:56'),
(8, 'ABUBAKAR', 'SALISU', 'SADIQ', '0002244', 'sadiq@yahoo.com', '$2y$10$aGFLy/E7PU.fbd9.yjgbiujE0TQFZsksxj9ocsaEoqUdkDZl5aOAy', 4, '09095989669', '2022-01-27 12:37:09'),
(9, 'SULAIMAN', 'IMAM', 'USMAN', '0003364', 'usman@yahoo.com', '$2y$10$v4N3ZVdZJ4PYeeBAzh3L.uJaKSXc6BFIeuZW7iaJ.oLFFtW3LndxG', 10, '08065579109', '2022-01-27 12:40:48'),
(10, 'HAUWA`U', 'ALIYU', NULL, '0002152', 'aliu@yahoo.com', '$2y$10$NEj3tuBLno.E6E/yFEC3uea9wgkaauAY2Wr7aag3oSsSxo6m0qY3.', 12, '08066835426', '2022-01-27 12:45:07');

-- --------------------------------------------------------

--
-- Table structure for table `nationality`
--

CREATE TABLE `nationality` (
  `nation_id` int(5) NOT NULL,
  `nation` varchar(200) NOT NULL,
  `dumb` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nationality`
--

INSERT INTO `nationality` (`nation_id`, `nation`, `dumb`) VALUES
(1, 'Afghanistan', 'Afghanistan'),
(2, 'Albania', 'Albania'),
(3, 'Algeria', 'Algeria'),
(4, 'American Samoa', 'American Samoa'),
(5, 'Andorra', 'Andorra'),
(6, 'Angola', 'Angola'),
(7, 'Anguilla', 'Anguilla'),
(8, 'Antarctica', 'Antarctica'),
(9, 'Antigua and Barbuda', 'Antigua and Barbuda'),
(10, 'Argentina', 'Argentina'),
(11, 'Armenia', 'Armenia'),
(12, 'Aruba', 'Aruba'),
(13, 'Austria', 'Austria'),
(14, 'Australia', 'Australia'),
(15, 'Azerbaijan', 'Azerbaijan'),
(16, 'Bahamas', 'Bahamas'),
(17, 'Bahrain', 'Bahrain'),
(18, 'Bangladesh', 'Bangladesh'),
(19, 'Barbados', 'Barbados'),
(20, 'Belarus', 'Belarus'),
(21, 'Belgium', 'Belgium'),
(22, 'Belize', 'Belize'),
(23, 'Benin', 'Benin'),
(24, 'Bermuda', 'Bermuda'),
(25, 'Bhutan', 'Bhutan'),
(26, 'Bolivia', 'Bolivia'),
(27, 'Bosnia and Herzegovina', 'Bosnia and Herzegovina'),
(28, 'Botswana', 'Botswana'),
(29, 'Bouvet Island', 'Bouvet Island'),
(30, 'Brazil', 'Brazil'),
(31, 'British \r\n                        Indian Ocean Territory', 'British Indian Ocean Territory'),
(32, 'Brunei Darussalam', 'Brunei Darussalam'),
(33, 'Bulgaria', 'Bulgaria'),
(34, 'Burkina Faso', 'Burkina Faso'),
(35, 'Burundi', 'Burundi'),
(36, 'Cambodia', 'Cambodia'),
(37, 'Cameroon', 'Cameroon'),
(38, 'Canada', 'Canada'),
(39, 'Cape Verde', 'Cape Verde'),
(40, 'Cayman Islands', 'Cayman Islands'),
(41, 'Central African \r\n                        Republic', 'Central African Republic'),
(42, 'Chad', 'Chad'),
(43, 'Chile', 'Chile'),
(44, 'China', 'China'),
(45, 'Christmas Island', 'Christmas Island'),
(46, 'Cocos (Keeling) \r\n                        Islands', 'Cocos (Keeling) Islands'),
(47, 'Colombia', 'Colombia'),
(48, 'Comoros', 'Comoros'),
(49, 'Congo', 'Congo'),
(50, 'Cook Islands', 'Cook Islands'),
(51, 'Costa Rica', 'Costa Rica'),
(52, 'Croatia (Hrvatska)', 'Croatia (Hrvatska)'),
(53, 'Cuba', 'Cuba'),
(54, 'Cyprus', 'Cyprus'),
(55, 'Czech Republic', 'Czech Republic'),
(56, 'Czechoslovakia \r\n                        (former)', 'Czechoslovakia (former)'),
(57, 'Denmark', 'Denmark'),
(58, 'Djibouti', 'Djibouti'),
(59, 'Dominica', 'Dominica'),
(60, 'Dominican Republic', 'Dominican Republic'),
(61, 'East Timor', 'East Timor'),
(62, 'Ecuador', 'Ecuador'),
(63, 'Egypt', 'Egypt'),
(64, 'El Salvador', 'El Salvador'),
(65, 'Equatorial Guinea', 'Equatorial Guinea'),
(66, 'Eritrea', 'Eritrea'),
(67, 'Estonia', 'Estonia'),
(68, 'Ethiopia', 'Ethiopia'),
(69, 'Falkland Islands \r\n                        (Malvinas)', 'Falkland Islands (Malvinas)'),
(70, 'Faroe Islands', 'Faroe Islands'),
(71, 'Fiji', 'Fiji'),
(72, 'Finland', 'Finland'),
(73, 'France', 'France'),
(74, 'French Guiana', 'French Guiana'),
(75, 'French Polynesia', 'French Polynesia'),
(76, 'French Southern \r\n                        Territories', 'French Southern Territories'),
(77, 'Gabon', 'Gabon'),
(78, 'Gambia', 'Gambia'),
(79, 'Georgia', 'Georgia'),
(80, 'Germany', 'Germany'),
(81, 'Ghana', 'Ghana'),
(82, 'Gibraltar', 'Gibraltar'),
(83, 'Greece', 'Greece'),
(84, 'Greenland', 'Greenland'),
(85, 'Grenada', 'Grenada'),
(86, 'Guadeloupe', 'Guadeloupe'),
(87, 'Guam', 'Guam'),
(88, 'Guatemala', 'Guatemala'),
(89, 'Guinea', 'Guinea'),
(90, 'Guinea-Bissau', 'Guinea-Bissau'),
(91, 'Guyana', 'Guyana'),
(92, 'Haiti', 'Haiti'),
(93, 'Heard and McDonald \r\n                        Islands', 'Heard and McDonald Islands'),
(94, 'Honduras', 'Honduras'),
(95, 'Hong Kong', 'Hong Kong'),
(96, 'Hungary', 'Hungary'),
(97, 'Iceland', 'Iceland'),
(98, 'India', 'India'),
(99, 'Indonesia', 'Indonesia'),
(100, 'Iran', 'Iran'),
(101, 'Iraq', 'Iraq'),
(102, 'Ireland', 'Ireland'),
(103, 'Israel', 'Israel'),
(104, 'Italy', 'Italy'),
(105, 'Jamaica', 'Jamaica'),
(106, 'Japan', 'Japan'),
(107, 'Jordan', 'Jordan'),
(108, 'Kazakhstan', 'Kazakhstan'),
(109, 'Kenya', 'Kenya'),
(110, 'Kiribati', 'Kiribati'),
(111, 'Korea (North)', 'Korea (North)'),
(112, 'Korea (South)', 'Korea (South)'),
(113, 'Kuwait', 'Kuwait'),
(114, 'Kyrgyzstan', 'Kyrgyzstan'),
(115, 'Laos', 'Laos'),
(116, 'Latvia', 'Latvia'),
(117, 'Lebanon', 'Lebanon'),
(118, 'Lesotho', 'Lesotho'),
(119, 'Liberia', 'Liberia'),
(120, 'Libya', 'Libya'),
(121, 'Liechtenstein', 'Liechtenstein'),
(122, 'Lithuania', 'Lithuania'),
(123, 'Luxembourg', 'Luxembourg'),
(124, 'Macau', 'Macau'),
(125, 'Macedonia', 'Macedonia'),
(126, 'Madagascar', 'Madagascar'),
(127, 'Malawi', 'Malawi'),
(128, 'Malaysia', 'Malaysia'),
(129, 'Maldives', 'Maldives'),
(130, 'Mali', 'Mali'),
(131, 'Malta', 'Malta'),
(132, 'Marshall Islands', 'Marshall Islands'),
(133, 'Martinique', 'Martinique'),
(134, 'Mauritania', 'Mauritania'),
(135, 'Mauritius', 'Mauritius'),
(136, 'Mayotte', 'Mayotte'),
(137, 'Mexico', 'Mexico'),
(138, 'Micronesia', 'Micronesia'),
(139, 'Moldova', 'Moldova'),
(140, 'Monaco', 'Monaco'),
(141, 'Mongolia', 'Mongolia'),
(142, 'Montserrat', 'Montserrat'),
(143, 'Morocco', 'Morocco'),
(144, 'Mozambique', 'Mozambique'),
(145, 'Myanmar', 'Myanmar'),
(146, 'Namibia', 'Namibia'),
(147, 'Nauru', 'Nauru'),
(148, 'Nepal', 'Nepal'),
(149, 'Netherlands', 'Netherlands'),
(150, 'Netherlands Antilles', 'Netherlands Antilles'),
(151, 'Neutral Zone', 'Neutral Zone'),
(152, 'New Caledonia', 'New Caledonia'),
(153, 'New Zealand (Aotearoa)', 'New Zealand (Aotearoa)'),
(154, 'Nicaragua', 'Nicaragua'),
(155, 'Niger', 'Niger'),
(156, 'Nigeria', 'Nigeria'),
(157, 'Niue', 'Niue'),
(158, 'Norfolk Island', 'Norfolk Island'),
(159, 'Northern Mariana \r\n                        Islands', 'Northern Mariana Islands'),
(160, 'Norway', 'Norway'),
(161, 'Oman', 'Oman'),
(162, 'Pakistan', 'Pakistan'),
(163, 'Palau', 'Palau'),
(164, 'Panama', 'Panama'),
(165, 'Papua New Guinea', 'Papua New Guinea'),
(166, 'Paraguay', 'Paraguay'),
(167, 'Peru', 'Peru'),
(168, 'Philippines', 'Philippines'),
(169, 'Pitcairn', 'Pitcairn'),
(170, 'Poland', 'Poland'),
(171, 'Portugal', 'Portugal'),
(172, 'Puerto Rico', 'Puerto Rico'),
(173, 'Qatar', 'Qatar'),
(174, 'Reunion', 'Reunion'),
(175, 'Romania', 'Romania'),
(176, 'Russian Federation', 'Russian Federation'),
(177, 'Rwanda', 'Rwanda'),
(178, 'Saint Kitts and \r\n                        Nevis', 'Saint Kitts and Nevis'),
(179, 'Saint Lucia', 'Saint Lucia'),
(180, 'Saint \r\n                        Vincent and the Grenadines', 'Saint Vincent and the Grenadines'),
(181, 'Samoa', 'Samoa'),
(182, 'San Marino', 'San Marino'),
(183, 'Sao Tome and Principe', 'Sao Tome and Principe'),
(184, 'Saudi Arabia', 'Saudi Arabia'),
(185, 'Senegal', 'Senegal'),
(186, 'Seychelles', 'Seychelles'),
(187, 'Sierra Leone', 'Sierra Leone'),
(188, 'Singapore', 'Singapore'),
(189, 'Solomon Islands', 'Solomon Islands'),
(190, 'Somalia', 'Somalia'),
(191, 'South Africa', 'South Africa'),
(192, 'South \r\n                        Georgia & South Sandwich Isls.', 'South Georgia and South Sandwich Isls.'),
(193, 'Slovak Republic', 'Slovak Republic'),
(194, 'Slovenia', 'Slovenia'),
(195, 'Spain', 'Spain'),
(196, 'Sri Lanka', 'Sri Lanka'),
(197, 'St. Helena', 'St. Helena'),
(198, 'St. Pierre and \r\n                        Miquelon', 'St. Pierre and Miquelon'),
(199, 'Sudan', 'Sudan'),
(200, 'Suriname', 'Suriname'),
(201, 'Svalbard \r\n                        and Jan Mayen Islands', 'Svalbard and Jan Mayen Islands'),
(202, 'Swaziland', 'Swaziland'),
(203, 'Sweden', 'Sweden'),
(204, 'Switzerland', 'Switzerland'),
(205, 'Syria', 'Syria'),
(206, 'Taiwan', 'Taiwan'),
(207, 'Tajikistan', 'Tajikistan'),
(208, 'Tanzania', 'Tanzania'),
(209, 'Thailand', 'Thailand'),
(210, 'Togo', 'Togo'),
(211, 'Trinidad and Tobago', 'Trinidad and Tobago'),
(212, 'Tokelau', 'Tokelau'),
(213, 'Tonga', 'Tonga'),
(214, 'Tunisia', 'Tunisia'),
(215, 'Turkey', 'Turkey'),
(216, 'Turkmenistan', 'Turkmenistan'),
(217, 'Turks and Caicos \r\n                        Islands', 'Turks and Caicos Islands'),
(218, 'Tuvalu', 'Tuvalu'),
(219, 'Uganda', 'Uganda'),
(220, 'Ukraine', 'Ukraine'),
(221, 'United Arab Emirate', 'United Arab Emirate'),
(222, 'United Kingdom', 'United Kingdom'),
(223, 'United States', 'United States'),
(224, 'Uruguay', 'Uruguay'),
(225, 'US Minor Outlying \r\n                        Islands', 'US Minor Outlying Islands'),
(226, 'USSR (former)', 'USSR (former)'),
(227, 'Uzbekistan', 'Uzbekistan'),
(228, 'Vatican \r\n                        City State (Holy See)', 'Vatican City State (Holy See)'),
(229, 'Vanuatu', 'Vanuatu'),
(230, 'Venezuela', 'Venezuela'),
(231, 'Viet Nam', 'Viet Nam'),
(232, 'Virgin Islands \r\n                        (British)', 'Virgin Islands (British)'),
(233, 'Virgin Islands (U.S.)', 'Virgin Islands (U.S.)'),
(234, 'Wallis and Futuna \r\n                        Islands', 'Wallis and Futuna Islands'),
(235, 'Western Sahara', 'Western Sahara'),
(236, 'Yemen', 'Yemen'),
(237, 'Yugoslavia', 'Yugoslavia'),
(238, 'Zaire', 'Zaire'),
(239, 'Zambia', 'Zambia'),
(240, 'Zimbabwe', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `ofield`
--

CREATE TABLE `ofield` (
  `of_id` int(100) NOT NULL,
  `ofield_name` varchar(255) NOT NULL,
  `of_prog` int(11) NOT NULL,
  `of_amount` varchar(10) NOT NULL,
  `of_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ofield`
--

INSERT INTO `ofield` (`of_id`, `ofield_name`, `of_prog`, `of_amount`, `of_status`) VALUES
(1, 'Hostel Accommodation', 0, '5000', 1),
(2, 'Convocation', 0, '15000', 1),
(3, 'Graduation Gown', 0, '22000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `olevels`
--

CREATE TABLE `olevels` (
  `o_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `subname` varchar(250) NOT NULL,
  `certname` varchar(50) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `eyear` varchar(4) NOT NULL,
  `emonth` varchar(5) NOT NULL,
  `sitting` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portalaccess`
--

CREATE TABLE `portalaccess` (
  `pid` int(11) NOT NULL,
  `appno` varchar(50) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `state` int(11) NOT NULL,
  `gsm` varchar(25) NOT NULL,
  `school` int(11) NOT NULL,
  `prog` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `stdtype` varchar(25) NOT NULL DEFAULT 'new',
  `status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `portal_status`
--

CREATE TABLE `portal_status` (
  `p_id` int(11) NOT NULL,
  `p_status` int(11) NOT NULL DEFAULT 0,
  `lr_status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `portal_status`
--

INSERT INTO `portal_status` (`p_id`, `p_status`, `lr_status`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `programme`
--

CREATE TABLE `programme` (
  `programme_id` int(100) NOT NULL,
  `programme_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programme`
--

INSERT INTO `programme` (`programme_id`, `programme_name`) VALUES
(1, 'CERTIFICATE'),
(2, 'DIPLOMA'),
(3, 'ND/HND');

-- --------------------------------------------------------

--
-- Table structure for table `programme_type`
--

CREATE TABLE `programme_type` (
  `programmet_id` int(100) NOT NULL,
  `programmet_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `programme_type`
--

INSERT INTO `programme_type` (`programmet_id`, `programmet_name`) VALUES
(1, 'Full Time');

-- --------------------------------------------------------

--
-- Table structure for table `remitapayment`
--

CREATE TABLE `remitapayment` (
  `id` int(11) NOT NULL,
  `rrr` varchar(50) NOT NULL,
  `channnel` varchar(50) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `transactiondate` varchar(20) NOT NULL,
  `debitdate` varchar(20) NOT NULL,
  `bank` varchar(100) NOT NULL,
  `branch` varchar(100) NOT NULL,
  `serviceTypeId` varchar(20) NOT NULL,
  `dateSent` varchar(20) NOT NULL,
  `dateRequested` varchar(20) NOT NULL,
  `orderRef` varchar(20) NOT NULL,
  `payerName` varchar(250) NOT NULL,
  `payerEmail` varchar(150) NOT NULL,
  `payerPhoneNumber` varchar(50) NOT NULL,
  `uniqueIdentifier` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `schoolinfo`
--

CREATE TABLE `schoolinfo` (
  `skid` int(11) NOT NULL,
  `schoolname` varchar(250) NOT NULL,
  `schoolabvname` varchar(25) NOT NULL,
  `schooladdress` text NOT NULL,
  `schoolemail` varchar(150) NOT NULL,
  `application_year` int(11) NOT NULL,
  `appsem` varchar(25) NOT NULL,
  `admdate` varchar(25) NOT NULL,
  `startreg` varchar(25) NOT NULL,
  `endreg` varchar(25) NOT NULL,
  `appstartdate` varchar(25) NOT NULL,
  `appenddate` varchar(25) NOT NULL,
  `appclosing` varchar(50) NOT NULL,
  `maq` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `schoolinfo`
--

INSERT INTO `schoolinfo` (`skid`, `schoolname`, `schoolabvname`, `schooladdress`, `schoolemail`, `application_year`, `appsem`, `admdate`, `startreg`, `endreg`, `appstartdate`, `appenddate`, `appclosing`, `maq`) VALUES
(1, 'Katsina State College of Health Sciences and Technology', 'COHESKAT', 'No. 165, IBB Way, adjacent to KEDCO (NEPA) Head Quarter, P.M.B. 2227 Katsina, Katsina State', 'coheskat@yahoo.com', 2021, 'First Semester', 'June 07, 2021', 'June 07, 2021', 'September 30, 2021', 'February 8, 2021', 'April 18, 2021', 'February 18, 2022 23:59:59', 'The registration for  the Returning students 2021/2022 session commences on August 02, 2021 and ends September 30, 2021. Late registration fees attracts N2000.');

-- --------------------------------------------------------

--
-- Table structure for table `splitreports`
--

CREATE TABLE `splitreports` (
  `id` int(11) NOT NULL,
  `t_date` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `trans_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `rrr` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'rrr',
  `realamt` float NOT NULL,
  `school` float NOT NULL,
  `consultant` float NOT NULL,
  `transcost` float NOT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `bank_id` int(11) NOT NULL,
  `bank_branch` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NA',
  `slipno` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'NA'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`state_id`, `state_name`) VALUES
(1, 'Abia'),
(2, 'Adamawa'),
(3, 'Akwa Ibom'),
(4, 'Anambra'),
(5, 'Bauchi'),
(6, 'Bayelsa'),
(7, 'Benue'),
(8, 'Borno'),
(9, 'Cross River'),
(10, 'Delta'),
(11, 'Ebonyi'),
(12, 'Edo'),
(13, 'Ekiti'),
(14, 'Enugu'),
(15, 'Gombe'),
(16, 'Imo'),
(17, 'Jigawa'),
(18, 'Kaduna'),
(19, 'Kano'),
(20, 'Katsina'),
(21, 'Kebbi'),
(22, 'Kogi'),
(23, 'Kwara'),
(24, 'Lagos'),
(25, 'Nasarawa'),
(26, 'Niger'),
(27, 'Ogun'),
(28, 'Ondo'),
(29, 'Osun'),
(30, 'Oyo'),
(31, 'Plateau'),
(32, 'Rivers'),
(33, 'Sokoto'),
(34, 'Taraba'),
(35, 'Yobe'),
(36, 'Zamfara'),
(37, 'FCT'),
(38, 'Foreign');

-- --------------------------------------------------------

--
-- Table structure for table `students_profile`
--

CREATE TABLE `students_profile` (
  `std_id` int(11) NOT NULL,
  `std_logid` int(11) NOT NULL,
  `matric_no` varchar(100) NOT NULL,
  `surname` varchar(100) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `othernames` varchar(100) DEFAULT NULL,
  `gender` varchar(6) NOT NULL,
  `marital_status` varchar(10) NOT NULL,
  `birthdate` date NOT NULL,
  `home_town` varchar(100) NOT NULL,
  `local_gov` varchar(100) NOT NULL,
  `state_of_origin` int(11) NOT NULL,
  `nationality` varchar(100) NOT NULL,
  `contact_address` varchar(255) NOT NULL,
  `student_email` varchar(100) NOT NULL,
  `student_mobiletel` varchar(12) NOT NULL,
  `next_of_kin` varchar(150) NOT NULL,
  `nok_address` varchar(255) NOT NULL,
  `nok_tel` varchar(12) NOT NULL,
  `stdprogramme_id` int(11) NOT NULL,
  `stdfaculty_id` int(11) NOT NULL,
  `stddepartment_id` int(11) NOT NULL,
  `stdcourse` int(11) NOT NULL,
  `std_custome1` int(11) NOT NULL,
  `std_custome2` varchar(10) NOT NULL,
  `std_custome3` varchar(10) NOT NULL,
  `std_custome4` varchar(50) NOT NULL,
  `std_custome13` varchar(25) NOT NULL,
  `std_custome15` tinyint(4) NOT NULL DEFAULT 0,
  `std_custome19` varchar(25) NOT NULL,
  `accessdetails_no` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students_profile`
--

INSERT INTO `students_profile` (`std_id`, `std_logid`, `matric_no`, `surname`, `firstname`, `othernames`, `gender`, `marital_status`, `birthdate`, `home_town`, `local_gov`, `state_of_origin`, `nationality`, `contact_address`, `student_email`, `student_mobiletel`, `next_of_kin`, `nok_address`, `nok_tel`, `stdprogramme_id`, `stdfaculty_id`, `stddepartment_id`, `stdcourse`, `std_custome1`, `std_custome2`, `std_custome3`, `std_custome4`, `std_custome13`, `std_custome15`, `std_custome19`, `accessdetails_no`) VALUES
(2, 6, '0000821', 'USMAN', 'MAMUDA', NULL, 'Male', 'Married', '2022-01-26', 'owo', 'Bakori', 20, 'Nigeria', 'owo', 'owo@yahoo.com', '07069491035', 'owo', 'owo', '08025858747', 2, 2, 10, 18, 2, '2022', ' ', '6220127093230.jpg', '27-Jan-2022', 1, 'new', '0000821'),
(3, 7, '0003505', 'MUAWIYA', 'ILIYASU', NULL, 'Male', 'Single', '2022-01-13', 'Imo', 'Bakori', 20, 'Nigeria', 'no 88 imo street', 'mua@yahoo.com', '08063327410', 'Mr fred', 'No 88', '08025878784', 2, 1, 2, 5, 1, '2022', ' ', '7220127100156.jpg', '27-Jan-2022', 1, 'new', '0003505'),
(4, 8, '0002244', 'ABUBAKAR', 'SALISU', 'SADIQ', 'Male', 'Single', '2012-02-16', 'Emira', '416', 20, 'Nigeria', 'No 88 Cat Street, Asaba, Delta State', 'sadiq@yahoo.com', '09095989669', 'Peter Alfred', 'No 88 Cat Street, Asaba, Delta State', '08025858747', 3, 1, 2, 4, 1, '2022', ' ', '8220127123709.jpg', '27-Jan-2022', 1, 'new', '0002244'),
(5, 9, '0003364', 'SULAIMAN', 'IMAM', 'USMAN', 'Female', 'Married', '2022-01-26', 'Usman', '93', 5, 'Nigeria', 'No 88 Usman Avenue, Lagos', 'usman@yahoo.com', '08065579109', 'Alhaji Usman', 'No 88 Usman Avenue, Lagos', '08025878747', 2, 2, 5, 10, 2, '2022', ' ', '9220127124048.jpg', '27-Jan-2022', 1, 'new', '0003364'),
(6, 10, '0002152', 'HAUWA`U', 'ALIYU', NULL, 'Male', 'Single', '2022-01-28', 'Aliyu', '420', 20, 'Nigeria', 'No 90 Remi Street, Ibadan', 'aliu@yahoo.com', '08066835426', 'Aliyu Baba', 'No 90 Remi Street, Ibadan', '08025252525', 3, 2, 5, 12, 1, '2022', ' ', '10220127124507.jpg', '27-Jan-2022', 1, 'new', '0002152');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `subjectcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subjectname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subjectcode`, `subjectname`) VALUES
(1, 'ENG', 'ENGLISH LANGUAGE'),
(2, 'MATH', 'MATHEMATICS'),
(3, 'CHEM', 'CHEMISTRY'),
(4, 'BIO', 'BIOLOGY'),
(5, 'PHY', 'PHYSICS'),
(6, 'GEO', 'GEOGRAPHY'),
(7, 'ECONS', 'ECONOMICS'),
(8, 'AGRIC', 'AGRICULTURAL SCIENCES'),
(9, 'AH', 'ANIMAL HUSBANDRY'),
(10, 'CVED', 'CIVIC EDUCATION'),
(11, 'HS', 'HEALTH SCIENCES'),
(12, 'TD', 'TECHNICAL DRAWING'),
(13, 'HAUSA', 'HAUSA'),
(14, 'IRK', 'ISLAMIC RELIGIOUS KNOWLEDGE');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trans_id` int(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `trans_name` text NOT NULL,
  `trans_no` varchar(255) NOT NULL,
  `user_department` varchar(255) NOT NULL,
  `user_faculty` varchar(255) NOT NULL,
  `trans_amount` varchar(100) NOT NULL,
  `generated_date` datetime NOT NULL,
  `trans_date` datetime NOT NULL,
  `t_date` date NOT NULL,
  `trans_semester` varchar(100) NOT NULL,
  `trans_year` varchar(100) NOT NULL,
  `trans_custom1` varchar(255) NOT NULL,
  `trans_custom3` varchar(255) NOT NULL,
  `trans_custom4` varchar(5) NOT NULL,
  `trans_custom7` varchar(255) NOT NULL,
  `trans_custom8` varchar(255) NOT NULL,
  `trans_custom10` varchar(255) NOT NULL,
  `trans_custom11` varchar(255) NOT NULL,
  `trans_custom12` varchar(255) NOT NULL,
  `trans_custom14` varchar(255) NOT NULL,
  `trans_custom15` varchar(255) NOT NULL,
  `trans_custom17` varchar(255) NOT NULL,
  `trans_custom19` int(5) NOT NULL,
  `trans_custom20` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `user_id`, `trans_name`, `trans_no`, `user_department`, `user_faculty`, `trans_amount`, `generated_date`, `trans_date`, `t_date`, `trans_semester`, `trans_year`, `trans_custom1`, `trans_custom3`, `trans_custom4`, `trans_custom7`, `trans_custom8`, `trans_custom10`, `trans_custom11`, `trans_custom12`, `trans_custom14`, `trans_custom15`, `trans_custom17`, `trans_custom19`, `trans_custom20`) VALUES
(1, '10', 'Examination Fee', '300613173678', '5', '2', '5000', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 3, '300613173678'),
(2, '10', 'Clinic', '300613173678', '5', '2', '1000', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 6, '300613173678'),
(3, '10', 'Caution Fee', '300613173678', '5', '2', '500', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 7, '300613173678'),
(4, '10', 'Practical Supervision Fee', '300613173678', '5', '2', '1000', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 8, '300613173678'),
(5, '10', 'Library Fee', '300613173678', '5', '2', '500', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 9, '300613173678'),
(6, '10', 'SUG Fee', '300613173678', '5', '2', '300', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 10, '300613173678'),
(7, '10', 'MSSN Fee', '300613173678', '5', '2', '300', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 11, '300613173678'),
(8, '10', 'Log Book Fee', '300613173678', '5', '2', '1000', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 12, '300613173678'),
(9, '10', 'Student Hand Book Fee', '300613173678', '5', '2', '600', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 13, '300613173678'),
(10, '10', 'Late Registration Fee', '300613173678', '5', '2', '2000', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 17, '300613173678'),
(11, '10', 'ICT Fee', '300613173678', '5', '2', '1000', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 18, '300613173678'),
(12, '10', 'Games', '300613173678', '5', '2', '500', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 5, '300613173678'),
(13, '10', 'Central Registration Fee', '300613173678', '5', '2', '5000', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 2, '300613173678'),
(14, '10', 'ID Card', '300613173678', '5', '2', '500', '2022-02-03 08:38:34', '2022-02-03 08:38:34', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 4, '300613173678'),
(15, '10', 'Examination Fee', '110613175384', '5', '2', '5000', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 3, '110613175384'),
(16, '10', 'Clinic', '110613175384', '5', '2', '1000', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 6, '110613175384'),
(17, '10', 'Caution Fee', '110613175384', '5', '2', '500', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 7, '110613175384'),
(18, '10', 'Practical Supervision Fee', '110613175384', '5', '2', '1000', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 8, '110613175384'),
(19, '10', 'Library Fee', '110613175384', '5', '2', '500', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 9, '110613175384'),
(20, '10', 'SUG Fee', '110613175384', '5', '2', '300', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 10, '110613175384'),
(21, '10', 'MSSN Fee', '110613175384', '5', '2', '300', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 11, '110613175384'),
(22, '10', 'Log Book Fee', '110613175384', '5', '2', '1000', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 12, '110613175384'),
(23, '10', 'Student Hand Book Fee', '110613175384', '5', '2', '600', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 13, '110613175384'),
(24, '10', 'Late Registration Fee', '110613175384', '5', '2', '2000', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 17, '110613175384'),
(25, '10', 'ICT Fee', '110613175384', '5', '2', '1000', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 18, '110613175384'),
(26, '10', 'Games', '110613175384', '5', '2', '500', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 5, '110613175384'),
(27, '10', 'Central Registration Fee', '110613175384', '5', '2', '5000', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 2, '110613175384'),
(28, '10', 'ID Card', '110613175384', '5', '2', '500', '2022-02-03 09:10:40', '2022-02-03 09:10:40', '2022-02-03', 'First Semester', '2021', 'Paid', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 4, '110613175384'),
(29, '10', 'Examination Fee', '310613509412', '5', '2', '5000', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 3, '310613509412'),
(30, '10', 'Clinic', '310613509412', '5', '2', '1000', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 6, '310613509412'),
(31, '10', 'Caution Fee', '310613509412', '5', '2', '500', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 7, '310613509412'),
(32, '10', 'Practical Supervision Fee', '310613509412', '5', '2', '1000', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 8, '310613509412'),
(33, '10', 'Library Fee', '310613509412', '5', '2', '500', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 9, '310613509412'),
(34, '10', 'SUG Fee', '310613509412', '5', '2', '300', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 10, '310613509412'),
(35, '10', 'MSSN Fee', '310613509412', '5', '2', '300', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 11, '310613509412'),
(36, '10', 'Log Book Fee', '310613509412', '5', '2', '1000', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 12, '310613509412'),
(37, '10', 'Student Hand Book Fee', '310613509412', '5', '2', '600', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 13, '310613509412'),
(38, '10', 'Late Registration Fee', '310613509412', '5', '2', '2000', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 17, '310613509412'),
(39, '10', 'ICT Fee', '310613509412', '5', '2', '1000', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 18, '310613509412'),
(40, '10', 'Games', '310613509412', '5', '2', '500', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 5, '310613509412'),
(41, '10', 'Central Registration Fee', '310613509412', '5', '2', '5000', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 2, '310613509412'),
(42, '10', 'ID Card', '310613509412', '5', '2', '500', '2022-02-04 10:15:00', '2022-02-04 10:15:00', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'fees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 4, '310613509412'),
(43, '10', 'Hostel Accommodation', '320613537566', '5', '2', '5000', '2022-02-04 12:44:06', '2022-02-04 12:44:06', '2022-02-04', 'First Semester', '2021', 'Paid', '1', 'ofees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 1, '320613537566'),
(44, '10', 'Convocation', '320613537590', '5', '2', '15000', '2022-02-04 12:44:20', '2022-02-04 12:44:20', '2022-02-04', 'First Semester', '2021', 'Pending', '1', 'ofees', '3', 'HAUWA`U ALIYU ', 'ND/HND ENVIRONMENTAL HEALTH TECHNOLOGIST (ND/HND EHT) ', 'KANKIYA IRO SCHOOL OF HEALTH TECHNOLOGY KANKIA', 'ENVIRONMENTAL HEALTH', '0002152', 'Remita', 'aliu@yahoo.com', 2, '320613537590');

-- --------------------------------------------------------

--
-- Table structure for table `transactiontotal`
--

CREATE TABLE `transactiontotal` (
  `trans_id` int(20) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `trans_name` text NOT NULL,
  `trans_no` varchar(255) NOT NULL,
  `user_department` varchar(255) NOT NULL,
  `user_faculty` varchar(255) NOT NULL,
  `trans_amount` varchar(100) NOT NULL,
  `generated_date` datetime NOT NULL,
  `trans_date` datetime NOT NULL,
  `t_date` date NOT NULL,
  `expdate` date NOT NULL,
  `trans_semester` varchar(100) NOT NULL,
  `trans_year` varchar(100) NOT NULL,
  `trans_custom1` varchar(255) NOT NULL,
  `trans_custom2` varchar(255) NOT NULL,
  `trans_custom3` varchar(255) NOT NULL,
  `trans_custom4` varchar(255) NOT NULL,
  `trans_custom5` varchar(255) NOT NULL,
  `trans_custom6` varchar(255) NOT NULL,
  `trans_custom7` varchar(255) NOT NULL,
  `trans_custom8` varchar(255) NOT NULL,
  `trans_custom9` varchar(255) NOT NULL,
  `trans_custom10` varchar(255) NOT NULL,
  `trans_custom11` varchar(255) NOT NULL,
  `trans_custom12` varchar(255) NOT NULL,
  `trans_custom13` varchar(255) NOT NULL,
  `trans_custom14` varchar(255) NOT NULL,
  `trans_custom15` varchar(255) NOT NULL,
  `trans_custom16` varchar(255) NOT NULL,
  `trans_custom17` varchar(255) NOT NULL,
  `trans_custom18` int(2) NOT NULL,
  `trans_custom19` int(5) NOT NULL,
  `trans_custom20` varchar(255) NOT NULL,
  `trans_custom21` int(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaction_app`
--

CREATE TABLE `transaction_app` (
  `trans_id` int(20) NOT NULL,
  `log_id` int(11) NOT NULL,
  `fee_name` varchar(150) NOT NULL,
  `trans_no` varchar(255) NOT NULL,
  `fee_amount` varchar(7) NOT NULL,
  `generated_date` datetime NOT NULL,
  `trans_date` datetime NOT NULL,
  `t_date` date NOT NULL,
  `trans_year` varchar(100) NOT NULL,
  `trans_custom1` varchar(10) NOT NULL DEFAULT 'Pending',
  `fullnames` varchar(255) NOT NULL,
  `appno` varchar(255) NOT NULL,
  `paychannel` varchar(6) NOT NULL DEFAULT 'Remita',
  `semail` varchar(255) NOT NULL,
  `rrr` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `useremail` varchar(128) NOT NULL,
  `userphone` varchar(24) NOT NULL,
  `dt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `useremail`, `userphone`, `dt`) VALUES
(1, 'Zaid Khalid', 'zaid@gmail.com', '876-564-6544', '2019-02-12 10:22:25'),
(2, 'Usman', 'usman@gmail.com', '887-655-8745', '2019-02-12 10:22:43'),
(3, 'Jhon', 'jhon@gmail.com', '878-874-6523', '2019-02-12 10:22:57'),
(4, 'Zohaib', 'zohaib@gmail.com', '878-652-6985', '2019-02-12 10:23:20'),
(5, 'Akram', 'akram@gmail.com', '324-985-3214', '2019-02-12 10:23:36'),
(6, 'Aslam', 'aslam@gmail.com', '777-874-8569', '2019-02-12 10:23:56'),
(7, 'Daood', 'daood@gmail.com', '666-123-541j', '2019-02-12 10:24:19'),
(8, 'Henary', 'henary@gmail.com', '234-236-1254', '2019-02-12 10:32:48'),
(9, 'Mark Jhon', 'mjhon@gmail.com', '324-569-3652', '2019-02-12 10:33:06');

-- --------------------------------------------------------

--
-- Table structure for table `_current_session`
--

CREATE TABLE `_current_session` (
  `cs_id` int(11) NOT NULL,
  `cs_session` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `prog_id` int(2) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_current_session`
--

INSERT INTO `_current_session` (`cs_id`, `cs_session`, `start_date`, `end_date`, `prog_id`, `status`) VALUES
(1, 2020, '2020-10-19', '2020-12-31', 2, 'ended'),
(11, 2021, '0000-00-00', '0000-00-00', 2, 'current');

-- --------------------------------------------------------

--
-- Table structure for table `_logs`
--

CREATE TABLE `_logs` (
  `e_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `regno` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `_logs`
--

INSERT INTO `_logs` (`e_id`, `name`, `regno`) VALUES
(1, 'NAFISA BISHIR MASHI', 'SHTD/20/DHT/0596'),
(2, 'NAFISA TIJJANI', 'SHTD/20/HIM/0597'),
(3, 'NA\'IMA ABDULLAHI', 'SHTD/20/DHT/0598'),
(4, 'ABUBAKAR SURAJO NIL', 'SHTK/20/DHPE/0599'),
(5, 'MURTALA HARUNA .', 'SHTK/20/MLT/0601'),
(6, 'SURAJO IBRAHIM', 'SHTK/20/EVT/0610'),
(7, 'HAJARA GAMBO', 'SHTD/20/HIM/0620'),
(8, 'SHAMSU IDRIS', 'SHTD/20/DHT/0624'),
(9, 'BALA ALIYU', 'SHTD/20/DHT/0629'),
(10, 'FIDDAUSI AMINU', 'SHTK/20/DHPE/0631'),
(11, 'AISHA AMINU', 'SHTD/20/HIM/0632'),
(12, 'SAIFULLAHI SALISU', 'SHTD/20/DHT/0638'),
(13, 'ABDULRAHMAN AWWAL', 'SHTD/20/CHEW/0639'),
(14, 'NAZIFI YUSHAU NAZIFIYUSHAU10@GMAIL.COM', 'SHTD/20/DHT/0689'),
(15, 'HADIZA LAWAL BATURE', 'SHTD/20/DHT/0692'),
(16, 'USMAN GARBA', 'SHTD/20/DHT/0695'),
(17, 'AISHA KABIR DANDUME', 'SHTK/20/PT/0700'),
(18, 'SAFIYYA NASIR MAMMAN', 'SHTD/20/DT/0702'),
(19, 'ZAINAB LAWAL MUHAMMAD', 'SHTD/20/HIM/0703'),
(20, 'RUKAYYA ABDULLAHI', 'SHTK/20/DHPE/0707'),
(21, 'IBRAHIM MUSTAPHA', 'SHTD/20/JCHEW/0708'),
(22, 'AMINU ABDULRAHMAN', 'SHTK/20/PT/0708'),
(23, 'MUHAMMAD SHUAIBU', 'SHTK/20/CHEW/0715'),
(24, 'NURADDINI ABUBAKAR', 'SHTK/20/CHEW/0718'),
(25, 'MUJITTAFA USMAN', 'SHTD/20/RE-CHEW/0730'),
(26, 'ABUBAKAR ISYAKU', 'SHTK/20/DHPE/0767'),
(27, 'HALIMA RABIU ABUBAKAR', 'SHTD/20/CHEW/0768'),
(28, 'SUMAYYA AHMAD -', 'SHTD/20/DHT/0771'),
(29, 'MARYAM MUHAMMAD KHAMIS', 'SHTD/20/HIM/0777'),
(30, 'AMINA SHUAIBU', 'SHTK/20/PT/0777'),
(31, 'ABUBAKAR NURA', 'SHTK/20/JCHEW/0779'),
(32, 'AMINA YUSUF AMMANI', 'SHTK/20/DHPE/0780'),
(33, 'ASMAU USMAN ALIYU', 'SHTK/20/CHEW/0781'),
(34, 'SHAMSU NURA', 'SHTK/20/EHA/0784'),
(35, 'FATIMA MUHAMMAD', 'SHTK/20/DHPE/0785'),
(36, 'HUSSAINA MUNTARI', 'SHTK/20/MLT/0787'),
(37, 'MUBARAK RABIU', 'SHTK/20/PT/0788'),
(38, 'YUNUSA KABIR', 'SHTK/20/RE-CHEW/0789'),
(39, 'SHAFAATU LAWAL', 'SHTD/20/CHEW/0790'),
(40, 'SALISU MANSIR', 'SHTK/20/MLT/0791'),
(41, 'ABDURRAHMAN MUSTAFA SULEIMAN', 'SHTK/20/PT/0792'),
(42, 'NAJIB SANI', 'SHTD/20/RE-CHEW/0793'),
(43, 'FATIMA USMAN S/KASA', 'SHTK/20/RE-CHEW/0799'),
(44, 'AISHA LAWAL ABDU', 'SHTK/20/CHEW/0800'),
(45, 'FIDDAUSI AHMED', 'SHTK/20/JCHEW/0801'),
(46, 'AMINA SALISU AHMAD', 'SHTK/20/DHPE/0802'),
(47, 'HASSAN  GALI', 'SHTK/20/PT/0803'),
(48, 'FATIMA IDRIS .', 'SHTD/20/CHEW/0804'),
(49, 'UMAR ALIYU', 'SHTK/20/NDHND-EHT/0805'),
(50, 'ASMAU MUSTAPHA', 'SHTK/20/CHEW/0806'),
(51, 'ABDULHAKIM SHUAIBU', 'SHTK/20/DHPE/0807'),
(52, 'HALIMA UMAR JEME', 'SHTD/20/HIM/0808'),
(53, 'BELLO NURA', 'SHTK/20/DHPE/0808'),
(54, 'USMAN ABDULKARIM', 'SHTK/20/DHPE/0809'),
(55, 'RUMAISA\'U ABBAS', 'SHTD/20/DHT/0810'),
(56, 'AHMADU SADISU', 'SHTK/20/DHPE/0811'),
(57, 'NA\'IM HASSAN', 'SHTK/20/PT/0813'),
(58, 'FATIMA MAMMAN SIYA', 'SHTD/20/DHT/0815'),
(59, 'ABUBAKAR SABIU', 'SHTK/20/EVT/0816'),
(60, 'AUWALU HARUNA', 'SHTD/20/JCHEW/0817'),
(61, 'FAUZIYYA IBRAHIM', 'SHTK/20/NDHND-EHT/0818'),
(62, 'NAZIRU HASSAN', 'SHTD/20/DHT/0828'),
(63, 'UMAR KABIR ABUBAKAR', 'SHTD/20/CHEW/0831'),
(64, 'HABIBA TUKUR', 'SHTK/20/DHPE/0835'),
(65, 'HALIMA ABDULLAHI', 'SHTK/20/EHA/0836'),
(66, 'AMINA ABDULLAHI RUNKA', 'SHTK/20/DHPE/0842'),
(67, 'SUWAIBA HUSSAIN NUHU', 'SHTK/20/EHA/0843'),
(68, 'FIDDAUSI ISAH', 'SHTD/20/DT/0846'),
(69, 'RAHINATU ALIYU', 'SHTK/20/EHA/0854'),
(70, 'FATIMA UMAR LAWAL', 'SHTK/20/JCHEW/0861'),
(71, 'UMAR ALIYU .', 'SHTK/20/PT/0862'),
(72, 'ABUBAKAR MUHAMMAD KAITA', 'SHTD/20/HIM/0863'),
(73, 'NASIRU  MUSA', 'SHTD/20/DT/0866'),
(74, 'ZINATU SHEHU', 'SHTK/20/DHPE/0876'),
(75, 'ABUBAKAR JABIR USMAN', 'SHTD/20/HIM/0876'),
(76, 'SAGIR ISYAKU', 'SHTD/20/HIM/0877'),
(77, 'MUZAMILU SANI', 'SHTK/20/DHPE/0880'),
(78, 'OSAKU CHIDIMMA', 'SHTK/20/DHPE/0879'),
(79, 'SAFIYA SANI FAGO', 'SHTD/20/HIM/0880'),
(80, 'AISHA USMAN UMAR', 'SHTK/20/JCHEW/0882'),
(81, 'JAMILA YAHAYA', 'SHTK/20/EVT/0883'),
(82, 'AISHA UMAR', 'SHTK/20/EVT/0884'),
(83, 'ZAINAB ISAH ALI', 'SHTK/20/CHEW/0886'),
(84, 'AMINU AHMED', 'SHTK/20/EVT/0887'),
(85, 'MARYAM SANI SANDAMU', 'SHTD/20/HIM/0890'),
(86, 'AISHA SANI SANDAMU', 'SHTD/20/DHT/0891'),
(87, 'RUKAYYA SAIDU TAFIDA', 'SHTK/20/RE-CHEW/0895'),
(88, 'AISHA IDRIS', 'SHTK/20/MLT/0897'),
(89, 'SAMINU SADI IDRIS', 'SHTK/20/PT/0901'),
(90, 'SAFIYA AHMAD SANI', 'SHTK/20/PT/0903'),
(91, 'FATIMA ABUBAKAR ALHAJI', 'SHTK/20/CHEW/0904'),
(92, 'ZAINAB JIBRIN', 'SHTK/20/JCHEW/0905'),
(93, 'BARIRIA USMAN IBRAHIM', 'SHTK/20/DHPE/0906'),
(94, 'MARYAM SAMINU MATAZU', 'SHTD/20/DT/0910'),
(95, 'ABDULLAHI HAUWAU WADA', 'SHTK/20/PT/0912'),
(96, 'AMINU ISAH', 'SHTD/20/HIM/0913'),
(97, 'KHADIJA SANUSI', 'SHTD/20/HIM/0914'),
(98, 'KHADIJA KABIR', 'SHTD/20/DHT/0917'),
(99, 'IBRAHIM MAARUF', 'SHTD/20/DT/0919'),
(100, 'ZAHARADDEN ZAKARIYYA', 'SHTK/20/EVT/0920'),
(101, 'MARYAM IBRAHIM USMAN', 'SHTK/20/CHEW/0920'),
(102, 'AMINA IDRIS BALARABE', 'SHTK/20/CHEW/0922'),
(103, 'BILKISU WADA ABDULLAHI', 'SHTK/20/MLT/0923'),
(104, 'TASIU USMAN MUHAMMAD', 'SHTK/20/DHPE/0924'),
(105, 'ZABBA\'U HALIRU', 'SHTK/20/DHPE/0930'),
(106, 'HADIZA HARUNA ILIYASU', 'SHTD/20/JCHEW/0931'),
(107, 'BISHIR RAYYANU', 'SHTK/20/DHPE/0932'),
(108, 'FATIMA AHMAD', 'SHTK/20/JCHEW/0933'),
(109, 'HABASIYYA AMINU', 'SHTK/20/EVT/0935'),
(110, 'ABUBAKAR MUHAMMED RABIU', 'SHTD/20/DHT/0935'),
(111, 'ASIYA HARUNA', 'SHTK/20/EHA/0937'),
(112, 'HALIMATU HARUNA', 'SHTK/20/NDHND-EHT/0938'),
(113, 'YAHAYA BUHARI', 'SHTK/20/NDHND-EHT/0940'),
(114, 'UMAR HALLIRU', 'SHTK/20/EVT/0944'),
(115, 'MARYAM YUNUSA', 'SHTK/20/CHEW/0945'),
(116, 'RAMLAH AL AHADA', 'SHTK/20/DHPE/0946'),
(117, 'MANSIR SANI', 'SHTD/20/JCHEW/0947'),
(118, 'RAHANATU AHMADU ABUBAKAR', 'SHTK/20/MLT/0717'),
(119, 'NURA LAWAL', 'SHTK/20/EVT/0950'),
(120, 'AISHA SIRAJO', 'SHTD/20/JCHEW/0951'),
(121, 'FIDDAUSI IBRAHIM', 'SHTD/20/DHT/0952'),
(122, 'ALIYU SULAIMAN', 'SHTK/20/DHPE/0953'),
(123, 'ALIYU HAMISU', 'SHTK/20/CHEW/0954'),
(124, 'SHAMSU AMINU BATURE', 'SHTK/20/PT/0955'),
(125, 'FATIMA SULAIMAN BAKO', 'SHTD/20/CHEW/0956'),
(126, 'DAUDA DAUDA JIBRIN', 'SHTK/20/MLT/0957'),
(127, 'SAFIYYA AHMAD TODI', 'SHTD/20/CHEW/0958'),
(128, 'NAJA\'ATU SHA\'AIBU', 'SHTK/20/JCHEW/0960'),
(129, 'SHAMSU ABUBAKAR', 'SHTK/20/JCHEW/0961'),
(130, 'MUFIDATU ABUBAKAR', 'SHTK/20/DHPE/0962'),
(131, 'HABIBA ABBA', 'SHTK/20/EHA/0962'),
(132, 'HAUWAU AHMAD BABAJO', 'SHTK/20/PT/0964'),
(133, 'ASIYA MUSA BARAU', 'SHTK/20/RE-CHEW/0965'),
(134, 'UMAR ABUBAKAR KUNTARU', 'SHTK/20/DHPE/0966'),
(135, 'FURERA ABDULMALIK', 'SHTK/20/CHEW/0967'),
(136, 'SHUKURANA YAHAYA RUNKA', 'SHTK/20/DHPE/0968'),
(137, 'USMAN IBRAHIM ILIYA', 'SHTK/20/PT/0970'),
(138, 'JAMILA ABDULLAHI', 'SHTK/20/EHA/0971'),
(139, 'SHAMSUDDEEN BELLO', 'SHTD/20/CHEW/0971'),
(140, 'ABUBAKAR DAHIRU SADAQATA', 'SHTK/20/EVT/0739'),
(141, 'ABUBAKAR SHEHU', 'SHTD/20/CHEW/0973'),
(142, 'ADAMU HASHIM BINONI', 'SHTK/20/NDHND-EHT/0741'),
(143, 'FATIMA SURAJO', 'SHTK/20/EVT/0742'),
(144, 'FATIMA YUSUF', 'SHTD/20/CHEW/0743');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `application_profile`
--
ALTER TABLE `application_profile`
  ADD PRIMARY KEY (`std_id`),
  ADD UNIQUE KEY `matric_no` (`app_no`),
  ADD UNIQUE KEY `std_logid` (`std_logid`),
  ADD KEY `stdcourse` (`stdcourse`);

--
-- Indexes for table `applogin`
--
ALTER TABLE `applogin`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `log_email` (`log_email`),
  ADD KEY `log_username` (`log_username`);

--
-- Indexes for table `app_current_session`
--
ALTER TABLE `app_current_session`
  ADD PRIMARY KEY (`cs_id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `degree`
--
ALTER TABLE `degree`
  ADD PRIMARY KEY (`degree_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`departments_id`);

--
-- Indexes for table `dept_options`
--
ALTER TABLE `dept_options`
  ADD PRIMARY KEY (`do_id`),
  ADD KEY `dept_id` (`dept_id`);

--
-- Indexes for table `eduhistory`
--
ALTER TABLE `eduhistory`
  ADD PRIMARY KEY (`eh_id`);

--
-- Indexes for table `exam_officers`
--
ALTER TABLE `exam_officers`
  ADD PRIMARY KEY (`examofficer_id`);

--
-- Indexes for table `expirydate`
--
ALTER TABLE `expirydate`
  ADD PRIMARY KEY (`expid`);

--
-- Indexes for table `faculties`
--
ALTER TABLE `faculties`
  ADD PRIMARY KEY (`faculties_id`);

--
-- Indexes for table `fees_amt_pass`
--
ALTER TABLE `fees_amt_pass`
  ADD PRIMARY KEY (`fee_id`);

--
-- Indexes for table `field_pass`
--
ALTER TABLE `field_pass`
  ADD PRIMARY KEY (`field_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group_table`
--
ALTER TABLE `group_table`
  ADD PRIMARY KEY (`group_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`b_id`);

--
-- Indexes for table `lastsession`
--
ALTER TABLE `lastsession`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`level_id`);

--
-- Indexes for table `lga`
--
ALTER TABLE `lga`
  ADD PRIMARY KEY (`lga_id`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`log_id`),
  ADD UNIQUE KEY `log_username` (`log_username`);
ALTER TABLE `login` ADD FULLTEXT KEY `log_surname` (`log_surname`);

--
-- Indexes for table `nationality`
--
ALTER TABLE `nationality`
  ADD PRIMARY KEY (`nation_id`);

--
-- Indexes for table `ofield`
--
ALTER TABLE `ofield`
  ADD PRIMARY KEY (`of_id`);

--
-- Indexes for table `olevels`
--
ALTER TABLE `olevels`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `portalaccess`
--
ALTER TABLE `portalaccess`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `portal_status`
--
ALTER TABLE `portal_status`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `programme`
--
ALTER TABLE `programme`
  ADD PRIMARY KEY (`programme_id`);

--
-- Indexes for table `programme_type`
--
ALTER TABLE `programme_type`
  ADD PRIMARY KEY (`programmet_id`);

--
-- Indexes for table `remitapayment`
--
ALTER TABLE `remitapayment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schoolinfo`
--
ALTER TABLE `schoolinfo`
  ADD PRIMARY KEY (`skid`);

--
-- Indexes for table `splitreports`
--
ALTER TABLE `splitreports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trans_id` (`trans_id`),
  ADD KEY `t_date` (`t_date`),
  ADD KEY `akscoe` (`school`),
  ADD KEY `consultant` (`consultant`),
  ADD KEY `bank_id` (`bank_id`),
  ADD KEY `status` (`status`),
  ADD KEY `transcost` (`transcost`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `students_profile`
--
ALTER TABLE `students_profile`
  ADD PRIMARY KEY (`std_id`),
  ADD UNIQUE KEY `matric_no` (`matric_no`),
  ADD UNIQUE KEY `std_logid` (`std_logid`),
  ADD KEY `stdcourse` (`stdcourse`),
  ADD KEY `std_custome1` (`std_custome1`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `trans_custom8` (`trans_custom8`),
  ADD KEY `trans_custom14` (`trans_custom14`),
  ADD KEY `trans_no` (`trans_no`);

--
-- Indexes for table `transactiontotal`
--
ALTER TABLE `transactiontotal`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `trans_no` (`trans_no`),
  ADD KEY `trans_year` (`trans_year`);

--
-- Indexes for table `transaction_app`
--
ALTER TABLE `transaction_app`
  ADD PRIMARY KEY (`trans_id`),
  ADD UNIQUE KEY `rrr` (`rrr`),
  ADD KEY `trans_no` (`trans_no`),
  ADD KEY `log_id` (`log_id`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_current_session`
--
ALTER TABLE `_current_session`
  ADD PRIMARY KEY (`cs_id`);

--
-- Indexes for table `_logs`
--
ALTER TABLE `_logs`
  ADD PRIMARY KEY (`e_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `application_profile`
--
ALTER TABLE `application_profile`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `applogin`
--
ALTER TABLE `applogin`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_current_session`
--
ALTER TABLE `app_current_session`
  MODIFY `cs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `degree`
--
ALTER TABLE `degree`
  MODIFY `degree_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `departments_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `dept_options`
--
ALTER TABLE `dept_options`
  MODIFY `do_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `eduhistory`
--
ALTER TABLE `eduhistory`
  MODIFY `eh_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_officers`
--
ALTER TABLE `exam_officers`
  MODIFY `examofficer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faculties`
--
ALTER TABLE `faculties`
  MODIFY `faculties_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `fees_amt_pass`
--
ALTER TABLE `fees_amt_pass`
  MODIFY `fee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `field_pass`
--
ALTER TABLE `field_pass`
  MODIFY `field_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `group_table`
--
ALTER TABLE `group_table`
  MODIFY `group_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `b_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lastsession`
--
ALTER TABLE `lastsession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12389;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `level_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `nationality`
--
ALTER TABLE `nationality`
  MODIFY `nation_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT for table `ofield`
--
ALTER TABLE `ofield`
  MODIFY `of_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `olevels`
--
ALTER TABLE `olevels`
  MODIFY `o_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portalaccess`
--
ALTER TABLE `portalaccess`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `portal_status`
--
ALTER TABLE `portal_status`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `programme`
--
ALTER TABLE `programme`
  MODIFY `programme_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `programme_type`
--
ALTER TABLE `programme_type`
  MODIFY `programmet_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `remitapayment`
--
ALTER TABLE `remitapayment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `schoolinfo`
--
ALTER TABLE `schoolinfo`
  MODIFY `skid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `splitreports`
--
ALTER TABLE `splitreports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students_profile`
--
ALTER TABLE `students_profile`
  MODIFY `std_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `trans_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `transactiontotal`
--
ALTER TABLE `transactiontotal`
  MODIFY `trans_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_app`
--
ALTER TABLE `transaction_app`
  MODIFY `trans_id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `_current_session`
--
ALTER TABLE `_current_session`
  MODIFY `cs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `_logs`
--
ALTER TABLE `_logs`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
