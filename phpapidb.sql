-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Dec 20, 2022 at 05:15 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phpapidb`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_marks` (INOUT `var1` INT)  BEGIN  
    SELECT marks INTO var1 FROM student_info WHERE stud_id = var1;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `display_max_mark` (OUT `highestmark` INT)  BEGIN  
    SELECT MAX(marks) INTO highestmark FROM student_info;   
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_merit_student` ()  BEGIN  
    SELECT * FROM student_info WHERE marks > 70;  
    SELECT COUNT(stud_code) AS Total_Student FROM student_info;    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_student` (IN `var1` INT)  BEGIN  
    SELECT * FROM student_info LIMIT var1;  
    SELECT COUNT(stud_code) AS Total_Student FROM student_info;    
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `average_age`
--

CREATE TABLE `average_age` (
  `average` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `average_age`
--

INSERT INTO `average_age` (`average`) VALUES
(33.333333333);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `age` int(11) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `age`, `designation`, `created`) VALUES
(1, 'John Doe', 'johndoe@gmail.com', 32, 'Data Scientist', '2012-06-01 02:12:30'),
(2, 'David Costa', 'sam.mraz1996@yahoo.com', 29, 'Apparel Patternmaker', '2013-03-03 01:20:10'),
(3, 'Todd Martell', 'liliane_hirt@gmail.com', 36, 'Accountant', '2014-09-20 03:10:25'),
(4, 'Adela Marion', 'michael2004@yahoo.com', 42, 'Shipping Manager', '2015-04-11 04:11:12'),
(5, 'Matthew Popp', 'krystel_wol7@gmail.com', 48, 'Chief Sustainability Officer', '2016-01-04 05:20:30'),
(6, 'Alan Wallin', 'neva_gutman10@hotmail.com', 37, 'Chemical Technician', '2017-01-10 06:40:10'),
(7, 'Joyce Hinze', 'davonte.maye@yahoo.com', 44, 'Transportation Planner', '2017-05-02 02:20:30'),
(8, 'Donna Andrews', 'joesph.quitz@yahoo.com', 49, 'Wind Energy Engineer', '2018-01-04 05:15:35'),
(9, 'Andrew Best', 'jeramie_roh@hotmail.com', 51, 'Geneticist', '2019-01-02 02:20:30'),
(10, 'Joel Ogle', 'summer_shanah@hotmail.com', 45, 'Space Sciences Teacher', '2020-02-01 06:22:50'),
(11, 'Md.Sakoat Hossen', 'sakoat07@gmail.com', 34, 'Senior Software Engineer PHP', '2022-12-08 17:29:13'),
(14, 'Dr ASif Ahmed', 'drasifahmed@gmail.com', 34, 'Doctor', '2022-12-18 00:00:00');

--
-- Triggers `employee`
--
DELIMITER $$
CREATE TRIGGER `before_insert_designation` BEFORE INSERT ON `employee` FOR EACH ROW BEGIN  
IF NEW.designation = 'Scientist' THEN SET NEW.designation = 'Doctor';  
END IF;  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `name`, `age`) VALUES
(1, 'Matthew', 25),
(2, 'Mark', 20),
(3, 'Robert', 55);

--
-- Triggers `person`
--
DELIMITER $$
CREATE TRIGGER `person_ad` AFTER DELETE ON `person` FOR EACH ROW UPDATE average_age SET average = (SELECT AVG(person.age) FROM person)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `person_ai` AFTER INSERT ON `person` FOR EACH ROW UPDATE average_age SET average = (SELECT AVG(age) FROM person)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `person_au` AFTER UPDATE ON `person` FOR EACH ROW UPDATE average_age SET average = (SELECT AVG(age) FROM person)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `person_bd` BEFORE DELETE ON `person` FOR EACH ROW INSERT INTO person_archive (name, age)
VALUES (OLD.name, OLD.age)
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `person_bu` BEFORE UPDATE ON `person` FOR EACH ROW IF NEW.age < 18 THEN
SIGNAL SQLSTATE '50002' SET MESSAGE_TEXT = 'Person must be older than 18.';
END IF
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `person_archive`
--

CREATE TABLE `person_archive` (
  `id` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `person_archive`
--

INSERT INTO `person_archive` (`id`, `name`, `age`, `time`) VALUES
(1, 'John', 21, '2022-12-18 06:40:59'),
(2, 'John', 21, '2022-12-18 06:44:35');

-- --------------------------------------------------------

--
-- Table structure for table `student_info`
--

CREATE TABLE `student_info` (
  `stud_id` int(11) NOT NULL,
  `stud_code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stud_name` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `marks` int(11) NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_info`
--

INSERT INTO `student_info` (`stud_id`, `stud_code`, `stud_name`, `subject`, `marks`, `phone`) VALUES
(1, '101', 'mark', 'English', 68, '3456789000'),
(2, '102', 'Joseph', 'physics', 70, '45678900'),
(3, '103', 'john', 'Maths', 90, '3456789000'),
(4, '102', 'Joseph', 'physics', 70, '45678900'),
(5, '104', 'barakck', 'Maths', 96, '3456789000'),
(6, '102', 'Joseph', 'physics', 70, '59678900'),
(7, '105', 'rinky', 'Maths', 96, '3456789000'),
(8, '102', 'Joseph', 'physics', 70, '567678900'),
(9, '106', 'adam', 'Science', 83, '345678977'),
(10, '107', 'Andrews', 'Science', 80, '567678900'),
(11, '108', 'Brayan', 'Science', 84, '567678900'),
(12, '120', 'Alexandar', 'Science', 84, '567678900');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) NOT NULL,
  `category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_category` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `agent_comment` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `category`, `sub_category`, `agent_comment`, `title`, `created_at`) VALUES
(1, 'Network', 'Internet slow, indoor and outdoor', 'Dist:Mymensingh Thana:Phulpur Village:Bashati\r\nHe is facing voice network problem.please solve this problem ASAP.Contact no: 8801733548180 Available Time:24 Hrample number:8801734327682', 'Internet slow, indoor and outdoor', '2022-12-14 14:55:41'),
(2, 'MyGp Enterprise Problems', 'MyGp app problems.', 'Agent comments {\r\n  \"markers\": [\r\n    {\r\n      \"name\": \"Rixos The Palm Dubai\",\r\n      \"position\": [25.1212, 55.1535],\r\n    },\r\n    {\r\n      \"name\": \"Shangri-La Hotel\",\r\n      \"location\": [25.2084, 55.2719]\r\n    },\r\n    {\r\n      \"name\": \"Grand Hyatt\",\r\n      \"location\": [25.2285, 55.3273]\r\n    }\r\n  ]\r\n}', 'title of tickets', '2022-12-14 14:58:53');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`) VALUES
(1, 'roy', 'roy'),
(2, 'soumitra', 'roy'),
(3, 'sakoat.hossen', 'sh123456');

-- --------------------------------------------------------

--
-- Table structure for table `voter`
--

CREATE TABLE `voter` (
  `id` int(11) NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `voter`
--

INSERT INTO `voter` (`id`, `first_name`, `age`) VALUES
(5, 'sakoat', 27),
(6, 'adnan', 25);

--
-- Triggers `voter`
--
DELIMITER $$
CREATE TRIGGER `age_checker` BEFORE INSERT ON `voter` FOR EACH ROW BEGIN
    	IF NEW.age < 18
        THEN
        SIGNAL SQLSTATE '45000'
        	SET MESSAGE_TEXT = 'Age must be >= 18';
        END IF;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `workcenters`
--

CREATE TABLE `workcenters` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `capacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `workcenters`
--

INSERT INTO `workcenters` (`id`, `name`, `capacity`) VALUES
(1, 'Mold Machine', 100),
(2, 'Packing', 200);

--
-- Triggers `workcenters`
--
DELIMITER $$
CREATE TRIGGER `before_workcenters_insert` BEFORE INSERT ON `workcenters` FOR EACH ROW BEGIN
    DECLARE rowcount INT;
    
    SELECT COUNT(*) 
    INTO rowcount
    FROM WorkCenterStats;
    
    IF rowcount > 0 THEN
        UPDATE WorkCenterStats
        SET totalCapacity = totalCapacity + new.capacity;
    ELSE
        INSERT INTO WorkCenterStats(totalCapacity)
        VALUES(new.capacity);
    END IF; 

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `workcenterstats`
--

CREATE TABLE `workcenterstats` (
  `totalCapacity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `workcenterstats`
--

INSERT INTO `workcenterstats` (`totalCapacity`) VALUES
(300);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person_archive`
--
ALTER TABLE `person_archive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_info`
--
ALTER TABLE `student_info`
  ADD PRIMARY KEY (`stud_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voter`
--
ALTER TABLE `voter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workcenters`
--
ALTER TABLE `workcenters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `person_archive`
--
ALTER TABLE `person_archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_info`
--
ALTER TABLE `student_info`
  MODIFY `stud_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `voter`
--
ALTER TABLE `voter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `workcenters`
--
ALTER TABLE `workcenters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
