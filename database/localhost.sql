-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 10, 2021 at 11:33 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospitaleu`
--
CREATE DATABASE IF NOT EXISTS `hospitaleu` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `hospitaleu`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ssn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `adminstrate`
--

CREATE TABLE `adminstrate` (
  `admin_ssn` int(11) NOT NULL,
  `doctor_SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_departement`
--

CREATE TABLE `admin_departement` (
  `departement` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ssn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL,
  `occupied` tinyint(1) NOT NULL,
  `bed_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `cost` int(11) NOT NULL,
  `case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_SSN` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `occupation_in_hospital` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `salary` int(11) NOT NULL,
  `shift` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_SSN`, `name`, `age`, `gender`, `address`, `occupation_in_hospital`, `salary`, `shift`) VALUES
(1, 'Abdelrahman Muhsen Abdellatif', 21, 'male', 'giza', 'oncologist', 10000, 'day'),
(2, 'Mariam Magued ', 21, 'female', 'el maadi', 'oncologist', 10000, 'day'),
(33, 'Magued Habib', 50, 'male', 'maadi', 'nephrologist', 8000, 'morning shift'),
(44, 'Youssef Shawki', 21, 'male', 'tagamoa', 'nephrologist', 8000, 'night shift'),
(66, 'Ahmed Hesham', 21, 'male', 'sheikh zayed', 'dermatologist', 10000, 'night shift'),
(78, 'rashidi', 25, 'male', 'haram', 'nephrologist', 10000, 'night shift');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_department`
--

CREATE TABLE `doctor_department` (
  `department` int(11) NOT NULL,
  `doctor_SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `gender` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` int(11) NOT NULL,
  `city` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `street` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `emergency_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` int(11) NOT NULL,
  `SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`name`, `gender`, `age`, `city`, `street`, `emergency_name`, `phone_number`, `SSN`) VALUES
('Abdelrahman Muhsen Abdellatif', 'male', 21, 'Giza', 'Madkour _El haram _El Giza', 'Hussein EL Rasheidy', 1125805973, 1),
('tarek', 'male', 21, 'cairo', 'sheikh zayed', 'hesham', 1125805973, 13),
('michael', 'male', 27, 'cairo', 'maadi', 'mariam', 1125805973, 49),
('marwa', 'female', 20, 'giza', 'haram', 'mariam', 1125805973, 55);

-- --------------------------------------------------------

--
-- Table structure for table `patient_medical_information`
--

CREATE TABLE `patient_medical_information` (
  `blood_pressure` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `respiration` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `height` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `temprature` int(11) NOT NULL,
  `pulse` int(11) NOT NULL,
  `doctor_notes` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `provisional_diagnosis` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `case_id` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `doctor_SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_medical_information_allergy`
--

CREATE TABLE `patient_medical_information_allergy` (
  `allergy` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_medical_information_previous_emergencies`
--

CREATE TABLE `patient_medical_information_previous_emergencies` (
  `previous_emergencies` tinyint(1) NOT NULL,
  `case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patient_medical_information_tests`
--

CREATE TABLE `patient_medical_information_tests` (
  `tests` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `case_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `adminstrate`
--
ALTER TABLE `adminstrate`
  ADD PRIMARY KEY (`admin_ssn`,`doctor_SSN`),
  ADD KEY `doctor_SSN` (`doctor_SSN`);

--
-- Indexes for table `admin_departement`
--
ALTER TABLE `admin_departement`
  ADD PRIMARY KEY (`departement`),
  ADD KEY `ssn` (`ssn`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`),
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_SSN`);

--
-- Indexes for table `doctor_department`
--
ALTER TABLE `doctor_department`
  ADD PRIMARY KEY (`department`,`doctor_SSN`),
  ADD KEY `doctor_SSN` (`doctor_SSN`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`SSN`);

--
-- Indexes for table `patient_medical_information`
--
ALTER TABLE `patient_medical_information`
  ADD PRIMARY KEY (`case_id`),
  ADD KEY `SSN` (`SSN`),
  ADD KEY `doctor_SSN` (`doctor_SSN`);

--
-- Indexes for table `patient_medical_information_allergy`
--
ALTER TABLE `patient_medical_information_allergy`
  ADD PRIMARY KEY (`allergy`),
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `patient_medical_information_previous_emergencies`
--
ALTER TABLE `patient_medical_information_previous_emergencies`
  ADD PRIMARY KEY (`previous_emergencies`),
  ADD KEY `case_id` (`case_id`);

--
-- Indexes for table `patient_medical_information_tests`
--
ALTER TABLE `patient_medical_information_tests`
  ADD PRIMARY KEY (`tests`),
  ADD KEY `case_id` (`case_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adminstrate`
--
ALTER TABLE `adminstrate`
  ADD CONSTRAINT `adminstrate_ibfk_1` FOREIGN KEY (`admin_ssn`) REFERENCES `admin` (`ssn`),
  ADD CONSTRAINT `adminstrate_ibfk_2` FOREIGN KEY (`doctor_SSN`) REFERENCES `doctor` (`doctor_SSN`);

--
-- Constraints for table `admin_departement`
--
ALTER TABLE `admin_departement`
  ADD CONSTRAINT `admin_departement_ibfk_1` FOREIGN KEY (`ssn`) REFERENCES `admin` (`ssn`);

--
-- Constraints for table `bed`
--
ALTER TABLE `bed`
  ADD CONSTRAINT `bed_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `patient_medical_information` (`case_id`);

--
-- Constraints for table `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `patient_medical_information` (`case_id`);

--
-- Constraints for table `doctor_department`
--
ALTER TABLE `doctor_department`
  ADD CONSTRAINT `doctor_department_ibfk_1` FOREIGN KEY (`doctor_SSN`) REFERENCES `doctor` (`doctor_SSN`);

--
-- Constraints for table `patient_medical_information`
--
ALTER TABLE `patient_medical_information`
  ADD CONSTRAINT `patient_medical_information_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `patient` (`SSN`),
  ADD CONSTRAINT `patient_medical_information_ibfk_2` FOREIGN KEY (`doctor_SSN`) REFERENCES `doctor` (`doctor_SSN`);

--
-- Constraints for table `patient_medical_information_allergy`
--
ALTER TABLE `patient_medical_information_allergy`
  ADD CONSTRAINT `patient_medical_information_allergy_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `patient_medical_information` (`case_id`);

--
-- Constraints for table `patient_medical_information_previous_emergencies`
--
ALTER TABLE `patient_medical_information_previous_emergencies`
  ADD CONSTRAINT `patient_medical_information_previous_emergencies_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `patient_medical_information` (`case_id`);

--
-- Constraints for table `patient_medical_information_tests`
--
ALTER TABLE `patient_medical_information_tests`
  ADD CONSTRAINT `patient_medical_information_tests_ibfk_1` FOREIGN KEY (`case_id`) REFERENCES `patient_medical_information` (`case_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
