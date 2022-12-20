-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Dec 20, 2022 at 05:12 AM
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
-- Database: `emp_dpt_role`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_id` int(5) NOT NULL,
  `department_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(5) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_by` int(5) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(10, 'IT', 3, '2020-09-04 18:54:47', 3, '2020-09-04 18:54:47'),
(20, 'Marketing', 3, '2020-09-04 18:56:02', 3, '2020-09-04 18:56:02'),
(30, 'Human Resources', 3, '2020-09-04 18:56:02', 3, '2020-09-04 18:56:02');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` int(5) NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_by` int(5) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_by` int(5) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `first_name`, `last_name`, `email`, `password`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(100, 'Steven', 'King', 'SKING', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(101, 'Neena', 'Kochhar', 'NKOCHHAR', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(102, 'Lex', 'De Haan', 'LDEHAAN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(103, 'Alexander', 'Hunold', 'AHUNOLD', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(104, 'Bruce', 'Ernst', 'BERNST', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(105, 'David', 'Austin', 'DAUSTIN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(106, 'Valli', 'Pataballa', 'VPATABAL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(107, 'Diana', 'Lorentz', 'DLORENTZ', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(109, 'Daniel', 'Faviet', 'DFAVIET', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(110, 'John', 'Chen', 'JCHEN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(112, 'Jose Manuel', 'Urman', 'JMURMAN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(113, 'Luis', 'Popp', 'LPOPP', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(114, 'Den', 'Raphaely', 'DRAPHEAL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(115, 'Alexander', 'Khoo', 'AKHOO', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(116, 'Shelli', 'Baida', 'SBAIDA', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(117, 'Sigal', 'Tobias', 'STOBIAS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(118, 'Guy', 'Himuro', 'GHIMURO', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(119, 'Karen', 'Colmenares', 'KCOLMENA', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(120, 'Matthew', 'Weiss', 'MWEISS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(121, 'Adam', 'Fripp', 'AFRIPP', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(122, 'Payam', 'Kaufling', 'PKAUFLIN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(123, 'Shanta', 'Vollman', 'SVOLLMAN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(124, 'Kevin', 'Mourgos', 'KMOURGOS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(125, 'Julia', 'Nayer', 'JNAYER', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(126, 'Irene', 'Mikkilineni', 'IMIKKILI', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(127, 'James', 'Landry', 'JLANDRY', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(128, 'Steven', 'Markle', 'SMARKLE', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(129, 'Laura', 'Bissot', 'LBISSOT', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(130, 'Mozhe', 'Atkinson', 'MATKINSO', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(131, 'James', 'Marlow', 'JAMRLOW', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(132, 'TJ', 'Olson', 'TJOLSON', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(133, 'Jason', 'Mallin', 'JMALLIN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(134, 'Michael', 'Rogers', 'MROGERS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(135, 'Ki', 'Gee', 'KGEE', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(136, 'Hazel', 'Philtanker', 'HPHILTAN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(137, 'Renske', 'Ladwig', 'RLADWIG', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(138, 'Stephen', 'Stiles', 'SSTILES', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(139, 'John', 'Seo', 'JSEO', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(140, 'Joshua', 'Patel', 'JPATEL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(141, 'Trenna', 'Rajs', 'TRAJS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(142, 'Curtis', 'Davies', 'CDAVIES', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(143, 'Randall', 'Matos', 'RMATOS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(144, 'Peter', 'Vargas', 'PVARGAS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(145, 'John', 'Russell', 'JRUSSEL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(146, 'Karen', 'Partners', 'KPARTNER', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(147, 'Alberto', 'Errazuriz', 'AERRAZUR', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(148, 'Gerald', 'Cambrault', 'GCAMBRAU', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(149, 'Eleni', 'Zlotkey', 'EZLOTKEY', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(150, 'Peter', 'Tucker', 'PTUCKER', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(151, 'David', 'Bernstein', 'DBERNSTE', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(152, 'Peter', 'Hall', 'PHALL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(153, 'Christopher', 'Olsen', 'COLSEN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(154, 'Nanette', 'Cambrault', 'NCAMBRAU', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(155, 'Oliver', 'Tuvault', 'OTUVAULT', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(156, 'Janette', 'King', 'JKING', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(157, 'Patrick', 'Sully', 'PSULLY', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(158, 'Allan', 'McEwen', 'AMCEWEN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(159, 'Lindsey', 'Smith', 'LSMITH', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(160, 'Louise', 'Doran', 'LDORAN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(161, 'Sarath', 'Sewall', 'SSEWALL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(162, 'Clara', 'Vishney', 'CVISHNEY', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(163, 'Danielle', 'Greene', 'DGREENE', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(164, 'Mattea', 'Marvins', 'MMARVINS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(165, 'David', 'Lee', 'DLEE', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(166, 'Sundar', 'Ande', 'SANDE', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(167, 'Amit', 'Banda', 'ABANDA', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(168, 'Lisa', 'Ozer', 'LOZER', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(169, 'Harrison', 'Bloom', 'HBLOOM', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(170, 'Tayler', 'Fox', 'TFOX', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(171, 'William', 'Smith', 'WSMITH', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(172, 'Elizabeth', 'Bates', 'EBATES', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(173, 'Sundita', 'Kumar', 'SKUMAR', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(174, 'Ellen', 'Abel', 'EABEL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(175, 'Alyssa', 'Hutton', 'AHUTTON', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(176, 'Jonathon', 'Taylor', 'JTAYLOR', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(177, 'Jack', 'Livingston', 'JLIVINGS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(178, 'Kimberely', 'Grant', 'KGRANT', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(179, 'Charles', 'Johnson', 'CJOHNSON', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(180, 'Winston', 'Taylor', 'WTAYLOR', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(181, 'Jean', 'Fleaur', 'JFLEAUR', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(182, 'Martha', 'Sullivan', 'MSULLIVA', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(183, 'Girard', 'Geoni', 'GGEONI', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(184, 'Nandita', 'Sarchand', 'NSARCHAN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(185, 'Alexis', 'Bull', 'ABULL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(186, 'Julia', 'Dellinger', 'JDELLING', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(187, 'Anthony', 'Cabrio', 'ACABRIO', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(188, 'Kelly', 'Chung', 'KCHUNG', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(189, 'Jennifer', 'Dilly', 'JDILLY', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(190, 'Timothy', 'Gates', 'TGATES', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(191, 'Randall', 'Perkins', 'RPERKINS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(192, 'Sarah', 'Bell', 'SBELL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(193, 'Britney', 'Everett', 'BEVERETT', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(194, 'Samuel', 'McCain', 'SMCCAIN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(195, 'Vance', 'Jones', 'VJONES', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(196, 'Alana', 'Walsh', 'AWALSH', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(197, 'Kevin', 'Feeney', 'KFEENEY', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(198, 'Donald', 'OConnell', 'DOCONNEL', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(199, 'Douglas', 'Grant', 'DGRANT', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(200, 'Jennifer', 'Whalen', 'JWHALEN', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(201, 'Michael', 'Hartstein', 'MHARTSTE', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(202, 'Pat', 'Fay', 'PFAY', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(203, 'Susan', 'Mavris', 'SMAVRIS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(204, 'Hermann', 'Baer', 'HBAER', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(205, 'Shelley', 'Higgins', 'SHIGGINS', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15'),
(206, 'William', 'Gietz', 'WGIETZ', '7c4a8d09ca3762af61e59520943dc26494f8941b', NULL, '2020-09-04 19:17:15', NULL, '2020-09-04 19:17:15');

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `employee_role_id` int(5) NOT NULL,
  `employee_id` int(5) DEFAULT NULL,
  `department_id` int(5) DEFAULT NULL,
  `role_id` int(5) DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_by` int(5) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_roles`
--

INSERT INTO `employee_roles` (`employee_role_id`, `employee_id`, `department_id`, `role_id`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(1, 100, 10, 201, 3, '2020-09-05 11:05:02', 3, '2020-09-05 11:05:02'),
(2, 101, 10, 301, 3, '2020-09-05 11:05:44', 3, '2020-09-05 11:05:44'),
(3, 102, 10, 401, 3, '2020-09-05 11:06:17', 3, '2020-09-05 11:06:17'),
(4, 103, 10, 501, 3, '2020-09-05 11:06:49', 3, '2020-09-05 11:06:49'),
(5, 104, 10, 601, 3, '2020-09-05 11:07:42', 3, '2020-09-05 11:07:42'),
(6, 105, 10, 701, 3, '2020-09-05 11:08:25', 3, '2020-09-05 11:08:25'),
(7, 106, 10, 701, 3, '2020-09-05 11:09:04', 3, '2020-09-05 11:09:04'),
(8, 107, 10, 701, 3, '2020-09-05 11:09:04', 3, '2020-09-05 11:09:04'),
(9, 108, 10, 701, 3, '2020-09-05 11:09:05', 3, '2020-09-05 11:09:05'),
(10, 109, 10, 701, 3, '2020-09-05 11:09:05', 3, '2020-09-05 11:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `payment_log`
--

CREATE TABLE `payment_log` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `error` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_log`
--

INSERT INTO `payment_log` (`id`, `uid`, `error`, `date`) VALUES
(1, 1, ' Insufficient funds ', '2020-10-01'),
(2, 1, 'Fault Error ', '2020-10-02'),
(3, 2, 'Fault Error', '2020-10-02'),
(4, 2, 'Insufficient funds', '2020-10-03');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(5) NOT NULL,
  `role_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `priority_order` int(5) DEFAULT NULL,
  `created_by` int(5) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_by` int(5) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`, `priority_order`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
(201, 'CEO', 1, 3, '2020-09-04 18:56:48', 3, '2020-09-04 18:56:48'),
(301, 'COO', 2, 3, '2020-09-04 18:57:35', 3, '2020-09-04 18:57:35'),
(401, 'GENERAL MANAGER', 3, 3, '2020-09-04 18:58:10', 3, '2020-09-04 18:58:10'),
(501, ' MANAGER', 4, 3, '2020-09-04 18:59:36', 3, '2020-09-04 18:59:36'),
(601, ' SUPERVISOR', 5, 3, '2020-09-04 19:01:08', 3, '2020-09-04 19:01:08'),
(701, ' STAFF', 6, 3, '2020-09-04 19:01:32', 3, '2020-09-04 19:01:32');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`employee_role_id`),
  ADD KEY `dept_fk_emp_role` (`department_id`),
  ADD KEY `emp_fk_emp_role` (`employee_id`),
  ADD KEY `role_fk_emp_role` (`role_id`);

--
-- Indexes for table `payment_log`
--
ALTER TABLE `payment_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `employee_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `employee_roles`
--
ALTER TABLE `employee_roles`
  MODIFY `employee_role_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payment_log`
--
ALTER TABLE `payment_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=702;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD CONSTRAINT `dept_fk_emp_role` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `emp_fk_emp_role` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `role_fk_emp_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
