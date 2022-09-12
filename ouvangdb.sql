-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2022 at 11:42 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online-admission`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `ID` int(4) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`ID`, `username`, `password`) VALUES
(1, 'admin', 'admin123'),
(2, 'assistant', '123'),
(3, 'cashier', '123');

-- --------------------------------------------------------

--
-- Table structure for table `admission`
--

CREATE TABLE `admission` (
  `ID` int(3) NOT NULL,
  `stud_id` int(11) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `sex` varchar(15) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `fathername` varchar(200) NOT NULL,
  `mothername` varchar(200) NOT NULL,
  `recommendation_referee` text DEFAULT NULL,
  `transcript_from_college` varchar(200) DEFAULT NULL,
  `application_fee` text DEFAULT NULL,
  `passportphoto` varchar(200) DEFAULT NULL,
  `signed_application_form` varchar(200) DEFAULT NULL,
  `updated_cv` text NOT NULL,
  `secondary_school_certificate` text NOT NULL,
  `diploma` varchar(200) NOT NULL,
  `lga` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `passport_number` varchar(20) NOT NULL,
  `grade_score` int(3) NOT NULL,
  `faculty` varchar(30) NOT NULL,
  `dept` varchar(30) NOT NULL,
  `proficiency_test` varchar(30) NOT NULL,
  `ssce` varchar(200) NOT NULL,
  `status` varchar(44) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `date_admission` varchar(22) NOT NULL,
  `applicationID` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admission`
--

INSERT INTO `admission` (`ID`, `stud_id`, `fullname`, `sex`, `phone`, `email`, `password`, `fathername`, `mothername`, `recommendation_referee`, `transcript_from_college`, `application_fee`, `passportphoto`, `signed_application_form`, `updated_cv`, `secondary_school_certificate`, `diploma`, `lga`, `state`, `passport_number`, `grade_score`, `faculty`, `dept`, `proficiency_test`, `ssce`, `status`, `photo`, `date_admission`, `applicationID`) VALUES
(31, 0, 'OUNG-VANG Moise II Bonheur', 'Male', '0784319074', 'oungvang11@gmail.com', '123456789', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', 'Tchad', ' Ndjamena', 'R0426715', 78, 'Information Technology', 'Software engineering', 'TOEFL', 'upload/Result-Report-card-software.jpeg', '1', 'upload/Result-Report-card-software.jpeg', '2022-08-25', '202215493'),
(28, 0, 'Pauline RUNGEZEKURE', ' ', '+25078353092', 'rungezekurepaeuline@gmail.com', '1234', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', 'Uganda', 'Kigali  ', '07890817373', 12, 'Yvette Snow', 'Lyle Combs', 'Amela Atkinson', 'upload/Result-Report-card-software.png', '0', 'upload/default.jpg', '2022-08-18', 'ADM_2022_12055');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Single'),
(2, 'Single-Family Home'),
(3, 'Multi-Family Home'),
(4, '2-story house');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `file_path` varchar(255) NOT NULL DEFAULT '../upload/',
  `file_name` varchar(255) NOT NULL,
  `reason` varchar(80) NOT NULL,
  `document_owner` varchar(255) NOT NULL,
  `uploaded_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `file_path`, `file_name`, `reason`, `document_owner`, `uploaded_on`) VALUES
(1, '../upload/', '202215493_visaDoc_20210226_124551.jpg', 'visa', '202215493', '2022-09-08 19:04:14'),
(2, '../upload/', '202215493_visaDoc_20210226_124557.jpg', 'visa', '202215493', '2022-09-08 19:04:10'),
(3, '../upload/', '202215493_20210226_124551.jpg', 'application', '202215493', '2022-09-08 19:04:07'),
(4, '../upload/', '202215493_20210226_124559.jpg', 'application', '202215493', '2022-09-08 19:04:03'),
(10, '../upload/', '\" . $newfilename . \"', 'application', '\" . $_SESSION[\"applicationID\"] . \"', '2022-09-08 20:48:09'),
(11, '', '202215493_visaDoc_CCATS_PROPOSAL.pdf', 'visa', '202215493', '2022-09-08 20:49:54'),
(12, '', '202215493_visaDoc_CCATS_PROPOSAL.pptx', 'visa', '202215493', '2022-09-08 20:49:54'),
(13, '', '202215493_visaDoc_Gant chart.docx', 'visa', '202215493', '2022-09-08 20:49:54'),
(14, '../upload/', '202215493_visaDoc_Gant chart.pdf', 'visa', '202215493', '2022-09-08 20:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `houses`
--

CREATE TABLE `houses` (
  `id` int(30) NOT NULL,
  `house_no` varchar(50) NOT NULL,
  `category_id` int(30) NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `houses`
--

INSERT INTO `houses` (`id`, `house_no`, `category_id`, `description`, `price`) VALUES
(2, '12', 1, 'Folions', 2500),
(3, '16', 3, 'klih', 23),
(4, '623', 2, 'oiuuuii', 3500000),
(5, '23', 4, 'Velit tempora aliqui', 936);

-- --------------------------------------------------------

--
-- Table structure for table `infopdf`
--

CREATE TABLE `infopdf` (
  `fileid` int(11) NOT NULL,
  `filename` varchar(150) NOT NULL,
  `directory` varchar(150) NOT NULL,
  `created_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `tenant_id` int(30) NOT NULL,
  `amount` float NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `admission`
--
ALTER TABLE `admission`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `stud_id` (`stud_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_owner` (`document_owner`);

--
-- Indexes for table `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `infopdf`
--
ALTER TABLE `infopdf`
  ADD PRIMARY KEY (`fileid`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admission`
--
ALTER TABLE `admission`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `houses`
--
ALTER TABLE `houses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `infopdf`
--
ALTER TABLE `infopdf`
  MODIFY `fileid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
