-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 11, 2026 at 03:21 AM
-- Server version: 10.11.18-MariaDB-cll-lve
-- PHP Version: 8.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_bir_ecommarce`
--

-- --------------------------------------------------------

--
-- Table structure for table `annual_pay`
--

CREATE TABLE `annual_pay` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `annual_pay`
--

INSERT INTO `annual_pay` (`id`, `name`, `status`, `entry_by`) VALUES
(1, 'Registered Nurse', 1, 1),
(2, 'Software Developer', 1, 1),
(3, 'Marketing Manager', 1, 1),
(4, 'Financial Analyst', 1, 1),
(5, 'Mechanical Engineer', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `apply_job`
--

CREATE TABLE `apply_job` (
  `id` int(11) NOT NULL,
  `job_publish_id` int(11) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `candidate_name` varchar(255) DEFAULT NULL,
  `candidate_address` varchar(255) DEFAULT NULL,
  `candidate_email` varchar(255) DEFAULT NULL,
  `candidate_num` varchar(255) DEFAULT NULL,
  `total_year_exp` varchar(255) DEFAULT NULL,
  `educa_qualifcation` text DEFAULT NULL,
  `skill_set` text DEFAULT NULL,
  `expeted_salary` varchar(255) DEFAULT NULL,
  `files` varchar(255) DEFAULT NULL,
  `application_date` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `apply_job`
--

INSERT INTO `apply_job` (`id`, `job_publish_id`, `job_title`, `candidate_name`, `candidate_address`, `candidate_email`, `candidate_num`, `total_year_exp`, `educa_qualifcation`, `skill_set`, `expeted_salary`, `files`, `application_date`, `remarks`, `status`, `entry_by`, `created_at`) VALUES
(2, 2, 'Senior BI Engineer', 'Bijon', 'Dhaka', 'mdbijon@gmail.com', '01915728982', '7 Yrs 5 Months', 'MSC', 'Soft Dev.', '5000', '/backend/files/JnT9wFEZM8JeK1gLjq4X.doc', '2023-08-29', '', 8, 1, '2023-08-29 10:44:24'),
(3, 2, 'Senior BI Engineer', 'Kabir', 'Dhaka', 'kabir@gmail.com', '01915728983', '10 Yrs', 'MSC', 'TEST', '1050', '/backend/files/mURkiEiAo1NR9wFEJ2No.pdf', '2023-08-29', '', 2, 1, '2023-08-29 10:45:32'),
(4, 2, 'Senior BI Engineer', 'Jannat', 'DHK', 'jannat@gmail.com', '01915728984', '10 Yrs', 'TEST', 'Computer', '50000', '/backend/files/FHSfhhsLtpUDx5w1yGaX.doc', '2023-08-29', NULL, 8, NULL, '2023-08-29 10:46:47'),
(5, 1, 'Software Engineer', 'Kabir ahmed', 'DHK', 'karim@gmail.com', '01915728985', '10 Yrs', 'TEST', 'DK', '50000', '/backend/files/BEMMoAGUMb0lFvg49YPF.pdf', '2023-08-29', NULL, NULL, NULL, '2023-08-29 11:07:25');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `name`, `status`, `created_at`, `updated_at`, `entry_by`) VALUES
(1, 'size', 1, '2023-10-14 10:28:05', '2023-10-14 16:28:05', 1),
(2, 'color', 1, '2023-10-14 10:30:19', '2023-10-14 16:30:19', 1),
(3, 'capacity', 0, '2023-10-14 10:30:43', '2024-04-08 11:14:25', 1),
(4, 'sleeve length', 1, '2023-10-14 10:31:01', '2023-10-14 16:31:01', 1),
(5, 'neckline', 1, '2023-10-14 10:31:23', '2023-10-14 16:31:23', 1),
(6, 'closure type', 1, '2023-10-14 10:31:45', '2023-10-14 16:31:45', 1),
(7, 'material', 1, '2023-10-14 10:32:02', '2023-10-14 16:32:02', 1),
(8, 'brand', 0, '2023-10-14 10:32:29', '2024-04-08 11:14:17', 1),
(9, 'weight', 1, '2023-10-14 10:32:52', '2023-10-14 16:32:52', 1),
(10, 'gender', 1, '2023-10-14 10:33:05', '2023-10-14 16:33:05', 1),
(11, 'style', 1, '2023-10-14 10:33:25', '2023-10-14 16:33:25', 1),
(12, 'pattern', 1, '2023-10-14 10:33:42', '2023-10-14 16:33:42', 1),
(13, 'fit', 1, '2023-10-14 10:33:58', '2023-10-14 16:33:58', 1),
(14, 'type', 1, '2023-10-14 10:34:14', '2023-10-14 16:34:14', 1),
(15, 'occasion', 1, '2023-10-14 10:34:27', '2023-10-14 16:34:27', 1),
(16, 'season', 1, '2023-10-14 10:34:40', '2023-10-14 16:34:40', 1),
(17, 'features', 1, '2023-10-14 10:34:56', '2023-10-14 16:34:56', 1),
(18, 'compatibility', 1, '2023-10-14 10:35:12', '2023-10-14 16:35:12', 1),
(19, 'resolution', 1, '2023-10-14 10:35:43', '2023-10-14 16:35:43', 1),
(20, 'warranty', 1, '2023-10-14 10:35:58', '2023-10-14 16:35:58', 1);

-- --------------------------------------------------------

--
-- Table structure for table `attributes_values`
--

CREATE TABLE `attributes_values` (
  `id` int(11) NOT NULL,
  `attributes_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attributes_values`
--

INSERT INTO `attributes_values` (`id`, `attributes_id`, `name`, `status`, `entry_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'S', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(2, 1, 'M', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(3, 1, 'L', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(4, 1, 'XL', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(5, 1, 'XXL', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(6, 1, 'XXXL', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(7, 1, '3XL', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(8, 1, '1', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(9, 1, '2', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(10, 1, '3', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(11, 1, '4', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(12, 1, '5', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(13, 1, '6', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(14, 1, '10', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(15, 1, '11', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(16, 1, '12', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(17, 1, '13', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(18, 1, '16', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(19, 1, '17', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(20, 1, '18', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(21, 1, '19', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(22, 1, '20', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(23, 1, '21', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(24, 1, '25', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(25, 1, '30', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(26, 1, '45', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(27, 1, '60', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(28, 1, '54', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(29, 1, '28', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(30, 1, '230', 1, 1, '2023-10-14 16:28:05', '2023-10-14 16:28:05'),
(31, 2, 'Green', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(32, 2, 'Blue', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(33, 2, 'Yellow', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(34, 2, 'Red', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(35, 2, 'Dark', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(36, 2, 'White', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(37, 2, 'Neviblue', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(38, 2, 'Darkness', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(39, 2, 'Whiteness', 1, 1, '2023-10-14 16:30:19', '2023-10-14 16:30:19'),
(40, 3, '1GB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(41, 3, '2GB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(42, 3, '3GB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(43, 3, '5GB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(44, 3, '6GB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(45, 3, '7GB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(46, 3, '1TB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(47, 3, '2TB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(48, 3, '3TB', 1, 1, '2023-10-14 16:30:43', '2023-10-14 16:30:43'),
(49, 4, 'Short Sleeve', 1, 1, '2023-10-14 16:31:01', '2023-10-14 16:31:01'),
(50, 4, 'Long Sleeve', 1, 1, '2023-10-14 16:31:01', '2023-10-14 16:31:01'),
(51, 4, 'Sleeveless', 1, 1, '2023-10-14 16:31:01', '2023-10-14 16:31:01'),
(52, 5, 'Round Neck', 1, 1, '2023-10-14 16:31:23', '2023-10-14 16:31:23'),
(53, 5, 'V-neck', 1, 1, '2023-10-14 16:31:23', '2023-10-14 16:31:23'),
(54, 5, 'Scoop Neck', 1, 1, '2023-10-14 16:31:23', '2023-10-14 16:31:23'),
(55, 6, 'Zipper', 1, 1, '2023-10-14 16:31:45', '2023-10-14 16:31:45'),
(56, 6, 'Button', 1, 1, '2023-10-14 16:31:45', '2023-10-14 16:31:45'),
(57, 6, 'Velcro', 1, 1, '2023-10-14 16:31:45', '2023-10-14 16:31:45'),
(58, 7, 'Cotton', 1, 1, '2023-10-14 16:32:02', '2023-10-14 16:32:02'),
(59, 7, 'Leather', 1, 1, '2023-10-14 16:32:02', '2023-10-14 16:32:02'),
(60, 7, 'Metal', 1, 1, '2023-10-14 16:32:02', '2023-10-14 16:32:02'),
(61, 8, 'Nike', 1, 1, '2023-10-14 16:32:29', '2023-10-14 16:32:29'),
(62, 8, 'Apple', 1, 1, '2023-10-14 16:32:29', '2023-10-14 16:32:29'),
(63, 8, 'Sony', 1, 1, '2023-10-14 16:32:29', '2023-10-14 16:32:29'),
(64, 9, 'Light', 1, 1, '2023-10-14 16:32:52', '2023-10-14 16:32:52'),
(65, 9, 'Medium', 1, 1, '2023-10-14 16:32:52', '2023-10-14 16:32:52'),
(66, 9, 'Heavy', 1, 1, '2023-10-14 16:32:52', '2023-10-14 16:32:52'),
(67, 10, 'Male', 1, 1, '2023-10-14 16:33:05', '2023-10-14 16:33:05'),
(68, 10, 'Female', 1, 1, '2023-10-14 16:33:05', '2023-10-14 16:33:05'),
(69, 10, 'Unisex', 1, 1, '2023-10-14 16:33:05', '2023-10-14 16:33:05'),
(70, 11, 'Casual', 1, 1, '2023-10-14 16:33:25', '2023-10-14 16:33:25'),
(71, 11, ' Formal', 1, 1, '2023-10-14 16:33:25', '2023-10-14 16:33:25'),
(72, 11, ' Sporty', 1, 1, '2023-10-14 16:33:25', '2023-10-14 16:33:25'),
(73, 12, 'Striped', 1, 1, '2023-10-14 16:33:42', '2023-10-14 16:33:42'),
(74, 12, 'Polka Dot', 1, 1, '2023-10-14 16:33:42', '2023-10-14 16:33:42'),
(75, 12, 'Solid', 1, 1, '2023-10-14 16:33:42', '2023-10-14 16:33:42'),
(76, 13, 'Slim Fit', 1, 1, '2023-10-14 16:33:58', '2023-10-14 16:33:58'),
(77, 13, 'Loose Fit', 1, 1, '2023-10-14 16:33:58', '2023-10-14 16:33:58'),
(78, 13, 'Regular Fit', 1, 1, '2023-10-14 16:33:58', '2023-10-14 16:33:58'),
(79, 14, 'Shirt', 1, 1, '2023-10-14 16:34:14', '2023-10-14 16:34:14'),
(80, 14, 'Pants', 1, 1, '2023-10-14 16:34:14', '2023-10-14 16:34:14'),
(81, 14, 'Shoes', 1, 1, '2023-10-14 16:34:14', '2023-10-14 16:34:14'),
(82, 15, 'Party', 1, 1, '2023-10-14 16:34:27', '2023-10-14 16:34:27'),
(83, 15, 'Wedding', 1, 1, '2023-10-14 16:34:27', '2023-10-14 16:34:27'),
(84, 15, 'Casual', 1, 1, '2023-10-14 16:34:27', '2023-10-14 16:34:27'),
(85, 16, 'Spring', 1, 1, '2023-10-14 16:34:40', '2023-10-14 16:34:40'),
(86, 16, 'Summer', 1, 1, '2023-10-14 16:34:40', '2023-10-14 16:34:40'),
(87, 16, 'Fall', 1, 1, '2023-10-14 16:34:40', '2023-10-14 16:34:40'),
(88, 16, 'Winter', 1, 1, '2023-10-14 16:34:40', '2023-10-14 16:34:40'),
(89, 17, 'Waterproof', 1, 1, '2023-10-14 16:34:56', '2023-10-14 16:34:56'),
(90, 17, 'UV Protection', 1, 1, '2023-10-14 16:34:56', '2023-10-14 16:34:56'),
(91, 17, 'Breathable', 1, 1, '2023-10-14 16:34:56', '2023-10-14 16:34:56'),
(92, 18, 'iOS', 1, 1, '2023-10-14 16:35:12', '2023-10-14 16:35:12'),
(93, 18, 'Android', 1, 1, '2023-10-14 16:35:12', '2023-10-14 16:35:12'),
(94, 18, 'Windows', 1, 1, '2023-10-14 16:35:12', '2023-10-14 16:35:12'),
(95, 3, '16GB', 1, 1, '2023-10-14 16:35:29', '2023-10-14 16:35:29'),
(96, 3, '32GB', 1, 1, '2023-10-14 16:35:29', '2023-10-14 16:35:29'),
(97, 3, '64GB', 1, 1, '2023-10-14 16:35:29', '2023-10-14 16:35:29'),
(98, 19, '720p', 1, 1, '2023-10-14 16:35:43', '2023-10-14 16:35:43'),
(99, 19, '1080p', 1, 1, '2023-10-14 16:35:43', '2023-10-14 16:35:43'),
(100, 19, '4K', 1, 1, '2023-10-14 16:35:43', '2023-10-14 16:35:43'),
(101, 20, '1 Year', 1, 1, '2023-10-14 16:35:58', '2023-10-14 16:35:58'),
(102, 20, '2 Years', 1, 1, '2023-10-14 16:35:58', '2023-10-14 16:35:58'),
(103, 20, 'Lifetime', 1, 1, '2023-10-14 16:35:58', '2023-10-14 16:35:58'),
(104, 2, 'Black', 1, 1, '2023-10-16 09:29:17', '2023-10-16 09:29:17'),
(105, 3, '128GB', 1, 1, '2023-10-16 09:30:41', '2023-10-25 15:31:10'),
(106, 3, '512GB', 1, 1, '2023-10-16 09:30:51', '2023-10-16 09:30:51'),
(107, 20, '6 Months', 1, 1, '2023-10-16 09:31:48', '2023-10-16 09:31:48');

-- --------------------------------------------------------

--
-- Table structure for table `bank_master`
--

CREATE TABLE `bank_master` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_master`
--

INSERT INTO `bank_master` (`id`, `name`, `status`, `entry_by`) VALUES
(1, 'HSBC BANK', 1, 1),
(2, 'BARCLAYS BANK', 1, 1),
(3, 'SANTANDER BANK', 1, 1),
(4, 'HALIFAX BANK', 1, 1),
(5, 'NATWEST BANK', 1, 1),
(6, 'LLOYDS BANK', 1, 1),
(7, 'TSB BANK', 1, 1),
(8, 'TESCO BANK', 1, 1),
(9, 'CO-OPERATIVE BANK', 1, 1),
(10, 'BANK OF SCOTLAND', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bank_short_code`
--

CREATE TABLE `bank_short_code` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank_short_code`
--

INSERT INTO `bank_short_code` (`id`, `bank_id`, `name`, `status`, `entry_by`) VALUES
(1, 9, '56854', 1, 1),
(2, 2, '11545', 1, 1),
(3, 2, '165586', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `blogcategorys`
--

CREATE TABLE `blogcategorys` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` int(1) NOT NULL,
  `user_id` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogcategorys`
--

INSERT INTO `blogcategorys` (`id`, `name`, `slug`, `description`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'name2222222222', 'name2222222222', '<p>des</p>', 1, 1, '2024-05-18 06:27:24', '2024-05-18 09:36:00'),
(2, 'name123', 'name123', '<p>des11111</p>', 1, 1, '2024-05-18 06:28:33', '2024-05-18 09:44:39'),
(3, 'name3', 'name3', '<p>name3</p>', 0, 1, '2024-05-18 06:46:10', '2024-05-18 06:46:10'),
(4, 'sdfasd', 'sdfasd', '<p>sadfsad</p>', 0, 1, '2024-05-18 06:48:14', '2024-05-18 06:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `image` mediumblob DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_posts`
--

INSERT INTO `blog_posts` (`id`, `title`, `slug`, `category`, `content`, `image`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'test', 2, '<p>dfssdfsfsf</p>', 0x2f6261636b656e642f66696c65732f313732363032323332362e706e67, 2, 1, '2024-09-10 20:38:46', '2024-09-10 20:38:46'),
(2, 'Category', 'category', 1, '<h2>CategoryCategoryCategoryCategoryCategory</h2>', 0x2f6261636b656e642f66696c65732f313737333233343430392e6a7067, 1, 1, '2026-03-11 07:06:49', '2026-03-11 07:06:49');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `image` text NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `image`, `status`, `created_at`, `updated_at`) VALUES
(1, 'WD-40', 'wd-40', '/backend/brandimage/1770446371.png', 1, '2024-02-28 13:02:21', '2026-02-07 06:39:31'),
(2, 'Vikars', 'vikars', '/backend/brandimage/1770447243.jpg', 1, '2024-02-28 14:12:23', '2026-02-07 06:54:03'),
(3, 'Bir Tools', 'bir-tools', '/backend/brandimage/1770447541.jpg', 1, '2024-02-28 15:24:37', '2026-02-07 06:59:01'),
(4, 'KGI Hardware', 'kgi-hardware', '/backend/brandimage/1770447573.png', 1, '2024-02-28 15:31:31', '2026-02-07 06:59:33'),
(5, 'VTech', 'vtech', '/backend/brandimage/1770447641.jpg', 1, '2024-02-28 19:27:00', '2026-02-07 07:00:41'),
(6, 'Memoir', 'memoir', '/backend/brandimage/1770447670.jpg', 1, '2024-02-28 19:44:56', '2026-02-07 07:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `categorys`
--

CREATE TABLE `categorys` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT 0,
  `commission` int(11) DEFAULT NULL,
  `fixcommission` varchar(255) DEFAULT NULL,
  `product_sell_qty` int(11) DEFAULT NULL,
  `getAmount` decimal(10,5) DEFAULT NULL COMMENT 'Admin get commission amount ',
  `sort_order` int(11) DEFAULT 0,
  `file` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `speacial_status` int(11) DEFAULT NULL,
  `mobile_view_class` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `slug`, `description`, `meta_title`, `meta_description`, `meta_keyword`, `parent_id`, `commission`, `fixcommission`, `product_sell_qty`, `getAmount`, `sort_order`, `file`, `status`, `speacial_status`, `mobile_view_class`, `keyword`, `created_at`, `updated_at`) VALUES
(1, 'Hardware Division', 'hardware-division', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, '/upload/1771054723.gif', 1, 1, NULL, NULL, '2026-02-09 03:48:16', '2026-02-14 07:38:43'),
(2, 'Silicon | Waterproofing | RTV', 'silicon-waterproofing-rtv', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, '/upload/1771049692.gif', 1, 1, NULL, NULL, '2026-02-09 03:49:39', '2026-02-14 06:14:52'),
(3, 'Hand Tools', 'hand-tools', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, '/upload/1771131548.gif', 1, 1, NULL, NULL, '2026-02-09 03:49:53', '2026-02-15 04:59:08'),
(4, 'Power Tools', 'power-tools', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, '/upload/1771306033.gif', 1, 1, NULL, NULL, '2026-02-09 03:50:12', '2026-02-17 05:27:13'),
(5, 'Industrial Solution', 'industrial-solution', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, '/upload/1771391060.gif', 1, 1, NULL, NULL, '2026-02-09 03:50:28', '2026-02-18 05:04:20'),
(6, 'Locks & Security', 'locks-security', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 0, '', 1, NULL, NULL, NULL, '2026-02-09 03:54:22', '2026-02-09 03:54:22'),
(7, 'Ladder', 'ladder', NULL, 'Durable Multi-Purpose Ladders | Secure Aluminum & Folding Step Ladders', 'Reach new heights safely with our premium Ladders. Shop lightweight aluminum step ladders, heavy-duty folding designs, and extension ladders perfect for home or industrial use.', 'ladders, step ladder, aluminum ladder, folding ladder, extension ladder, multi-purpose ladder, telescopic ladder, heavy duty ladder, household ladder, industrial ladder', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 03:54:54', '2026-02-17 11:05:48'),
(8, 'Door Accessories', 'door-accessories', NULL, 'Premium Door Accessories | Essential Hardware, Closers & Hinges', 'Complete your installation with our high-quality Door Accessories. Browse a wide selection of door closers, hinges, stoppers, and decorative hardware for every door type.', 'door accessories, door closer, heavy duty hinges, door stopper, floor mount protector, door hardware kit, kick plate, door viewer, security chain, weather stripping', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 03:55:20', '2026-02-17 11:06:44'),
(9, 'Foldable Clothes Drying Racks', 'foldable-clothes-drying-racks', NULL, 'Foldable Clothes Drying Racks | Space-Saving Laundry Dryer', 'Maximize your space with our premium Foldable Clothes Drying Racks. Heavy-duty, rust-resistant, and perfect for indoor or outdoor air-drying of laundry.', 'foldable clothes rack, drying rack for laundry, indoor clothes dryer, outdoor drying rack, collapsible laundry rack, stainless steel drying rack, space-saving dryer, air dry rack', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 03:56:03', '2026-02-17 11:08:27'),
(10, 'Nails & Screws', 'nails-screws', NULL, 'Premium Nails & Screws | Heavy Duty Construction Fasteners', 'Shop our wide selection of Nails & Screws for wood, metal, and masonry. High-quality, rust-resistant fasteners designed for professional construction and DIY home repairs.', 'nails and screws, wood screws, masonry nails, drywall screws, galvanized nails, stainless steel screws, construction fasteners, self-tapping screws, hardware kit', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 03:56:34', '2026-02-17 11:09:14'),
(11, 'Hinges', 'hinges', NULL, 'Durable Door Hinges | Heavy-Duty Stainless Steel & Brass Hinges', 'Shop our wide range of high-quality Door Hinges. From heavy-duty ball bearing hinges to concealed cabinet hinges, find the perfect hardware for smooth, silent door operation.', 'door hinges, ball bearing hinges, stainless steel hinges, butt hinges, concealed hinges, cabinet hardware, heavy duty hinges, spring hinges, gate hinges, flag hinges', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 03:57:05', '2026-02-17 11:13:02'),
(12, 'SS Drawer Channel', 'ss-drawer-channel', NULL, 'SS Drawer Channel - Stainless Steel Full Extension Slides', 'Upgrade your cabinetry with our premium SS Drawer Channels. Built with high-grade stainless steel for rust resistance, smooth ball-bearing movement, and heavy-duty load support.', 'ss drawer channel, stainless steel drawer slides, telescopic drawer channel, ball bearing slides, kitchen drawer runners, heavy duty drawer channel, soft close slides, 3 fold drawer channel', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 03:57:40', '2026-02-17 11:13:49'),
(13, 'Window Roller', 'window-roller', NULL, 'Durable Window Roller - Smooth Sliding Replacement Hardware', 'Repair your sliding windows with our high-quality Window Rollers. Designed for effortless gliding, long-lasting durability, and a perfect fit for aluminum and UPVC window tracks.', 'window roller, sliding window wheels, window pulley, aluminum window roller, upvc window hardware, sliding window replacement, nylon window roller, brass window wheels', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 03:58:03', '2026-02-17 11:14:41'),
(14, 'LPG Regulator', 'lpg-regulator', NULL, 'Safe LPG Regulator - High-Pressure Gas Flow Controller', 'Ensure kitchen safety with our certified LPG Regulator. Features a secure gas flow control mechanism, leak-proof design, and durable construction for domestic and commercial cylinders.', 'lpg regulator, gas regulator, kitchen safety valve, lpg gas controller, high pressure regulator, domestic gas valve, cylinder regulator kit, leak proof lpg valve', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 03:59:04', '2026-02-17 11:15:37'),
(15, 'Cutting Disc', 'cutting-disc', NULL, 'High-Performance Cutting Discs | Precision Metal & Stone Cutting Wheels', 'Cut through steel, masonry, and stainless steel with ease using our premium Cutting Discs. Designed for longevity, safety, and clean, burr-free cuts with any standard angle grinder.', 'cutting disc, metal cutting wheel, stainless steel cutter, masonry cutting disc, abrasive cutting wheel, 4 inch cutting disc, ultra thin cutting disc, steel saw blade, angle grinder disc', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:06:21', '2026-02-17 11:38:07'),
(16, 'Measurement Tape', 'measurement-tape', NULL, 'Precision Measurement Tape | Durable Steel & Fiberglass Measuring Tools', 'Get accurate readings every time with our heavy-duty Measurement Tapes. Featuring easy-read markings, smooth retraction, and shock-resistant cases for construction, DIY, and professional use.', 'measurement tape, measuring tape, steel tape measure, retractable tape, 5m measurement tape, 3m measuring tape, flexible ruler, construction tape, surveying tape, metric inch tape', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:07:02', '2026-02-17 11:38:49'),
(17, 'Screw Driver', 'screw-driver', NULL, 'Precision Screw Drivers | Magnetic Tip & Ergonomic Grip Tool Sets', 'Drive screws effortlessly with our high-quality Screw Drivers. Featuring hardened magnetic tips, non-slip ergonomic handles, and a variety of sizes including Phillips, Slotted, and Torx.', 'screw driver, magnetic screwdriver, phillips head screwdriver, flat head screwdriver, precision screwdriver set, insulated screwdriver, torx driver, hand tools, screwdriver kit', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:07:11', '2026-02-17 11:39:41'),
(18, 'Pliers', 'pliers', NULL, 'Professional Pliers & Cutting Tools | Heavy-Duty Hand Tools', 'Master every task with our high-quality Pliers. Shop durable combination pliers, long-nose precision pliers, and heavy-duty wire cutters featuring ergonomic grips and hardened steel jaws.', 'pliers, combination pliers, long nose pliers, nose pliers, wire cutter, side cutting pliers, circlip pliers, adjustable pliers, hand tools, water pump pliers, diagonal pliers', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:07:22', '2026-02-17 11:40:34'),
(19, 'Professional Tools', 'professional-tools', NULL, 'Professional Tools & Industrial Equipment | Heavy-Duty Trade Hardware', 'Equip your workshop with our range of Professional Tools. Engineered for precision and durability, featuring high-grade power tools, hand tools, and diagnostic equipment for the modern tradesman.', 'professional tools, industrial hardware, contractor tools, heavy duty hand tools, mechanic tool set, trade quality tools, precision engineering tools, workshop equipment', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:08:51', '2026-02-17 11:41:13'),
(20, 'Hammer', 'hammer', NULL, 'Durable Hammers & Mallets | Heavy-Duty Claw & Sledge Hammers', 'Get the job done with our range of high-quality Hammers. Featuring shock-absorbing grips, drop-forged steel heads, and perfectly balanced designs for carpentry, demolition, and DIY.', 'hammer, claw hammer, sledge hammer, rubber mallet, ball peen hammer, machinist hammer, carpentry tools, demolition hammer, hand tools, non-slip grip hammer', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:09:07', '2026-02-17 11:43:03'),
(21, 'Wrench', 'wrench', NULL, 'Professional Wrench & Spanner Sets | Heavy-Duty Adjustable & Combination Wrenches', 'Master every bolt with our premium Wrenches. Shop durable adjustable wrenches, combination spanner sets, and torque-heavy pipe wrenches designed for automotive and plumbing professionals.', 'wrench, spanner, adjustable wrench, combination wrench set, pipe wrench, socket wrench, torque wrench, chrome vanadium spanner, ring wrench, monkey wrench, mechanics tools', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:09:18', '2026-02-17 11:44:41'),
(22, 'Cutting Tools', 'cutting-tools', NULL, 'Professional Cutting Tools | High-Precision Blades & Industrial Cutters', 'Experience clean, effortless cuts with our professional Cutting Tools. Shop a wide range of utility knives, heavy-duty shears, PVC pipe cutters, and industrial blades designed for precision and safety.', 'cutting tools, utility knife, box cutter, pvc pipe cutter, hand shears, industrial cutting tools, precision blades, wire snips, tin snips, replacement blades', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:09:42', '2026-02-17 11:45:30'),
(23, 'File', 'file', NULL, 'Industrial Hand Files | Precision Metal & Wood Shaping Tools', 'Achieve a smooth finish with our professional Hand Files. Shop high-carbon steel flat, round, and half-round files designed for deburring metal, shaping wood, and sharpening blades.', 'hand file, metal file, wood rasp, flat file, round file, half round file, triangular file, needle file set, deburring tool, high carbon steel file, sharpening file', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:09:51', '2026-02-17 11:48:00'),
(24, 'Drill Bit', 'drill-bit', NULL, 'High-Performance Drill Bits | HSS, Cobalt & Carbide Tipped Sets', 'Precision-engineered Drill Bits for every material. Shop heavy-duty HSS, heat-resistant Cobalt, and Carbide-tipped bits for wood, metal, and masonry. Professional-grade durability for clean, fast drilling.', 'drill bits, hss drill bit, cobalt drill bits, masonry drill bits, wood drill bits, step drill bit, sds plus bits, carbide tipped bits, titanium coated drill bits, twist drill bit, glass and tile bits', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:10:03', '2026-02-17 11:48:51'),
(25, 'Hand Saw', 'hand-saw', NULL, 'Professional Hand Saws | Sharp Woodworking & Carpentry Saws', 'Cut through timber with ease using our high-performance Hand Saws. Featuring induction-hardened teeth, ergonomic grips, and precision-ground blades for smooth crosscuts and rip cuts.', 'hand saw, woodworking saw, carpentry saw, crosscut saw, rip saw, tenon saw, fine tooth saw, timber saw, wood cutting tool, hand saw for wood', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:10:11', '2026-02-17 11:49:42'),
(26, 'House Tools', 'house-tools', NULL, 'Essential House Tools | Home Repair Kits & DIY Maintenance Gear', 'Keep your home in top shape with our essential House Tools. From basic repair kits to versatile multi-tools, find everything you need for DIY home maintenance, furniture assembly, and daily repairs.', 'house tools, home repair kit, household tools, diy tool set, apartment toolkit, maintenance tools, basic hand tools, home improvement tools, daily fix tools, general hardware', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:10:21', '2026-02-17 11:50:41'),
(27, 'LN KEY', 'ln-key', NULL, 'LN Key Sets | Heavy-Duty Hex Key & Allen Wrench Tools', 'Master precision tasks with our high-grade LN Keys. Available in Metric and SAE sizes, these heat-treated hex keys offer maximum torque and a perfect fit for furniture assembly, automotive, and industrial use', 'ln key, allen key, hex key set, l-key, metric hex keys, sae allen wrench, ball point hex key, t-handle ln key, industrial hex tools, bicycle repair tools', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:10:31', '2026-02-17 11:51:31'),
(28, 'Rivet Gun', 'rivet-gun', NULL, 'Professional Rivet Guns | Heavy-Duty Manual & Pop Rivet Tools', 'Secure metal, leather, and fabric with our precision Rivet Guns. Featuring interchangeable nozzles, ergonomic non-slip handles, and high-leverage design for effortless permanent fastening.', 'rivet gun, pop rivet tool, manual riveter, hand riveter, blind rivet gun, heavy duty rivet tool, rivet gun set, metal fastening tool, professional riveter, nut rivet tool', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:57:04', '2026-02-17 11:52:26'),
(29, 'Hand Saw', 'hand-saw', NULL, 'Professional Hand Saws | Sharp Woodworking & Carpentry Saws', 'Cut through timber with ease using our high-performance Hand Saws. Featuring induction-hardened teeth, ergonomic grips, and precision-ground blades for smooth crosscuts and rip cuts.', 'hand saw, woodworking saw, carpentry saw, crosscut saw, rip saw, tenon saw, fine tooth saw, timber saw, wood cutting tool, hand saw for wood', 22, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:57:27', '2026-02-17 11:46:55'),
(30, 'Hand Saw', 'hand-saw', NULL, 'Professional Hand Saws | Sharp Woodworking & Carpentry Saws', 'Cut through timber with ease using our high-performance Hand Saws. Featuring induction-hardened teeth, ergonomic grips, and precision-ground blades for smooth crosscuts and rip cuts.', 'hand saw, woodworking saw, carpentry saw, crosscut saw, rip saw, tenon saw, fine tooth saw, timber saw, wood cutting tool, hand saw for wood', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:58:51', '2026-02-17 11:53:16'),
(31, 'Spanner', 'spanner', NULL, 'Professional Spanner Sets | Durable Chrome Vanadium Steel Wrenches', 'Master every bolt with our precision-engineered Spanners. Shop heavy-duty combination, ring, and open-ended spanner sets designed for automotive repair, plumbing, and industrial maintenance.', 'spanner, spanner set, combination spanner, ring spanner, open ended spanner, metric spanner, ratchet spanner, chrome vanadium spanner, double ended spanner, mechanics tools', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:59:09', '2026-02-17 11:53:57'),
(32, 'Aluminium Level', 'aluminium-level', NULL, 'Precision Aluminium Spirit Levels | Heavy-Duty Magnetic Levelling Tools', 'Ensure perfect accuracy with our Aluminium Spirit Levels. Features shock-proof vials, magnetic bases, and reinforced aluminium frames for construction, masonry, and DIY projects. Durable and precise.', 'aluminium level, spirit level, magnetic level, bubble level, 600mm spirit level, masonry level, construction level, vertical horizontal level, professional levelling tool, straight edge level', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:59:31', '2026-02-17 11:54:55'),
(33, 'Socket', 'socket', NULL, 'Professional Socket Sets | Heavy-Duty Ratchet & Drive Accessories', 'Master every bolt with our precision Socket Sets. Featuring Chrome Vanadium steel, 6-point grips, and a full range of 1/4\", 3/8\", and 1/2\" drives for automotive repair and industrial maintenance.', 'socket set, ratchet socket, metric socket, deep socket, impact socket, 1/2 inch socket, socket wrench kit, drive socket accessories, chrome vanadium socket, 6 point socket', 3, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 04:59:47', '2026-02-17 11:56:30'),
(34, 'WD-40 Product USA', 'wd-40-product-usa', NULL, 'WD-40 Anti-Rust Spray | Long-Term Corrosion Protection & Lubricant', 'Prevent rust and corrosion with WD-40 Anti-Rust. Professional-grade moisture displacement and long-lasting lubrication for metal parts, tools, and automotive machinery. Blocks rust for up to 1 year.', 'wd-40 anti rust, rust inhibitor spray, corrosion protection, wd40 specialist rust, metal lubricant, moisture displacer, rust preventer, automotive rust spray, tool protection spray', 5, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:02:17', '2026-07-06 05:08:03'),
(35, 'WD-40 Multi-Use Product(মরিচা রোধক)', 'wd-40-multi-use-product-', NULL, 'WD-40 Multi-Use Product | Stops Squeaks & Anti-Rust (মরিচা রোধক)', 'Protect metal from rust and corrosion with WD-40. The world\'s #1 multi-use spray for lubricating moving parts, displacing moisture (মরিচা পরিষ্কারক), and cleaning stubborn grease or grime.', 'wd-40 multi-use, wd40 spray, rust remover, anti rust spray, মরিচা রোধক, wd-40 lubricant, moisture displacer, metal protector spray, squeeze stopper, multi-purpose lubricant', 34, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:03:04', '2026-02-17 12:00:53'),
(36, 'WD-40 Specialist', 'wd-40-specialist', NULL, 'WD-40 Specialist Range | Professional-Grade Lubricants & Degreasers', 'Upgrade to WD-40 Specialist for heavy-duty tasks. High-performance formulas including Silicone, White Lithium Grease, Contact Cleaner, and Penetrant for demanding industrial and automotive jobs.', 'wd-40 specialist, wd40 silicone spray, white lithium grease, fast acting degreaser, contact cleaner, high performance penetrant, dry ptfe lubricant, industrial lubricants, professional wd40', 34, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:03:27', '2026-02-17 12:01:34'),
(37, 'Vikars Spray Paint', 'vikars-spray-paint', NULL, 'Vikars Spray Paint | High-Gloss Multi-Purpose Aerosol Colors', 'Transform any surface with Vikars Spray Paint. Our 100% acrylic, quick-drying formula provides a durable, high-gloss finish on metal, wood, plastic, and glass. Ideal for automotive touch-ups, DIY crafts, and home decor.', 'vikars spray paint, vikars aerosol paint, high gloss spray paint, quick dry spray paint, acrylic spray paint, vikars silver 36, vikars black 39, multi-purpose spray color, metal and wood spray paint, automotive touch up paint', 5, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:10:14', '2026-02-17 12:03:03'),
(38, 'Wheel', 'wheel', NULL, 'Durable Caster Wheels | Heavy-Duty Rubber & Nylon Wheels', 'Improve mobility with our high-quality Wheels and Casters. Perfect for trolleys, furniture, and industrial equipment. Featuring smooth-swivel action and high load-bearing capacity.', 'caster wheels, trolley wheels, rubber wheels, nylon casters, heavy duty wheels, furniture wheels, swivel caster, industrial wheels, fixed caster, replacement wheels', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:17:28', '2026-02-17 11:17:50'),
(39, 'Polishing & Grinding Disc', 'polishing-grinding-disc', NULL, 'Polishing & Grinding Discs | High-Performance Abrasive Wheels', 'Achieve the perfect finish with our Polishing and Grinding Discs. Engineered for metal, stone, and wood, these durable abrasive wheels provide smooth cutting and high-gloss polishing.', 'grinding disc, polishing wheel, abrasive disc, metal grinding wheel, stone polishing pad, sanding disc, angle grinder accessories, flap disc, buffing wheel, cutting disc', 1, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:18:00', '2026-02-17 11:18:49'),
(40, 'Fiber Net', 'fiber-net', NULL, 'Fiber Net & Fiberglass Mesh | Durable Construction & Insect Screens', 'Strengthen your projects with high-quality Fiber Net. Shop alkali-resistant fiberglass mesh for plaster reinforcement, wall repair, and waterproofing, plus durable insect screens for windows and doors. Built for long-lasting performance.', 'fiber net, fiberglass mesh, plaster mesh, construction net, mosquito net roll, insect screen, alkali resistant mesh, wall reinforcement net, fiber net for windows, fiber glass net, waterproofing mesh', 5, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:37:59', '2026-02-17 12:04:15'),
(41, 'Mohiar', 'mohiar', NULL, 'Professional Mohair Paint Rollers | Smooth Finish Decorating Tools', 'Achieve a flawless, lint-free finish with our premium Mohair paint rollers. Specially designed for high-gloss enamels, varnishes, and oil-based paints. Ideal for doors, cabinets, and smooth surfaces.', 'mohair roller, mohair paint brush, lint free paint roller, gloss finish roller, oil based paint tools, mohair mini roller, professional decorating tools, enamel paint roller, mohair sleeves, high quality painting supplies', 5, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:38:09', '2026-02-17 12:05:27'),
(42, 'Door Lock - Aluminum Handle Locks small 58x45 mm', 'door-lock---aluminum-handle-locks-small-58x45-mm', NULL, 'Small Aluminum Handle Door Lock (58x45 mm)', 'Upgrade your security with our premium 58x45 mm Aluminum Handle Door Lock. Designed for slim profiles, easy installation, and long-lasting durability. Shop now!', 'aluminum door lock, 58x45mm handle lock, small door handle, aluminum hardware, mortise lock, slim profile door lock, replacement door handle', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:40:07', '2026-02-17 09:21:07'),
(43, 'Door Lock - Zinc Handle Locks Medium 85x45 mm', 'door-lock---zinc-handle-locks-medium-85x45-mm', NULL, 'Zinc Handle Door Lock - Medium 85x45mm | Durable & Secure', 'Upgrade your home security with our premium Zinc Handle Door Lock. Features a medium 85x45mm profile, corrosion-resistant finish, and smooth lever action.', 'zinc door lock, 85x45mm handle lock, medium door handle, mortise lock set, zinc alloy hardware, interior door lock', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:40:22', '2026-02-17 10:13:28'),
(44, 'Door Lock - Aluminum Handle Locks Medium 85x45 mm', 'door-lock---aluminum-handle-locks-medium-85x45-mm', NULL, 'Aluminum Handle Door Lock - Medium 85x45mm | Lightweight & Secure', 'Upgrade your doors with our premium Aluminum Handle Door Lock. Features a medium 85x45mm profile, rust-resistant finish, and smooth ergonomic lever action.', 'aluminum door lock, 85x45mm handle lock, medium aluminum lever, mortise lock set, aluminum alloy hardware, rust-resistant door lock, interior door handle, 85x45mm mortise set', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:41:04', '2026-02-17 10:28:18'),
(45, 'Door Lock - Aluminum Handle Locks Big 68x60 mm', 'door-lock---aluminum-handle-locks-big-68x60-mm', NULL, 'Aluminum Handle Door Lock - Big 68x60mm | Heavy Duty & Secure', 'Upgrade to our premium Big Aluminum Handle Door Lock. Featuring a 68x60mm profile, rust-resistant alloy, and heavy-duty lever action for maximum durability.', 'aluminum door lock, 68x60mm handle lock, big aluminum lever, large mortise lock, aluminum alloy hardware, heavy duty door lock, interior door handle, 68x60mm lock set', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:42:51', '2026-02-17 10:33:24'),
(46, 'Door Lock - Round Locks Zinc 58 mm', 'door-lock---round-locks-zinc-58-mm', NULL, 'Round Zinc Door Lock - 58mm | Modern Circular Handle & Secure', 'Enhance your interior doors with our premium Round Zinc Door Lock. Featuring a 58mm circular profile, corrosion-resistant zinc alloy, and smooth privacy locking.', 'round door lock, 58mm zinc lock, circular handle lock, zinc alloy hardware, modern round lever, privacy door lock, 58mm rose set, interior round door handle', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:43:18', '2026-02-17 10:34:29'),
(47, 'Door Lock - Round Locks SS 58 mm', 'door-lock---round-locks-ss-58-mm', NULL, 'Round SS Door Lock - 58mm | Stainless Steel Circular Handle', 'Secure your home with our premium Round Stainless Steel Door Lock. Featuring a 58mm circular rose, grade-304 SS finish, and rust-proof privacy locking.', 'round door lock, 58mm ss lock, stainless steel handle, circular ss lock, 58mm rose set, rust-proof door hardware, interior ss lever, modern round lock', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:43:35', '2026-02-17 10:35:25'),
(48, 'Liver Locks', 'liver-locks', NULL, 'Premium Liver Door Locks | Secure Lever Handle Hardware', 'Shop our durable Liver Locks for interior and exterior doors. Featuring ergonomic lever handles, high-security locking mechanisms, and a variety of stylish finishes.', 'liver locks, lever door handle, interior lever lock, secure liver handle, door hardware, privacy lever lock, entrance liver lock set, ergonomic door handle', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:43:53', '2026-02-17 10:36:49'),
(49, 'Drawer Lock', 'drawer-lock', NULL, 'Durable Drawer Lock - Secure Storage & Cabinet Security', 'Secure your valuables with our high-quality Drawer Lock. Perfect for desks, cabinets, and dressers. Easy installation with a smooth, reliable locking mechanism.', 'drawer lock, cabinet security, desk drawer lock, furniture hardware, cylinder drawer lock, dresser lock set, secure storage lock, replacement drawer lock', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:44:04', '2026-02-17 10:37:46'),
(50, 'Rim Lock (Iron)', 'rim-lock-iron-', NULL, 'Heavy Duty Iron Rim Lock - Secure Surface Mount Security', 'Secure your doors with our classic Iron Rim Lock. Built for durability and strength, this surface-mounted lock is ideal for traditional doors, gates, and outbuildings.', 'iron rim lock, surface mount lock, heavy duty door lock, traditional rim lock, iron gate lock, security rim latch, vintage style door lock, exterior iron lock', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:44:21', '2026-02-17 10:38:32'),
(51, 'Pad Lock', 'pad-lock', NULL, 'High-Security Pad Lock | Weatherproof Outdoor & Indoor Protection', 'Protect your property with our durable Pad Lock. Featuring a hardened steel shackle, anti-pick technology, and a corrosion-resistant body for ultimate security.', 'pad lock, security padlock, heavy duty lock, outdoor padlock, hardened steel lock, weatherproof padlock, gate lock, locker lock, anti-theft padlock', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:44:36', '2026-02-17 10:39:33'),
(52, 'Lock Accessories', 'lock-accessories', NULL, 'Premium Lock Accessories | Hardware Spares & Installation Parts', 'Enhance your security setup with our essential Lock Accessories. Shop high-quality strike plates, cylinder replacements, screw kits, and maintenance tools for all lock types.', 'lock accessories, door hardware parts, lock cylinder spares, strike plate kit, lock installation tools, replacement screws, lock maintenance, hardware accessories', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:44:44', '2026-02-17 10:40:23'),
(53, 'Vtech Silicon & RTV', 'vtech-silicon-rtv', NULL, 'Vtech Silicon & RTV Sealants | High-Temp Waterproof Adhesive', 'Secure joints with Vtech Silicon and RTV sealants. High-performance, waterproof, and heat-resistant formulas perfect for automotive gaskets, industrial sealing, and household repairs.', 'vtech silicon, rtv sealant, high temperature silicone, gasket maker, waterproof sealant, industrial adhesive, vtech rtv grey, black silicone sealant, clear rtv silicone', 2, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:47:58', '2026-02-17 11:23:52'),
(54, 'Bir Silicon & RTV', 'bir-silicon-rtv', NULL, 'Bir Silicon & RTV Sealants | Professional Gasket Maker & Adhesive', 'Get a leak-proof seal with Bir Silicon and RTV. High-strength, flexible, and weather-resistant formulas designed for automotive gaskets, construction joints, and industrial sealing.', 'bir silicon, bir rtv sealant, high strength silicone, gasket maker rtv, waterproof bir adhesive, weather resistant sealant, industrial grade rtv, automotive gasket sealer', 2, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:48:32', '2026-02-17 11:24:41'),
(55, 'V-tech Waterproofing', 'v-tech-waterproofing', NULL, 'V-tech Waterproofing Solutions | Advanced Leak & Moisture Protection', 'Stop leaks permanently with V-tech Waterproofing. High-performance coatings and sealants designed for roofs, basements, and bathrooms. Durable, flexible, and weather-resistant protection.', 'v-tech waterproofing, waterproof coating, roof sealant, basement waterproofing, v-tech water guard, liquid membrane, damp proofing, terrace leak repair, wall sealer', 2, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:49:28', '2026-02-17 11:25:23'),
(56, 'Isonem Waterproofing', 'isonem-waterproofing', NULL, 'Isonem Waterproofing & Insulation | High-Tech Liquid Membranes', 'Experience the ultimate protection with Isonem Waterproofing. From MS Polymer to Liquid Glass, our Turkish-engineered coatings provide 100% water insulation, UV resistance, and thermal efficiency for roofs, terraces, and pools.', 'isonem waterproofing, ms polymer, liquid glass, isonem thermal paint, roof insulation, transparent waterproofing, isonem hybrid, liquid applied membrane, damp proofing, uv resistant coating', 2, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 05:49:53', '2026-02-17 11:26:10'),
(57, 'Makita Power Tools', 'makita-power-tools', NULL, 'Makita Power Tools | Cordless Drills, Saws & LXT Battery Gear', 'Experience professional performance with Makita Power Tools. Shop the latest LXT and XGT cordless drills, impact drivers, angle grinders, and saws. Durable, high-torque tools for construction and woodworking.', 'makita power tools, makita cordless drill, makita lxt battery, impact driver makita, makita brushless motor, 18v makita tools, makita angle grinder, makita circular saw, professional power tools, makita xgt', 4, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 06:06:25', '2026-02-17 11:57:18'),
(58, 'Ford Power Tools', 'ford-power-tools', NULL, 'Ford Power Tools | Heavy-Duty Cordless Drills & Professional Gear', 'Experience the durability of Ford Power Tools. Engineered for performance and reliability, our range includes high-torque cordless drills, impact drivers, and industrial-grade pressure washers for any job site.', 'ford power tools, ford cordless drill, ford impact driver, professional hammer drill, ford tools set, ford pressure washer, heavy duty power tools, built ford tough tools, ford power equipment', 4, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 06:08:53', '2026-02-17 11:58:01'),
(59, 'Bir Power Tools', 'bir-power-tools', NULL, 'Bir Power Tools | Reliable Drills, Grinders & Professional Hardware', 'Get the job done with Bir Power Tools. High-performance electric drills, angle grinders, and rotary hammers designed for durability and precision. Quality power tools at the best value for every project.', 'bir power tools, bir electric drill, bir angle grinder, bir rotary hammer, high torque power tools, bir impact drill, professional bir tools, affordable power tools, bir power gear', 4, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 06:09:20', '2026-02-17 11:59:20'),
(60, 'Sliding Lock', 'sliding-lock', NULL, 'Secure Sliding Lock - Durable Hardware for Sliding Doors & Windows', 'Enhance your privacy with our premium Sliding Lock. Perfect for sliding patio doors, windows, and barn doors. Features a heavy-duty design and easy-glide locking mechanism.', 'sliding lock, sliding door security, patio door lock, window sliding latch, barn door lock, sliding bolt hardware, heavy duty sliding lock, interior sliding door lock', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 06:17:03', '2026-02-17 10:41:09'),
(61, 'Ford Hot Air Gun', 'ford-hot-air-gun', NULL, 'Ford Hot Air Guns | High-Performance Industrial Heat Guns', 'Master tough jobs with Ford Hot Air Guns. Featuring variable temperature settings, ergonomic design, and dual-airflow modes for paint stripping, heat shrinking, and soldering. Built Ford Tough for every task.', 'ford hot air gun, ford heat gun, industrial heat gun, variable temperature heat gun, paint stripper tool, electric hot air blower, shrinking tubing tool, 2000w heat gun, ford power tools', 58, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 06:20:05', '2026-02-17 11:58:46'),
(62, 'Jigsaw Blade', 'jigsaw-blade', NULL, 'null', 'null', 'null', 57, 0, NULL, NULL, NULL, 0, '', 0, NULL, 'null', 'null', '2026-02-09 10:01:21', '2026-02-09 10:03:32'),
(63, 'Cordless Screw Driver', 'cordless-screw-driver', NULL, 'null', 'null', 'null', 57, 0, NULL, NULL, NULL, 0, '', 0, NULL, 'null', 'null', '2026-02-09 10:01:52', '2026-02-09 10:03:48'),
(64, 'WD40 Mup Smart Straw', 'wd40-mup-smart-straw', NULL, 'null', 'null', 'null', 0, 0, NULL, NULL, NULL, 0, '/backend/files/ck9Tg3M1urlSPKnTzGdn.png', 0, 0, 'null', 'null', '2026-02-09 10:09:13', '2026-02-17 07:04:59'),
(65, 'Dead Bolt / Security Lock', 'dead-bolt-security-lock', NULL, 'Dead Bolt Security Lock - Heavy Duty Protection & High Security', 'Protect your home with our premium Dead Bolt Security Lock. Featuring a drill-resistant cylinder, hardened steel bolt, and pick-proof technology for ultimate door safety.', 'dead bolt lock, security lock, heavy duty deadbolt, double cylinder lock, single cylinder deadbolt, high security door lock, anti-pick lock, entrance security deadbolt', 6, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 10:22:16', '2026-02-17 10:42:34'),
(66, 'Door Chain - Zinc', 'door-chain---zinc', NULL, 'Zinc Door Security Chain - Durable Anti-Theft Guard', 'Enhance your home security with our heavy-duty Zinc Door Chain. Featuring a corrosion-resistant finish and easy-to-install design for restricted door opening and safety.', 'door chain, zinc door guard, security chain lock, anti-theft door chain, zinc alloy hardware, safety door latch, restricted opening lock, front door security chain', 8, 0, NULL, NULL, NULL, 0, '', 1, NULL, 'null', 'null', '2026-02-09 10:24:09', '2026-02-17 11:07:37');

-- --------------------------------------------------------

--
-- Table structure for table `category_commission_history`
--

CREATE TABLE `category_commission_history` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_qty` int(11) DEFAULT NULL,
  `product_price` decimal(10,2) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `category_percetage` int(11) DEFAULT NULL COMMENT 'commission %',
  `admin_get_amount` decimal(10,2) DEFAULT NULL,
  `check_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_commission_history`
--

INSERT INTO `category_commission_history` (`id`, `customer_id`, `seller_id`, `product_id`, `product_qty`, `product_price`, `category_id`, `category_percetage`, `admin_get_amount`, `check_status`, `created_at`, `updated_at`) VALUES
(1, 26, 1, 47, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:38:12', '2026-02-10 12:38:12'),
(2, 26, 1, 2, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:38:12', '2026-02-10 12:38:12'),
(3, 26, 1, 1, 1, 10.00, 1, 0, 0.00, NULL, '2026-02-10 12:38:12', '2026-02-10 12:38:12'),
(4, 26, 1, 34, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:38:12', '2026-02-10 12:38:12'),
(5, 26, 1, 33, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:38:12', '2026-02-10 12:38:12'),
(6, 26, 1, 47, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:47:45', '2026-02-10 12:47:45'),
(7, 26, 1, 2, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:47:45', '2026-02-10 12:47:45'),
(8, 26, 1, 1, 1, 10.00, 1, 0, 0.00, NULL, '2026-02-10 12:47:45', '2026-02-10 12:47:45'),
(9, 26, 1, 34, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:47:45', '2026-02-10 12:47:45'),
(10, 26, 1, 33, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:47:45', '2026-02-10 12:47:45'),
(11, 26, 1, 32, 1, 100.00, 1, 0, 0.00, NULL, '2026-02-10 12:47:45', '2026-02-10 12:47:45');

-- --------------------------------------------------------

--
-- Table structure for table `chat_messages`
--

CREATE TABLE `chat_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `buyer_id` bigint(20) UNSIGNED NOT NULL,
  `seller_id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `circumstances`
--

CREATE TABLE `circumstances` (
  `id` int(11) NOT NULL,
  `employe_id` int(11) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(225) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `salary` double(10,2) DEFAULT NULL,
  `phone` varchar(225) DEFAULT NULL,
  `joning_date` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `type_of_doc` text DEFAULT NULL,
  `passport_upload_docs` text DEFAULT NULL,
  `visa_upload_documents` text DEFAULT NULL,
  `euss_upload_documents` text DEFAULT NULL,
  `nid_upload_documents` text DEFAULT NULL,
  `other_upload_documents` text DEFAULT NULL,
  `employee_code` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `ni_no` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `employee_type` varchar(255) DEFAULT NULL,
  `date_of_confirmation` date DEFAULT NULL,
  `contact_start_date` date DEFAULT NULL,
  `contact_end_date` date DEFAULT NULL,
  `job_location` varchar(255) DEFAULT NULL,
  `reporting_authority` varchar(255) DEFAULT NULL,
  `leave_sanction_auth` varchar(255) DEFAULT NULL,
  `education_details` text DEFAULT NULL,
  `job_details` text DEFAULT NULL,
  `key_respons` text DEFAULT NULL,
  `training_details` varchar(255) DEFAULT NULL,
  `emger_contact_name` varchar(255) DEFAULT NULL,
  `emger_email` varchar(255) DEFAULT NULL,
  `emger_contact_no` varchar(255) DEFAULT NULL,
  `emger_address` varchar(255) DEFAULT NULL,
  `certifi_title` varchar(255) DEFAULT NULL,
  `certifi_license_number` varchar(255) DEFAULT NULL,
  `certifi_start_date` date DEFAULT NULL,
  `certifi_end_date` date DEFAULT NULL,
  `contact_info_post_code` varchar(255) DEFAULT NULL,
  `contact_info_address` varchar(255) DEFAULT NULL,
  `contact_info_address_1` varchar(255) DEFAULT NULL,
  `contact_info_address_2` varchar(255) DEFAULT NULL,
  `contact_info_address_3` varchar(255) DEFAULT NULL,
  `contact_info_city_country` varchar(255) DEFAULT NULL,
  `contact_info_country_id` varchar(255) DEFAULT NULL,
  `pass_no` varchar(255) DEFAULT NULL,
  `pass_nationality` varchar(255) DEFAULT NULL,
  `pass_place_birth` varchar(255) DEFAULT NULL,
  `pass_issued_by` varchar(255) DEFAULT NULL,
  `pass_date` date DEFAULT NULL,
  `pass_expire_date` date DEFAULT NULL,
  `pass_review_date` date DEFAULT NULL,
  `visa_brp_np` varchar(255) DEFAULT NULL,
  `visa_nationality` varchar(255) DEFAULT NULL,
  `visa_country_residence` varchar(255) DEFAULT NULL,
  `visa_issuedby` varchar(255) DEFAULT NULL,
  `visa_issued_date` date DEFAULT NULL,
  `visa_expire_date` date DEFAULT NULL,
  `visa_eligbible_review_date` date DEFAULT NULL,
  `visa_current_yesno` varchar(255) DEFAULT NULL,
  `visa_remarks` text DEFAULT NULL,
  `ess_ref_no` varchar(255) DEFAULT NULL,
  `ess_nationality` varchar(255) DEFAULT NULL,
  `ess_issued_by` varchar(255) DEFAULT NULL,
  `ess_issued_date` date DEFAULT NULL,
  `ess_expire_date` date DEFAULT NULL,
  `ess_eligible_review_date` date DEFAULT NULL,
  `ess_current_visa` varchar(255) DEFAULT NULL,
  `ess_remarks` varchar(255) DEFAULT NULL,
  `nid_number` text DEFAULT NULL,
  `nid_nationality` varchar(255) DEFAULT NULL,
  `nid_country_residence` varchar(255) DEFAULT NULL,
  `nid_issue_date` date DEFAULT NULL,
  `nid_expire_date` date DEFAULT NULL,
  `nid_eli_review_date` date DEFAULT NULL,
  `nid_current_visa` varchar(255) DEFAULT NULL,
  `nid_remarks` varchar(255) DEFAULT NULL,
  `others_doc_name` varchar(255) DEFAULT NULL,
  `others_ref_name` varchar(255) DEFAULT NULL,
  `others_nationality` varchar(255) DEFAULT NULL,
  `others_issue_date` date DEFAULT NULL,
  `others_expire_date` date DEFAULT NULL,
  `others_eligb_review_date` date DEFAULT NULL,
  `others_visa_sts` varchar(255) DEFAULT NULL,
  `others_remarks` varchar(255) DEFAULT NULL,
  `pay_group` varchar(255) DEFAULT NULL,
  `pay_annual_pay` varchar(255) DEFAULT NULL,
  `pay_wedges_pay_mode` varchar(255) DEFAULT NULL,
  `pay_payment_type` varchar(255) DEFAULT NULL,
  `pay_basic_daily_wedges` varchar(255) DEFAULT NULL,
  `pay_min_working_hour` varchar(255) DEFAULT NULL,
  `pay_tax_code` varchar(255) DEFAULT NULL,
  `pay_tax_ref` varchar(200) DEFAULT NULL,
  `pay_percentage` varchar(200) DEFAULT NULL,
  `pay_payment_mode` varchar(200) DEFAULT NULL,
  `pay_bank_name` varchar(200) DEFAULT NULL,
  `pay_branch_name` varchar(200) DEFAULT NULL,
  `pay_account_no` text DEFAULT NULL,
  `pay_sort_code` text DEFAULT NULL,
  `pay_remarks` text DEFAULT NULL,
  `payment_da` text DEFAULT NULL,
  `payment_hra` text DEFAULT NULL,
  `payment_conven_ta` text DEFAULT NULL,
  `payment_perfomance` text DEFAULT NULL,
  `payment_monthly_al` text DEFAULT NULL,
  `ni_dedu_da` text DEFAULT NULL,
  `ni_dedu_hra` text DEFAULT NULL,
  `ni_dedu_conven_ta` text DEFAULT NULL,
  `ni_dedu_perfomance` text DEFAULT NULL,
  `ni_dedu_monthly_al` text DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `circumstances`
--

INSERT INTO `circumstances` (`id`, `employe_id`, `designation_id`, `department_id`, `name`, `email`, `age`, `gender`, `address`, `salary`, `phone`, `joning_date`, `date_of_birth`, `image`, `type_of_doc`, `passport_upload_docs`, `visa_upload_documents`, `euss_upload_documents`, `nid_upload_documents`, `other_upload_documents`, `employee_code`, `first_name`, `middle_name`, `last_name`, `ni_no`, `marital_status`, `country_id`, `employee_type`, `date_of_confirmation`, `contact_start_date`, `contact_end_date`, `job_location`, `reporting_authority`, `leave_sanction_auth`, `education_details`, `job_details`, `key_respons`, `training_details`, `emger_contact_name`, `emger_email`, `emger_contact_no`, `emger_address`, `certifi_title`, `certifi_license_number`, `certifi_start_date`, `certifi_end_date`, `contact_info_post_code`, `contact_info_address`, `contact_info_address_1`, `contact_info_address_2`, `contact_info_address_3`, `contact_info_city_country`, `contact_info_country_id`, `pass_no`, `pass_nationality`, `pass_place_birth`, `pass_issued_by`, `pass_date`, `pass_expire_date`, `pass_review_date`, `visa_brp_np`, `visa_nationality`, `visa_country_residence`, `visa_issuedby`, `visa_issued_date`, `visa_expire_date`, `visa_eligbible_review_date`, `visa_current_yesno`, `visa_remarks`, `ess_ref_no`, `ess_nationality`, `ess_issued_by`, `ess_issued_date`, `ess_expire_date`, `ess_eligible_review_date`, `ess_current_visa`, `ess_remarks`, `nid_number`, `nid_nationality`, `nid_country_residence`, `nid_issue_date`, `nid_expire_date`, `nid_eli_review_date`, `nid_current_visa`, `nid_remarks`, `others_doc_name`, `others_ref_name`, `others_nationality`, `others_issue_date`, `others_expire_date`, `others_eligb_review_date`, `others_visa_sts`, `others_remarks`, `pay_group`, `pay_annual_pay`, `pay_wedges_pay_mode`, `pay_payment_type`, `pay_basic_daily_wedges`, `pay_min_working_hour`, `pay_tax_code`, `pay_tax_ref`, `pay_percentage`, `pay_payment_mode`, `pay_bank_name`, `pay_branch_name`, `pay_account_no`, `pay_sort_code`, `pay_remarks`, `payment_da`, `payment_hra`, `payment_conven_ta`, `payment_perfomance`, `payment_monthly_al`, `ni_dedu_da`, `ni_dedu_hra`, `ni_dedu_conven_ta`, `ni_dedu_perfomance`, `ni_dedu_monthly_al`, `entry_by`, `created_at`, `status`) VALUES
(1, 6, 7, 6, 'Mrs. Jan Ahmed', 'OnlinessSit2221@gmail.com', 'eed', '1', 'fsdfsdf', 34234234.00, '324234', '2023-08-30', '2023-08-16', '/backend/files/I0ZYJ7wmwlVnZ1ZEe6Z9.jpg', '/backend/files/3iJXaelLRTTkIHBlVNq2.jpg', '/backend/files/sWe1DbkAU7lBaLTLQq57.jpg', '/backend/files/3Gqsx9Qm9HWakp3GoJDE.jpg', '/backend/files/kJDdkiRXW3igzULbs1RZ.jpg', NULL, '/backend/files/qQRq3ozkjgiEnkX2pTnl.jpg', 'EMP-006', 'Mrs.', 'Jan', 'Ahmed', 'sdfsdf', 'Widow', 10, 'FULL TIME', '2023-08-17', '2023-08-10', '2023-08-17', 'sdfs', '', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 's@gmail.com', 's', 'sdf', 'sfs', 'sdf', '2023-08-21', '2023-08-27', 'asdd', 'fsdf', 'sdf', 'sdf', 'sdfsdf', '2023-08-17', '2', 'dgdfg', '3', '2023-08-24', '3245', '0000-00-00', '0000-00-00', '0000-00-00', 'sdf', '3', '4', 'sdfsdf', '2023-08-17', '2023-08-18', '2023-08-17', '', '', 'sdfs', '6', '234234', '2023-08-21', '2023-08-24', '2023-08-25', 'No', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'undefined', '', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 1, '2023-08-15 23:22:16', 1),
(2, 5, 3, 4, 'Mr. Bijon Ahmed', 'onlinesoft@gmail.com', '33f1111', '1', 'fgfdgf1111', 330000.00, 'sdff1111', '2023-08-10', '2023-08-24', '/backend/files/yLueQNQHCDh4PEdlOmzf.jpg', '/backend/files/mK9pawBkTAUCnlnLLVZ8.jpg', '/backend/files/qtjiMkUrXLvCpHnPXfot.jpg', '/backend/files/ackvh94E74xeWVcqbHPt.jpg', '/backend/files/aGTivb3cUepDtHEyj9dm.jpg', '/backend/files/08gLujAFSq6VKfQTbuKi.jpg', NULL, 'EMP-005', 'Mr.', 'Bijon', 'Ahmed', 'dsff1111', 'Single', 4, 'FULL TIME', '2023-08-16', '2023-08-23', '2023-08-31', 'dfgf1111', 'dfgf1111', 'dfgdfgf1111', 'dfgf1111', 'dfgf1111', 'dfgf1111', 'dfgdfgf1111', 'dfgdfgdfg111111', 'dfgdfg@gmail.comf1111', '353434f1111', 'sdfsdff1111', 'sdfsdff1111', 'sdfsdf111111', '2023-08-24', '2023-08-17', 'wewerf1111', 'werwer111111', 'dsfsdfsdf', 'dfdfdsf', 'dsfsdfsdf', '2023-08-31', '6', 'sdfsdf111111', '3', '2023-08-23', 'sdfsdf111111', '2023-08-18', '2023-08-24', '2023-08-25', 'sdf111111', '9', '5', 'sdfsdfsdf111111', '2023-08-22', '2023-08-16', '2023-08-24', 'Yes', '111111111111111111111111', 'sdfsdf11111', '11', 'sdfsdfsdf', '2023-08-31', '2023-08-16', '2023-08-25', 'Yes', 'asdasdf11111f11111f11111', '216548748', '2', '2', '2023-08-24', '2023-08-31', '2023-08-31', 'Yes', 'asdasdf11111f11111f11111', 'asd', 'sadasdasd', '2', '2023-08-17', '2023-08-23', '2023-08-23', 'Yes', 'sdfsdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'Cash', 'sdf', 'sdf', 'sdf', 'sdf', 'sdfsdf', 'true', 'true', '', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 1, '2023-08-15 23:38:09', 1),
(3, 3, 8, 4, 'Mrs. Raheem Ahmd', 'Raheem@gmail.com', '32 Yrs', '1', 'Dhaka , Bangladesh', 120000.00, '01915728982', '2023-07-07', '2023-07-21', '/backend/files/n3ZCXWhTKIWVi4TZfHto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'EMP-003', 'Mrs.', 'Raheem', 'Ahmd', '11122233445', 'Single', 9, 'LEFT', '0000-00-00', '0000-00-00', '0000-00-00', 'Test', 'Test', 'Test', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', '2023-08-23', '2023-08-31', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'null', '5', 'Pay Group', '4', 'null', 'Pay Group', '0000-00-00', '0000-00-00', '0000-00-00', 'Pay Group', '11', '10', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'No', 'Pay Group', 'Pay Group', '3', 'Pay Group', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'Pay Group', 'null', '', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'Pay Group', 'Pay Group', '5', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'null', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'null', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'Pay Group', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 1, '2023-08-16 14:13:11', 1);

-- --------------------------------------------------------

--
-- Table structure for table `companyprofilesettings`
--

CREATE TABLE `companyprofilesettings` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `logo` text DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `phone_number` text NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` text NOT NULL,
  `about` text DEFAULT NULL,
  `founded_year` varchar(255) DEFAULT NULL,
  `revenue` decimal(15,2) DEFAULT NULL,
  `employee_count` int(11) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `language` varchar(20) DEFAULT NULL,
  `setup_charge` decimal(15,2) DEFAULT NULL,
  `transaction_fee` decimal(15,2) DEFAULT NULL,
  `other_charges` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companyprofilesettings`
--

INSERT INTO `companyprofilesettings` (`id`, `company_id`, `company_name`, `logo`, `address`, `city`, `state`, `country`, `postal_code`, `phone_number`, `email`, `phone`, `about`, `founded_year`, `revenue`, `employee_count`, `industry`, `timezone`, `currency`, `language`, `setup_charge`, `transaction_fee`, `other_charges`, `created_at`, `updated_at`) VALUES
(1, 0, 'Ekroybd', '/backend/upload/1711747306.png', 'islamabad pakistan', '[value-6]', '[value-7]', '[value-8]', '[value-9]', '0', 'admin@ekroybd.com', '017010000000', 'about us here', '0000', 0.00, 0, 'Ecommerce', '[value-17]', '[va', '[value-19]', 0.00, 10.00, '00.00', '2024-03-29 05:13:07', '2024-04-12 04:13:33');

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `countrycode` char(3) NOT NULL,
  `countryname` varchar(200) NOT NULL,
  `code` char(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `countrycode`, `countryname`, `code`) VALUES
(1, 'ABW', 'Aruba', 'AW'),
(2, 'AFG', 'Afghanistan', 'AF'),
(3, 'AGO', 'Angola', 'AO'),
(4, 'AIA', 'Anguilla', 'AI'),
(5, 'ALA', 'Åland', 'AX'),
(6, 'ALB', 'Albania', 'AL'),
(7, 'AND', 'Andorra', 'AD'),
(8, 'ARE', 'United Arab Emirates', 'AE'),
(9, 'ARG', 'Argentina', 'AR'),
(10, 'ARM', 'Armenia', 'AM'),
(11, 'ASM', 'American Samoa', 'AS'),
(12, 'ATA', 'Antarctica', 'AQ'),
(13, 'ATF', 'French Southern Territories', 'TF'),
(14, 'ATG', 'Antigua and Barbuda', 'AG'),
(15, 'AUS', 'Australia', 'AU'),
(16, 'AUT', 'Austria', 'AT'),
(17, 'AZE', 'Azerbaijan', 'AZ'),
(18, 'BDI', 'Burundi', 'BI'),
(19, 'BEL', 'Belgium', 'BE'),
(20, 'BEN', 'Benin', 'BJ'),
(21, 'BES', 'Bonaire', 'BQ'),
(22, 'BFA', 'Burkina Faso', 'BF'),
(23, 'BGD', 'Bangladesh', 'BD'),
(24, 'BGR', 'Bulgaria', 'BG'),
(25, 'BHR', 'Bahrain', 'BH'),
(26, 'BHS', 'Bahamas', 'BS'),
(27, 'BIH', 'Bosnia and Herzegovina', 'BA'),
(28, 'BLM', 'Saint Barthélemy', 'BL'),
(29, 'BLR', 'Belarus', 'BY'),
(30, 'BLZ', 'Belize', 'BZ'),
(31, 'BMU', 'Bermuda', 'BM'),
(32, 'BOL', 'Bolivia', 'BO'),
(33, 'BRA', 'Brazil', 'BR'),
(34, 'BRB', 'Barbados', 'BB'),
(35, 'BRN', 'Brunei', 'BN'),
(36, 'BTN', 'Bhutan', 'BT'),
(37, 'BVT', 'Bouvet Island', 'BV'),
(38, 'BWA', 'Botswana', 'BW'),
(39, 'CAF', 'Central African Republic', 'CF'),
(40, 'CAN', 'Canada', 'CA'),
(41, 'CCK', 'Cocos [Keeling] Islands', 'CC'),
(42, 'CHE', 'Switzerland', 'CH'),
(43, 'CHL', 'Chile', 'CL'),
(44, 'CHN', 'China', 'CN'),
(45, 'CIV', 'Ivory Coast', 'CI'),
(46, 'CMR', 'Cameroon', 'CM'),
(47, 'COD', 'Democratic Republic of the Congo', 'CD'),
(48, 'COG', 'Republic of the Congo', 'CG'),
(49, 'COK', 'Cook Islands', 'CK'),
(50, 'COL', 'Colombia', 'CO'),
(51, 'COM', 'Comoros', 'KM'),
(52, 'CPV', 'Cape Verde', 'CV'),
(53, 'CRI', 'Costa Rica', 'CR'),
(54, 'CUB', 'Cuba', 'CU'),
(55, 'CUW', 'Curacao', 'CW'),
(56, 'CXR', 'Christmas Island', 'CX'),
(57, 'CYM', 'Cayman Islands', 'KY'),
(58, 'CYP', 'Cyprus', 'CY'),
(59, 'CZE', 'Czech Republic', 'CZ'),
(60, 'DEU', 'Germany', 'DE'),
(61, 'DJI', 'Djibouti', 'DJ'),
(62, 'DMA', 'Dominica', 'DM'),
(63, 'DNK', 'Denmark', 'DK'),
(64, 'DOM', 'Dominican Republic', 'DO'),
(65, 'DZA', 'Algeria', 'DZ'),
(66, 'ECU', 'Ecuador', 'EC'),
(67, 'EGY', 'Egypt', 'EG'),
(68, 'ERI', 'Eritrea', 'ER'),
(69, 'ESH', 'Western Sahara', 'EH'),
(70, 'ESP', 'Spain', 'ES'),
(71, 'EST', 'Estonia', 'EE'),
(72, 'ETH', 'Ethiopia', 'ET'),
(73, 'FIN', 'Finland', 'FI'),
(74, 'FJI', 'Fiji', 'FJ'),
(75, 'FLK', 'Falkland Islands', 'FK'),
(76, 'FRA', 'France', 'FR'),
(77, 'FRO', 'Faroe Islands', 'FO'),
(78, 'FSM', 'Micronesia', 'FM'),
(79, 'GAB', 'Gabon', 'GA'),
(80, 'GBR', 'United Kingdom', 'GB'),
(81, 'GEO', 'Georgia', 'GE'),
(82, 'GGY', 'Guernsey', 'GG'),
(83, 'GHA', 'Ghana', 'GH'),
(84, 'GIB', 'Gibraltar', 'GI'),
(85, 'GIN', 'Guinea', 'GN'),
(86, 'GLP', 'Guadeloupe', 'GP'),
(87, 'GMB', 'Gambia', 'GM'),
(88, 'GNB', 'Guinea-Bissau', 'GW'),
(89, 'GNQ', 'Equatorial Guinea', 'GQ'),
(90, 'GRC', 'Greece', 'GR'),
(91, 'GRD', 'Grenada', 'GD'),
(92, 'GRL', 'Greenland', 'GL'),
(93, 'GTM', 'Guatemala', 'GT'),
(94, 'GUF', 'French Guiana', 'GF'),
(95, 'GUM', 'Guam', 'GU'),
(96, 'GUY', 'Guyana', 'GY'),
(97, 'HKG', 'Hong Kong', 'HK'),
(98, 'HMD', 'Heard Island and McDonald Islands', 'HM'),
(99, 'HND', 'Honduras', 'HN'),
(100, 'HRV', 'Croatia', 'HR'),
(101, 'HTI', 'Haiti', 'HT'),
(102, 'HUN', 'Hungary', 'HU'),
(103, 'IDN', 'Indonesia', 'ID'),
(104, 'IMN', 'Isle of Man', 'IM'),
(105, 'IND', 'India', 'IN'),
(106, 'IOT', 'British Indian Ocean Territory', 'IO'),
(107, 'IRL', 'Ireland', 'IE'),
(108, 'IRN', 'Iran', 'IR'),
(109, 'IRQ', 'Iraq', 'IQ'),
(110, 'ISL', 'Iceland', 'IS'),
(111, 'ISR', 'Israel', 'IL'),
(112, 'ITA', 'Italy', 'IT'),
(113, 'JAM', 'Jamaica', 'JM'),
(114, 'JEY', 'Jersey', 'JE'),
(115, 'JOR', 'Jordan', 'JO'),
(116, 'JPN', 'Japan', 'JP'),
(117, 'KAZ', 'Kazakhstan', 'KZ'),
(118, 'KEN', 'Kenya', 'KE'),
(119, 'KGZ', 'Kyrgyzstan', 'KG'),
(120, 'KHM', 'Cambodia', 'KH'),
(121, 'KIR', 'Kiribati', 'KI'),
(122, 'KNA', 'Saint Kitts and Nevis', 'KN'),
(123, 'KOR', 'South Korea', 'KR'),
(124, 'KWT', 'Kuwait', 'KW'),
(125, 'LAO', 'Laos', 'LA'),
(126, 'LBN', 'Lebanon', 'LB'),
(127, 'LBR', 'Liberia', 'LR'),
(128, 'LBY', 'Libya', 'LY'),
(129, 'LCA', 'Saint Lucia', 'LC'),
(130, 'LIE', 'Liechtenstein', 'LI'),
(131, 'LKA', 'Sri Lanka', 'LK'),
(132, 'LSO', 'Lesotho', 'LS'),
(133, 'LTU', 'Lithuania', 'LT'),
(134, 'LUX', 'Luxembourg', 'LU'),
(135, 'LVA', 'Latvia', 'LV'),
(136, 'MAC', 'Macao', 'MO'),
(137, 'MAF', 'Saint Martin', 'MF'),
(138, 'MAR', 'Morocco', 'MA'),
(139, 'MCO', 'Monaco', 'MC'),
(140, 'MDA', 'Moldova', 'MD'),
(141, 'MDG', 'Madagascar', 'MG'),
(142, 'MDV', 'Maldives', 'MV'),
(143, 'MEX', 'Mexico', 'MX'),
(144, 'MHL', 'Marshall Islands', 'MH'),
(145, 'MKD', 'Macedonia', 'MK'),
(146, 'MLI', 'Mali', 'ML'),
(147, 'MLT', 'Malta', 'MT'),
(148, 'MMR', 'Myanmar [Burma]', 'MM'),
(149, 'MNE', 'Montenegro', 'ME'),
(150, 'MNG', 'Mongolia', 'MN'),
(151, 'MNP', 'Northern Mariana Islands', 'MP'),
(152, 'MOZ', 'Mozambique', 'MZ'),
(153, 'MRT', 'Mauritania', 'MR'),
(154, 'MSR', 'Montserrat', 'MS'),
(155, 'MTQ', 'Martinique', 'MQ'),
(156, 'MUS', 'Mauritius', 'MU'),
(157, 'MWI', 'Malawi', 'MW'),
(158, 'MYS', 'Malaysia', 'MY'),
(159, 'MYT', 'Mayotte', 'YT'),
(160, 'NAM', 'Namibia', 'NA'),
(161, 'NCL', 'New Caledonia', 'NC'),
(162, 'NER', 'Niger', 'NE'),
(163, 'NFK', 'Norfolk Island', 'NF'),
(164, 'NGA', 'Nigeria', 'NG'),
(165, 'NIC', 'Nicaragua', 'NI'),
(166, 'NIU', 'Niue', 'NU'),
(167, 'NLD', 'Netherlands', 'NL'),
(168, 'NOR', 'Norway', 'NO'),
(169, 'NPL', 'Nepal', 'NP'),
(170, 'NRU', 'Nauru', 'NR'),
(171, 'NZL', 'New Zealand', 'NZ'),
(172, 'OMN', 'Oman', 'OM'),
(173, 'PAK', 'Pakistan', 'PK'),
(174, 'PAN', 'Panama', 'PA'),
(175, 'PCN', 'Pitcairn Islands', 'PN'),
(176, 'PER', 'Peru', 'PE'),
(177, 'PHL', 'Philippines', 'PH'),
(178, 'PLW', 'Palau', 'PW'),
(179, 'PNG', 'Papua New Guinea', 'PG'),
(180, 'POL', 'Poland', 'PL'),
(181, 'PRI', 'Puerto Rico', 'PR'),
(182, 'PRK', 'North Korea', 'KP'),
(183, 'PRT', 'Portugal', 'PT'),
(184, 'PRY', 'Paraguay', 'PY'),
(185, 'PSE', 'Palestine', 'PS'),
(186, 'PYF', 'French Polynesia', 'PF'),
(187, 'QAT', 'Qatar', 'QA'),
(188, 'REU', 'Réunion', 'RE'),
(189, 'ROU', 'Romania', 'RO'),
(190, 'RUS', 'Russia', 'RU'),
(191, 'RWA', 'Rwanda', 'RW'),
(192, 'SAU', 'Saudi Arabia', 'SA'),
(193, 'SDN', 'Sudan', 'SD'),
(194, 'SEN', 'Senegal', 'SN'),
(195, 'SGP', 'Singapore', 'SG'),
(196, 'SGS', 'South Georgia and the South Sandwich Islands', 'GS'),
(197, 'SHN', 'Saint Helena', 'SH'),
(198, 'SJM', 'Svalbard and Jan Mayen', 'SJ'),
(199, 'SLB', 'Solomon Islands', 'SB'),
(200, 'SLE', 'Sierra Leone', 'SL'),
(201, 'SLV', 'El Salvador', 'SV'),
(202, 'SMR', 'San Marino', 'SM'),
(203, 'SOM', 'Somalia', 'SO'),
(204, 'SPM', 'Saint Pierre and Miquelon', 'PM'),
(205, 'SRB', 'Serbia', 'RS'),
(206, 'SSD', 'South Sudan', 'SS'),
(207, 'STP', 'São Tomé and Príncipe', 'ST'),
(208, 'SUR', 'Suriname', 'SR'),
(209, 'SVK', 'Slovakia', 'SK'),
(210, 'SVN', 'Slovenia', 'SI'),
(211, 'SWE', 'Sweden', 'SE'),
(212, 'SWZ', 'Swaziland', 'SZ'),
(213, 'SXM', 'Sint Maarten', 'SX'),
(214, 'SYC', 'Seychelles', 'SC'),
(215, 'SYR', 'Syria', 'SY'),
(216, 'TCA', 'Turks and Caicos Islands', 'TC'),
(217, 'TCD', 'Chad', 'TD'),
(218, 'TGO', 'Togo', 'TG'),
(219, 'THA', 'Thailand', 'TH'),
(220, 'TJK', 'Tajikistan', 'TJ'),
(221, 'TKL', 'Tokelau', 'TK'),
(222, 'TKM', 'Turkmenistan', 'TM'),
(223, 'TLS', 'East Timor', 'TL'),
(224, 'TON', 'Tonga', 'TO'),
(225, 'TTO', 'Trinidad and Tobago', 'TT'),
(226, 'TUN', 'Tunisia', 'TN'),
(227, 'TUR', 'Turkey', 'TR'),
(228, 'TUV', 'Tuvalu', 'TV'),
(229, 'TWN', 'Taiwan', 'TW'),
(230, 'TZA', 'Tanzania', 'TZ'),
(231, 'UGA', 'Uganda', 'UG'),
(232, 'UKR', 'Ukraine', 'UA'),
(233, 'UMI', 'U.S. Minor Outlying Islands', 'UM'),
(234, 'URY', 'Uruguay', 'UY'),
(235, 'USA', 'United States', 'US'),
(236, 'UZB', 'Uzbekistan', 'UZ'),
(237, 'VAT', 'Vatican City', 'VA'),
(238, 'VCT', 'Saint Vincent and the Grenadines', 'VC'),
(239, 'VEN', 'Venezuela', 'VE'),
(240, 'VGB', 'British Virgin Islands', 'VG'),
(241, 'VIR', 'U.S. Virgin Islands', 'VI'),
(242, 'VNM', 'Vietnam', 'VN'),
(243, 'VUT', 'Vanuatu', 'VU'),
(244, 'WLF', 'Wallis and Futuna', 'WF'),
(245, 'WSM', 'Samoa', 'WS'),
(246, 'XKX', 'Kosovo', 'XK'),
(247, 'YEM', 'Yemen', 'YE'),
(248, 'ZAF', 'South Africa', 'ZA'),
(249, 'ZMB', 'Zambia', 'ZM'),
(250, 'ZWE', 'Zimbabwe', 'ZW');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `promocode` varchar(255) NOT NULL,
  `d_percent` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `slug`, `promocode`, `d_percent`, `status`, `Created_at`, `Updated_at`) VALUES
(1, 'PROMO-1', '', '123', 5, 1, '2026-04-27 22:50:40', '2026-04-27 22:50:40'),
(2, 'PROMO-2', '', '456', 6, 1, '2026-04-27 22:51:00', '2026-04-27 22:51:00'),
(3, 'PROMO-3', '', '789', 7, 1, '2026-04-27 23:02:12', '2026-04-27 23:02:12');

-- --------------------------------------------------------

--
-- Table structure for table `couponusehistorys`
--

CREATE TABLE `couponusehistorys` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `couponusehistorys`
--

INSERT INTO `couponusehistorys` (`id`, `user_id`, `coupon_id`, `Created_at`, `Updated_at`) VALUES
(1, 1, 23, '2024-03-26 20:57:10', '2024-03-26 20:57:10'),
(2, 1, 19, '2024-03-26 21:34:16', '2024-03-26 21:34:16'),
(3, 1, 18, '2024-03-26 22:17:06', '2024-03-26 22:17:06'),
(4, 21, 1, '2026-04-28 01:30:35', '2026-04-28 01:30:35');

-- --------------------------------------------------------

--
-- Table structure for table `creditcards`
--

CREATE TABLE `creditcards` (
  `id` int(11) NOT NULL,
  `card_number` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `card_holder` varchar(255) NOT NULL,
  `card_type` varchar(50) DEFAULT NULL,
  `expiry_date` text DEFAULT NULL,
  `cvv` varchar(4) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `issuing_bank` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `creditcards`
--

INSERT INTO `creditcards` (`id`, `card_number`, `user_id`, `card_holder`, `card_type`, `expiry_date`, `cvv`, `billing_address`, `issuing_bank`, `updated_at`, `created_at`) VALUES
(0, '4000056655665556', 1, 'Pronay', NULL, '02/30', NULL, NULL, NULL, '2024-03-29 21:23:17', '2024-03-29 21:23:17'),
(0, '40051313215121212', 1, 'Jahid', NULL, '04/28', NULL, NULL, NULL, '2024-04-05 23:34:40', '2024-04-05 23:34:40');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `addres` varchar(255) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealsbanners`
--

CREATE TABLE `dealsbanners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `inside_dv_charge` int(11) DEFAULT NULL,
  `outside_dv_charge` int(11) DEFAULT NULL,
  `imageOne` text NOT NULL,
  `imageTwo` text NOT NULL,
  `imageOneLink` varchar(255) DEFAULT NULL,
  `imageTwoLink` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dealsbanners`
--

INSERT INTO `dealsbanners` (`id`, `name`, `inside_dv_charge`, `outside_dv_charge`, `imageOne`, `imageTwo`, `imageOneLink`, `imageTwoLink`, `updated_at`, `created_at`) VALUES
(1, 'DealsAdsBanner', 70, 120, '/bannerImage/1771393511img.gif', '/bannerImage/1771393926.gif', 'https://birv2.futuregenit.com/category/category-filter/?slug=vtech-silicon-rtv', 'https://birv2.futuregenit.com/category/category-filter/?slug=foldable-clothes-drying-racks', '2026-07-05 17:24:39', '2024-02-29 19:22:16');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `status`, `entry_by`, `created_at`) VALUES
(1, 'Research and development', 1, 1, '2023-07-15 21:33:10'),
(2, 'Operations', 1, 1, '2023-07-15 21:33:24'),
(3, 'fhfghfghfgh1111', 1, 1, '2023-07-16 09:57:04'),
(4, 'Marketing and sales', 1, 1, '2023-07-16 09:57:51'),
(5, 'Human resources', 1, 1, '2023-07-16 09:57:58'),
(6, 'Customer service', 1, 1, '2023-07-16 09:58:07'),
(7, 'Accounting and finance', 1, 1, '2023-07-16 09:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `name`, `status`, `entry_by`, `created_at`) VALUES
(1, 'Chairman', 1, 1, '2023-07-15 21:56:25'),
(2, 'Director', 1, 1, '2023-07-15 22:01:20'),
(3, 'Managing Director', 1, 1, '2023-07-16 09:54:43'),
(4, 'Chief Executive Officer (CEO)', 1, 1, '2023-07-16 09:54:51'),
(5, 'Chief Financial Officer (CFO)', 1, 1, '2023-07-16 09:55:05'),
(6, 'Secretary', 1, 1, '2023-07-16 09:55:12'),
(7, 'Chief Operating Officer (COO)', 1, 1, '2023-07-16 09:55:23'),
(8, 'Chief Technology Officer (CTO)', 1, 1, '2023-07-16 09:55:30'),
(9, 'Vice President', 1, 1, '2023-07-16 09:55:37'),
(10, 'Manager', 1, 1, '2023-07-16 09:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `gender` varchar(225) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `salary` double(10,2) DEFAULT NULL,
  `phone` varchar(225) DEFAULT NULL,
  `joning_date` date DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `image` varchar(225) DEFAULT NULL,
  `type_of_doc` text DEFAULT NULL,
  `passport_upload_docs` text DEFAULT NULL,
  `visa_upload_documents` text DEFAULT NULL,
  `euss_upload_documents` text DEFAULT NULL,
  `nid_upload_documents` text DEFAULT NULL,
  `other_upload_documents` text DEFAULT NULL,
  `employee_code` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `ni_no` varchar(255) DEFAULT NULL,
  `marital_status` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `employee_type` varchar(255) DEFAULT NULL,
  `date_of_confirmation` date DEFAULT NULL,
  `contact_start_date` date DEFAULT NULL,
  `contact_end_date` date DEFAULT NULL,
  `job_location` varchar(255) DEFAULT NULL,
  `reporting_authority` varchar(255) DEFAULT NULL,
  `leave_sanction_auth` varchar(255) DEFAULT NULL,
  `education_details` text DEFAULT NULL,
  `job_details` text DEFAULT NULL,
  `key_respons` text DEFAULT NULL,
  `training_details` varchar(255) DEFAULT NULL,
  `emger_contact_name` varchar(255) DEFAULT NULL,
  `emger_email` varchar(255) DEFAULT NULL,
  `emger_contact_no` varchar(255) DEFAULT NULL,
  `emger_address` varchar(255) DEFAULT NULL,
  `certifi_title` varchar(255) DEFAULT NULL,
  `certifi_license_number` varchar(255) DEFAULT NULL,
  `certifi_start_date` date DEFAULT NULL,
  `certifi_end_date` date DEFAULT NULL,
  `contact_info_post_code` varchar(255) DEFAULT NULL,
  `contact_info_address` varchar(255) DEFAULT NULL,
  `contact_info_address_1` varchar(255) DEFAULT NULL,
  `contact_info_address_2` varchar(255) DEFAULT NULL,
  `contact_info_address_3` varchar(255) DEFAULT NULL,
  `contact_info_city_country` varchar(255) DEFAULT NULL,
  `contact_info_country_id` varchar(255) DEFAULT NULL,
  `pass_no` varchar(255) DEFAULT NULL,
  `pass_nationality` varchar(255) DEFAULT NULL,
  `pass_place_birth` varchar(255) DEFAULT NULL,
  `pass_issued_by` varchar(255) DEFAULT NULL,
  `pass_date` date DEFAULT NULL,
  `pass_expire_date` date DEFAULT NULL,
  `pass_review_date` date DEFAULT NULL,
  `visa_brp_np` varchar(255) DEFAULT NULL,
  `visa_nationality` varchar(255) DEFAULT NULL,
  `visa_country_residence` varchar(255) DEFAULT NULL,
  `visa_issuedby` varchar(255) DEFAULT NULL,
  `visa_issued_date` date DEFAULT NULL,
  `visa_expire_date` date DEFAULT NULL,
  `visa_eligbible_review_date` date DEFAULT NULL,
  `visa_current_yesno` varchar(255) DEFAULT NULL,
  `visa_remarks` text DEFAULT NULL,
  `ess_ref_no` varchar(255) DEFAULT NULL,
  `ess_nationality` varchar(255) DEFAULT NULL,
  `ess_issued_by` varchar(255) DEFAULT NULL,
  `ess_issued_date` date DEFAULT NULL,
  `ess_expire_date` date DEFAULT NULL,
  `ess_eligible_review_date` date DEFAULT NULL,
  `ess_current_visa` varchar(255) DEFAULT NULL,
  `ess_remarks` varchar(255) DEFAULT NULL,
  `nid_number` text DEFAULT NULL,
  `nid_nationality` varchar(255) DEFAULT NULL,
  `nid_country_residence` varchar(255) DEFAULT NULL,
  `nid_issue_date` date DEFAULT NULL,
  `nid_expire_date` date DEFAULT NULL,
  `nid_eli_review_date` date DEFAULT NULL,
  `nid_current_visa` varchar(255) DEFAULT NULL,
  `nid_remarks` varchar(255) DEFAULT NULL,
  `others_doc_name` varchar(255) DEFAULT NULL,
  `others_ref_name` varchar(255) DEFAULT NULL,
  `others_nationality` varchar(255) DEFAULT NULL,
  `others_issue_date` date DEFAULT NULL,
  `others_expire_date` date DEFAULT NULL,
  `others_eligb_review_date` date DEFAULT NULL,
  `others_visa_sts` varchar(255) DEFAULT NULL,
  `others_remarks` varchar(255) DEFAULT NULL,
  `pay_group` varchar(255) DEFAULT NULL,
  `pay_annual_pay` varchar(255) DEFAULT NULL,
  `pay_wedges_pay_mode` varchar(255) DEFAULT NULL,
  `pay_payment_type` varchar(255) DEFAULT NULL,
  `pay_basic_daily_wedges` varchar(255) DEFAULT NULL,
  `pay_min_working_hour` varchar(255) DEFAULT NULL,
  `pay_tax_code` varchar(255) DEFAULT NULL,
  `pay_tax_ref` varchar(200) DEFAULT NULL,
  `pay_percentage` varchar(200) DEFAULT NULL,
  `pay_payment_mode` varchar(200) DEFAULT NULL,
  `pay_bank_name` varchar(200) DEFAULT NULL,
  `pay_branch_name` varchar(200) DEFAULT NULL,
  `pay_account_no` text DEFAULT NULL,
  `pay_sort_code` text DEFAULT NULL,
  `pay_remarks` text DEFAULT NULL,
  `payment_da` text DEFAULT NULL,
  `payment_hra` text DEFAULT NULL,
  `payment_conven_ta` text DEFAULT NULL,
  `payment_perfomance` text DEFAULT NULL,
  `payment_monthly_al` text DEFAULT NULL,
  `ni_dedu_da` text DEFAULT NULL,
  `ni_dedu_hra` text DEFAULT NULL,
  `ni_dedu_conven_ta` text DEFAULT NULL,
  `ni_dedu_perfomance` text DEFAULT NULL,
  `ni_dedu_monthly_al` text DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `designation_id`, `department_id`, `name`, `email`, `age`, `gender`, `address`, `salary`, `phone`, `joning_date`, `date_of_birth`, `image`, `type_of_doc`, `passport_upload_docs`, `visa_upload_documents`, `euss_upload_documents`, `nid_upload_documents`, `other_upload_documents`, `employee_code`, `first_name`, `middle_name`, `last_name`, `ni_no`, `marital_status`, `country_id`, `employee_type`, `date_of_confirmation`, `contact_start_date`, `contact_end_date`, `job_location`, `reporting_authority`, `leave_sanction_auth`, `education_details`, `job_details`, `key_respons`, `training_details`, `emger_contact_name`, `emger_email`, `emger_contact_no`, `emger_address`, `certifi_title`, `certifi_license_number`, `certifi_start_date`, `certifi_end_date`, `contact_info_post_code`, `contact_info_address`, `contact_info_address_1`, `contact_info_address_2`, `contact_info_address_3`, `contact_info_city_country`, `contact_info_country_id`, `pass_no`, `pass_nationality`, `pass_place_birth`, `pass_issued_by`, `pass_date`, `pass_expire_date`, `pass_review_date`, `visa_brp_np`, `visa_nationality`, `visa_country_residence`, `visa_issuedby`, `visa_issued_date`, `visa_expire_date`, `visa_eligbible_review_date`, `visa_current_yesno`, `visa_remarks`, `ess_ref_no`, `ess_nationality`, `ess_issued_by`, `ess_issued_date`, `ess_expire_date`, `ess_eligible_review_date`, `ess_current_visa`, `ess_remarks`, `nid_number`, `nid_nationality`, `nid_country_residence`, `nid_issue_date`, `nid_expire_date`, `nid_eli_review_date`, `nid_current_visa`, `nid_remarks`, `others_doc_name`, `others_ref_name`, `others_nationality`, `others_issue_date`, `others_expire_date`, `others_eligb_review_date`, `others_visa_sts`, `others_remarks`, `pay_group`, `pay_annual_pay`, `pay_wedges_pay_mode`, `pay_payment_type`, `pay_basic_daily_wedges`, `pay_min_working_hour`, `pay_tax_code`, `pay_tax_ref`, `pay_percentage`, `pay_payment_mode`, `pay_bank_name`, `pay_branch_name`, `pay_account_no`, `pay_sort_code`, `pay_remarks`, `payment_da`, `payment_hra`, `payment_conven_ta`, `payment_perfomance`, `payment_monthly_al`, `ni_dedu_da`, `ni_dedu_hra`, `ni_dedu_conven_ta`, `ni_dedu_perfomance`, `ni_dedu_monthly_al`, `entry_by`, `created_at`, `status`) VALUES
(1, 8, 4, 'Employee-1', 'bijon@gmail.com', '32 Yrs', '1', 'Dhaka , Bangladesh', 120000.00, '01915728982', '2023-07-07', '2023-07-21', '/backend/files/n3ZCXWhTKIWVi4TZfHto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'EMP-001', NULL, NULL, NULL, NULL, NULL, NULL, 'CONTRACTUAL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2023-07-16 11:11:49', 1),
(2, 4, 5, 'Ibraheem', 'Ibraheem@gmail.com', '2', '1', 'Dhaka , Bangladesh', 50000.00, '112233456', '2023-07-28', '2023-07-27', '/backend/files/0HjRR3tDHvFgdwr00NAB.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'EMP-002', 'null', 'null', 'null', 'null', 'null', 0, 'CONTRACTUAL', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', '', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', NULL, '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '', '', '', '', '', '', '', '', '', '', 1, '2023-07-16 11:12:51', 0),
(3, 8, 4, 'Raheem', 'Raheem@gmail.com', '32 Yrs', '1', 'Dhaka , Bangladesh', 120000.00, '01915728982', '2023-07-07', '2023-07-21', '/backend/files/n3ZCXWhTKIWVi4TZfHto.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'EMP-003', 'null', 'null', 'null', 'null', 'null', 0, 'CONTRACTUAL', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', '', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '', '', '', '', '', '', '', '', '', '', 1, '2023-07-16 11:11:49', 0),
(4, 6, 6, 'Employee-3', 'we2022@gmail.com', '444', '1', '333', 34343.00, '343434', '2023-08-08', '2023-08-08', '/backend/files/ESzCAGIDj20ZJNLXthmy.jpg', NULL, NULL, NULL, NULL, NULL, NULL, 'EMP-004', 'Md.', 'Gazi', 'Uddin', '343434', 'Married', 8, 'CONTRACTUAL', '2023-08-29', '2023-08-17', '2023-08-18', 'fdg', 'dfg', 'dfg', 'dfg', 'dfg', 'dfgdfgdfg', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', '', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', '0000-00-00', '0000-00-00', '0000-00-00', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', NULL, 'null', 'null', 'null', 'null', 1, '2023-08-08 09:55:34', 0),
(5, 3, 4, 'Employee-4', 'onlinesoft@gmail.com', '33f1111', '1', 'fgfdgf1111', 330000.00, 'sdff1111', '2023-08-10', '2023-08-24', '/backend/files/yLueQNQHCDh4PEdlOmzf.jpg', '/backend/files/mK9pawBkTAUCnlnLLVZ8.jpg', '/backend/files/qtjiMkUrXLvCpHnPXfot.jpg', '/backend/files/ackvh94E74xeWVcqbHPt.jpg', '/backend/files/aGTivb3cUepDtHEyj9dm.jpg', '/backend/files/08gLujAFSq6VKfQTbuKi.jpg', NULL, 'EMP-005', 'df1111', 'sdff1111', 'sdff1111', 'dsff1111', 'Single', 4, 'SUSPEND', '2023-08-16', '2023-08-23', '2023-08-31', 'dfgf1111', 'dfgf1111', 'dfgdfgf1111', 'dfgf1111', 'dfgf1111', 'dfgf1111', 'dfgdfgf1111', 'dfgdfgdfg111111', 'dfgdfg@gmail.comf1111', '353434f1111', 'sdfsdff1111', 'sdfsdff1111', 'sdfsdf111111', '2023-08-24', '2023-08-17', 'wewerf1111', 'werwer111111', 'dsfsdfsdf', 'dfdfdsf', 'dsfsdfsdf', '2023-08-31', '6', 'sdfsdf111111', '3', '2023-08-23', 'sdfsdf111111', '2023-08-18', '2023-08-24', '2023-08-25', 'sdf111111', '9', '5', 'sdfsdfsdf111111', '2023-08-22', '2023-08-16', '2023-08-24', 'Yes', '111111111111111111111111', 'sdfsdf11111', '11', 'sdfsdfsdf', '2023-08-31', '2023-08-16', '2023-08-25', 'Yes', 'asdasdf11111f11111f11111', '216548748', '2', '2', '2023-08-24', '2023-08-31', '2023-08-31', 'Yes', 'asdasdf11111f11111f11111', 'asd', 'sadasdasd', '2', '2023-08-17', '2023-08-23', '2023-08-23', 'Yes', 'sdfsdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'Cash', 'sdf', 'sdf', 'sdf', 'sdf', 'sdfsdf', 'true', 'true', 'false', 'true', 'true', 'true', 'true', 'true', 'true', 'true', 1, '2023-08-15 11:10:11', 1),
(6, 7, 6, 'Employee6 Six Emp', 'OnlinessSit2221@gmail.com', 'eed', '1', 'fsdfsdf', 34234234.00, '324234', '2023-08-30', '2023-08-16', '/backend/files/I0ZYJ7wmwlVnZ1ZEe6Z9.jpg', '/backend/files/3iJXaelLRTTkIHBlVNq2.jpg', '/backend/files/sWe1DbkAU7lBaLTLQq57.jpg', '/backend/files/3Gqsx9Qm9HWakp3GoJDE.jpg', '/backend/files/kJDdkiRXW3igzULbs1RZ.jpg', NULL, '/backend/files/qQRq3ozkjgiEnkX2pTnl.jpg', 'EMP-006', 'Employee6', 'Six', 'Emp', 'sdfsdf', 'Widow', 10, 'SUSPEND', '2023-08-17', '2023-08-10', '2023-08-17', 'sdfs', '', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 'sdf', 's@gmail.com', 's', 'sdf', 'sfs', 'sdf', '2023-08-21', '2023-08-27', 'asdd', 'fsdf', 'sdf', 'sdf', 'sdfsdf', '2023-08-17', '2', 'dgdfg', '3', '2023-08-24', '3245', '0000-00-00', '0000-00-00', '0000-00-00', 'sdf', '3', '4', 'sdfsdf', '2023-08-17', '2023-08-18', '2023-08-17', '', '', 'sdfs', '6', '234234', '2023-08-21', '2023-08-24', '2023-08-25', 'No', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', '', '0000-00-00', '0000-00-00', '0000-00-00', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'undefined', '', '', '', '', '', '', '', '', '', '', '', '', 1, '2023-08-15 21:39:45', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee_docs`
--

CREATE TABLE `employee_docs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emp_id` int(10) UNSIGNED NOT NULL COMMENT 'primary key of employee table',
  `title` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `doc_name` varchar(255) DEFAULT NULL,
  `doc` varchar(255) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_docs`
--

INSERT INTO `employee_docs` (`id`, `emp_id`, `title`, `note`, `doc_name`, `doc`, `entry_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 'Title-1', 'Note', NULL, '/backend/files/0LtHc43MXnbUgWIXk2KX.sql', 1, 1, '2023-07-13 04:41:50', '2023-07-28 04:42:07'),
(2, 1, 'Documents of bijon', 'Documents of bijonDocuments of bijonDocuments of bijonDocuments of bijonDocuments of bijonDocuments of bijon', NULL, '/backend/files/K9jKMJLLg7gBS5tMEdmT.sql', 1, 1, '2023-07-28 04:33:22', '2023-07-28 04:33:22'),
(3, 3, 'Raheem122', 'RaheemRaheemRaheem', NULL, '/backend/files/K9jKMJLLg7gBS5tMEdmT.sql', 1, 1, '2023-07-28 04:45:56', '2023-07-28 04:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `employee_holidays`
--

CREATE TABLE `employee_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL COMMENT 'PK Of employees table',
  `holiday` varchar(255) NOT NULL,
  `used_holiday` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_holidays`
--

INSERT INTO `employee_holidays` (`id`, `employee_id`, `holiday`, `used_holiday`, `created_at`, `updated_at`) VALUES
(1, 80, '28', 0, '2023-07-21 11:42:56', '2023-07-21 11:42:56');

-- --------------------------------------------------------

--
-- Table structure for table `employee_leave_request`
--

CREATE TABLE `employee_leave_request` (
  `id` int(11) NOT NULL,
  `employe_id` int(11) DEFAULT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `frm_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `date_of_application` date DEFAULT NULL,
  `no_of_leave` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0=pending,\r\n1=Approved 2=Reject. 	',
  `remarks` text DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_leave_request`
--

INSERT INTO `employee_leave_request` (`id`, `employe_id`, `leave_type_id`, `frm_date`, `to_date`, `date_of_application`, `no_of_leave`, `status`, `remarks`, `created_at`, `updated_at`) VALUES
(1, 6, 1, '2023-09-02', '2023-09-07', '2023-09-02', '2', 1, NULL, '2023-09-02 19:43:31', '2023-09-02 15:06:15'),
(2, 5, 1, '2023-09-02', '2023-09-07', '2023-09-02', '200', 1, 'xddd', '2023-09-02 19:43:31', '2023-09-03 13:47:43'),
(3, 3, 1, '2023-09-02', '2023-09-07', '2023-09-02', '2', 1, NULL, '2023-09-02 19:43:31', '2023-09-02 19:43:31'),
(4, 6, 1, '2023-09-02', '2023-09-07', '2023-09-02', '2', 1, NULL, '2023-09-02 19:43:31', '2023-09-02 19:43:31'),
(5, 5, 1, '2023-09-02', '2023-09-07', '2023-09-02', '2', 1, NULL, '2023-09-02 19:43:31', '2023-09-02 19:43:31'),
(6, 5, 2, '2023-09-04', '2023-09-21', '2023-09-03', '44', 0, 'kk', '2023-09-03 13:35:14', '2023-09-03 13:35:14'),
(7, 5, 4, '2023-09-01', '2023-09-28', '2023-09-03', '27', 0, 'ddd', '2023-09-03 13:57:44', '2023-09-03 13:58:37'),
(8, 5, 2, '2023-09-01', '2023-09-02', '2023-09-03', '1', 0, NULL, '2023-09-03 13:58:05', '2023-09-03 13:58:05');

-- --------------------------------------------------------

--
-- Table structure for table `employee_type`
--

CREATE TABLE `employee_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_type`
--

INSERT INTO `employee_type` (`id`, `name`, `status`, `entry_by`) VALUES
(1, 'FULL TIME', 1, 1),
(2, 'CONTRACTUAL', 1, 1),
(3, 'SUSPEND', 1, 1),
(4, 'PART TIME', 1, 1),
(5, 'LEFT', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holiday`
--

CREATE TABLE `holiday` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `holiday`
--

INSERT INTO `holiday` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'New Year\'s Day', 1, NULL, NULL),
(2, 'Good Friday', 1, NULL, NULL),
(3, 'Early May Bank Holiday', 1, NULL, NULL),
(4, 'Spring Bank Holiday', 1, NULL, NULL),
(5, 'Christmas Day', 1, NULL, NULL),
(6, 'Boxing Day', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `home_product_slider_category`
--

CREATE TABLE `home_product_slider_category` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `home_product_slider_category`
--

INSERT INTO `home_product_slider_category` (`id`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(21, 6, 1, '2026-03-01 04:49:50', '2026-03-01 04:49:50'),
(24, 35, 1, '2026-03-01 04:50:45', '2026-03-01 04:50:45'),
(25, 7, 1, '2026-03-01 04:51:27', '2026-03-01 04:51:27'),
(26, 9, 1, '2026-03-01 04:52:10', '2026-03-01 04:52:10');

-- --------------------------------------------------------

--
-- Table structure for table `leave_allocation`
--

CREATE TABLE `leave_allocation` (
  `id` int(11) NOT NULL,
  `employee_type` varchar(255) DEFAULT NULL,
  `employe_id` int(11) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `maximum_no_annual` varchar(255) DEFAULT NULL,
  `leave_type` varchar(255) DEFAULT NULL,
  `leave_in_hand` varchar(255) DEFAULT NULL,
  `effective_year` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_allocation`
--

INSERT INTO `leave_allocation` (`id`, `employee_type`, `employe_id`, `year`, `maximum_no_annual`, `leave_type`, `leave_in_hand`, `effective_year`, `status`, `created_at`, `updated_at`) VALUES
(1, 'FULL TIME', 6, '2024', '265', 'Unauthorised Absence', '65', '22222222222', 1, '2023-08-30 17:47:18', '2023-08-31 03:27:51'),
(2, 'FULL TIME', 6, '2021', '265', 'Unauthorised Absence', '5', '2021', 1, '2023-08-30 17:47:18', '2023-08-30 17:47:18'),
(3, 'FULL TIME', 6, '2026', '265', 'Unauthorised Absence', '70', '2022', 1, '2023-08-30 18:12:00', '2023-08-30 18:12:00'),
(4, 'FULL TIME', 5, '2021', '265', 'Unauthorised Absence', '10', '2022', 1, '2023-08-31 03:34:26', '2023-08-31 03:34:26'),
(5, 'FULL TIME', 5, '2023', '265', 'Unauthorised Absence', '5', '2023', 1, '2023-08-31 03:35:16', '2023-08-31 03:35:16'),
(7, 'LEFT', 3, '2026', '150', 'Unauthorised Absence', '5', '2026', 1, '2023-08-31 03:48:27', '2023-08-31 03:48:27'),
(8, 'LEFT', 3, '2024', '150', 'Unauthorised Absence', '145', '2014', 1, '2023-08-31 03:48:59', '2023-08-31 03:48:59');

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `emp_id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '1 = Casual Leave, 2 = Medical Leave',
  `application_date` date NOT NULL,
  `start_date` date NOT NULL,
  `previous_start_date` date DEFAULT NULL,
  `end_date` date NOT NULL,
  `previous_end_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `dp_status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Pending, 2 = Approved, 3 = Declined',
  `dp_approved_by` tinyint(4) DEFAULT NULL,
  `dp_approved_date` date DEFAULT NULL,
  `hr_status` tinyint(4) DEFAULT NULL,
  `hr_approved_by` tinyint(4) DEFAULT NULL,
  `hr_approved_date` date DEFAULT NULL,
  `application_date_changed_by` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_list`
--

CREATE TABLE `leave_list` (
  `id` int(11) NOT NULL,
  `day` varchar(255) DEFAULT NULL,
  `frm_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `no_of_days` varchar(255) DEFAULT NULL,
  `holiday_description` varchar(255) DEFAULT NULL,
  `holiday_type_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_list`
--

INSERT INTO `leave_list` (`id`, `day`, `frm_date`, `to_date`, `no_of_days`, `holiday_description`, `holiday_type_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Friday', '2023-08-03', '2023-08-31', '434', 'Description-1', 3, 1, '2023-08-30 05:57:54', '2023-08-30 06:54:51'),
(2, 'thrusday', '2023-08-30', '2023-09-27', '3', 'Description-2', 3, 1, '2023-08-30 05:59:11', '2023-08-30 05:59:11'),
(3, 'tuesday', '2023-08-24', '2023-08-31', '33', 'Description-3', 5, 1, '2023-08-30 06:07:15', '2023-08-30 06:07:15'),
(4, 'sunday', '2023-08-24', '2023-08-31', '333', 'Description-4', 4, 1, '2023-08-30 06:08:00', '2023-08-30 06:08:00'),
(5, 'monday', '2023-08-01', '2023-08-17', '16', 'Description-5', 3, 1, '2023-08-30 06:20:10', '2023-08-30 06:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `leave_rule`
--

CREATE TABLE `leave_rule` (
  `id` int(11) NOT NULL,
  `employee_type_id` int(11) DEFAULT NULL,
  `leave_type_id` int(11) DEFAULT NULL,
  `maximum_no_annual` varchar(150) DEFAULT NULL,
  `effective_from` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_rule`
--

INSERT INTO `leave_rule` (`id`, `employee_type_id`, `leave_type_id`, `maximum_no_annual`, `effective_from`, `effective_to`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '265', '2023-01-01', '2023-12-31', 2, '2023-08-30 13:01:21', '2023-09-02 15:05:11'),
(2, 2, 7, '160', '2023-01-01', '2023-12-31', 1, '2023-08-30 13:02:06', '2023-08-30 16:40:26'),
(3, 5, 1, '150', '2024-01-01', '2024-12-31', 1, '2023-08-31 03:48:09', '2023-08-31 03:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `leave_type`
--

CREATE TABLE `leave_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `leave_type`
--

INSERT INTO `leave_type` (`id`, `name`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Unauthorised Absence', 'U', 1, '2023-08-30 11:37:29', '2023-08-30 11:51:33'),
(2, 'Paternity Leave', 'PT', 1, '2023-08-30 11:39:39', '2023-08-30 11:51:40'),
(3, 'Holiday', 'H', 1, '2023-08-30 11:51:54', '2023-08-30 11:51:54'),
(4, 'Parental Leave', 'PL', 1, '2023-08-30 11:52:06', '2023-08-30 11:52:06'),
(5, 'Public Duties', 'P', 1, '2023-08-30 11:52:17', '2023-08-30 11:52:17'),
(6, 'Maternity Leave', 'M', 1, '2023-08-30 11:52:28', '2023-08-30 11:52:28'),
(7, 'Jury Service', 'J', 1, '2023-08-30 11:52:41', '2023-08-30 11:52:41'),
(8, 'Bereavement Leave', 'B', 1, '2023-08-30 11:52:50', '2023-08-30 11:52:50'),
(9, 'Antenatal', 'AN', 1, '2023-08-30 11:53:01', '2023-08-30 11:53:01'),
(10, 'Adoption Leave', 'AL', 1, '2023-08-30 11:53:11', '2023-08-30 11:53:11'),
(11, 'Authorised Absence', 'A', 1, '2023-08-30 11:53:25', '2023-08-30 11:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL COMMENT 'TO',
  `sender_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `community_slug` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `files` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `to_id`, `sender_id`, `username`, `community_slug`, `message`, `files`, `created_at`, `updated_at`) VALUES
(1, 4, 2, 4, 'deshimart@gmail.com', 'deshimart@gmail.com', 'Hello roman I\'m Desi mart this my 1st Messages', NULL, '2024-09-10 04:43:43', '2024-09-10 04:43:43'),
(2, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'Yes also my this 1st message replay for you.', NULL, '2024-09-10 04:44:36', '2024-09-10 04:44:36'),
(3, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'Second Messages', NULL, '2024-09-10 04:47:42', '2024-09-10 04:47:42'),
(4, 4, 2, 4, 'deshimart@gmail.com', 'deshimart@gmail.com', 'Roman when come to my shop', NULL, '2024-09-10 05:02:02', '2024-09-10 05:02:02'),
(5, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'Day after tomorrow... brother', NULL, '2024-09-10 05:02:27', '2024-09-10 05:02:27'),
(6, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'Okay selected', NULL, '2024-09-10 05:11:38', '2024-09-10 05:11:38'),
(7, 2, NULL, 2, 'roman@gmail.com', 'roman@gmail.com', '65656', NULL, '2024-09-18 09:22:17', '2024-09-18 09:22:17'),
(8, 2, 3, 2, 'roman@gmail.com', 'roman@gmail.com', 'dd', NULL, '2024-09-18 09:22:36', '2024-09-18 09:22:36'),
(9, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'sdfsdf', NULL, '2024-09-18 09:24:12', '2024-09-18 09:24:12'),
(10, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'gggggggggg', NULL, '2024-09-18 09:24:16', '2024-09-18 09:24:16'),
(11, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'sss', NULL, '2024-09-18 10:39:15', '2024-09-18 10:39:15'),
(12, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'ssssssssssss', NULL, '2024-09-18 10:40:09', '2024-09-18 10:40:09'),
(13, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'dfgdfgdfgdfg', '/backend/files/1726656847.dll', '2024-09-18 10:54:07', '2024-09-18 10:54:07'),
(18, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'Hello bijon', NULL, '2024-09-18 11:06:04', '2024-09-18 11:06:04'),
(19, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'Hello jons', '/backend/files/1726657926.exe', '2024-09-18 11:12:06', '2024-09-18 11:12:06'),
(20, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'Files', '/backend/files/1726657955.exe', '2024-09-18 11:12:35', '2024-09-18 11:12:35'),
(21, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'This game category datbase', '/backend/files/1726658397.sql', '2024-09-18 11:19:57', '2024-09-18 11:19:57'),
(22, 4, 2, 4, 'deshimart@gmail.com', 'deshimart@gmail.com', 'Hello', NULL, '2024-09-18 11:27:50', '2024-09-18 11:27:50'),
(23, 4, 2, 4, 'deshimart@gmail.com', 'deshimart@gmail.com', 'This testing db', '/backend/files/1726658891.dll', '2024-09-18 11:28:11', '2024-09-18 11:28:11'),
(24, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'HI', NULL, '2024-09-19 02:27:35', '2024-09-19 02:27:35'),
(25, 2, 4, 2, 'roman@gmail.com', 'roman@gmail.com', 'Mir. Roman How are you', NULL, '2024-09-19 02:27:40', '2024-09-19 02:27:40');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `orderId` varchar(255) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `pathao_consignment_id` varchar(255) DEFAULT NULL,
  `pathao_merchant_order_id` varchar(255) DEFAULT NULL,
  `pathao_order_status` varchar(255) DEFAULT NULL,
  `pathao_delivery_fee` varchar(255) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `order_status` int(11) NOT NULL DEFAULT 1 COMMENT 'Order Placed=1,Payment Processing=2,Order Confirmed=3,Item Shipped=4,In Transit=5,Out for Delivery=6,Delivered=7,Order Completed=8,Cancelled or Returned=9',
  `coupon_id` int(11) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `coupon_discount` double(10,2) DEFAULT NULL,
  `delivery_charge` int(11) DEFAULT NULL,
  `delivery_type` varchar(255) DEFAULT NULL,
  `billing_name` varchar(255) DEFAULT NULL,
  `billing_email` varchar(255) DEFAULT NULL,
  `billing_phone_number` varchar(255) DEFAULT NULL,
  `billing_address` varchar(255) DEFAULT NULL,
  `billing_country` varchar(255) DEFAULT NULL,
  `billing_city` varchar(255) DEFAULT NULL,
  `shipper_name` varchar(255) DEFAULT NULL,
  `shipper_email` varchar(255) DEFAULT NULL,
  `shipper_phone_number` varchar(255) DEFAULT NULL,
  `shipper_address` varchar(255) DEFAULT NULL,
  `shipper_country` varchar(255) DEFAULT NULL,
  `shipper_city` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `packed_status` text NOT NULL,
  `dispatched_status` text NOT NULL,
  `outForDelivery_status` text NOT NULL,
  `delivered_status` text NOT NULL,
  `cancel_status` text NOT NULL,
  `return_status` text NOT NULL,
  `orderUpdateby` int(11) DEFAULT NULL,
  `orderUpdateDate` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `orderId`, `customer_id`, `pathao_consignment_id`, `pathao_merchant_order_id`, `pathao_order_status`, `pathao_delivery_fee`, `total`, `subtotal`, `order_status`, `coupon_id`, `coupon_code`, `coupon_discount`, `delivery_charge`, `delivery_type`, `billing_name`, `billing_email`, `billing_phone_number`, `billing_address`, `billing_country`, `billing_city`, `shipper_name`, `shipper_email`, `shipper_phone_number`, `shipper_address`, `shipper_country`, `shipper_city`, `payment_type`, `packed_status`, `dispatched_status`, `outForDelivery_status`, `delivered_status`, `cancel_status`, `return_status`, `orderUpdateby`, `orderUpdateDate`, `created_at`, `updated_at`) VALUES
(1, '1132525-26', 11, NULL, NULL, NULL, NULL, 400.00, 480.00, 1, NULL, NULL, NULL, NULL, NULL, 'rana', 'rana@gmail.com', '6598989899', NULL, NULL, NULL, 'rana', 'rana@gmail.com', '6598989899', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-03-11 14:21:38', '2026-03-05 14:21:38'),
(2, '1577221-26', 15, NULL, NULL, NULL, NULL, 400.00, 400.00, 1, NULL, NULL, NULL, NULL, NULL, 'Rabeya', 'rabeya@gmail.com', '5989898999', NULL, NULL, NULL, 'Rabeya', 'rabeya@gmail.com', '5989898999', 'dHAKA', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(3, '1721013-26', 17, NULL, NULL, NULL, NULL, 300.00, 540.00, 1, NULL, NULL, NULL, NULL, NULL, 'hasan', 'hasan@gmail.com', '064597878', NULL, NULL, NULL, 'hasan', 'hasan@gmail.com', '064597878', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-03-11 15:15:17', '2026-03-05 15:15:17'),
(4, '1952666-26', 19, NULL, NULL, NULL, NULL, 3424.00, 3584.00, 1, NULL, NULL, NULL, NULL, NULL, 'Kalam', 'kalam@gmail.com', '05454887878', NULL, NULL, NULL, 'Kalam', 'kalam@gmail.com', '05454887878', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-03-10 07:08:38', '2026-03-10 13:08:38'),
(5, '2089415-26', 20, NULL, NULL, NULL, NULL, 50.00, 130.00, 1, NULL, NULL, NULL, NULL, NULL, 'df', 'df@gmail.com', 'df', NULL, NULL, NULL, 'df', 'df@gmail.com', 'df', 'df', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-03-31 06:02:32', '2026-03-31 12:02:32'),
(6, '2175270-26', 21, NULL, NULL, NULL, NULL, 6385.00, 6545.00, 1, NULL, NULL, NULL, NULL, NULL, 'Test', 'test@gmail.com', '59797979', NULL, NULL, NULL, 'Test', 'test@gmail.com', '59797979', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-15 23:50:08', '2026-04-16 05:50:08'),
(7, '2296606-26', 22, NULL, NULL, NULL, NULL, 210.00, 210.00, 1, NULL, NULL, NULL, NULL, NULL, 'Test1', 'test3434@gmail.com', '259898989', NULL, NULL, NULL, 'Test1', 'test3434@gmail.com', '259898989', 'Dhaka', NULL, NULL, 'online', '', '', '', '', '', '', NULL, NULL, '2026-04-16 00:04:37', '2026-04-16 06:04:37'),
(8, '360833-26', 3, NULL, NULL, NULL, NULL, 10059.00, 10219.00, 1, NULL, NULL, NULL, NULL, NULL, 'Bijon', 'mdbijon@gmail.com', '01915728982', NULL, NULL, NULL, 'Bijon', 'mdbijon@gmail.com', '01915728982', 'Dhaka, Mirpur', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 00:17:21', '2026-04-16 06:17:21'),
(9, '2157243-26', 21, NULL, NULL, NULL, NULL, 10910.00, 11070.00, 1, NULL, NULL, NULL, NULL, NULL, 'test', 'test@gmail.com', '041958989', NULL, NULL, NULL, 'test', 'test@gmail.com', '041958989', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 00:32:13', '2026-04-16 06:32:13'),
(10, '377748-26', 3, NULL, NULL, NULL, NULL, 8736.00, 8896.00, 1, NULL, NULL, NULL, NULL, NULL, 'Karim', 'karim@gmail.com', '01915728982', NULL, NULL, NULL, 'Karim', 'karim@gmail.com', '01915728982', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 03:37:49', '2026-04-16 09:37:49'),
(11, '396344-26', 3, NULL, NULL, NULL, NULL, 8485.00, 8645.00, 1, NULL, NULL, NULL, NULL, NULL, 'Kumarahmed', 'kumarahmed@gmail.com', '01915728982', NULL, NULL, NULL, 'Kumarahmed', 'kumarahmed@gmail.com', '01915728982', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 03:51:34', '2026-04-16 09:51:34'),
(12, '2313657-26', 23, NULL, NULL, NULL, NULL, 5434.00, 5434.00, 1, NULL, NULL, NULL, NULL, NULL, 'Mrs. Ayesha', 'ayesa@gmail.com', '01988876927', NULL, NULL, NULL, 'Mrs. Ayesha', 'ayesa@gmail.com', '01988876927', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 03:54:16', '2026-04-16 09:54:16'),
(13, '326774-26', 3, NULL, NULL, NULL, NULL, 100.00, 180.00, 1, NULL, NULL, NULL, NULL, NULL, 'Joynal', 'joynal@gmail.com', '01915728982', NULL, NULL, NULL, 'Joynal', 'joynal@gmail.com', '01915728982', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 03:57:26', '2026-04-16 09:57:26'),
(14, '329379-26', 3, NULL, NULL, NULL, NULL, 104.00, 104.00, 1, NULL, NULL, NULL, NULL, NULL, 'Janant', 'janant@gmail.com', '01915728982', NULL, NULL, NULL, 'Janant', 'janant@gmail.com', '01915728982', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 04:26:35', '2026-04-16 10:26:35'),
(15, '2438423-26', 24, NULL, NULL, NULL, NULL, 4368.00, 4448.00, 1, NULL, NULL, NULL, NULL, NULL, 'ayan', 'ayan@gmail.com', '01915728982', NULL, NULL, NULL, 'ayan', 'ayan@gmail.com', '01915728982', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 04:42:51', '2026-04-16 10:42:51'),
(16, '2598874-26', 25, NULL, NULL, NULL, NULL, 400.00, 480.00, 1, NULL, NULL, NULL, NULL, NULL, 'sdf', 'sdf@gmailc.com', '878787', NULL, NULL, NULL, 'sdf', 'sdf@gmailc.com', '878787', 'sdfsdfsdf', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 04:48:50', '2026-04-16 10:48:50'),
(17, '2657732-26', 26, NULL, NULL, NULL, NULL, 400.00, 480.00, 1, NULL, NULL, NULL, NULL, NULL, 'joynal', 'joynal111@gmail.com', '01915725555', NULL, NULL, NULL, 'joynal', 'joynal111@gmail.com', '01915725555', 'dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 04:50:53', '2026-04-16 10:50:53'),
(18, '2739558-26', 27, NULL, NULL, NULL, NULL, 4846.00, 4926.00, 1, NULL, NULL, NULL, NULL, NULL, 'Ibraheem', '56ibraheem@gmail.com', '01915728988', NULL, NULL, NULL, 'Ibraheem', '56ibraheem@gmail.com', '01915728988', 'Dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-16 08:24:51', '2026-04-16 14:24:51'),
(19, '2815595-26', 28, NULL, NULL, NULL, NULL, 210.00, 210.00, 1, NULL, NULL, NULL, NULL, NULL, 'tessss', 'test456@gmail.com', '23487923874', NULL, NULL, NULL, 'tessss', 'test456@gmail.com', '23487923874', 'Dhaka', NULL, NULL, 'online', '', '', '', '', '', '', NULL, NULL, '2026-04-16 08:25:50', '2026-04-16 14:25:50'),
(20, '2999183-26', 29, NULL, NULL, NULL, NULL, 22912.00, 22972.00, 1, NULL, NULL, NULL, NULL, NULL, 'test15666', 'test15666@gmail.com', '9989899889', NULL, NULL, NULL, 'test15666', 'test15666@gmail.com', '9989899889', 'Dhaka', NULL, NULL, 'online', '', '', '', '', '', '', NULL, NULL, '2026-04-21 07:53:51', '2026-04-21 13:53:51'),
(21, '2168424-26', 21, NULL, NULL, NULL, NULL, 12453.00, 11890.35, 1, 1, '123', 622.65, 125, 'in side dhaka', 'test', 'test@gmail.com', '84239478923', NULL, NULL, NULL, 'test', 'test@gmail.com', '84239478923', 'dhaka', NULL, NULL, 'cod', '0', '1', '1', '1', '0', '0', NULL, NULL, '2026-04-28 01:30:35', '2026-04-28 09:37:35'),
(22, '2199892-26', 21, NULL, NULL, NULL, NULL, 210.00, 340.00, 1, 0, '', 0.00, 160, 'Outside Dhaka', 'Test', 'test@gmail.com', '59797979', NULL, NULL, NULL, 'Test', 'test@gmail.com', '59797979', 'sdfsdfsdf', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-04-28 02:29:35', '2026-05-03 06:27:13'),
(23, '114770-26', 1, 'DB030526WZMT2H', '114770-26', 'Pickup_Cancelled', '60', 594.00, 654.00, 12, 0, '', 0.00, 60, 'Inside Dhaka', 'admin', 'admin@gmail.com', '968598989', NULL, NULL, NULL, 'admin', 'admin@gmail.com', '01915728982', 'Mirpur-1, Dhaka, Bangladesh', NULL, NULL, 'cod', '', '', '', '', '', '', 1, '2026-05-03', '2026-04-29 03:43:22', '2026-05-03 22:15:22'),
(24, '2471217-26', 24, NULL, NULL, NULL, NULL, 4110.00, 4170.00, 1, 0, '', 0.00, 60, 'Inside Dhaka', 'Bijon ahmed', 'mdbijon@gmail.com', '01915728982', NULL, NULL, NULL, 'Bijon ahmed', 'mdbijon@gmail.com', '01915728982', 'Mirpur-1, Dhaka, Bangladesh', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-05-03 12:22:47', '2026-05-03 05:22:47'),
(25, '3025224-26', 30, NULL, NULL, NULL, NULL, 478.00, 568.00, 1, 0, '', 0.00, 90, 'Outside Dhaka', 'Sayed Shahidul Alam', 'ssalam247144@gmail.com', '01725480484', NULL, NULL, NULL, 'Sayed Shahidul Alam', 'ssalam247144@gmail.com', '01725480484', 'Kalighat Road,Sreemangal-3210,Sreemangal,Moulvibazar', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-05-04 14:44:34', '2026-05-04 07:44:34'),
(26, '3139249-26', 31, NULL, NULL, NULL, NULL, 1394.00, 1484.00, 1, 0, '', 0.00, 90, 'Outside Dhaka', 'Rubel Das', 'rubeldas335@gmail.com', '01834260300', NULL, NULL, NULL, 'Rubel Das', 'rubeldas335@gmail.com', '01834260300', 'Ramgonj, Lakshmipur', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-05-05 00:55:14', '2026-05-04 17:55:14'),
(27, '3058321-26', 30, NULL, NULL, NULL, NULL, 478.00, 568.00, 1, 0, '', 0.00, 90, 'Outside Dhaka', 'S S ALAM', 'ssalam247144@gmail.com', '01725480484', NULL, NULL, NULL, 'S S ALAM', 'ssalam247144@gmail.com', '01725480484', 'Kalighat Road,Sreemangal-3210,Sreemangal,Moulvibazar.', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-05-06 16:50:00', '2026-05-06 09:50:00'),
(28, '3273635-26', 32, NULL, NULL, NULL, NULL, 1199.00, 1249.00, 1, 0, '', 0.00, 50, 'Inside Dhaka', 'Sm Shahnur Riyasad', 'marketing@birgh.net', '01704168997', NULL, NULL, NULL, 'Sm Shahnur Riyasad', 'marketing@birgh.net', '01704168997', 'DHAKA', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-05-07 12:12:17', '2026-05-07 05:12:17'),
(29, '3383860-26', 33, NULL, NULL, NULL, NULL, 400.00, 450.00, 1, 0, '', 0.00, 50, 'Inside Dhaka', 'Sohag', 'amisohag07@gmail.com', '01768860335', NULL, NULL, NULL, 'Sohag', 'amisohag07@gmail.com', '01768860335', 'Robintex germents (project gate), Bhulta, Rupganj, Narayanganj.', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-05-13 11:18:00', '2026-05-13 04:18:00'),
(30, '3439792-26', 34, NULL, NULL, NULL, NULL, 697.00, 787.00, 1, 0, '', 0.00, 90, 'Outside Dhaka', 'Mr Rahat', 'abc.sudo@gmail.com', '01304275857', NULL, NULL, NULL, 'Mr Rahat', 'abc.sudo@gmail.com', '01304275857', 'Ghatkhali Mohila Madrasha(Shikder Bari), Village: Ghatkhali, Upzila: Amtali, Zila: Barguna', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-06-03 03:49:02', '2026-06-02 20:49:02'),
(31, '3782766-26', 37, NULL, NULL, NULL, NULL, 697.00, 747.00, 1, 0, '', 0.00, 50, 'Inside Dhaka', 'kawsar ahmed', 'sdsfa@ssfa.com', '01575124473', NULL, NULL, NULL, 'kawsar ahmed', 'sdsfa@ssfa.com', '01575124473', 'arma group corporate office arma complex house 1/b road ns 1 main road block a banasree rampura dhaka 1219', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-06-24 15:47:08', '2026-06-24 08:47:08'),
(32, '3743374-26', 37, NULL, NULL, NULL, NULL, 697.00, 747.00, 1, 0, '', 0.00, 50, 'Inside Dhaka', 'kawsar ahmed', 'sdsfa@ssfa.com', '01575124473', NULL, NULL, NULL, 'kawsar ahmed', 'sdsfa@ssfa.com', '01575124473', 'arma group corporate office arma complex house 1/b road ns 1 main road block a banasree rampura dhaka 1219', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-06-24 15:47:08', '2026-06-24 08:47:08'),
(33, '3222999-26', 32, NULL, NULL, NULL, NULL, 1680.00, 1750.00, 1, 0, '', 0.00, 70, 'Inside Dhaka', 'Sm Shahnur Riyasad', 'marketing@birgh.net', '01704168997', NULL, NULL, NULL, 'Sm Shahnur Riyasad', 'marketing@birgh.net', '01704168997', 'DHAKA', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-05 17:46:28', '2026-07-05 10:46:28'),
(34, '2432420-26', 24, NULL, NULL, NULL, NULL, 18144.00, 18214.00, 1, 0, '', 0.00, 70, 'Inside Dhaka', 'BIJON', '01915728982_6a4b55b4d0330@gmail.com', '01915728982', NULL, NULL, NULL, 'BIJON', '01915728982_6a4b55b4d0330@gmail.com', '01915728982', 'Dhaka, Mirpur-1', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-06 14:13:56', '2026-07-06 07:13:56'),
(35, '3251955-26', 32, NULL, NULL, NULL, NULL, 1637.00, 1707.00, 1, 0, '', 0.00, 70, 'Inside Dhaka', 'Sm Shahnur Riyasad', '01704168997_6a4b6995b0382@gmail.com', '01704168997', NULL, NULL, NULL, 'Sm Shahnur Riyasad', '01704168997_6a4b6995b0382@gmail.com', '01704168997', 'DHAKA', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-06 15:38:45', '2026-07-06 08:38:45'),
(36, '3830912-26', 38, NULL, NULL, NULL, NULL, 697.00, 817.00, 14, 0, '', 0.00, 120, 'Outside Dhaka', 'Mehedi', 'mh110340@gmail.com', '01845659940', NULL, NULL, NULL, 'Mehedi', 'mh110340@gmail.com', '01845659940', 'Cumilla govt women\'s college Gate, Cumilla', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-06 17:09:34', '2026-07-11 06:46:05'),
(37, '3990550-26', 39, NULL, NULL, NULL, NULL, 520.00, 590.00, 10, 0, '', 0.00, 70, 'Inside Dhaka', 'Mohammad Shiblee Hasan', 'shiblee_hasan@yahoo.com', '01611200935', NULL, NULL, NULL, 'Mohammad Shiblee Hasan', 'shiblee_hasan@yahoo.com', '01611200935', 'Epic Group, Trade Intercontinental 213/A ,Tejgaon Industrial Area,Dhaka 1208.', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-07 13:22:34', '2026-07-11 06:38:16'),
(38, '4049984-26', 40, NULL, NULL, NULL, NULL, 1828.00, 1948.00, 10, 0, '', 0.00, 120, 'Outside Dhaka', 'Rupam', '01791122307_6a4dd78c39cb4@gmail.com', '01791122307', NULL, NULL, NULL, 'Rupam', '01791122307_6a4dd78c39cb4@gmail.com', '01791122307', 'খালেদা মঞ্জিল, জি এ একাডেমি স্কুলের পিছনের গেট, একাডেমি, ফেনী সদর, ফেনী', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-08 11:52:29', '2026-07-11 06:23:19'),
(39, '4167198-26', 41, NULL, NULL, NULL, NULL, 1472.00, 1592.00, 1, 0, '', 0.00, 120, 'Outside Dhaka', 'Dr Md Tafiqul Islam', 'tafiqulssansh@gmail.com', '01785837630', NULL, NULL, NULL, 'Dr Md Tafiqul Islam', 'tafiqulssansh@gmail.com', '01785837630', 'Tulip plaza ,Abu Nasser hospital link road,khalishhpur, khulna.', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-09 14:10:38', '2026-07-09 07:10:38'),
(40, '4316536-26', 43, NULL, NULL, NULL, NULL, 567.00, 637.00, 14, 0, '', 0.00, 70, 'Inside Dhaka', 'Farah Hossain', 'Farah.sub.billing@gmail.com', '01849747744', NULL, NULL, NULL, 'Farah Hossain', 'Farah.sub.billing@gmail.com', '01849747744', 'Flat 3A, House 28, Road 14/A, Dhanmondi, Dhaka 1209', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-10 12:13:15', '2026-07-11 06:16:58'),
(41, '4389476-26', 43, NULL, NULL, NULL, NULL, 567.00, 637.00, 10, 0, '', 0.00, 70, 'Inside Dhaka', 'Farah Hossain', 'Farah.sub.billing@gmail.com', '01849747744', NULL, NULL, NULL, 'Farah Hossain', 'Farah.sub.billing@gmail.com', '01849747744', 'Flat 3A, House 28, Road 14/A, Dhanmondi, Dhaka 1209', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-10 12:13:16', '2026-07-11 06:14:28'),
(42, '4438853-26', 44, NULL, NULL, NULL, NULL, 420.00, 540.00, 10, 0, '', 0.00, 120, 'Outside Dhaka', 'Tuhin', 'tuhinmedia.01@gmail.com', '01682674158', NULL, NULL, NULL, 'Tuhin', 'tuhinmedia.01@gmail.com', '01682674158', 'Mukkhit mor, Bagerhat Sadar.', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-10 17:04:01', '2026-07-11 06:09:28'),
(43, '4517176-26', 45, NULL, NULL, NULL, NULL, 1846.00, 1916.00, 10, 0, '', 0.00, 70, 'Inside Dhaka', 'Mahir sadman Samin', 'samsamin127@gmail.com', '01620551475', NULL, NULL, NULL, 'Mahir sadman Samin', 'samsamin127@gmail.com', '01620551475', '558 eastkazipara mirpur dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-10 17:21:45', '2026-07-11 06:04:34'),
(44, '4546460-26', 45, NULL, NULL, NULL, NULL, 1846.00, 1916.00, 10, 0, '', 0.00, 70, 'Inside Dhaka', 'Mahir sadman Samin', 'samsamin127@gmail.com', '01620551475', NULL, NULL, NULL, 'Mahir sadman Samin', 'samsamin127@gmail.com', '01620551475', '558 eastkazipara mirpur dhaka', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-10 17:21:46', '2026-07-11 06:03:28'),
(45, '4636195-26', 46, NULL, NULL, NULL, NULL, 10.00, 130.00, 14, 0, '', 0.00, 120, 'Outside Dhaka', 'সুমন', '1750195522_6a50cb6be6531@gmail.com', '1750195522', NULL, NULL, NULL, 'সুমন', '1750195522_6a50cb6be6531@gmail.com', '1750195522', 'গোলনা নবাব গঞ্জ এস পি বাড়ি/নবাব বাড়ি,,উপজেলা -জলঢাকা,,জেলা নীলফামারি,,,', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-10 17:37:32', '2026-07-11 04:23:39'),
(46, '4794885-26', 47, NULL, NULL, NULL, NULL, 1100.00, 1170.00, 10, 0, '', 0.00, 70, 'Inside Dhaka', 'Zafir Huq', 'zafir.huq@gmail.com', '8801715657790', NULL, NULL, NULL, 'Zafir Huq', 'zafir.huq@gmail.com', '8801715657790', 'House 21, Road 10/B, Block H, Flat 2B, Banani', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-10 23:01:13', '2026-07-11 05:59:01'),
(47, '4826871-26', 48, NULL, NULL, NULL, NULL, 1100.00, 1220.00, 1, 0, '', 0.00, 120, 'Outside Dhaka', 'Rashedur Rahman', 'rashed.rahaman1@gmail.com', '01814411691', NULL, NULL, NULL, 'Rashedur Rahman', 'rashed.rahaman1@gmail.com', '01814411691', 'Digital Solution & Statinary Corner, Islampur Bazar, Rudrorampur-3874, Chatkhil, Noakhali', NULL, NULL, 'cod', '', '', '', '', '', '', NULL, NULL, '2026-07-11 16:58:28', '2026-07-11 09:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `orders_product`
--

CREATE TABLE `orders_product` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` double(10,5) NOT NULL,
  `discount` double(10,5) NOT NULL,
  `discount_status` int(11) NOT NULL,
  `vat` decimal(10,0) NOT NULL,
  `vat_status` int(11) NOT NULL,
  `last_price` double(10,5) NOT NULL,
  `qty` float NOT NULL,
  `color` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_product`
--

INSERT INTO `orders_product` (`id`, `order_id`, `product_id`, `price`, `discount`, `discount_status`, `vat`, `vat_status`, `last_price`, `qty`, `color`, `size`, `created_at`, `updated_at`) VALUES
(1, '2688040-26', 47, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-02-10 06:47:45', '2026-02-10 06:47:45'),
(2, '2688040-26', 2, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-02-10 06:47:45', '2026-02-10 06:47:45'),
(3, '2688040-26', 1, 10.00000, 0.00000, 1, 0, 0, 10.00000, 1, '', '', '2026-02-10 06:47:45', '2026-02-10 06:47:45'),
(4, '2688040-26', 34, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-02-10 06:47:45', '2026-02-10 06:47:45'),
(5, '2688040-26', 33, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-02-10 06:47:45', '2026-02-10 06:47:45'),
(6, '2688040-26', 32, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-02-10 06:47:45', '2026-02-10 06:47:45'),
(7, '1112609-26', 204, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:19:20', '2026-03-05 14:19:20'),
(8, '1112609-26', 278, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:19:20', '2026-03-05 14:19:20'),
(9, '1112609-26', 275, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:19:20', '2026-03-05 14:19:20'),
(10, '1112609-26', 26, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:19:20', '2026-03-05 14:19:20'),
(11, '1112609-26', 261, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:19:20', '2026-03-05 14:19:20'),
(12, '1132525-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-03-05 14:21:38', '2026-03-05 14:21:38'),
(13, '1577221-26', 241, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(14, '1577221-26', 244, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(15, '1577221-26', 245, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(16, '1577221-26', 246, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(17, '1721013-26', 241, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 15:15:17', '2026-03-05 15:15:17'),
(18, '1721013-26', 244, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 15:15:17', '2026-03-05 15:15:17'),
(19, '1721013-26', 245, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-03-05 15:15:17', '2026-03-05 15:15:17'),
(20, '1952666-26', 246, 3024.00000, 0.00000, 1, 0, 0, 3024.00000, 1, '', '', '2026-03-10 07:08:38', '2026-03-10 07:08:38'),
(21, '1952666-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-03-10 07:08:38', '2026-03-10 07:08:38'),
(22, '2089415-26', 278, 50.00000, 0.00000, 1, 0, 0, 50.00000, 1, '', '1\"', '2026-03-31 06:02:32', '2026-03-31 06:02:32'),
(23, '2175270-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-04-15 23:50:08', '2026-04-15 23:50:08'),
(24, '2175270-26', 241, 5985.00000, 0.00000, 1, 0, 0, 5985.00000, 1, '', '', '2026-04-15 23:50:08', '2026-04-15 23:50:08'),
(25, '2296606-26', 1, 10.00000, 0.00000, 1, 0, 0, 10.00000, 1, '', '', '2026-04-16 00:04:37', '2026-04-16 00:04:37'),
(26, '2296606-26', 2, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-16 00:04:37', '2026-04-16 00:04:37'),
(27, '2296606-26', 3, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-16 00:04:37', '2026-04-16 00:04:37'),
(28, '360833-26', 244, 7035.00000, 0.00000, 1, 0, 0, 7035.00000, 1, '', '', '2026-04-16 00:17:21', '2026-04-16 00:17:21'),
(29, '360833-26', 246, 3024.00000, 0.00000, 1, 0, 0, 3024.00000, 1, '', '', '2026-04-16 00:17:21', '2026-04-16 00:17:21'),
(30, '2157243-26', 244, 7035.00000, 0.00000, 1, 0, 0, 7035.00000, 1, '', '', '2026-04-16 00:32:13', '2026-04-16 00:32:13'),
(31, '2157243-26', 255, 3875.00000, 0.00000, 1, 0, 0, 3875.00000, 1, '', '', '2026-04-16 00:32:13', '2026-04-16 00:32:13'),
(32, '377748-26', 90, 4368.00000, 0.00000, 1, 0, 0, 4368.00000, 2, '', '', '2026-04-16 03:37:49', '2026-04-16 03:37:49'),
(33, '396344-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-04-16 03:51:34', '2026-04-16 03:51:34'),
(34, '396344-26', 245, 8085.00000, 0.00000, 1, 0, 0, 8085.00000, 1, '', '', '2026-04-16 03:51:34', '2026-04-16 03:51:34'),
(35, '2313657-26', 87, 666.00000, 0.00000, 1, 0, 0, 666.00000, 1, '', '', '2026-04-16 03:54:16', '2026-04-16 03:54:16'),
(36, '2313657-26', 90, 4368.00000, 0.00000, 1, 0, 0, 4368.00000, 1, '', '', '2026-04-16 03:54:16', '2026-04-16 03:54:16'),
(37, '2313657-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-04-16 03:54:16', '2026-04-16 03:54:16'),
(38, '326774-26', 261, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-16 03:57:26', '2026-04-16 03:57:26'),
(39, '329379-26', 142, 104.00000, 0.00000, 1, 0, 0, 104.00000, 1, '', '', '2026-04-16 04:26:35', '2026-04-16 04:26:35'),
(40, '2438423-26', 90, 4368.00000, 0.00000, 1, 0, 0, 4368.00000, 1, '', '', '2026-04-16 04:42:51', '2026-04-16 04:42:51'),
(41, '2598874-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-04-16 04:48:50', '2026-04-16 04:48:50'),
(42, '2657732-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-04-16 04:50:53', '2026-04-16 04:50:53'),
(43, '2739558-26', 1, 10.00000, 0.00000, 1, 0, 0, 10.00000, 1, '', '', '2026-04-16 08:24:51', '2026-04-16 08:24:51'),
(44, '2739558-26', 2, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-16 08:24:51', '2026-04-16 08:24:51'),
(45, '2739558-26', 47, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-16 08:24:51', '2026-04-16 08:24:51'),
(46, '2739558-26', 201, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-16 08:24:51', '2026-04-16 08:24:51'),
(47, '2739558-26', 250, 4536.00000, 0.00000, 1, 0, 0, 4536.00000, 1, '', '', '2026-04-16 08:24:51', '2026-04-16 08:24:51'),
(48, '2815595-26', 1, 10.00000, 0.00000, 1, 0, 0, 10.00000, 1, '', '', '2026-04-16 08:25:50', '2026-04-16 08:25:50'),
(49, '2815595-26', 5, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-16 08:25:50', '2026-04-16 08:25:50'),
(50, '2815595-26', 10, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-16 08:25:50', '2026-04-16 08:25:50'),
(51, '2999183-26', 244, 7035.00000, 0.00000, 1, 0, 0, 7035.00000, 1, '', '', '2026-04-21 07:53:51', '2026-04-21 07:53:51'),
(52, '2999183-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-04-21 07:53:51', '2026-04-21 07:53:51'),
(53, '2999183-26', 90, 4368.00000, 0.00000, 1, 0, 0, 4368.00000, 1, '', '', '2026-04-21 07:53:51', '2026-04-21 07:53:51'),
(54, '2999183-26', 245, 8085.00000, 0.00000, 1, 0, 0, 8085.00000, 1, '', '', '2026-04-21 07:53:51', '2026-04-21 07:53:51'),
(55, '2999183-26', 246, 3024.00000, 0.00000, 1, 0, 0, 3024.00000, 1, '', '', '2026-04-21 07:53:51', '2026-04-21 07:53:51'),
(56, '2168424-26', 90, 4368.00000, 0.00000, 1, 0, 0, 4368.00000, 1, '', '', '2026-04-28 01:30:35', '2026-04-28 01:30:35'),
(57, '2168424-26', 245, 8085.00000, 0.00000, 1, 0, 0, 8085.00000, 1, '', '', '2026-04-28 01:30:35', '2026-04-28 01:30:35'),
(58, '2199892-26', 1, 10.00000, 0.00000, 1, 0, 0, 10.00000, 1, '', '', '2026-04-28 02:29:35', '2026-04-28 02:29:35'),
(59, '2199892-26', 2, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-28 02:29:35', '2026-04-28 02:29:35'),
(60, '2199892-26', 3, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-28 02:29:35', '2026-04-28 02:29:35'),
(61, '114770-26', 86, 494.00000, 0.00000, 1, 0, 0, 494.00000, 1, '', '', '2026-04-29 03:43:22', '2026-04-29 03:43:22'),
(62, '114770-26', 10, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-04-29 03:43:22', '2026-04-29 03:43:22'),
(63, '2471217-26', 254, 3444.00000, 0.00000, 1, 0, 0, 3444.00000, 1, '', '', '2026-05-03 12:22:47', '2026-05-03 12:22:47'),
(64, '2471217-26', 87, 666.00000, 0.00000, 1, 0, 0, 666.00000, 1, '', '', '2026-05-03 12:22:47', '2026-05-03 12:22:47'),
(65, '3025224-26', 280, 478.00000, 0.00000, 1, 0, 0, 478.00000, 1, '', '', '2026-05-04 14:44:34', '2026-05-04 14:44:34'),
(66, '3139249-26', 87, 697.00000, 0.00000, 1, 0, 0, 697.00000, 2, '', '', '2026-05-05 00:55:14', '2026-05-05 00:55:14'),
(67, '3058321-26', 280, 478.00000, 0.00000, 1, 0, 0, 478.00000, 1, '', '', '2026-05-06 16:50:00', '2026-05-06 16:50:00'),
(68, '3273635-26', 92, 1199.00000, 0.00000, 1, 0, 0, 1199.00000, 1, '', '', '2026-05-07 12:12:17', '2026-05-07 12:12:17'),
(69, '3383860-26', 279, 400.00000, 0.00000, 1, 0, 0, 400.00000, 1, '', '', '2026-05-13 11:18:00', '2026-05-13 11:18:00'),
(70, '3439792-26', 87, 697.00000, 0.00000, 1, 0, 0, 697.00000, 1, '', '', '2026-06-03 03:49:02', '2026-06-03 03:49:02'),
(71, '3782766-26', 87, 697.00000, 0.00000, 1, 0, 0, 697.00000, 1, '', '', '2026-06-24 15:47:08', '2026-06-24 15:47:08'),
(72, '3743374-26', 87, 697.00000, 0.00000, 1, 0, 0, 697.00000, 1, '', '', '2026-06-24 15:47:08', '2026-06-24 15:47:08'),
(73, '3222999-26', 279, 420.00000, 0.00000, 1, 0, 0, 420.00000, 4, '', '', '2026-07-05 17:46:28', '2026-07-05 17:46:28'),
(74, '2432420-26', 244, 7035.00000, 0.00000, 1, 0, 0, 7035.00000, 1, '', '', '2026-07-06 14:13:56', '2026-07-06 14:13:56'),
(75, '2432420-26', 245, 8085.00000, 0.00000, 1, 0, 0, 8085.00000, 1, '', '', '2026-07-06 14:13:56', '2026-07-06 14:13:56'),
(76, '2432420-26', 246, 3024.00000, 0.00000, 1, 0, 0, 3024.00000, 1, '', '', '2026-07-06 14:13:56', '2026-07-06 14:13:56'),
(77, '3251955-26', 279, 420.00000, 0.00000, 1, 0, 0, 420.00000, 2, '', '', '2026-07-06 15:38:45', '2026-07-06 15:38:45'),
(78, '3251955-26', 265, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-07-06 15:38:45', '2026-07-06 15:38:45'),
(79, '3251955-26', 87, 697.00000, 0.00000, 1, 0, 0, 697.00000, 1, '', '', '2026-07-06 15:38:45', '2026-07-06 15:38:45'),
(80, '3830912-26', 87, 697.00000, 0.00000, 1, 0, 0, 697.00000, 1, '', '', '2026-07-06 17:09:34', '2026-07-06 17:09:34'),
(81, '3990550-26', 279, 420.00000, 0.00000, 1, 0, 0, 420.00000, 1, '', '', '2026-07-07 13:22:34', '2026-07-07 13:22:34'),
(82, '3990550-26', 261, 100.00000, 0.00000, 1, 0, 0, 100.00000, 1, '', '', '2026-07-07 13:22:34', '2026-07-07 13:22:34'),
(83, '4049984-26', 92, 1100.00000, 0.00000, 1, 0, 0, 1100.00000, 1, '', '', '2026-07-08 11:52:29', '2026-07-08 11:52:29'),
(84, '4049984-26', 93, 728.00000, 0.00000, 1, 0, 0, 728.00000, 1, '', '', '2026-07-08 11:52:29', '2026-07-08 11:52:29'),
(85, '4167198-26', 97, 770.00000, 0.00000, 1, 0, 0, 770.00000, 1, '', '', '2026-07-09 14:10:38', '2026-07-09 14:10:38'),
(86, '4167198-26', 88, 702.00000, 0.00000, 1, 0, 0, 702.00000, 1, '', '', '2026-07-09 14:10:38', '2026-07-09 14:10:38'),
(87, '4316536-26', 86, 567.00000, 0.00000, 1, 0, 0, 567.00000, 1, '', '', '2026-07-10 12:13:15', '2026-07-10 12:13:15'),
(88, '4389476-26', 86, 567.00000, 0.00000, 1, 0, 0, 567.00000, 1, '', '', '2026-07-10 12:13:16', '2026-07-10 12:13:16'),
(89, '4438853-26', 279, 420.00000, 0.00000, 1, 0, 0, 420.00000, 1, '', '', '2026-07-10 17:04:01', '2026-07-10 17:04:01'),
(90, '4517176-26', 91, 858.00000, 0.00000, 1, 0, 0, 858.00000, 1, '', '', '2026-07-10 17:21:45', '2026-07-10 17:21:45'),
(91, '4517176-26', 95, 988.00000, 0.00000, 1, 0, 0, 988.00000, 1, '', '', '2026-07-10 17:21:45', '2026-07-10 17:21:45'),
(92, '4546460-26', 91, 858.00000, 0.00000, 1, 0, 0, 858.00000, 1, '', '', '2026-07-10 17:21:46', '2026-07-10 17:21:46'),
(93, '4546460-26', 95, 988.00000, 0.00000, 1, 0, 0, 988.00000, 1, '', '', '2026-07-10 17:21:46', '2026-07-10 17:21:46'),
(94, '4636195-26', 1, 10.00000, 0.00000, 1, 0, 0, 10.00000, 1, '', '', '2026-07-10 17:37:32', '2026-07-10 17:37:32'),
(95, '4794885-26', 92, 1100.00000, 0.00000, 1, 0, 0, 1100.00000, 1, '', '', '2026-07-10 23:01:13', '2026-07-10 23:01:13'),
(96, '4826871-26', 92, 1100.00000, 0.00000, 1, 0, 0, 1100.00000, 1, '', '', '2026-07-11 16:58:28', '2026-07-11 16:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_history`
--

CREATE TABLE `order_history` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `cancel_status` int(11) NOT NULL DEFAULT 0,
  `price` float DEFAULT NULL,
  `total` double(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_history`
--

INSERT INTO `order_history` (`id`, `order_id`, `product_id`, `seller_id`, `quantity`, `cancel_status`, `price`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, 279, 1, 1, 0, 400, 400.00, '2026-03-05 14:21:38', '2026-03-05 14:21:38'),
(2, 2, 241, 2, 1, 0, 100, 100.00, '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(3, 2, 244, 2, 1, 0, 100, 200.00, '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(4, 2, 245, 2, 1, 0, 100, 300.00, '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(5, 2, 246, 2, 1, 0, 100, 400.00, '2026-03-05 14:22:48', '2026-03-05 14:22:48'),
(6, 3, 241, 2, 1, 0, 100, 100.00, '2026-03-05 15:15:17', '2026-03-05 15:15:17'),
(7, 3, 244, 2, 1, 0, 100, 200.00, '2026-03-05 15:15:17', '2026-03-05 15:15:17'),
(8, 3, 245, 2, 1, 0, 100, 300.00, '2026-03-05 15:15:17', '2026-03-05 15:15:17'),
(9, 4, 246, 2, 1, 0, 3024, 3024.00, '2026-03-10 13:08:38', '2026-03-10 07:08:38'),
(10, 4, 279, 1, 1, 0, 400, 3424.00, '2026-03-10 13:08:38', '2026-03-10 07:08:38'),
(11, 5, 278, 2, 1, 0, 50, 50.00, '2026-03-31 12:02:32', '2026-03-31 06:02:32'),
(12, 6, 279, 1, 1, 0, 400, 400.00, '2026-04-16 05:50:08', '2026-04-15 23:50:08'),
(13, 6, 241, 2, 1, 0, 5985, 6385.00, '2026-04-16 05:50:08', '2026-04-15 23:50:08'),
(14, 7, 1, 2, 1, 0, 10, 10.00, '2026-04-16 06:04:37', '2026-04-16 00:04:37'),
(15, 7, 2, 2, 1, 0, 100, 110.00, '2026-04-16 06:04:37', '2026-04-16 00:04:37'),
(16, 7, 3, 2, 1, 0, 100, 210.00, '2026-04-16 06:04:37', '2026-04-16 00:04:37'),
(17, 8, 244, 2, 1, 0, 7035, 7035.00, '2026-04-16 06:17:21', '2026-04-16 00:17:21'),
(18, 8, 246, 2, 1, 0, 3024, 10059.00, '2026-04-16 06:17:21', '2026-04-16 00:17:21'),
(19, 9, 244, 2, 1, 0, 7035, 7035.00, '2026-04-16 06:32:13', '2026-04-16 00:32:13'),
(20, 9, 255, 2, 1, 0, 3875, 10910.00, '2026-04-16 06:32:13', '2026-04-16 00:32:13'),
(21, 10, 90, 2, 2, 0, 4368, 8736.00, '2026-04-16 09:37:49', '2026-04-16 03:37:49'),
(22, 11, 279, 1, 1, 0, 400, 400.00, '2026-04-16 09:51:34', '2026-04-16 03:51:34'),
(23, 11, 245, 2, 1, 0, 8085, 8485.00, '2026-04-16 09:51:34', '2026-04-16 03:51:34'),
(24, 12, 87, 2, 1, 0, 666, 666.00, '2026-04-16 09:54:16', '2026-04-16 03:54:16'),
(25, 12, 90, 2, 1, 0, 4368, 5034.00, '2026-04-16 09:54:16', '2026-04-16 03:54:16'),
(26, 12, 279, 1, 1, 0, 400, 5434.00, '2026-04-16 09:54:16', '2026-04-16 03:54:16'),
(27, 13, 261, 2, 1, 0, 100, 100.00, '2026-04-16 09:57:26', '2026-04-16 03:57:26'),
(28, 14, 142, 2, 1, 0, 104, 104.00, '2026-04-16 10:26:35', '2026-04-16 04:26:35'),
(29, 15, 90, 2, 1, 0, 4368, 4368.00, '2026-04-16 10:42:51', '2026-04-16 04:42:51'),
(30, 16, 279, 1, 1, 0, 400, 400.00, '2026-04-16 10:48:50', '2026-04-16 04:48:50'),
(31, 17, 279, 1, 1, 0, 400, 400.00, '2026-04-16 10:50:53', '2026-04-16 04:50:53'),
(32, 18, 1, 2, 1, 0, 10, 10.00, '2026-04-16 14:24:51', '2026-04-16 08:24:51'),
(33, 18, 2, 2, 1, 0, 100, 110.00, '2026-04-16 14:24:51', '2026-04-16 08:24:51'),
(34, 18, 47, 2, 1, 0, 100, 210.00, '2026-04-16 14:24:51', '2026-04-16 08:24:51'),
(35, 18, 201, 2, 1, 0, 100, 310.00, '2026-04-16 14:24:51', '2026-04-16 08:24:51'),
(36, 18, 250, 2, 1, 0, 4536, 4846.00, '2026-04-16 14:24:51', '2026-04-16 08:24:51'),
(37, 19, 1, 2, 1, 0, 10, 10.00, '2026-04-16 14:25:50', '2026-04-16 08:25:50'),
(38, 19, 5, 2, 1, 0, 100, 110.00, '2026-04-16 14:25:50', '2026-04-16 08:25:50'),
(39, 19, 10, 2, 1, 0, 100, 210.00, '2026-04-16 14:25:50', '2026-04-16 08:25:50'),
(40, 20, 244, 2, 1, 0, 7035, 7035.00, '2026-04-21 13:53:51', '2026-04-21 07:53:51'),
(41, 20, 279, 1, 1, 0, 400, 7435.00, '2026-04-21 13:53:51', '2026-04-21 07:53:51'),
(42, 20, 90, 2, 1, 0, 4368, 11803.00, '2026-04-21 13:53:51', '2026-04-21 07:53:51'),
(43, 20, 245, 2, 1, 0, 8085, 19888.00, '2026-04-21 13:53:51', '2026-04-21 07:53:51'),
(44, 20, 246, 2, 1, 0, 3024, 22912.00, '2026-04-21 13:53:51', '2026-04-21 07:53:51'),
(45, 21, 90, 2, 1, 0, 4368, 4368.00, '2026-04-28 07:30:35', '2026-04-28 01:30:35'),
(46, 21, 245, 2, 1, 0, 8085, 12453.00, '2026-04-28 07:30:35', '2026-04-28 01:30:35'),
(47, 22, 1, 2, 1, 0, 10, 10.00, '2026-04-28 08:29:35', '2026-04-28 02:29:35'),
(48, 22, 2, 2, 1, 0, 100, 110.00, '2026-04-28 08:29:35', '2026-04-28 02:29:35'),
(49, 22, 3, 2, 1, 0, 100, 210.00, '2026-04-28 08:29:35', '2026-04-28 02:29:35'),
(50, 23, 86, 2, 1, 0, 494, 494.00, '2026-04-29 09:43:22', '2026-04-29 03:43:22'),
(51, 23, 10, 2, 1, 0, 100, 594.00, '2026-04-29 09:43:22', '2026-04-29 03:43:22'),
(52, 24, 254, 2, 1, 0, 3444, 3444.00, '2026-05-03 05:22:47', '2026-05-03 12:22:47'),
(53, 24, 87, 2, 1, 0, 666, 4110.00, '2026-05-03 05:22:47', '2026-05-03 12:22:47'),
(54, 25, 280, 1, 1, 0, 478, 478.00, '2026-05-04 07:44:34', '2026-05-04 14:44:34'),
(55, 26, 87, 2, 2, 0, 697, 1394.00, '2026-05-04 17:55:14', '2026-05-05 00:55:14'),
(56, 27, 280, 1, 1, 0, 478, 478.00, '2026-05-06 09:50:00', '2026-05-06 16:50:00'),
(57, 28, 92, 32, 1, 0, 1199, 1199.00, '2026-05-07 05:12:17', '2026-05-07 12:12:17'),
(58, 29, 279, 1, 1, 0, 400, 400.00, '2026-05-13 04:18:00', '2026-05-13 11:18:00'),
(59, 30, 87, 2, 1, 0, 697, 697.00, '2026-06-02 20:49:02', '2026-06-03 03:49:02'),
(60, 31, 87, 32, 1, 0, 697, 697.00, '2026-06-24 08:47:08', '2026-06-24 15:47:08'),
(61, 32, 87, 32, 1, 0, 697, 697.00, '2026-06-24 08:47:08', '2026-06-24 15:47:08'),
(62, 33, 279, 1, 4, 0, 420, 1680.00, '2026-07-05 10:46:28', '2026-07-05 17:46:28'),
(63, 34, 244, 2, 1, 0, 7035, 7035.00, '2026-07-06 07:13:56', '2026-07-06 14:13:56'),
(64, 34, 245, 2, 1, 0, 8085, 15120.00, '2026-07-06 07:13:56', '2026-07-06 14:13:56'),
(65, 34, 246, 2, 1, 0, 3024, 18144.00, '2026-07-06 07:13:56', '2026-07-06 14:13:56'),
(66, 35, 279, 1, 2, 0, 420, 840.00, '2026-07-06 08:38:45', '2026-07-06 15:38:45'),
(67, 35, 265, 2, 1, 1, 100, 940.00, '2026-07-06 08:38:45', '2026-07-08 10:55:38'),
(68, 35, 87, 32, 1, 0, 697, 1637.00, '2026-07-06 08:38:45', '2026-07-06 15:38:45'),
(69, 36, 87, 32, 1, 0, 697, 697.00, '2026-07-06 10:09:34', '2026-07-06 17:09:34'),
(70, 37, 279, 1, 1, 0, 420, 420.00, '2026-07-07 06:22:34', '2026-07-07 13:22:34'),
(71, 37, 261, 2, 1, 1, 100, 520.00, '2026-07-07 06:22:34', '2026-07-08 10:52:20'),
(72, 38, 92, 32, 1, 0, 1100, 1100.00, '2026-07-08 04:52:29', '2026-07-08 11:52:29'),
(73, 38, 93, 2, 1, 0, 728, 1828.00, '2026-07-08 04:52:29', '2026-07-08 11:52:29'),
(74, 39, 97, 2, 1, 0, 770, 770.00, '2026-07-09 07:10:38', '2026-07-09 14:10:38'),
(75, 39, 88, 32, 1, 0, 702, 1472.00, '2026-07-09 07:10:38', '2026-07-09 14:10:38'),
(76, 40, 86, 32, 1, 0, 567, 567.00, '2026-07-10 05:13:16', '2026-07-10 12:13:16'),
(77, 41, 86, 32, 1, 0, 567, 567.00, '2026-07-10 05:13:16', '2026-07-10 12:13:16'),
(78, 42, 279, 1, 1, 0, 420, 420.00, '2026-07-10 10:04:01', '2026-07-10 17:04:01'),
(79, 43, 91, 32, 1, 0, 858, 858.00, '2026-07-10 10:21:45', '2026-07-10 17:21:45'),
(80, 43, 95, 2, 1, 0, 988, 1846.00, '2026-07-10 10:21:45', '2026-07-10 17:21:45'),
(81, 44, 91, 32, 1, 0, 858, 858.00, '2026-07-10 10:21:46', '2026-07-10 17:21:46'),
(82, 44, 95, 2, 1, 0, 988, 1846.00, '2026-07-10 10:21:46', '2026-07-10 17:21:46'),
(83, 45, 1, 2, 1, 0, 10, 10.00, '2026-07-10 10:37:32', '2026-07-11 11:23:50'),
(84, 46, 92, 32, 1, 0, 1100, 1100.00, '2026-07-10 16:01:13', '2026-07-10 23:01:13'),
(85, 47, 92, 32, 1, 0, 1100, 1100.00, '2026-07-11 09:58:28', '2026-07-11 16:58:28');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Order Placed', 'Upon successful checkout, the system records the order details and assigns a unique order ID.', '2023-12-04 11:15:23', '2023-12-04 05:55:06'),
(2, 'Payment Processing', 'After ordering, the system verifies payment info. Successful payments move to processing.', '2023-12-04 11:15:23', '2023-12-04 05:55:48'),
(3, 'Order Confirmed', 'Payment processed, order confirmed. System notifies customer and vendors. Vendors prep items for shipment.', '2023-12-04 11:15:23', '2023-12-04 05:56:14'),
(4, 'Pickup', 'Vendor ships, order status: \"Shipped.\" Customer gets confirmation and tracking.', '2023-12-04 11:15:23', '2023-12-04 05:56:45'),
(5, 'In Transit', 'Order in transit; customers track shipment with provided details.', '2023-12-04 11:15:23', '2023-12-04 05:57:14'),
(6, 'Out for Delivery', '\"Out for Delivery\" status means the package is en route and will be delivered soon, notifying the customer.', '2023-12-04 11:15:23', '2023-12-04 05:57:42'),
(7, 'Delivered', '\"Delivered\" means items received. System captures delivery confirmation, including date and time.', '2023-12-04 11:15:23', '2023-12-04 05:58:19'),
(8, 'Order Completed', '\"Completed\" status: delivery confirmed, order process concluded.', '2023-12-04 11:15:23', '2023-12-04 05:58:53'),
(9, 'Cancelled or Returned', 'Order status adapts to customer actions. \"Cancelled\" for cancellations, \"Returned\" for returns.', '2023-12-04 11:15:23', '2023-12-04 05:59:17'),
(10, 'Transfer to Pathao', 'Transfer to Pathao', '2023-12-04 11:15:23', '2023-12-04 05:59:17'),
(11, 'Pathao Acepted', 'Pathao Acepted', '2023-12-04 11:15:23', '2023-12-04 05:59:17'),
(12, 'Pickup Cancelled', 'Pickup Cancelled', '2023-12-04 11:15:23', '2023-12-04 05:59:17'),
(13, 'Pathao Pickup', 'Pathao Pickup', '2023-12-04 11:15:23', '2023-12-04 05:59:17'),
(14, 'Cancel Order', 'Cancel Order', '2023-12-04 11:15:23', '2023-12-04 05:59:17');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number_of_referell` varchar(255) DEFAULT NULL,
  `number_of_sales` varchar(255) DEFAULT NULL,
  `number_of_blogs` int(255) DEFAULT NULL,
  `salary_amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `number_of_referell`, `number_of_sales`, `number_of_blogs`, `salary_amount`, `created_at`, `status`, `updated_at`) VALUES
(1, 'Salary Pack', '1000', '20', 30, '450', '2024-09-12 04:02:15', 1, '2024-09-12 04:02:15'),
(3, 'Packages-1', '500', '600', 500, '256', '2024-09-13 03:10:19', 1, '2024-09-13 03:10:19'),
(4, 'Packages-1', '600', '652', 25, '255', '2024-09-13 03:10:31', 1, '2024-09-13 03:10:31');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pathao_tokens`
--

CREATE TABLE `pathao_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `environment` varchar(20) NOT NULL DEFAULT 'sandbox',
  `access_token` text NOT NULL,
  `refresh_token` text NOT NULL,
  `expires_in` int(11) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pathao_tokens`
--

INSERT INTO `pathao_tokens` (`id`, `environment`, `access_token`, `refresh_token`, `expires_in`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'live', 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0NTAwODUiLCJhdWQiOlsiMTgxMDEiXSwiZXhwIjoxNzg1NTA3MDAzLCJuYmYiOjE3Nzc3MzEwMDMsImlhdCI6MTc3NzczMTAwMywianRpIjoiMmRiYzlkZDViNzRiNzgyNjI1YTA2NWJiZTM0NDFmNjZiNjRkNDc3NmZlMjU4ZDRlOTU2MTRmMjIwZTRlOTIwOSIsIm1lcmNoYW50X2lkIjoiQkRiRDEzMkJkbCIsInNjb3BlcyI6W119.rdH0N-o_hlEHlpMuMf_JYommeQLIdPFmgzZjRMCYRJfDHCoWasIxmwVKIoEYoZx_0fmtUmn2OK2UPM_4bh08DanX2z5aAcyKnfAH6YdDChCvkMSY_t9p1mf2xvcyTtzDtln_kJ5Wg7LHh92HtbQvL6V1fa8bXsFVR0S2x8j7VuRaBXEUL33LMYP1tnx2NG4uF8sDVdRnK0W9GPK8Yy8_UJ76-O4PNpl6s6wCHoQm_eXJ3XIBcMoaU2YHhLcoToOV4kYqkLWBU93qvId5ypoXx3JrpAljPvDoWReoOBpTDcJ-T497ac9ldMz2i1F9CzC1KBEyYbvQOpoJm5qCXVRNEt_UVyMoBrgIMoXPA5eES0Oktkqk8un1aQNse_a-u--aYJdhAFqI2v4vfbepoTB0Q9krdk2ZpwJLV2hFIMTMqdQSQTpd6HqhCTyTT_vW8CPF_FK7gEip2CEQYH7LoY86p06YEFVuvW3BOA_Rj7psplbmAIy4DZgkBLhXBJtjZSS_x0axLHn-xIvHnWcT4VSs4Up54uaCN2mzFfQLedXc4WL7CmHmoXeAm9jgP3NshOym5KlLTFRRPzHUTrEuZhDjqsBziypsn2cmzJf9J_xxjlVGn5Y0yrQqtRK7aRUr55NOnZQ22-Lkvr4ysmxSG1fAnee9HFlLrP399gjT2gktxqo', 'def502007a2732a0f480b8e4687791a64d94750eddcc62ffd280c68f32e1cb6f94e3e02560100164ad6b6fddc541f2f8edac61a69386f4d4d29f85fc338ebdb9f27f1d18627f52e0d60bdf306273a98e56aa39f94b7447848931cf624ad229e4f859ca3753b6e4dc9a712286bce32fced89b9afc226380cfb967c3ac329b9a24342c7dbca867b6151db0fd76f40d4b9228a698413c8921149fd951c8a5a08aed8d68d380cf1a036a39057ea2c5242c1fa9ca40a8b378e76006c38b4cdf99ac2b522b9dc1cea0c96e597eaa7e194c136b77ab3e3c227945fcaa9a25370a030555d668a2386b0030c417c1bee7601644cb6229d5c7608fca0d14133ee7c3699731f67a7561fce7d9c76a6b6c0244ddb2b0046d97baf29411af79536b9dbc81d8d196127c03b9d82f9ec2acf5de6faeb3211d035af9b2e1aee870bc0a0e568be6bf1a614837c21d06157dca2e6f7bdb6daf21aa45d34736f0c1c11ae1f3', 7776000, '2026-07-31 08:10:06', '2026-05-02 08:10:06', '2026-05-02 08:10:06');

-- --------------------------------------------------------

--
-- Table structure for table `payment_type`
--

CREATE TABLE `payment_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'Payment_type',
  `working_hour` varchar(255) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_type`
--

INSERT INTO `payment_type` (`id`, `name`, `working_hour`, `rate`, `status`, `entry_by`) VALUES
(1, 'Bank', '120', 100.00, 1, 1),
(2, 'Bank', '12', 15.00, 1, 1),
(3, 'Bank', '12', 30.00, 1, 1),
(4, 'Crypto', '6', 40.00, 1, 1),
(5, 'Crypto', '120', 100.00, 1, 1),
(6, 'TT', '33', 3333.00, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_pay_item`
--

CREATE TABLE `payroll_pay_item` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT 'Head',
  `in_percent` varchar(255) DEFAULT NULL,
  `in_rupees` varchar(255) DEFAULT NULL,
  `min_value` varchar(255) DEFAULT NULL,
  `max_value` varchar(255) DEFAULT NULL,
  `effective_frm` date DEFAULT NULL,
  `effective_to` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_pay_item`
--

INSERT INTO `payroll_pay_item` (`id`, `name`, `in_percent`, `in_rupees`, `min_value`, `max_value`, `effective_frm`, `effective_to`, `status`, `entry_by`) VALUES
(1, 'Test', '5', 'Yes', '15', '254', '2023-08-27', '2023-08-27', 1, 1),
(2, '213333', 'sdfsdf', '34', '33', '33', '2023-08-24', '2023-08-31', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pay_group`
--

CREATE TABLE `pay_group` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pay_group`
--

INSERT INTO `pay_group` (`id`, `name`, `status`, `entry_by`) VALUES
(1, 'Administrative Staff', 1, 1),
(2, 'Technical Team', 1, 1),
(3, 'Sales Team', 1, 1),
(4, 'Customer Service', 1, 1),
(5, 'Management', 1, 1),
(6, 'Production Workers', 1, 1),
(7, 'Finance and Accounting', 1, 1),
(8, 'Marketing and Communications', 1, 1),
(9, 'Research and Development (R&D)', 1, 1),
(10, 'Operations and Logistics', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `description`) VALUES
(1, 'dfgdfg', 'dd'),
(2, '1.95', 'ssdf'),
(3, 'sdfsdfsdf', 'ss'),
(4, 'zxc', 'pop'),
(5, 'Beef tozo', 'l;;l;'),
(6, 'xcv', 'xcvxcv');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `short_description` varchar(255) NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keyword` varchar(255) DEFAULT NULL,
  `product_tag` varchar(255) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `external_link` varchar(255) DEFAULT NULL,
  `cash_dev_status` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `stock_qty` int(11) DEFAULT NULL,
  `stock_mini_qty` int(11) DEFAULT NULL,
  `stock_status` int(11) DEFAULT NULL,
  `manufacturer` int(11) DEFAULT NULL,
  `download_link` varchar(255) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `discount_status` int(11) DEFAULT NULL,
  `shipping_days` int(11) DEFAULT NULL,
  `free_shopping` int(11) DEFAULT NULL,
  `delivery_days` varchar(255) DEFAULT NULL,
  `flat_rate_status` int(11) DEFAULT NULL,
  `flat_rate_price` double(10,5) DEFAULT NULL,
  `vat` varchar(255) DEFAULT NULL,
  `vat_status` int(11) DEFAULT NULL,
  `tax` varchar(255) DEFAULT NULL,
  `tax_status` int(11) DEFAULT NULL,
  `thumnail_img` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `seller_id`, `name`, `slug`, `description`, `short_description`, `meta_title`, `meta_description`, `meta_keyword`, `product_tag`, `brand`, `sku`, `external_link`, `cash_dev_status`, `price`, `unit`, `stock_qty`, `stock_mini_qty`, `stock_status`, `manufacturer`, `download_link`, `discount`, `discount_status`, `shipping_days`, `free_shopping`, `delivery_days`, `flat_rate_status`, `flat_rate_price`, `vat`, `vat_status`, `tax`, `tax_status`, `thumnail_img`, `status`, `entry_by`, `created_at`, `updated_at`) VALUES
(1, 2, 'KG 09 XL 382 RG', 'kg-09-xl-382-rg-1', '<p>KG 09 XL 382 RG</p>', '<p>KG 09 XL 382 RG</p>', '', '', '', '', 2, 'LHLB01', '', 2, 10, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/v0b1Jv1oJFizZT737q4M.png', 1, 1, NULL, '2026-04-27 14:21:21'),
(2, 2, 'X 830 L 8040 MSN', 'x-830-l-8040-msn-2', '<p>X 830 L 8040 MSN</p>', '<p>X 830 L 8040 MSN</p>', '', '', '', '', 2, 'LHLB02', '', 2, 100, '200', 200, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/vwNpmaFNy9IGKvG63PP9.png', 1, 1, NULL, '2026-02-10 05:52:11'),
(3, 2, 'M1158 H 655 AC', 'm1158-h-655-ac-3', '<p>M1158 H 655 AC</p><p><br>&nbsp;</p>', '<p>M1158 H 655 AC</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ01', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JawltUwhAsycY2oekHEH.png', 1, 1, NULL, NULL),
(4, 2, 'M 1200 H 741 DAB', 'm-1200-h-741-dab-4', '<p>M 1200 H 741 DAB</p><p><br>&nbsp;</p>', '<p>M 1200 H 741 DAB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ02', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/lGJVmvLoNcwAX6dkCxyj.png', 1, 1, NULL, NULL),
(5, 2, 'H 58177 H 192 ORG', 'h-58177-h-192-org-5', '<p>H 58177 H 192 ORG</p><p><br>&nbsp;</p>', '<p>H 58177 H 192 ORG</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ03', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/r3SJGdsGDlKQAXB8c2g4.png', 1, 1, NULL, NULL),
(6, 2, 'H 58177 H 192 BLACK AC', 'h-58177-h-192-black-ac-6', '<p>H 58177 H 192 BLACK AC</p>', '<p>H 58177 H 192 BLACK AC<br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ04', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/LHZ6GoVj04wuYeXiDqz3.png', 1, 1, NULL, '2026-02-10 06:21:27'),
(7, 2, '95479 826 BRED', '95479-826-bred-7', '<p>95479 826 BRED</p><p><br>&nbsp;</p>', '<p>95479 826 BRED</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ05', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/63f3zLVXi8cqQ9wNZqEq.png', 1, 1, NULL, NULL),
(8, 2, '85138-377 ORB', '85138-377-orb-8', '<p>85138-377 ORB</p><p><br>&nbsp;</p>', '<p>85138-377 ORB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ06', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/5TmXSVPXCI5BhviSKCzJ.png', 1, 1, NULL, NULL),
(9, 2, '9577 583 BRED', '9577-583-bred-9', '<p>9577 583 BRED</p>', '<p>9577 583 BRED<br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ07', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/RkjlVJvFByD1yiU24BKJ.png', 1, 1, NULL, NULL),
(10, 2, '9522 406 MCF', '9522-406-mcf-10', '<p>9522 406 MCF</p><p><br>&nbsp;</p>', '<p>9522 406 MCF</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ08', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/cjNyiRHehHiJUK7vbcQo.png', 1, 1, NULL, NULL),
(11, 2, '9349 D 113 BSN MSN', '9349-d-113-bsn-msn-11', '<p>9349 D 113 BSN MSN</p><p><br>&nbsp;</p>', '<p>9349 D 113 BSN MSN</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ09', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/b0wTKkNdBAdfLhlM5xfa.png', 1, 1, NULL, '2026-02-10 06:27:54'),
(12, 2, '9325 536 MCF', '9325-536-mcf-12', '<p>9325 536 MCF</p><p><br>&nbsp;</p>', '<p>9325 536 MCF</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ10', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/0kiUSufLXWn0Gdr6PdVb.png', 1, 1, NULL, NULL),
(13, 2, '9302 ER 16 BRED', '9302-er-16-bred-13', '<p>9302 ER 16 BRED</p><p><br>&nbsp;</p>', '<p>9302 ER 16 BRED</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ11', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/jWpB0WV8UO7aU0ez5dk7.png', 1, 1, NULL, NULL),
(14, 2, '9302 442 MCF', '9302-442-mcf-14', '<p>9302 442 MCF</p><p><br>&nbsp;</p>', '<p>9302 442 MCF</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ12', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/RiiRyRkhLpJmHKWkTyIK.png', 1, 1, NULL, NULL),
(15, 2, '9123 Z 454 MCF', '9123-z-454-mcf-15', '<p>9123 Z 454 MCF</p>', '<p>9123 Z 454 MCF</p>', '', '', '', '', 2, 'LHLMZ13', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/2XfwjLOHq0tqhsqauhy8.png', 1, 1, NULL, NULL),
(16, 2, '9136 507 MCF', '9136-507-mcf-16', '<p>9136 507 MCF</p>', '<p>9136 507 MCF</p>', '', '', '', '', 2, 'LHLMZ14', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/RuieCfequ9fx35y7FXRJ.png', 1, 1, NULL, NULL),
(17, 2, '9252 301 SN CP', '9252-301-sn-cp-17', '<p>9252 301 SN CP</p><p><br>&nbsp;</p>', '<p>9252 301 SN CP</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ15', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/i4DDgQ1vhUFqkfr63Nvq.png', 1, 1, NULL, NULL),
(18, 2, '1248 A 9043 MCF', '1248-a-9043-mcf-18', '<p>1248 A 9043 MCF</p><p><br>&nbsp;</p>', '<p>1248 A 9043 MCF</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ16', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/317vfFac8gTw2Y4tgezs.png', 1, 1, NULL, NULL),
(19, 2, '1232A 1695 MSN', '1232a-1695-msn-19', '<p>1232A 1695 MSN</p>', '<p>1232A 1695 MSN</p>', '', '', '', '', 2, 'LHLMZ17', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/orOgdn8F7bvqgEOUsmCg.png', 1, 1, NULL, NULL),
(20, 2, '1015 h 502 orb', '1015-h-502-orb-20', '<p>1015 h 502 orb</p>', '<p>1015 h 502 orb</p>', '', '', '', '', 2, 'LHLMZ18', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Gk7LJbjfhLAFkvaGd5At.png', 1, 1, NULL, NULL),
(21, 2, '813 990 black ac', '813-990-black-ac-21', '<p>813 990 black ac</p><p><br>&nbsp;</p>', '<p>813 990 black ac</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ19', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/xpj5jvzd8Kf0o8L6BzFy.png', 1, 1, NULL, NULL),
(22, 2, '9302 E 16 MCF', '9302-e-16-mcf-22', '<p>9302 E 16 MCF</p><p><br>&nbsp;</p>', '<p>9302 E 16 MCF</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ20', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/lo70geMUoPiBv5YZoxGK.png', 1, 1, NULL, NULL),
(23, 2, '9325 536 BRED', '9325-536-bred-23', '<p>9325 536 BRED</p>', '<p>9325 536 BRED</p>', '', '', '', '', 2, 'LHLMZ21', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/4RgLMBIL5oV8PTs4c1Ar.png', 1, 1, NULL, NULL),
(24, 2, 'Z 9106 Z 96 ORB', 'z-9106-z-96-orb-24', '<p>Z 9106 Z 96 ORB</p><p><br>&nbsp;</p>', '<p>Z 9106 Z 96 ORB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMZ22', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/P3Pb4srz8LMaK6vIWK4c.png', 1, 1, NULL, NULL),
(25, 2, 'P 1166 H 254 DAC BLACK AC', 'p-1166-h-254-dac-black-ac-25', '<p>P 1166 H 254 DAC BLACK AC</p>', '<p>P 1166 H 254 DAC BLACK AC</p>', '', '', '', '', 2, 'LHLMZ23', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/I3RVhiMzrtGQJvoI3k4Z.png', 1, 1, NULL, NULL),
(26, 2, '1232 A 9014 MAB', '1232-a-9014-mab-26', '<p>1232 A 9014 MAB</p><p><br>&nbsp;</p>', '<p>1232 A 9014 MAB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMA01', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/7wgbr2SegjRuC3C2wqpV.png', 1, 1, NULL, NULL),
(27, 2, '85 12 ORB', '85-12-orb-27', '<p>85 12 ORB</p>', '<p>85 12 ORB</p>', '', '', '', '', 2, 'LHLMA02', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/CG6pVZpGANeD5Zv1Rwdl.png', 1, 1, NULL, NULL),
(28, 2, '1232 A 9044 MSN', '1232-a-9044-msn-28', '<p>1232 A 9044 MSN</p>', '<p>1232 A 9044 MSN</p>', '', '', '', '', 2, 'LHLMA03', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/wyqXQHw6DF7H0P1ZrNig.png', 1, 1, NULL, NULL),
(29, 2, '1232 A 1501 MCF', '1232-a-1501-mcf-29', '<p><span style=\"background-color:rgb(238,238,238);color:rgba(0,0,0,0.87);\">1232 A 1501 MCF</span></p>', '<p><span style=\"background-color:rgb(238,238,238);color:rgba(0,0,0,0.87);\">1232 A 1501 MCF</span></p>', '', '', '', '', 2, 'LHLMA04', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/ozYXSqwMLvjqclq0ZXwf.png', 1, 1, NULL, NULL),
(30, 2, '1232 A 1048 MSN', '1232-a-1048-msn-30', '<p>1232 A 1048 MSN</p>', '<p>1232 A 1048 MSN</p>', '', '', '', '', 2, 'LHLMA05', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/yMZLDKE3yLLcMVbErYgP.png', 1, 1, NULL, NULL),
(31, 2, '1232 A 1048 MCF', '1232-a-1048-mcf-31', '<p>1232 A 1048 MCF</p>', '<p>1232 A 1048 MCF</p>', '', '', '', '', 2, 'LHLMA06', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/WsYzEC8a0S5GyvednV3A.png', 1, 1, NULL, NULL),
(32, 2, '85 11 MCF', '85-11-mcf-32', '<p>85 11 MCF</p><p><br>&nbsp;</p>', '<p>85 11 MCF</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMA07', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/qBaODp5PlBfnSg6P53qF.png', 1, 1, NULL, NULL),
(33, 2, '85 11 ORB', '85-11-orb-33', '<p>85 11 ORB</p><p><br>&nbsp;</p>', '<p>85 11 ORB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMA08', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Q4ew3evudGgeDN9IO4Hu.png', 1, 1, NULL, NULL),
(34, 2, '85 11 AC', '85-11-ac-34', '<p>85 11 AC</p><p><br>&nbsp;</p>', '<p>85 11 AC</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LHLMA09', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Oh4DBY7UXNeSLvh6R9sI.png', 1, 1, NULL, NULL),
(35, 2, 'CNCI AC', 'cnci-ac-35', '<p>CNCI AC</p><p><br>&nbsp;</p><p><br>&nbsp;</p>', '<p>CNCI AC</p><p><br>&nbsp;</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ01', '', 2, 100, '100', 1, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/npJsjpZ5zuVA7tFRFnSq.png', 1, 1, NULL, NULL),
(36, 2, 'CNCI AB', 'cnci-ab-36', '<p>CNCI AB</p><p><br>&nbsp;</p>', '<p>CNCI AB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ02', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/RZVyE88G3CcG84NGIN3y.png', 1, 1, NULL, NULL),
(37, 2, '5893-AC', '5893-ac-37', '<p>5893-AC</p><p><br>&nbsp;</p>', '<p>5893-AC</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ03', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/R5lpK4luExSy55YvKzOs.png', 1, 1, NULL, NULL),
(38, 2, '5892-AC', '5892-ac-38', '<p>5892-AC</p><p><br>&nbsp;</p>', '<p>5892-AC</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ04', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/s72gnVtyG2oDSniJYgnZ.png', 1, 1, NULL, NULL),
(39, 2, '5890-SB PB', '5890-sb-pb-39', '<p>5890-SB PB</p><p><br>&nbsp;</p>', '<p>5890-SB PB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ05', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Uy3f0orz1OhQaqU40HlE.png', 1, 1, NULL, NULL),
(40, 2, '5890-BN PB', '5890-bn-pb-40', '', '', '', '', '', '', 2, 'LRLZ06', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/ktelX7g1l1iKAeTg0JjG.png', 1, 1, NULL, NULL),
(41, 2, '5890 COFFEE', '5890-coffee-41', '<p>5890 COFFEE</p><p><br>&nbsp;</p>', '<p>5890 COFFEE</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ07', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/YAirIYgbiLwbALRhhOm0.png', 1, 1, NULL, NULL),
(42, 2, '5887 D AC PB FULL ZINC', '5887-d-ac-pb-full-zinc-42', '<p>5887 D AC PB FULL ZINC</p>', '<p>5887 D AC PB FULL ZINC</p>', '', '', '', '', 2, 'LRLZ08', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/54bg01ULbcJ3775J9tPI.png', 1, 1, NULL, NULL),
(43, 2, '5885 AC', '5885-ac-43', '<p>5885 AC</p><p><br>&nbsp;</p>', '<p>5885 AC</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ09', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/2Pnc9xjgfcUaCKaKSltW.png', 1, 1, NULL, NULL),
(45, 2, '5801 SS DIAMOND KNOB', '5801-ss-diamond-knob-45', '<p>5801 SS DIAMOND KNOB</p><p><br>&nbsp;</p>', '<p>5801 SS DIAMOND KNOB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ10', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/MRNzT70X5RophaIL2q9N.png', 1, 1, NULL, NULL),
(46, 2, '5801 RG DIAMOND KNOB', '5801-rg-diamond-knob-46', '<p>5801 RG DIAMOND KNOB</p><p><br>&nbsp;</p>', '<p>5801 RG DIAMOND KNOB</p><p><br>&nbsp;</p>', '', '', '', '', 2, 'LRLZ11', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/rIuOlBliNy5j4muiyBl0.png', 1, 1, NULL, NULL),
(47, 2, 'Tower Bolt (ছিটকিনি)', 'tower-bolt--47', '<p>Tower Bolt (ছিটকিনি)</p>', '<p>Tower Bolt (ছিটকিনি)</p>', '', '', '', '', 2, 'TB001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/NVGFMvFltme8anUcmMPH.png', 1, 1, NULL, NULL),
(48, 2, 'Measurement Tape (Big)', 'measurement-tape-big--48', '<p>Available Sizes: 15m &amp; 30 M</p><p>Material: Plastic Body and fiber</p>', '<p>Available Sizes: 15m &amp; 30 M</p><p>Material: Plastic Body and fiber</p>', '', '', '', '', 3, 'MT001', '', 2, 60, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/OHlX8rFRJoGqr1iFZwiW.png', 1, 1, NULL, '2026-03-06 05:12:41'),
(49, 2, 'Diamond Cutter (Plain)', 'diamond-cutter-plain--49', '<p><strong>Material:</strong> High-concentration diamond grit bonded to a reinforced steel core.<br><strong>Size:</strong> 4\" Diameter.<br><strong>Key Features:</strong> Professional quality plain rim for smooth finishing on marble, granite, and ceramic tiles.</p>', '<p>A professional-grade 4-inch plain rim diamond blade designed for high-precision, chip-free cutting of delicate masonry surfaces.</p>', '', '', '', '', 3, 'DC1001', '', 2, 110, '100', 100, 100, 2, 0, '', 0.00, 1, 1, 1, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/ANQ7fBZeRBbo7hXBOsji.png', 1, 1, NULL, '2026-03-06 05:11:24'),
(50, 2, 'Diamond Cutter Special quality', 'diamond-cutter-special-quality-50', '<p>Lorem ipsum dolor sit amet</p>', '<p>Lorem ipsum dolor sit amet</p>', '', '', '', '', 3, 'DCS001', '', 2, 297, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/CnvCC9HLuADmCbg2ndLC.png', 1, 1, NULL, '2026-03-06 05:10:46'),
(51, 2, 'Grinding Disc (Diamond Cup Wheel)', 'grinding-disc-diamond-cup-wheel--51', '<p>Single &amp; Double</p>', '<p>Single &amp; Double</p>', '', '', '', '', 3, 'CDDC001', '', 2, 250, '100', 200, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/6nUbEyiyllybKqunl1e2.png', 1, 1, NULL, '2026-03-06 05:09:52'),
(52, 2, 'Metal Cutting Disk', 'metal-cutting-disk-52', '<p>Material:<br>High-quality abrasive compound reinforced with fiberglass mesh.</p><p>Size:<br>4\", 14\", and 16\" Diameter.</p><p>Key Features:<br>High cutting efficiency, strong durability, stable performance at high speed, and suitable for multiple metal cutting applications.</p>', '<p>Durable metal cutting disk designed for fast and precise cutting of various metal surfaces with smooth performance.</p>', '', '', '', '', 3, 'MCD1001', '', 2, 18, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/tb9ANgQi4X7TbwG0Zf29.png', 1, 1, NULL, '2026-03-06 05:07:36'),
(53, 2, 'Diamond Cutter Professional Quality  Seg. Cutting & Plain Saw', 'diamond-cutter-professional-quality-seg-cutting-plain-saw-53', '<p><strong>Material:</strong><br>Industrial-grade diamond abrasive bonded to a high-strength steel core.</p><p><strong>Size:</strong><br>5\" Diameter.</p><p><strong>Key Features:</strong><br>Professional quality blade with segmented cutting for speed and plain saw edges for versatile and smooth cutting performance.</p>', '<p>Professional-grade 5-inch diamond cutter designed for fast cutting and smooth finishing in demanding construction applications.</p>', '', '', '', '', 3, 'DCP1001', '', 2, 139, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/hBNlekwXRZsdYYGXavYn.png', 1, 1, NULL, '2026-03-06 05:06:39'),
(54, 2, 'Diamond Cutter Multi Professional Quality', 'diamond-cutter-multi-professional-quality-54', '<p><strong>Material:</strong><br>Industrial-grade diamond abrasive bonded to a reinforced steel core.</p><p><strong>Size:</strong><br>4\" and 5\" Diameter.</p><p><strong>Key Features:</strong><br>Multi professional quality design, high durability, fast cutting efficiency, smooth finishing, and suitable for multiple construction materials.</p>', '<p>Multi professional quality diamond cutter designed for efficient cutting with smooth and precise performance across various construction materials.</p>', '', '', '', '', 3, 'DCMP1001', '', 2, 117, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/sUSHecideV6ixgy2U0db.png', 1, 1, NULL, '2026-03-06 05:05:57'),
(55, 2, 'Diamond Cutter Seg Cutting Professional Quality', 'diamond-cutter-seg-cutting-professional-quality-55', '<p><strong>Material:</strong><br>Industrial-grade diamond segments bonded to a high-strength steel core.</p><p><strong>Size:</strong><br>7\" and 9\" Diameter.</p><p><strong>Key Features:</strong><br>Segmented cutting design for faster operation, professional quality durability, improved heat dissipation, and reliable performance for heavy-duty cutting tasks.</p>', '<p>Professional quality diamond cutter designed for powerful and efficient cutting in heavy-duty construction applications.</p>', '', '', '', '', 3, 'DCSCP1001', '', 2, 260, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/GS2uyDHegFQXRFHATNdu.png', 1, 1, NULL, '2026-03-06 05:05:21'),
(56, 2, 'Measurement Tape DX-15', 'measurement-tape-dx-15-56', '<p><strong>Material:</strong><br>High-quality steel measuring blade with durable ABS casing.</p><p><strong>Size:</strong><br>3 Meter and 5 Meter.</p><p><strong>Key Features:</strong><br>Clear measurement markings, strong retractable system, compact ergonomic design, and suitable for professional and daily measuring needs.</p>', '<p>Compact and durable measurement tape designed for accurate measuring in construction, repair, and everyday applications.</p>', '', '', '', '', 3, 'MTD1001', '', 2, 94, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/rUJIvPPgyfH83Ft30KPG.png', 1, 1, NULL, '2026-03-06 05:03:53'),
(57, 2, 'Measurement Tape DX - 09', 'measurement-tape-dx---09-57', '<p><strong>Material:</strong><br>High-quality steel measuring blade with durable ABS casing.</p><p><strong>Size:</strong><br>3 Meter and 5 Meter.</p><p><strong>Key Features:</strong><br>Clear and accurate markings, smooth retractable function, compact design, and suitable for construction, repair, and daily measurement applications.</p>', '<p>Reliable and easy-to-use measurement tape designed for accurate measuring in construction and everyday tasks.</p>', '', '', '', '', 3, 'MTD1002', '', 2, 47, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/NwWMoaNNxsYIe5Cm0UqL.png', 1, 1, NULL, '2026-03-06 05:03:36'),
(58, 2, 'Measurement Tape – A69', 'measurement-tape-a69-58', '<p><strong>Material:</strong><br>High-quality steel measuring blade with durable ABS casing.</p><p><strong>Size:</strong><br>3 Meter and 5 Meter.</p><p><strong>Key Features:</strong><br>Easy-to-read measurement markings, durable body construction, smooth retractable mechanism, and ideal for construction and general measuring tasks.</p>', '<p>Strong and dependable measurement tape designed for precise measurements in professional and everyday applications.</p>', '', '', '', '', 3, 'MTA1001', '', 2, 142, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/KnKICwiM0CSWNGMnXO4J.png', 1, 1, NULL, '2026-03-06 04:58:06'),
(59, 2, 'Measurement Tape - A70', 'measurement-tape---a70-59', '<p><strong>Material:</strong><br>High-quality steel measuring blade with a robust ABS casing.</p><p><strong>Size:</strong><br>3 Meter and 5 Meter</p><p><strong>Key Features:</strong></p><p>Clear and easy-to-read markings</p><p>Durable body for long-lasting use</p><p>Smooth retractable mechanism</p><p>Ideal for construction, carpentry, and general measuring tasks</p>', '<p>Reliable and durable measurement tape engineered for precise and effortless measuring in both professional and everyday tasks.</p>', '', '', '', '', 3, 'MTA1002', '', 2, 113, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/KdTEyjUGotHXxx7EeKBM.png', 1, 1, NULL, '2026-03-06 04:57:45'),
(60, 2, 'Measurement Tape – (Nickel Blade)', 'measurement-tape-nickel-blade--60', '<p><strong>Material:</strong><br>Nickel-plated steel measuring blade with robust ABS casing.</p><p><strong>Size:</strong><br>3 Meter and 5 Meter</p><p><strong>Key Features:</strong></p><p>Rust-resistant nickel-plated blade</p><p>Easy-to-read measurement markings</p><p>Durable and ergonomic casing</p><p>Smooth retractable mechanism</p><p>Suitable for professional and home applications</p>', '<p>Durable measurement tape with nickel-plated blade for precise, rust-resistant measurements in professional and home use.</p>', '', '', '', '', 3, 'MTNB1001', '', 2, 73, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/fKIWlcr8kmrnr8mVRCCg.png', 1, 1, NULL, '2026-03-06 04:57:12'),
(61, 2, 'Steel Tape', 'steel-tape-61', '<p><strong>Material:</strong><br>High-strength steel blade with protective ABS or metal casing.</p><p><strong>Size:</strong><br>15 Meter and 30 Meter</p><p><strong>Key Features:</strong></p><p>Long-range measurement capability</p><p>Durable steel blade for accurate readings</p><p>Protective and robust casing</p><p>Smooth retractable or winding mechanism</p><p>Ideal for construction, surveying, and industrial applications</p>', '<p>Heavy-duty steel tape designed for long-distance measurements with high accuracy and durability for professional use.</p>', '', '', '', '', 3, 'ST1001', '', 2, 260, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/WkAXzYzC8A1lp5KSuYbX.png', 1, 1, NULL, '2026-03-06 04:55:40'),
(62, 2, 'Versatile two-way adjustable screwdriver designed for precise fastening and effortless handling in various applications.', 'versatile-two-way-adjustable-screwdriver-designed-for-precise-fastening-and-effortless-handling-in-various-applications--62', '<p><strong>Material:</strong><br>High-quality steel tips with a durable, non-slip ABS handle.</p><p><strong>Size:</strong><br>Standard handheld size suitable for general use</p><p><strong>Key Features:</strong></p><p>Two-way functionality (slotted and Phillips)</p><p>Ergonomic non-slip handle for comfort</p><p>Durable steel tips for long-lasting use</p><p>Adjustable mechanism for quick switching</p><p>Suitable for household, workshop, and professional tasks</p>', '<p>Versatile two-way adjustable screwdriver designed for precise fastening and effortless handling in various applications.</p>', '', '', '', '', 0, 'ASM1001', '', 2, 200, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/tLVH1TrPizi9U7eefXsO.png', 1, 1, NULL, NULL),
(63, 2, 'Screwdriver 107 (Chrome Plated)', 'screwdriver-107-chrome-plated--63', '<p><strong>Material:</strong><br>Chrome-plated steel tips with durable, ergonomically designed plastic or rubber handles.</p><p><strong>Size:</strong><br>4″, 6″, 8″, 10″, 12″ (for both Plus and Flat types)</p><p><strong>Key Features:</strong></p><p>Chrome-plated tips for corrosion resistance and durability</p><p>Available in Plus (Phillips) and Flat (slotted) types</p><p>Multiple lengths to suit different applications</p><p>Ergonomic handles for comfortable grip</p><p>Ideal for professional and household use</p>', '<p>Durable chrome-plated screwdrivers in multiple sizes for precise fastening with long-lasting corrosion resistance.</p>', '', '', '', '', 3, 'SDCP1001', '', 2, 17, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/XryCzpsE5HIxWgHRuPzY.png', 1, 1, NULL, '2026-03-06 04:54:41'),
(64, 2, 'Screwdriver – Two Way', 'screwdriver-two-way-64', '<p><strong>Material:</strong><br>High-quality steel tips with durable non-slip ABS or rubber handles.</p><p><strong>Size:</strong><br>2″, 4″, 6″</p><p><strong>Key Features:</strong></p><p>Two-way functionality (slotted and Phillips)</p><p>Ergonomic non-slip handle for comfort</p><p>Durable steel tips for long-lasting use</p><p>Multiple sizes for versatile applications</p><p>Ideal for household, workshop, and professional tasks</p>', '<p>Versatile two-way screwdrivers in multiple sizes for precise fastening and easy handling in various applications.</p>', '', '', '', '', 3, 'SDTW1001', '', 2, 47, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/e8yEEzLgtmlmP2dgE5YK.png', 1, 1, NULL, '2026-03-06 04:53:57'),
(65, 2, 'Screwdriver 6637 Black Handle', 'screwdriver-6637-black-handle-65', '<p><strong>Material:</strong><br>Chrome-plated steel tips with durable black plastic or rubber handles.</p><p><strong>Size:</strong><br>4″, 6″, 8″, 10″, 12″ (for both Plus and Flat types)</p><p><strong>Key Features:</strong></p><p>Ergonomic black handles for comfortable grip</p><p>Chrome-plated tips for durability and rust resistance</p><p>Available in Plus (Phillips) and Flat (slotted) types</p><p>Multiple sizes to suit different fastening tasks</p><p>Ideal for professional, workshop, and household use</p>', '<p>Durable screwdrivers with black ergonomic handles, available in Plus and Flat types, designed for precise and comfortable fastening.</p>', '', '', '', '', 3, 'SDB1001', '', 2, 58, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/v4Y9SDJXTkPO9sY02cF9.png', 1, 1, NULL, '2026-03-06 04:53:14'),
(66, 2, 'Screwdriver 815-6″', 'screwdriver-815-6--66', '<p><strong>Material:</strong><br>Chrome-plated steel tips with durable ergonomic plastic or rubber handles.</p><p><strong>Size:</strong><br>4″, 6″, 8″, 10″, 12″ (for both Plus and Flat types)</p><p><strong>Key Features:</strong></p><p>Ergonomic handles for comfortable grip</p><p>Chrome-plated steel tips for long-lasting durability</p><p>Available in Plus (Phillips) and Flat (slotted) types</p><p>Multiple sizes for versatile applications</p><p>Ideal for professional, workshop, and household use</p>', '<p>Durable 815 series screwdrivers with versatile Plus and Flat types, designed for precise fastening and long-lasting performance.</p>', '', '', '', '', 3, 'SD1001', '', 2, 64, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/KJDps2Usi9ARfVWRdtvk.png', 1, 1, NULL, '2026-03-06 04:52:04'),
(67, 2, 'Screwdriver HS24', 'screwdriver-hs24-67', '<p><strong>Material:</strong><br>Chrome-plated steel tips with durable ergonomic plastic or rubber handles.</p><p><strong>Size:</strong><br>4″, 6″, 8″ (for both Plus and Flat types)</p><p><strong>Key Features:</strong></p><p>Ergonomic handles for comfortable grip</p><p>Chrome-plated steel tips for durability and rust resistance</p><p>Available in Plus (Phillips) and Flat (slotted) types</p><p>Compact sizes suitable for tight spaces</p><p>Ideal for professional, workshop, and household use</p>', '<p>Compact and durable HS24 screwdrivers with Plus and Flat types, designed for precise fastening in professional and home use.</p>', '', '', '', '', 3, 'SDH1001', '', 2, 50, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/h7Q3CMKVdkLpN3nMJ89e.png', 1, 1, NULL, '2026-03-06 04:50:19'),
(69, 2, 'Crimpring Plier', 'crimpring-plier-69', '<p><strong>Material:</strong><br>High-quality hardened steel with ergonomic non-slip handles.</p><p><strong>Size:</strong><br>6″ handheld size</p><p><strong>Key Features:</strong></p><p>Precise and secure crimping for wires and connectors</p><p>Durable steel construction for long-term use</p><p>Ergonomic non-slip handle for comfortable operation</p><p>Suitable for electrical, networking, and workshop applications</p><p>Compact 6″ size for easy handling and portability</p>', '<p>Versatile dual modular crimping plier designed for secure and precise crimping of connectors in electrical and networking applications.</p>', '', '', '', '', 3, 'CP1001', '', 2, 148, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/wk7lHNggy8sCNLvVqQUv.png', 1, 1, NULL, '2026-03-06 04:45:57'),
(70, 2, 'Locking Plier', 'locking-plier-70', '<p><strong>Material:</strong><br>High-grade steel with durable, non-slip handles.</p><p><strong>Size:</strong><br>10″ and 7″</p><p><strong>Key Features:</strong></p><p>Strong adjustable clamping force</p><p>Durable steel construction for long-lasting use</p><p>Precision jaws for secure gripping</p><p>Ergonomic non-slip handles for comfort</p><p>Ideal for mechanical, construction, and household tasks</p>', '<p>Heavy-duty locking pliers designed for strong grip and secure clamping in professional and household applications.</p>', '', '', '', '', 3, 'LP1001', '', 2, 250, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/skMcHCrlfRgOHWUTc2jB.png', 1, 1, NULL, '2026-03-06 04:44:13'),
(71, 2, 'Circle Plier External & Internal', 'circle-plier-external-internal-71', '<p><strong>Material:</strong><br>High-grade steel tips with durable, non-slip handles.</p><p><strong>Size:</strong><br>07″ (Bent – External &amp; Internal, Straight)</p><p><strong>Key Features:</strong></p><p>Available in External &amp; Internal Bent and Straight types</p><p>Precision tips for accurate bending and shaping</p><p>Durable high-grade steel construction</p><p>Ergonomic non-slip handles for comfortable use</p><p>Ideal for jewelry making, electronics, crafts, and professional use</p>', '<p>High-quality circle pliers for precise bending, cutting, and shaping, available in bent and straight types for versatile use.</p>', '', '', '', '', 3, 'CPEI1001', '', 2, 161, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/sHJxGO6Yl2UReLjgJvQG.png', 1, 1, NULL, '2026-03-06 04:43:28'),
(72, 2, 'CTG Plier (Nickel Finish)', 'ctg-plier-nickel-finish--72', '<p>Nickel-finished steel with durable ergonomic handles.</p><p><strong>Size:</strong></p><p>Plier: 6″, 7″, 8″</p><p>Cutting Plier: 6″</p><p>Nose Plier: 6″</p><p><strong>Key Features:</strong></p><p>Nickel finish for corrosion resistance and durability</p><p>Multiple types: standard plier, cutting plier, nose plier</p><p>Ergonomic non-slip handles for comfortable use</p><p>Precision tips for accurate gripping and cutting</p><p>Suitable for professional, workshop, and household tasks</p>', '<p>Durable CTG pliers with nickel finish, available in multiple types and sizes for precise gripping, cutting, and handling tasks.</p>', '', '', '', '', 3, 'CPNF1001', '', 2, 198, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/L1ykXVGr4JJ9XMjoHrY9.png', 1, 1, NULL, '2026-03-06 04:42:17'),
(73, 2, 'Pliers – Black Finish', 'pliers-black-finish-73', '<p><strong>Material:</strong><br>High-quality black-coated steel with ergonomic yellow &amp; black plastic/rubber handles.</p><p><strong>Size:</strong><br>8″</p><p><strong>Key Features:</strong></p><p>Black finish for corrosion resistance and durability</p><p>Ergonomic yellow &amp; black handles for comfortable grip</p><p>Precision jaws for accurate gripping and cutting</p><p>Ideal for workshop, construction, and household tasks</p><p>Durable steel construction for long-term use</p>', '<p>Durable 8″ pliers with black finish and ergonomic yellow &amp; black handles, designed for precise gripping, cutting, and general workshop tasks.</p>', '', '', '', '', 3, 'PBF1001', '', 2, 208, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/SBv8NeYzg2BXA8nAn5SH.png', 1, 1, NULL, '2026-03-06 04:41:35'),
(74, 2, 'Plier (Nickel Finish)', 'plier-nickel-finish--74', '<p><strong>Material:</strong><br>Nickel-finished high-quality steel with ergonomic non-slip handles.</p><p><strong>Size:</strong><br>4″, 6″, 7″, 8″</p><p><strong>Key Features:</strong></p><p>Nickel finish for rust resistance and durability</p><p>Multiple sizes for versatile applications</p><p>Strong jaws for secure gripping and handling</p><p>Ergonomic non-slip handles for comfort and control</p><p>Ideal for professional, workshop, and household use</p>', '<p>Durable nickel-finish pliers available in multiple sizes, designed for precise gripping, bending, and cutting applications.</p>', '', '', '', '', 3, 'PNF1001', '', 2, 120, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/8uCmugZYIVAH9hJ9fppc.png', 1, 1, NULL, '2026-03-06 04:40:48'),
(75, 2, 'Fine Polished Plier', 'fine-polished-plier-75', '<p><strong>Material:</strong><br>Fine polished high-quality steel with ergonomic non-slip handles.</p><p><strong>Size:</strong></p><p>Plier: 6″, 8″</p><p>Cutting Plier: 6″</p><p>Nose Plier: 6″</p><p><strong>Key Features:</strong></p><p>Fine polished finish for durability and corrosion resistance</p><p>Multiple types for versatile applications</p><p>Precision jaws for accurate gripping and cutting</p><p>Ergonomic non-slip handles for comfort and control</p><p>Ideal for professional, workshop, and household tasks</p>', '<p>Fine polished pliers designed for precise gripping and cutting, available in multiple types for professional and general applications.</p>', '', '', '', '', 3, 'FP1001', '', 2, 156, '10', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/ZOEoql2d5698YwCBsmIs.png', 1, 1, NULL, '2026-03-06 04:39:51'),
(76, 2, 'Combination Plier (Professional Quality) & Nose Plier (Professional Quality)', 'combination-plier-professional-quality-nose-plier-professional-quality--76', '<p><strong>Material:</strong><br>High-grade hardened steel with ergonomic non-slip handles.</p><p><strong>Size:</strong></p><p>Combination Plier: 8″</p><p>Nose Plier: 6″</p><p><strong>Key Features:</strong></p><p>Professional-quality construction for heavy-duty use</p><p>Strong jaws for secure gripping and cutting</p><p>Nose plier designed for precision work in tight spaces</p><p>Ergonomic non-slip handles for comfort and control</p><p>Ideal for professional, workshop, and household applications</p>', '<p>Professional-quality pliers designed for strong gripping, cutting, and precision handling in workshop and industrial applications.</p>', '', '', '', '', 3, 'CPNP1001', '', 2, 156, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/NxWB1ncM7Q5V80eBh4Ut.png', 1, 1, NULL, '2026-03-06 04:39:04'),
(83, 2, 'Pro Riveter', 'pro-riveter-83', '<p><strong>Material:</strong><br>High-strength steel body with ergonomic non-slip handles.</p><p><strong>Size:</strong><br>Standard handheld size suitable for general riveting applications</p><p><strong>Key Features:</strong></p><p>Heavy-duty professional construction</p><p>Smooth and efficient riveting mechanism</p><p>Strong leverage for easy operation</p><p>Ergonomic non-slip handles for comfort</p><p>Ideal for metalwork, automotive, construction, and repair tasks</p>', '<p>Heavy-duty professional riveter designed for secure and efficient fastening in metal, construction, and repair applications.</p>', '', '', '', '', 3, 'PR1001', '', 2, 380, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/WGWTcrlgKlLPdyhDIqyB.png', 1, 1, NULL, '2026-03-06 04:36:47'),
(85, 2, 'Cutting Plier (Professional Quality)', 'cutting-plier-professional-quality--85', '<p><strong>Material:</strong><br>High-grade hardened steel with ergonomic non-slip handles.</p><p><strong>Size:</strong><br>6″</p><p><strong>Key Features:</strong></p><p>Professional-quality construction for durability</p><p>Sharp cutting edges for clean and precise cuts</p><p>Strong and reliable cutting performance</p><p>Ergonomic non-slip handles for comfort and control</p><p>Suitable for electrical, workshop, and household applications</p>', '<p>Professional-quality 6″ cutting plier designed for precise wire cutting with durability and comfortable handling.</p>', '', '', '', '', 3, 'CP1003', '', 2, 166, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/z51Q8JDU2WrOvWFwrvEY.png', 1, 1, NULL, '2026-03-06 04:36:19'),
(86, 32, 'WD-40 Multi-Use Product (277 ml) – মরিচা রোধক', 'wd-40-multi-use-product-277-ml--86', '<p style=\"margin-left:0px;\"><strong>Key Features:</strong></p><ol><li><strong>Lubricates Moving Parts:</strong> Ensures smooth operation of hinges, wheels, pulleys, gears, and other mechanisms.</li><li><strong>Protects Against Rust &amp; Corrosion:</strong> Creates a protective barrier to shield metal surfaces from moisture and oxidation.</li><li><strong>Frees Stuck or Rusted Parts:</strong> Penetrates and loosens tight, jammed, or corroded components quickly.</li><li><strong>Removes Dirt &amp; Residue:</strong> Cleans grease, grime, tar, adhesive, and other tough build-ups with ease.</li><li><strong>Displaces Moisture:</strong> Effectively dries out damp electrical systems and prevents short circuits.</li><li><strong>Versatile Applications:</strong> Suitable for use in household maintenance, automotive care, industrial machinery, and outdoor equipment.</li></ol><p style=\"margin-left:0px;\">WD-40 is not just a spray—it’s a reliable tool for extending the life and performance of your equipment.</p>', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(74,74,74);\">WD-40 Multi-Use Product is the all-in-one solution trusted worldwide for maintenance, protection, and repair. Engineered with a unique formula, it provides multiple benefits across ho', '', '', '', '', 1, 'WD401001', '', 2, 567, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/eUjZXB71eKjMbzOsL0un.png', 1, 1, NULL, '2026-07-06 06:21:53'),
(87, 32, 'WD-40 Multi use product (382 ml)', 'wd-40-multi-use-product-382-ml--87', '<p style=\"margin-left:0px;\"><strong>Key Features:</strong></p><ol><li><strong>Lubricates Moving Parts:</strong> Ensures smooth operation of hinges, wheels, pulleys, gears, and other mechanisms.</li><li><strong>Protects Against Rust &amp; Corrosion:</strong> Creates a protective barrier to shield metal surfaces from moisture and oxidation.</li><li><strong>Frees Stuck or Rusted Parts:</strong> Penetrates and loosens tight, jammed, or corroded components quickly.</li><li><strong>Removes Dirt &amp; Residue:</strong> Cleans grease, grime, tar, adhesive, and other tough build-ups with ease.</li><li><strong>Displaces Moisture:</strong> Effectively dries out damp electrical systems and prevents short circuits.</li><li><strong>Versatile Applications:</strong> Suitable for use in household maintenance, automotive care, industrial machinery, and outdoor equipment.</li></ol><p style=\"margin-left:0px;\">WD-40 is not just a spray—it’s a reliable tool for extending the life and performance of your equipment.</p>', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(74,74,74);\">WD-40 Multi-Use Product is the all-in-one solution trusted worldwide for maintenance, protection, and repair. Engineered with a unique formula, it provides multiple benefits across ho', '', '', '', '', 1, 'WD401002', '', 2, 697, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/9dyQ6QSf7esSlHdbG3zg.png', 1, 1, NULL, '2026-06-24 08:41:34'),
(88, 32, 'WD-40 Multi-Use Product (412ml)', 'wd-40-multi-use-product-412ml--88', '<p style=\"margin-left:0px;\"><strong>Key Features:</strong></p><ol><li><strong>Lubricates Moving Parts:</strong> Ensures smooth operation of hinges, wheels, pulleys, gears, and other mechanisms.</li><li><strong>Protects Against Rust &amp; Corrosion:</strong> Creates a protective barrier to shield metal surfaces from moisture and oxidation.</li><li><strong>Frees Stuck or Rusted Parts:</strong> Penetrates and loosens tight, jammed, or corroded components quickly.</li><li><strong>Removes Dirt &amp; Residue:</strong> Cleans grease, grime, tar, adhesive, and other tough build-ups with ease.</li><li><strong>Displaces Moisture:</strong> Effectively dries out damp electrical systems and prevents short circuits.</li><li><strong>Versatile Applications:</strong> Suitable for use in household maintenance, automotive care, industrial machinery, and outdoor equipment.</li></ol><p style=\"margin-left:0px;\">WD-40 is not just a spray—it’s a reliable tool for extending the life and performance of your equipment.</p>', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(74,74,74);\">WD-40 Multi-Use Product is the all-in-one solution trusted worldwide for maintenance, protection, and repair. Engineered with a unique formula, it provides multiple benefits across ho', '', '', '', '', 1, 'WDMP1001', '', 2, 702, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/yEs5rkZ0f8UBzBoI8lZb.png', 0, 1, NULL, '2026-07-06 04:13:41'),
(90, 32, 'WD-40 Multi-Use Product (4 Ltr.)', 'wd-40-multi-use-product-4-ltr--90', '<p style=\"margin-left:0px;\"><strong>Key Features:</strong></p><ol><li><strong>Lubricates Moving Parts:</strong> Ensures smooth operation of hinges, wheels, pulleys, gears, and other mechanisms.</li><li><strong>Protects Against Rust &amp; Corrosion:</strong> Creates a protective barrier to shield metal surfaces from moisture and oxidation.</li><li><strong>Frees Stuck or Rusted Parts:</strong> Penetrates and loosens tight, jammed, or corroded components quickly.</li><li><strong>Removes Dirt &amp; Residue:</strong> Cleans grease, grime, tar, adhesive, and other tough build-ups with ease.</li><li><strong>Displaces Moisture:</strong> Effectively dries out damp electrical systems and prevents short circuits.</li><li><strong>Versatile Applications:</strong> Suitable for use in household maintenance, automotive care, industrial machinery, and outdoor equipment.</li></ol><p style=\"margin-left:0px;\">WD-40 is not just a spray—it’s a reliable tool for extending the life and performance of your equipment.</p>', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(74,74,74);\">WD-40 Multi-Use Product is the all-in-one solution trusted worldwide for maintenance, protection, and repair. Engineered with a unique formula, it provides multiple benefits across ho', '', '', '', '', 1, 'WDMP1002', '', 2, 4500, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/vivHVYCeQG0Czf7KZWRO.png', 0, 1, NULL, '2026-07-05 10:56:06'),
(91, 32, 'WD-40 Specialist Auto Chain Lube (360ml)', 'wd-40-specialist-auto-chain-lube-360ml--91', '<p><strong>Material:</strong><br>Advanced anti-wear lubricating formula in aerosol form.</p><p><strong>Size:</strong><br>Available in multiple sizes (e.g., 200ml, 400ml – check your stock)</p><p><strong>Key Features:</strong></p><p>Reduces friction and wear on chains</p><p>Protects against rust and corrosion</p><p>Long-lasting lubrication under high-speed conditions</p><p>Precision spray for targeted application</p><p>Ideal for motorcycles, bicycles, and automotive chains</p>', '<p>High-performance chain lubricant designed to protect, reduce friction, and extend the life of motorcycle and automotive chains.</p>', '', '', '', '', 1, 'WDCL1001', '', 2, 858, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/VjwWL3Y5efyvoVrLldON.png', 0, 1, NULL, '2026-07-08 05:53:07'),
(92, 32, 'WD-40 Specialist Contact Cleaner (360 ml) – দ্রুত শুকিয়ে যাওয়া ইলেকট্রিক্যাল কন্টাক্ট ক্লিনার', 'wd-40-specialist-contact-cleaner-360-ml--92', '<p>WD-40 Specialist Contact Cleaner (360 ml) একটি দ্রুত শুকিয়ে যাওয়া, নন-কন্ডাকটিভ ক্লিনিং স্প্রে যা সংবেদনশীল ইলেকট্রিক্যাল ও ইলেকট্রনিক যন্ত্রাংশ পরিষ্কার করার জন্য বিশেষভাবে তৈরি। এটি ধুলো, তেল, গ্রিজ, ফ্লাক্স, ময়লা ও অন্যান্য দূষিত পদার্থ দ্রুত অপসারণ করে এবং কোনো অবশিষ্টাংশ (Residue) রেখে যায় না। নিয়মিত ব্যবহারে বৈদ্যুতিক সংযোগের কার্যক্ষমতা বজায় রাখতে সহায়তা করে।</p><h3>মূল বৈশিষ্ট্য</h3><ul><li>দ্রুত শুকিয়ে যায় (Fast Drying Formula)</li><li>কোনো অবশিষ্টাংশ (Residue) রেখে যায় না</li><li>নন-কন্ডাকটিভ ফর্মুলা</li><li>তেল, গ্রিজ, ধুলো ও ময়লা কার্যকরভাবে পরিষ্কার করে</li><li>সংবেদনশীল ইলেকট্রিক্যাল ও ইলেকট্রনিক যন্ত্রাংশের জন্য উপযোগী</li><li>নির্ভুল Smart Straw স্প্রে সিস্টেমের মাধ্যমে সহজে ব্যবহারযোগ্য</li></ul><h3>ব্যবহারের ক্ষেত্র</h3><ul><li>সার্কিট বোর্ড (PCB)</li><li>ইলেকট্রিক্যাল কন্টাক্ট ও কানেক্টর</li><li>সুইচ ও রিলে</li><li>কন্ট্রোল প্যানেল</li><li>প্রিন্টার ও অফিস ইকুইপমেন্ট</li><li>সেন্সর ও টার্মিনাল</li><li>অডিও/ভিডিও ইকুইপমেন্ট</li><li>শিল্প কারখানার বৈদ্যুতিক যন্ত্রপাতি</li></ul><h3>স্পেসিফিকেশন</h3><ul><li><strong>ব্র্যান্ড:</strong> WD-40 Specialist</li><li><strong>পণ্যের ধরন:</strong> Contact Cleaner</li><li><strong>নিট পরিমাণ:</strong> 360 ml</li><li><strong>উৎপত্তি:</strong> USA</li></ul>', '<p>Fast-drying contact cleaner designed to safely remove dirt, grease, and oxidation from electrical and electronic components.</p>', '', '', '', '', 1, 'WDCC1001', '', 2, 1100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/g0qFXAemuCVXCg4q3fL5.jpg', 1, 1, NULL, '2026-07-06 09:58:30'),
(93, 2, 'WD-40 Specialist Spray Silicone Lubricant (360ml)', 'wd-40-specialist-spray-silicone-lubricant-360ml--93', '<p><strong>Material:</strong><br>Specialized lubricating and anti-corrosion formula in aerosol form.</p><p><strong>Size:</strong><br>Available in multiple sizes (e.g., 100ml, 200ml, 300ml, 400ml – check your stock)</p><p><strong>Key Features:</strong></p><p>Lubricates moving parts and mechanisms</p><p>Protects metal surfaces from rust and corrosion</p><p>Displaces moisture from tools and equipment</p><p>Helps loosen stuck or rusted parts</p><p>Suitable for automotive, industrial, and household applications</p>', '<p>Versatile multi-use product for lubrication, protection, and maintenance of tools, machines, and household items.</p>', '', '', '', '', 1, 'WDSSL1001', '', 2, 728, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/8E5YMVBODVV47eyq9TTm.png', 0, 1, NULL, '2026-05-03 06:44:24'),
(94, 2, 'WD-40 Specialist Auto Brake & Parts Cleaner (450ml)', 'wd-40-specialist-auto-brake-parts-cleaner-450ml--94', '<p><strong>Material:</strong><br>Specialized fast-drying cleaning solution in aerosol form.</p><p><strong>Size:</strong><br>450ml</p><p><strong>Key Features:</strong></p><p>Quickly removes grease, oil, dirt, and brake dust</p><p>Leaves no residue for reliable component performance</p><p>Enhances braking efficiency and system reliability</p><p>Safe for use on automotive brakes and mechanical parts</p><p>Ideal for professional mechanics and DIY automotive maintenance</p>', '<p>Powerful cleaner for automotive brakes and mechanical parts, removing grease, oil, and brake dust quickly and safely.</p>', '', '', '', '', 1, 'WDABPC1001', '', 2, 1092, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/K41o0nvp6Nw0z33SnXFS.png', 0, 1, NULL, '2026-05-03 06:43:59'),
(95, 2, 'WD-40 Specialist Degreaser (450ml)', 'wd-40-specialist-degreaser-450ml--95', '<p><strong>Material:</strong><br>Advanced fast-acting degreasing formula in aerosol form.</p><p><strong>Size:</strong><br>450ml</p><p><strong>Key Features:</strong></p><p>Quickly removes grease, oil, and grime</p><p>Leaves no residue for clean, efficient surfaces</p><p>Ideal for machinery, tools, engines, and workspaces</p><p>Professional-grade performance for industrial and automotive use</p><p>Safe and easy to use for both professionals and DIY enthusiasts</p>', '<p>Powerful degreaser designed to remove tough grease, oil, and grime from machinery, tools, and surfaces efficiently.</p>', '', '', '', '', 1, 'WDSD1001', '', 2, 988, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/1SsvryVHrf0i3VtDhf6m.png', 0, 1, NULL, '2026-05-03 06:43:37');
INSERT INTO `product` (`id`, `seller_id`, `name`, `slug`, `description`, `short_description`, `meta_title`, `meta_description`, `meta_keyword`, `product_tag`, `brand`, `sku`, `external_link`, `cash_dev_status`, `price`, `unit`, `stock_qty`, `stock_mini_qty`, `stock_status`, `manufacturer`, `download_link`, `discount`, `discount_status`, `shipping_days`, `free_shopping`, `delivery_days`, `flat_rate_status`, `flat_rate_price`, `vat`, `vat_status`, `tax`, `tax_status`, `thumnail_img`, `status`, `entry_by`, `created_at`, `updated_at`) VALUES
(96, 32, 'WD-40 Specialist Air Condition Cleaner (360ml)', 'wd-40-specialist-air-condition-cleaner-360ml--96', '<p><strong>Material:</strong><br>Specialized fast-acting cleaning formula in aerosol form.</p><p><strong>Size:</strong><br>360ml</p><p><strong>Key Features:</strong></p><p>Removes dust, dirt, grease, and odors</p><p>Safe for metal and plastic AC components</p><p>Fast-acting formula with no residue</p><p>Improves airflow and air quality</p><p>Suitable for automotive and home AC systems</p>', '<p>Specialized cleaner for air conditioning systems, removing dust, dirt, and odors to improve efficiency and air quality.</p>', '', '', '', '', 1, 'WDSACC1001', '', 2, 811, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/d2NCGV2mC1FP67zYdAur.png', 0, 1, NULL, '2026-07-06 05:09:37'),
(97, 2, 'WD-40 Specialist Auto Belt Dressing (360ml)', 'wd-40-specialist-auto-belt-dressing-360ml--97', '<p><strong>Material:</strong><br>Specialized rubber-conditioning and protective formula in aerosol form.</p><p><strong>Size:</strong><br>360ml</p><p><strong>Key Features:</strong></p><p>Restores flexibility and prevents belt slipping</p><p>Reduces squeaking and wear on automotive belts</p><p>Protects belts from cracking, drying, and aging</p><p>Safe for all types of rubber and synthetic belts</p><p>Ideal for automotive maintenance and repair</p>', '<p>High-performance belt dressing designed to restore, protect, and extend the life of automotive belts.</p>', '', '', '', '', 1, 'WDSABD', '', 2, 770, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/HeK7sS5R4MXG4BI1X8uM.png', 0, 1, NULL, '2026-05-03 06:41:07'),
(98, 2, 'Claw Hammer with Fiberglass Handle', 'claw-hammer-with-fiberglass-handle-98', '<p><strong>Material:</strong><br>Hardened steel head with durable fiberglass handle.</p><p><strong>Size:</strong><br>08 OZ and 16 OZ</p><p><strong>Key Features:</strong></p><p>Hardened steel head for effective nailing</p><p>Curved claw for easy nail removal</p><p>Fiberglass handle for shock absorption and comfort</p><p>Ergonomic non-slip grip</p><p>Suitable for carpentry, construction, and household projects</p>', '<p>Durable claw hammer with fiberglass handle, designed for precise nailing and easy pulling of nails in professional and household tasks.</p>', '', '', '', '', 3, 'CHFH1001', '', 2, 196, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Eb0z7gFcIfKSP2uNB3ij.png', 1, 1, NULL, '2026-03-06 04:34:34'),
(99, 2, 'Bir – Ball Pein Hammer', 'bir-ball-pein-hammer-99', '<p><strong>Material:</strong><br>Hardened steel head with ergonomic, durable handle (wood or fiberglass depending on stock).</p><p><strong>Size:</strong><br>08 OZ, 16 OZ, 24 OZ, 32 OZ</p><p><strong>Key Features:</strong></p><p>Hardened steel head with flat face and rounded pein</p><p>Multiple sizes for light to heavy-duty tasks</p><p>Ergonomic handle for comfortable grip and control</p><p>Ideal for metalworking, shaping, riveting, and general workshop use</p><p>Durable construction for long-lasting performance</p>', '<p>Versatile ball pein hammer for metalworking, shaping, and general workshop tasks, available in multiple sizes.</p>', '', '', '', '', 3, 'BBPH1001', '', 2, 196, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/gPWb4betDp2XdGwQgdpA.png', 1, 1, NULL, '2026-03-06 04:20:03'),
(100, 2, 'Chipping Hammer with Wooden Handle', 'chipping-hammer-with-wooden-handle-100', '<p><strong>Material:</strong><br>Hardened steel head with natural wooden handle.</p><p><strong>Size:</strong><br>200g and 500g</p><p><strong>Key Features:</strong></p><p>Hardened steel head for effective chipping and cleaning</p><p>Wooden handle for comfort and shock absorption</p><p>Available in 200g and 500g sizes for light and heavy-duty work</p><p>Ideal for welders, metalworkers, and construction tasks</p><p>Durable and long-lasting construction</p>', '<p>Durable chipping hammer with wooden handle, designed for removing rust, scale, and welding slag in workshop and construction tasks.</p>', '', '', '', '', 3, 'CJWH1001', '', 2, 203, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/vM4pmHo2Lutyl0EDXUKC.png', 1, 1, NULL, '2026-03-06 04:19:12'),
(101, 2, 'Machinist Hammer with Wooden Handle', 'machinist-hammer-with-wooden-handle-101', '<p><strong>Material:</strong><br>Hardened steel head with natural wooden handle.</p><p><strong>Size:</strong><br>300g and 500g</p><p><strong>Key Features:</strong></p><p>Hardened steel head for precise striking</p><p>Wooden handle for comfort and shock absorption</p><p>Available in 300g and 500g for light and medium-duty tasks</p><p>Ideal for machinists, metalworkers, and precision applications</p><p>Durable and professional-grade construction</p>', '<p>Precision machinist hammer with wooden handle, designed for metalworking, shaping, and delicate striking tasks.</p>', '', '', '', '', 3, 'MHWH1001', '', 2, 196, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Fb1TVawosNuqSkhZEnk6.png', 1, 1, NULL, '2026-03-06 04:18:03'),
(102, 2, 'Rubber Mallet Hammer with Fiberglass Handle', 'rubber-mallet-hammer-with-fiberglass-handle-102', '<p><strong>Material:</strong><br>Rubber head with durable fiberglass handle.</p><p><strong>Size:</strong><br>08 OZ, 12 OZ, 24 OZ, 32 OZ</p><p><strong>Key Features:</strong></p><p>Rubber head for non-marring, controlled striking</p><p>Fiberglass handle for shock absorption and comfort</p><p>Multiple sizes for light to heavy-duty tasks</p><p>Ideal for carpentry, furniture assembly, and metalwork</p><p>Durable construction for professional and DIY use</p>', '<p>Durable rubber mallet with fiberglass handle, designed for gentle striking, shaping, and assembly without damaging surfaces.</p>', '', '', '', '', 3, 'RMHFGH1001', '', 2, 227, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/tSizlVXFG8wVOdniJAoE.png', 1, 1, NULL, '2026-03-06 04:17:28'),
(103, 2, 'BMI Hammer with Fiberglass Handle', 'bmi-hammer-with-fiberglass-handle-103', '<p><strong>Material:</strong><br>Hardened steel head with fiberglass handle.</p><p><strong>Size:</strong><br>12 OZ, 16 OZ</p><p><strong>Key Features:</strong></p><p>Hardened steel head for effective striking</p><p>Fiberglass handle for shock absorption and comfort</p><p>Available in 12 OZ and 16 OZ sizes for versatile use</p><p>Ergonomic grip for safe and precise operation</p><p>Suitable for carpentry, construction, and household tasks</p><p>&nbsp;</p>', '<p>Durable BMI hammer with fiberglass handle, designed for effective striking in professional and household tasks.</p>', '', '', '', '', 3, 'FGH1001', '', 2, 231, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/2N0vMKUBG3m5nWdVN2bf.png', 1, 1, NULL, '2026-03-06 04:15:42'),
(104, 2, 'Two-Way Mallet Hammer with Fiberglass Handle', 'two-way-mallet-hammer-with-fiberglass-handle-104', '<p><strong>Material:</strong><br>Durable dual-surface mallet head with fiberglass handle.</p><p><strong>Size:</strong><br>30 mm, 35 mm, 40 mm</p><p><strong>Key Features:</strong></p><p>Two-way mallet for versatile striking applications</p><p>Fiberglass handle for shock absorption and ergonomic grip</p><p>Available in 30 mm, 35 mm, 40 mm for different task requirements</p><p>Non-marring surfaces for safe and controlled impact</p><p>Ideal for carpentry, metalwork, and assembly tasks</p>', '<p>Versatile two-way mallet hammer with fiberglass handle, designed for precise striking and non-marring impact in professional and DIY applications.</p><p>&nbsp;</p>', '', '', '', '', 3, 'TWMHFH1001', '', 2, 237, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/b2wnTzSPFSOe6GHWkVYO.png', 1, 1, NULL, '2026-03-06 04:14:26'),
(105, 2, 'Adjustable Wrench Multi color', 'adjustable-wrench-multi-color-105', '<p><strong>Material:</strong><br>High-grade steel with multi-color coated finish and ergonomic handle.</p><p><strong>Size:</strong><br>Standard handheld size suitable for general use</p><p><strong>Key Features:</strong></p><p>Adjustable jaw for multiple fastener sizes</p><p>Durable steel construction for long-lasting use</p><p>Ergonomic non-slip handle for comfort and control</p><p>Multi-color finish for visibility and style</p><p>Suitable for mechanical, plumbing, and household applications</p>', '<p>Versatile multi-color adjustable wrench designed for gripping and turning nuts and bolts of various sizes with ease and precision.</p>', '', '', '', '', 3, 'AWMC', '', 2, 385, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/pRxXqoX79P054HliozHE.png', 1, 1, NULL, '2026-03-06 04:13:05'),
(106, 2, 'Adjustable Wrench – Black Nickel Plated', 'adjustable-wrench-black-nickel-plated-106', '<p><strong>Material:</strong><br>High-grade steel with black nickel-plated finish and ergonomic handle.</p><p><strong>Size:</strong><br>Standard handheld size suitable for general use</p><p><strong>Key Features:</strong></p><p>Adjustable jaw for various fastener sizes</p><p>Black nickel-plated steel for corrosion resistance and durability</p><p>Ergonomic non-slip handle for comfort and control</p><p>Ideal for mechanical, plumbing, and household applications</p><p>Professional-grade construction for long-lasting use</p>', '<p>Durable adjustable wrench with black nickel-plated finish, designed for gripping and turning nuts and bolts with precision and long-lasting performance.</p>', '', '', '', '', 3, 'AWBNP1001', '', 2, 241, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/5UKkqEOVpvr2aWoqAqQV.png', 1, 1, NULL, '2026-03-06 04:12:32'),
(107, 2, 'Adjustable Wrench – Bir Super Blue', 'adjustable-wrench-bir-super-blue-107', '<p><strong>Material:</strong><br>High-grade steel with blue protective finish and ergonomic handle.</p><p><strong>Size:</strong><br>Standard handheld size suitable for general use</p><p><strong>Key Features:</strong></p><p>Adjustable jaw fits multiple fastener sizes</p><p>Durable blue finish for corrosion protection and visibility</p><p>Ergonomic non-slip handle for comfort and control</p><p>Suitable for professional, mechanical, and household tasks</p><p>Reliable performance and long-lasting construction</p>', '<p>High-quality Bir Super adjustable wrench in blue, designed for precise gripping and turning of nuts and bolts in professional and household use</p>', '', '', '', '', 3, 'AWBSB1001', '', 2, 203, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JpP4HkoW9e3TK4urzX4r.png', 1, 1, NULL, '2026-03-06 04:11:32'),
(108, 2, 'Adjustable Wrench – Red Handle', 'adjustable-wrench-red-handle-108', '<p><strong>Material:</strong><br>High-grade steel with bright red ergonomic handle.</p><p><strong>Size:</strong><br>Standard handheld size suitable for general use</p><p><strong>Key Features:</strong></p><p>Adjustable jaw for multiple fastener sizes</p><p>Durable steel construction for long-lasting use</p><p>Bright red ergonomic handle for comfort and easy visibility</p><p>Ideal for mechanical, plumbing, and household tasks</p><p>Reliable and precise performance</p>', '<p>Durable adjustable wrench with red handle, designed for precise gripping and turning of nuts and bolts in professional and household applications.</p>', '', '', '', '', 3, 'AWRH1001', '', 2, 161, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/RF15ZbImfBMzN2EPFUSB.png', 1, 1, NULL, '2026-03-06 04:10:36'),
(109, 2, 'L-Handle Wrench – Bir Super', 'l-handle-wrench-bir-super-109', '<p><strong>Material:</strong><br>High-grade steel with ergonomic grip handle.</p><p><strong>Size:</strong><br>Standard L-handle size for general use</p><p><strong>Key Features:</strong></p><p>L-shaped design for maximum leverage and torque</p><p>Durable high-grade steel construction</p><p>Ergonomic handle for secure and comfortable grip</p><p>Ideal for tight spaces and hard-to-reach fasteners</p><p>Suitable for mechanical, automotive, and household use</p>', '<p>High-quality Bir Super L-handle wrench designed for easy turning of nuts and bolts in tight spaces with precision and leverage.</p>', '', '', '', '', 3, 'LHWBS1001', '', 2, 135, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/eZowi62cTE3bU3dvhWFP.png', 1, 1, NULL, '2026-03-06 04:08:41'),
(110, 2, 'Pipe Wrench (Bir Super) - 12\'\',14\'\',18\'\',24\'\'', 'pipe-wrench-bir-super---12-14-18-24--110', '<p><strong>Material:</strong><br>High-strength steel with hardened serrated jaws and ergonomic handle.</p><p><strong>Size:</strong><br>12″, 14″, 18″, 24″</p><p><strong>Key Features:</strong></p><p>Hardened serrated jaws for firm pipe gripping</p><p>Ergonomic handle for comfortable and controlled use</p><p>Multiple sizes for light to heavy-duty tasks</p><p>Ideal for plumbing, construction, and mechanical work</p><p>Durable construction for long-lasting professional use</p>', '<p>Heavy-duty Bir Super pipe wrench designed for gripping and turning pipes of various sizes with precision and strength.</p>', '', '', '', '', 3, 'PW1001', '', 2, 364, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/W8cEDA43O0GeTE4U0CH2.png', 1, 1, NULL, '2026-03-06 04:08:12'),
(111, 2, 'Socket Set (10pcs) Wrench, (40 pcs) Wrench - 2003 Big, (40pcs) Wrench - AIWA 2002 Small', 'socket-set-10pcs-wrench-40-pcs-wrench---2003-big-40pcs-wrench---aiwa-2002-small-111', '<p><strong>Material:</strong><br>Hardened steel with chrome-plated finish for durability and corrosion resistance.</p><p><strong>Size:</strong></p><p>10pcs Wrench Set – standard socket sizes</p><p>40pcs Wrench Set – 2003 Big sizes</p><p>40pcs Wrench Set – AIWA 2002 Small sizes</p><p><strong>Key Features:</strong></p><p>Wide range of socket sizes for versatile use</p><p>Durable hardened steel construction with chrome plating</p><p>Provides reliable torque and long-lasting performance</p><p>Suitable for professional, automotive, and household applications</p><p>Compact and organized sets for easy storage and accessibility</p>', '<p>Comprehensive socket wrench sets designed for precise fastening and loosening of bolts and nuts in professional and DIY applications.</p>', '', '', '', '', 3, 'SS1001', '', 2, 416, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/0JmEh84o2aXhMD33Hger.png', 1, 1, NULL, '2026-03-06 04:05:17'),
(112, 2, 'T-Handle Socket', 't-handle-socket-112', '<p><strong>Material:</strong><br>High-grade hardened steel with ergonomic T-handle grip.</p><p><strong>Size:</strong><br>Standard socket size (depends on your specific set – e.g., 8mm to 19mm)</p><p><strong>Key Features:</strong></p><p>T-shaped handle for excellent leverage and torque</p><p>Durable hardened steel construction</p><p>Precision socket for secure fastening and loosening</p><p>Compact design suitable for tight spaces</p><p>Ideal for professional, automotive, and household use</p>', '<p>Versatile T-handle socket designed for easy and precise fastening and loosening of bolts and nuts in tight spaces.</p>', '', '', '', '', 3, 'THS1001', '', 2, 130, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/y0vTIDSlZerJQS5lZPUO.png', 1, 1, NULL, '2026-03-06 04:01:18'),
(113, 2, 'VT-140 epoxy (56.80gm)', 'vt-140-epoxy-56-80gm--113', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(112,112,112);\">A fast setting, non-shrinking, grey color epoxy adhesive that exhibits a remarkable combination of properties, high mechanical strength, excellent resistant to most chemical and reliable heat resistant. VT-140 is a rapid setting, general purpose, 1:1 mix ratio epoxy adhesive. It exhibits a remarkable combination of properties; fast setting, good resistance towards water, most solvents and automotive oils. VT-140 is steel-filled hence it can be used as an adhesive on various substrates, to fill gaps and surface repairs.&nbsp;It can be sanded, does not shrink upon curing and does not crack if drilled. It is easy to machine, non-conductive and can be handled after 2 hours.</span></p>', '<p><strong>Applications:</strong><br><span style=\"background-color:rgb(255,255,255);color:rgb(112,112,112);\">Bonding of metal and metal alloys, casting impregnating and potting system, gap filling, trimming bonding, crack casting or holes repair, tools, o', '', '', '', '', 5, 'VT1001', '', 2, 135, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/8qsQU2jZMNI4L1u7T3ok.png', 1, 1, NULL, '2026-03-03 07:35:28'),
(114, 2, 'VT-141 epoxy (28.40gm)', 'vt-141-epoxy-28-40gm--114', '<p><span style=\"background-color:rgb(255,255,255);color:rgb(0,0,0);\">A rapid setting, general purpose, 1:1 mix ratio epoxy adhesive that exhibits a remarkable combination of properties: fast setting, good resistance towards water, most solvents and automotive oils. Rapid 3 Ton 4 Minutes Epoxy can be used as an adhesive on various substrates, to fill gaps and surface repairs. It does not shrink upon curing, does not crack if drilled and can be sanded. Itcures clear can be handled after an hour.</span></p>', '<p style=\"margin-left:0px;\"><strong>Applications :</strong></p><p style=\"margin-left:0px;\">Bond metal, wood, plastic, ceramics, brick, tools, glassware, fiberglass repair etc</p>', '', '', '', '', 5, 'VT1002', '', 2, 128, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/iTJmRVCUGe95pVz51fQq.png', 1, 1, NULL, '2026-03-03 07:35:08'),
(115, 2, 'VT-144 Epoxy (20gm)', 'vt-144-epoxy-20gm--115', '<p><span style=\"background-color:rgb(255,255,255);color:rgba(0,0,0,0.87);\">The epoxy forms a high-strength bond on a wide range of surfaces, ensuring durability and longevity. Its resistance to heat and chemicals makes it suitable for various applications, including automotive, household, and industrial needs. The easy mixing process ensures consistent results, and the application is straightforward. Trust V-TECH VT-144 RAPID STEEL EPOXY for strong and rapid bonding in your projects.</span></p>', '<p><span style=\"background-color:rgb(255,255,255);color:rgba(0,0,0,0.87);\">V-TECH VT-144 RAPID STEEL&nbsp;EPOXY is a reliable adhesive solution designed for quick repairs and projects. With its fast 4-minute setting time, it efficiently reduces waiting pe', '', '', '', '', 5, 'VT1003', '', 2, 71, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/nvebFo4sS1GRgz0qB1SL.png', 1, 1, NULL, '2026-03-03 07:34:53'),
(116, 2, 'VT-151 Rtv Red (70gm)', 'vt-151-rtv-red-70gm--116', '<p>Rear main bearing cap split line, damper keyway sealing, differential cover, intake end seals, OHC cap, oil pan corner seals, oil pan gasket, side cover plate, thermostat housing, timing cover, transmission pan, valve cover gasket, vibration damper, water pump cover gasket and intake manifolds.&nbsp;</p>', '<p><span style=\"background-color:rgb(248,244,241);color:rgba(0,0,0,0.8);\">The </span><strong>V-Tech VT-151 RTV</strong><span style=\"background-color:rgb(248,244,241);color:rgba(0,0,0,0.8);\"> is a high-temperature gasket maker formulated for heavy-duty app', '', '', '', '', 5, 'VT1004', '', 2, 120, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/sAAgnAPBsL3qcy4TNtfK.png', 1, 1, NULL, '2026-03-03 07:34:35'),
(117, 2, 'VT 152 Rtv Grey 70g', 'vt-152-rtv-grey-70g-117', '<p>This 70g grey silicone formula is specially engineered for high-torque applications, providing excellent resistance to oil, water, and anti-freeze while remaining permanently flexible. It withstands extreme temperatures up to 625°F (329°C), forming a leak-proof and vibration-resistant gasket ideal for intake manifolds, timing covers, and thermostat housings.</p>', '<p>A high-torque, sensor-safe RTV silicone gasket maker designed for high-performance Japanese and European engines.</p>', '', '', '', '', 5, 'Vt1005', '', 2, 120, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Rf2ynh5PoXw3OkKDEUTE.png', 1, 1, NULL, '2026-03-03 07:34:13'),
(118, 2, 'VT 157 Rtv black (70gm)', 'vt-157-rtv-black-70gm--118', '<p>This 70g black silicone formula is specially developed for high-torque environments, providing a permanently flexible, leak-proof seal that resists oil, grease, and weathering. It is primarily used for sealing valve covers, timing gear covers, transmission pans, and oil pumps, making it perfect for automotive and mechanical repairs where heavy-duty adhesion is essential.</p>', '<p>A professional-grade, high-strength RTV silicone gasket maker designed for high-vibration and heavy-duty industrial applications.</p>', '', '', '', '', 5, 'vt1006', '', 2, 120, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/qnWMWkY263rkWBgL44pD.png', 1, 1, NULL, '2026-03-03 07:33:46'),
(119, 2, 'vt-159 RTV Red (32g)', 'vt-159-rtv-red-32g--119', '<p>This 32g red silicone formula is engineered to withstand extreme heat up to 650°F (343°C) while providing a leak-proof, vibration-resistant seal. It is specifically used for creating or replacing gaskets on high-heat components such as valve covers, exhaust manifolds, water pumps, and thermostat housings where a smaller, precise application is required.</p>', '<p>A high-temperature, sensor-safe RTV silicone gasket maker designed for compact, precision automotive and industrial repairs.</p>', '', '', '', '', 5, 'vt1007', '', 2, 73, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/CurRqwo9n6VN0Ytmhjpg.png', 1, 1, NULL, '2026-03-03 07:33:26'),
(120, 2, 'V-Tech VT-161 RTV Black (32g)', 'v-tech-vt-161-rtv-black-32g--120', '<p>This professional black silicone formula withstands temperatures up to 600°F (315°C) while remaining permanently flexible and leak-proof. It is primarily used for sealing oil pans, valve covers, and timing gear covers where a durable, vibration-resistant gasket is required.</p>', '<p>A high-strength, 32g RTV black silicone gasket maker designed for high-torque and high-vibration engine sealing.</p>', '', '', '', '', 5, 'vt1008', '', 2, 73, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/WHPu6krn2CohP0bG2uzE.png', 1, 1, NULL, '2026-03-03 07:32:32'),
(121, 2, 'VT-169s Vital Tape (Butyl Sealant)', 'vt-169s-vital-tape-butyl-sealant--121', '<p>This versatile sealant tape provides excellent adhesion to various surfaces, offering a long-lasting, weather-resistant barrier against water and air. It is widely used for sealing joints in car windshields, metal roof panels, and window frames to prevent leaks and corrosion.</p>', '<p>A high-performance butyl sealant tape designed for superior moisture-proof sealing in automotive and construction applications.</p>', '', '', '', '', 5, 'vt1009', '', 2, 432, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/7qS9pqx1LiHE8S32KDh0.jpg', 1, 1, NULL, '2026-03-03 07:32:09'),
(122, 2, 'VT-173 RTV Grey (32g)', 'vt-173-rtv-grey-32g--122', '<p>This versatile sealant tape provides excellent adhesion to various surfaces, offering a long-lasting, weather-resistant barrier against water and air. It is widely used for sealing joints in car windshields, metal roof panels, and window frames to prevent leaks and corrosion.</p>', '<p>A high-performance butyl sealant tape designed for superior moisture-proof sealing in automotive and construction applications.</p>', '', '', '', '', 5, 'vt1010', '', 2, 73, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/tGOO0utv8VaRd2WTsus8.png', 1, 1, NULL, '2026-03-03 07:31:07'),
(123, 2, 'Multi-Purpose Sealant (VT-200)', 'multi-purpose-sealant-vt-200--123', '<p>This high-performance clear sealant is specifically designed to provide long-term durability and excellent adhesion to glass, aluminum, and non-porous surfaces. It is commonly used for sealing window frames, glass partitions, and bathroom fixtures to prevent water penetration and air leaks.</p>', '<p>A versatile, clear acetic silicone sealant designed for general-purpose sealing and glazing applications.</p>', '', '', '', '', 5, 'vt1011', '', 2, 291, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/C78Xc9cG4Ni4btZ1uKYp.png', 1, 1, NULL, '2026-03-03 07:30:36'),
(124, 2, 'All Purpose Sealant (VT-201)', 'all-purpose-sealant-vt-201--124', '<p>This versatile sealant is engineered to provide a flexible and weather-resistant seal on various materials like metal, plastic, and glass. It is frequently used for general automotive repairs, DIY maintenance, and sealing joints in areas exposed to moisture and varying weather conditions.</p>', '<p>A high-quality acetic silicone sealant available in black, clear, and white for a wide range of household and industrial repairs.</p>', '', '', '', '', 5, 'VT1012', '', 2, 254, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/uuQoNjtAJ253IwXZ9BkE.png', 1, 1, NULL, '2026-03-03 07:29:37'),
(125, 2, 'Seal-All-Gap (VT-220)', 'seal-all-gap-vt-220--125', '<p>This white sealant provides excellent adhesion and durability for filling gaps and cracks in both interior and exterior environments. It is specifically used for sealing around window frames, door frames, baseboards, and wall joints to provide a clean and professional finish.</p>', '<p>A professional-grade white gap sealant designed for finishing and filling joints in construction and home improvement projects.</p>', '', '', '', '', 5, 'VT1013', '', 2, 198, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/a2K3fQI97BRgjl2jrOYb.png', 1, 1, NULL, '2026-03-03 07:29:06'),
(126, 2, 'Rainbow Seal (VT-224)', 'rainbow-seal-vt-224--126', '<p>This brown formula provides a durable and aesthetic seal that blends seamlessly with wood surfaces and dark-colored construction materials. It is primarily used for sealing gaps in wooden furniture, cabinetry, and floorboards where a color-specific, professional appearance is required.</p>', '<p>A specialized brown sealant designed for color-matched applications in woodworking and interior finishing.</p>', '', '', '', '', 5, 'vt1014', '', 2, 229, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/WcqXz3HlsE46q2dAs3P5.png', 1, 1, NULL, '2026-03-03 07:28:28'),
(127, 2, 'Vital Nails (VT-230)', 'vital-nails-vt-230--127', '<p>This premium adhesive offers excellent initial grab and high bond strength on various construction materials like wood, metal, and concrete. It is primarily used for installing mirrors, wall panels, and floor skirting, providing a clean finish without the need for visible mechanical fasteners.</p>', '<p>A high-strength, professional-grade construction adhesive designed to replace nails and screws in heavy-duty bonding tasks.</p>', '', '', '', '', 5, 'vt1015', '', 2, 198, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JQepPYumOZaCJTnoEH9U.png', 1, 1, NULL, '2026-03-03 07:27:42'),
(128, 2, 'LM MS Sealant (VT-620)', 'lm-ms-sealant-vt-620--128', '<p>This low-modulus sealant provides superior weather resistance and durability, specifically engineered to handle significant movement in structural joints. It is ideally used for sealing precast concrete joints, window frame perimeters, and metal cladding where a long-lasting, paintable, and leak-proof barrier is essential.</p>', '<p>A high-performance, 600ml grey modified silicone sealant designed for advanced expansion joint sealing in construction.</p>', '', '', '', '', 5, 'vt1016', '', 2, 718, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/EXhpEFFYgAF3S6lDryIf.png', 1, 1, NULL, '2026-03-03 07:27:03'),
(129, 2, 'Bir - Silicone 104', 'bir---silicone-104-129', '<p>This high-quality silicone provides a flexible and moisture-resistant seal that adheres perfectly to non-porous surfaces like glass and aluminum. It is commonly used for sealing glass partitions, aquarium repairs, and general waterproofing tasks in kitchens and bathrooms.</p>', '<p>An all-purpose acetic silicone sealant available in Black and Clear for versatile household and industrial repairs.</p>', '', '', '', '', 5, 'vt1017', '', 2, 250, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/3um2kJeGwiN4bH0z32Cw.png', 1, 1, NULL, '2026-03-03 07:25:40'),
(130, 2, 'Bir - Silicone 107', 'bir---silicone-107-130', '<p>Featuring a brilliant white finish, this sealant offers excellent flexibility and resistance to shrinking or cracking over time. It is primarily used for sealing around bathtubs, sinks, and ceramic tiles, ensuring a hygienic and aesthetically pleasing watertight seal.</p>', '<p>A high-elasticity white silicone sealant specifically formulated for professional finishing and sanitary applications.</p>', '', '', '', '', 5, 'vt1019', '', 2, 187, '100', 100, 1, 2, 0, '', 80.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/DmlBvK4j6Luw0xProX7n.png', 1, 1, NULL, '2026-03-03 07:25:18'),
(131, 2, 'Axe (BIR Brand) – Small & Premium Quality', 'axe-bir-brand-small-premium-quality-131', '<p><strong>Material:</strong><br>High-carbon hardened steel blade with durable handle (wooden or fiber handle depending on variant).</p><p><strong>Size:</strong><br>Small size (compact design suitable for light to medium cutting tasks)</p><p><strong>Key Features:</strong></p><p>Sharp and durable hardened steel blade</p><p>Compact and lightweight for easy handling</p><p>Strong and balanced construction for better control</p><p>Suitable for wood cutting, gardening, and outdoor use</p><p>Premium quality finish for long-term durability</p><p>Ideal for professional and household applications</p>', '<p>Compact and high-quality axe designed for efficient cutting, chopping, and woodwork tasks with superior durability and control.</p>', '', '', '', '', 3, 'ASP1001', '', 2, 473, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/chpAYW7DzNHkZovoaEap.png', 1, 1, NULL, '2026-03-06 03:59:03'),
(132, 2, 'Bolt Cutter', 'bolt-cutter-132', '<p><strong>Material:</strong><br>Drop-forged hardened steel jaws with heavy-duty steel handles and anti-slip grips.</p><p><strong>Size:</strong><br>12\'\', 18\'\', 24\'\', 36\'\'</p><p><strong>Key Features:</strong></p><p>Hardened steel cutting jaws for maximum strength</p><p>High leverage handle design for powerful cutting performance</p><p>Suitable for bolts, chains, wires, and metal rods</p><p>Durable and heavy-duty construction</p><p>Ergonomic anti-slip handles for comfortable grip</p><p>Ideal for industrial, construction, and maintenance work</p><p>&nbsp;</p>', '<p>Heavy-duty bolt cutter designed for powerful cutting of bolts, chains, rods, and metal wires with maximum efficiency and durability</p>', '', '', '', '', 3, 'BC1001', '', 2, 541, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JNflHDId9CPl1giLyGhz.png', 1, 1, NULL, '2026-03-06 03:58:04'),
(134, 2, 'Carpenter Pincher', 'carpenter-pincher-134', '<p><strong>Material:</strong><br>High-quality forged steel with durable anti-slip handle grip.</p><p><strong>Size:</strong><br>7\'\', 8\'\'</p><p><strong>Key Features:</strong></p><p>Strong jaws for easy nail pulling and gripping</p><p>Durable forged steel construction</p><p>Precision design for carpentry and woodworking tasks</p><p>Comfortable anti-slip handle for better control</p><p>Compact and easy to handle</p><p>Suitable for professional and household use</p>', '<p>Strong and durable carpenter pincher designed for pulling nails, gripping objects, and cutting wires with precision and ease.</p>', '', '', '', '', 3, 'CP1002', '', 2, 192, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/dDzPRqxZjYhjYLjBYPcE.png', 1, 1, NULL, '2026-03-06 03:56:52'),
(135, 2, 'Cutter Knife – 2 Extra Blade & Cutter Knife Blade (10 pcs Box)', 'cutter-knife-2-extra-blade-cutter-knife-blade-10-pcs-box--135', '<p><strong>Material:</strong><br>High-quality steel blades with durable ABS plastic handle.</p><p><strong>Size:</strong><br>Standard cutter knife size with replaceable blades (Blade pack: 10 pcs box).</p><p><strong>Key Features:</strong></p><p>Sharp retractable blade for precise cutting</p><p>Includes 2 extra blades for extended use</p><p>Additional 10-piece blade box for replacement</p><p>Ergonomic handle for comfortable grip</p><p>Easy blade replacement mechanism</p><p>Suitable for office, warehouse, industrial, and household applications</p>', '<p>Sharp and reliable cutter knife with extra blades, designed for precise cutting of paper, plastic, carton, and various materials in professional and everyday use.</p>', '', '', '', '', 3, 'CK1001', '', 2, 50, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/NPYMpVsRvf16lZPfva0F.png', 1, 1, NULL, '2026-03-06 03:55:52'),
(136, 2, 'Flap Disk – 60 Grit / 80 Grit & Foam Disc – 4\'\' (9P)', 'flap-disk-60-grit-80-grit-foam-disc-4-9p--136', '<p><strong>Material:</strong><br>Premium abrasive cloth flaps with reinforced backing plate (Flap Disk); high-density foam material (Foam Disc).</p><p><strong>Size:</strong><br>Flap Disk: 60 Grit, 80 Grit<br>Foam Disc: 4\'\' (9P)</p><p><strong>Key Features:</strong></p><p>Durable abrasive flaps for efficient grinding and sanding</p><p>Multiple grit options for different surface finishing needs</p><p>Foam disc provides smooth polishing performance</p><p>Strong and long-lasting construction</p><p>Compatible with standard angle grinders and polishing machines</p><p>Ideal for metal, fabrication, automotive, and maintenance applications</p>', '<p>High-performance flap disk and foam disc set designed for efficient grinding, sanding, and surface finishing on metal and various materials.</p>', '', '', '', '', 3, 'FD1001', '', 2, 40, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/X3HRYeeBaakP9fIYo7mA.png', 1, 1, NULL, '2026-03-06 03:55:23'),
(137, 2, 'Garden Scissor', 'garden-scissor-137', '<p><strong>Material:</strong><br>Hardened steel blades with durable plastic handle.</p><p><strong>Size:</strong><br>10\'\'</p><p><strong>Key Features:</strong></p><p>Sharp blades for clean and precise cutting</p><p>Lightweight plastic handle for comfortable use</p><p>Ergonomic design for better control</p><p>Durable construction for long-term use</p><p>Suitable for pruning plants, flowers, and small branches</p><p>Ideal for gardening and landscaping applications</p>', '<p>Durable garden scissor designed for smooth and precise cutting of plants, branches, and flowers in gardening and landscaping tasks.</p>', '', '', '', '', 3, 'GS1001', '', 2, 468, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/j2KivCDr97qFo8FMTqAJ.png', 1, 1, NULL, '2026-03-06 03:53:00'),
(138, 2, 'Glass Cutter', 'glass-cutter-138', '<p><strong>Material:</strong><br>Hardened steel cutting wheel with durable plastic or metal handle (depending on variant).</p><p><strong>Size:</strong><br>Standard glass cutter size suitable for manual scoring.</p><p><strong>Key Features:</strong></p><p>Hardened cutting wheel for precise glass scoring</p><p>Available in Black, Golden, and White finishes</p><p>Ergonomic handle for comfortable grip and control</p><p>Smooth and accurate cutting performance</p><p>Durable construction for long-lasting use</p><p>Suitable for professional glaziers and DIY glass projects</p>', '<p>Precision glass cutter designed for accurate and smooth cutting of glass sheets in professional and DIY applications.</p>', '', '', '', '', 3, 'GC1001', '', 2, 110, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/wRbMNRElkWUld73hAEfH.png', 1, 1, NULL, '2026-03-05 07:27:14'),
(139, 2, 'Scissor', 'scissor-139', '<p><strong>Material:</strong><br>Hardened steel blades with ergonomic plastic handle.</p><p><strong>Size:</strong><br>8\'\'</p><p><strong>Key Features:</strong></p><p>Sharp blades for clean and precise cutting</p><p>Ergonomic handle for comfortable grip and control</p><p>Durable construction for long-lasting use</p><p>Compact size suitable for home, office, and light industrial use</p><p>Ideal for paper, fabric, and general cutting tasks</p>', '<p>Durable 8-inch scissor designed for precise cutting of paper, fabric, and general household or office tasks.</p>', '', '', '', '', 3, 'S1001', '', 2, 107, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/UM9tarfBNemxFL16JM2n.png', 1, 1, NULL, '2026-03-05 07:26:21'),
(140, 2, 'Tiles Cutter Pen', 'tiles-cutter-pen-140', '<p><strong>Material:</strong><br>Hardened steel cutting wheel with durable plastic pen-style handle.</p><p><strong>Size:</strong><br>140mm</p><p><strong>Key Features:</strong></p><p>Hardened steel wheel for precise tile scoring</p><p>Ergonomic pen-style handle for comfort and control</p><p>Compact and lightweight design for easy handling</p><p>Suitable for ceramic, glass, and porcelain tiles</p><p>Durable construction for long-term use</p><p>Ideal for professional tilers and DIY projects</p>', '<p>Precision tile cutter pen designed for accurate scoring and cutting of ceramic, glass, and porcelain tiles.</p>', '', '', '', '', 3, 'TCP1001', '', 2, 71, '100', 1, 100, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/3d0Ibz7mlEM2GTU8blaJ.png', 1, 1, NULL, '2026-03-05 07:25:54'),
(141, 2, 'Tin Snip', 'tin-snip-141', '<p><strong>Material:</strong><br>Hardened steel blades with ergonomic anti-slip handle.</p><p><strong>Size:</strong><br>10\'\' / 12\'\'</p><p><strong>Key Features:</strong></p><p>Hardened steel blades for precise and clean cutting</p><p>Ergonomic handle for comfortable grip and control</p><p>Suitable for sheet metal, aluminum, and thin metals</p><p>Available in 10\'\' and 12\'\' sizes for versatile use</p><p>Durable construction for long-term performance</p><p>Ideal for metalworking, construction, and DIY projects</p>', '<p>Heavy-duty tin snip designed for precise cutting of sheet metal, aluminum, and other thin metal materials.</p>', '', '', '', '', 3, 'TS1001', '', 2, 302, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/5fVO2YEWpKg5oxtvbK2p.png', 1, 1, NULL, '2026-03-05 07:25:31'),
(142, 2, 'Hammer Drill Bit', 'hammer-drill-bit-142', '<h3>Material:</h3><p>High-quality hardened steel body with carbide-tipped head.</p><h3>Size:</h3><p>Available in various diameters and lengths as per requirement.</p><h3>Key Features:</h3><p>Carbide-tipped cutting head for efficient and precise drilling</p><p>Designed specifically for hammer drill machines</p><p>Suitable for concrete, brick, stone, and masonry surfaces</p><p>Spiral flutes for fast dust removal</p><p>Strong, durable, and heat-resistant construction</p><p>Long service life with consistent performance</p><p>Ideal for construction, installation, and DIY work</p>', '<p>Durable and high-impact hammer drill bit designed for fast and accurate drilling in concrete, brick, stone, and masonry surfaces.</p>', '', '', '', '', 3, 'HDB10001', '', 2, 104, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/icMKZkH3kMSINNmxBusS.png', 1, 1, NULL, '2026-03-05 07:24:37'),
(146, 2, 'HSS Drill Bit', 'hss-drill-bit-146', '<h3>Material:</h3><p>High-Speed Steel (HSS)</p><h3>Size:</h3><p>Available in various diameters and lengths as required.</p><h3>Key Features:</h3><p>Made from high-speed steel for strength and durability</p><p>Sharp cutting edges for precise and clean drilling</p><p>Suitable for metal, wood, plastic, and similar materials</p><p>Spiral flutes for efficient chip removal</p><p>Heat-resistant and long service life</p><p>Compatible with most standard drilling machines</p><p>Ideal for workshop, construction, and DIY use</p>', '<p>High-speed steel (HSS) drill bit designed for precise and efficient drilling in metal, wood, and plastic materials.</p>', '', '', '', '', 3, 'HDB10002', '', 2, 74, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/SP1MZAEHW9QmTXrJWpru.png', 1, 1, NULL, '2026-03-05 07:21:44'),
(147, 2, 'Hammer Drill Bit Star', 'hammer-drill-bit-star-147', '<h3>Material:</h3><p>Hardened steel body with star-type carbide-tipped head.</p><h3>Size:</h3><p>Available in various diameters and lengths as required.</p><h3>Key Features:</h3><p>Star-type carbide tip for enhanced drilling performance</p><p>Designed for hammer drill machines</p><p>Suitable for concrete, brick, stone, and masonry</p><p>Efficient dust removal through spiral flutes</p><p>Strong, durable, and heat-resistant construction</p><p>Long-lasting sharpness and performance</p><p>Ideal for construction, installation, and heavy-duty applications</p>', '<p>Heavy-duty star-type hammer drill bit designed for powerful and efficient drilling in concrete, brick, and masonry surfaces.</p>', '', '', '', '', 3, 'HDBS10001', '', 2, 51, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/uua1706BWAx1zknonLef.png', 1, 1, NULL, '2026-03-05 07:20:37'),
(148, 2, '16 Pcs Hole Saw Set', '16-pcs-hole-saw-set-148', '<p><strong>Material:</strong><br>Hardened steel with precision-cut teeth.</p><p><strong>Size:</strong><br>16 pieces – assorted diameters (varies by set)</p><p><strong>Key Features:</strong></p><p>High-quality hardened steel for durability and sharpness</p><p>Multiple diameters for versatile hole cutting</p><p>Precise and clean cutting for wood, plastic, and soft metals</p><p>Easy-to-attach arbors for quick setup</p><p>Ideal for professional, workshop, and DIY applications</p><p>Long-lasting performance for repeated use</p>', '<p>Comprehensive 16-piece hole saw set designed for precise cutting of wood, plastic, and soft metals in professional and DIY applications.</p>', '', '', '', '', 3, 'HSS1001', '', 2, 536, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Zyj7i2CJRnnzdNOc7Cz2.png', 1, 1, NULL, '2026-03-05 07:19:31'),
(149, 2, '2 Pieces Lock Installation Kit', '2-pieces-lock-installation-kit-149', '<p><strong>Material:</strong><br>Hardened steel drill bits and guides.</p><p><strong>Size:</strong><br>Standard sizes suitable for typical door lock installations.</p><p><strong>Key Features:</strong></p><p>Includes 2 essential pieces for lock installation</p><p>Hardened steel for durability and precision</p><p>Ensures accurate and clean hole drilling</p><p>Suitable for wooden door lock installation</p><p>Compact and easy to handle</p><p>Ideal for professional and DIY use</p>', '<p>Essential 2-piece lock installation kit designed for accurate drilling and installation of door locks and hardware.</p>', '', '', '', '', 3, 'LI1001', '', 2, 312, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/shcb5XtPc8grDBHQF5FL.png', 1, 1, NULL, '2026-03-05 07:18:55'),
(150, 2, '5 Pcs Hole Saw Set', '5-pcs-hole-saw-set-150', '<p><strong>Material:</strong><br>Hardened steel with precision-cut teeth.</p><p><strong>Size:</strong><br>5 pieces – assorted diameters (varies by set)</p><p><strong>Key Features:</strong></p><p>Durable hardened steel construction for long-lasting use</p><p>Multiple diameters for versatile hole cutting</p><p>Precise and clean cutting for wood, plastic, and soft metals</p><p>Easy-to-attach arbors for quick setup</p><p>Ideal for professional, workshop, and DIY applications</p><p>Smooth and efficient cutting performance</p>', '<p>Versatile 5-piece hole saw set designed for precise cutting of wood, plastic, and soft metals in professional and DIY tasks.</p>', '', '', '', '', 3, 'HSS1002', '', 2, 165, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/rOtdEO9IiYwR5hAy5TUP.png', 1, 1, NULL, '2026-03-05 07:18:26'),
(151, 2, '5 Pcs Jig Saw Blade', '5-pcs-jig-saw-blade-151', '<p><strong>Material:</strong><br>Hardened steel for durability and precise cutting.</p><p><strong>Size:</strong><br>5 pieces – assorted types and sizes suitable for standard jigsaws.</p><p><strong>Key Features:</strong></p><p>Hardened steel blades for long-lasting sharpness</p><p>Versatile cutting for wood, metal, and plastic</p><p>Compatible with standard jigsaw machines</p><p>Assorted blade types for different cutting applications</p><p>Precise and smooth cutting performance</p><p>Ideal for professional, workshop, and DIY projects</p>', '<p>Durable 5-piece jigsaw blade set designed for precise cutting of wood, metal, and plastic in professional and DIY projects.</p>', '', '', '', '', 3, 'JSB1001', '', 2, 111, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/fzrovCL6qvOESTccXZIf.png', 1, 1, NULL, '2026-03-05 07:18:01'),
(152, 2, 'Chisel for Wood', 'chisel-for-wood-152', '<p><strong>Material:</strong><br>Hardened steel blade with ergonomic wooden or plastic handle.</p><p><strong>Size:</strong><br>Standard woodworking chisel size (varies by blade width).</p><p><strong>Key Features:</strong></p><p>Sharp hardened steel blade for precise wood cutting</p><p>Ergonomic handle for comfortable grip and control</p><p>Durable construction for long-term use</p><p>Ideal for carving, shaping, and joinery</p><p>Suitable for professional carpenters and DIY woodworking projects</p><p>Reliable performance for both workshop and home applications</p>', '<p>High-quality wood chisel designed for precise carving, shaping, and woodworking tasks in professional and DIY applications.</p>', '', '', '', '', 3, 'CFW', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/qPq57528WZZxv4KktviR.png', 1, 1, NULL, NULL),
(153, 2, 'Ln Key (Cross Head) – Small / Medium / Big', 'ln-key-cross-head-small-medium-big-153', '<p><strong>Material:</strong><br>Hardened heavy-duty steel with corrosion-resistant finish.</p><p><strong>Size:</strong><br>Small / Medium / Big</p><p><strong>Key Features:</strong></p><p>Strong hardened steel construction for durability</p><p>Cross head design for maximum torque and easy handling</p><p>Suitable for loosening and tightening wheel nuts</p><p>Available in Small, Medium, and Big sizes</p><p>Ideal for automotive workshops and emergency roadside use</p><p>Rust-resistant finish for long-term performance</p>', '<p>Heavy-duty cross head LN key designed for easy loosening and tightening of wheel nuts. Ideal for automotive use with strong grip and maximum torque support.</p>', '', '', '', '', 3, 'LKCH10001', '', 2, 182, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/8t4gPug8J7wXyDSrLi5j.png', 1, 1, NULL, '2026-03-05 07:16:04'),
(154, 2, 'LN Key Flat Chrome CF 03 – Small | CF 02 – Medium | CF 01 – Big', 'ln-key-flat-chrome-cf-03-small-cf-02-medium-cf-01-big-154', '<p><strong>Material:</strong><br>High-strength steel with chrome-plated, rust-resistant finish.</p><p><strong>Size:</strong><br>CF 03 – Small<br>CF 02 – Medium<br>CF 01 – Big</p><p><strong>Key Features:</strong></p><p>Chrome-plated finish for durability and corrosion resistance</p><p>Cross design for maximum torque and easy handling</p><p>Strong steel construction for heavy-duty use</p><p>Suitable for various wheel nut sizes</p><p>Ideal for professional and personal automotive applications</p><p>Long-lasting performance with ergonomic handling</p>', '<p>Flat chrome cross-type LN key designed for loosening and tightening wheel nuts with strong grip and corrosion-resistant finish.</p>', '', '', '', '', 3, 'LKFCC10001', '', 2, 250, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/AVTnZg5dsahPXRyPokCH.png', 1, 1, NULL, '2026-03-05 07:14:44'),
(156, 2, 'Chisel for Wood', 'chisel-for-wood-156', '<p><strong>Material:</strong><br>Hardened steel blade with ergonomic wooden or plastic handle.</p><p><strong>Size:</strong><br>Standard woodworking chisel size (varies by blade width).</p><p><strong>Key Features:</strong></p><p>Sharp hardened steel blade for precise wood cutting</p><p>Ergonomic handle for comfortable grip and control</p><p>Durable construction for long-term use</p><p>Ideal for carving, shaping, and joinery</p><p>Suitable for professional carpenters and DIY woodworking projects</p><p>Reliable performance for both workshop and home applications</p>', '<p>High-quality wood chisel designed for precise carving, shaping, and woodworking tasks in professional and DIY applications.</p>', '', '', '', '', 3, 'CFW1003', '', 2, 198, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/5gVjr4nlRyYt6FuBHWci.png', 1, 1, NULL, '2026-03-05 07:12:56');
INSERT INTO `product` (`id`, `seller_id`, `name`, `slug`, `description`, `short_description`, `meta_title`, `meta_description`, `meta_keyword`, `product_tag`, `brand`, `sku`, `external_link`, `cash_dev_status`, `price`, `unit`, `stock_qty`, `stock_mini_qty`, `stock_status`, `manufacturer`, `download_link`, `discount`, `discount_status`, `shipping_days`, `free_shopping`, `delivery_days`, `flat_rate_status`, `flat_rate_price`, `vat`, `vat_status`, `tax`, `tax_status`, `thumnail_img`, `status`, `entry_by`, `created_at`, `updated_at`) VALUES
(157, 2, 'Compass Saw (Wooden Handle)', 'compass-saw-wooden-handle--157', '<p><strong>Material:</strong><br>High-carbon steel blade with polished wooden handle.</p><p><strong>Size:</strong><br>14\" blade length</p><p><strong>Key Features:</strong></p><p>Sharp high-carbon steel blade for clean cuts</p><p>Wooden handle for comfortable and secure grip</p><p>Designed for curved, angled, and intricate cuts</p><p>Durable and long-lasting construction</p><p>Suitable for carpentry, woodworking, and DIY projects</p><p>Ideal for professional and household use</p>', '<p>Durable 14-inch compass saw with wooden handle, designed for precise cutting of curves, openings, and intricate shapes in wood.</p>', '', '', '', '', 3, 'CSWH1001', '', 2, 125, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/I3a4q94UG60aB3OpPTVb.png', 1, 1, NULL, '2026-03-05 07:10:10'),
(158, 2, 'Circular Saw Blade', 'circular-saw-blade-158', '<p><strong>Material:</strong><br>Hardened steel with precision-cut teeth.</p><p><strong>Size:</strong><br>Standard circular saw blade sizes (varies by machine and application).</p><p><strong>Key Features:</strong></p><p>Hardened steel for long-lasting sharpness and durability</p><p>Precision-cut teeth for accurate and clean cuts</p><p>Suitable for wood, metal, and plastic materials</p><p>Compatible with standard circular saw machines</p><p>Durable construction for professional and DIY use</p>', '<p>High-performance circular saw blade designed for precise and efficient cutting of wood, metal, and plastic materials.</p>', '', '', '', '', 3, 'CSB1001', '', 2, 115, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/NDXKYVzWUx9stJitoKBf.png', 1, 1, NULL, '2026-03-05 07:09:08'),
(159, 2, 'Electrode Holder – 500A', 'electrode-holder-500a-159', '<p><strong>Material:</strong><br>High-conductivity copper jaws with insulated heat-resistant handle.</p><p><strong>Size:</strong><br>500A rated capacity for medium to heavy-duty welding.</p><p><strong>Key Features:</strong></p><p>Heavy-duty design for secure electrode holding</p><p>Excellent electrical conductivity for stable welding arcs</p><p>Insulated ergonomic handle for safety and comfort</p><p>Durable construction for long-lasting use</p><p>Suitable for professional welding and industrial applications</p><p>Reliable performance for consistent welding results</p>', '<p>Heavy-duty 500A electrode holder designed for secure and efficient welding operations in professional and industrial applications.</p>', '', '', '', '', 3, 'EH1001', '', 2, 396, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/5JI2xfz8APpAFEzLt3UW.png', 1, 1, NULL, '2026-03-05 07:03:36'),
(160, 2, 'Hack Saw Blade', 'hack-saw-blade-160', '<p><strong>Material:</strong><br>Hardened steel for durability and long-lasting sharpness.</p><p><strong>Size:</strong><br>12\"</p><p><strong>Key Features:</strong></p><p>Hardened steel blade for efficient and precise cutting</p><p>Standard 12-inch length for compatibility with most hacksaw frames</p><p>Suitable for cutting metal, plastic, and other hard materials</p><p>Durable and long-lasting construction</p><p>Ideal for professional, industrial, and DIY applications</p><p>Provides smooth, accurate, and clean cuts</p>', '<p>Durable 12-inch hack saw blade designed for precise cutting of metal, plastic, and other hard materials.</p>', '', '', '', '', 3, 'HSB1001', '', 2, 6, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/SlXxtZITHP0hYnAx9Azq.png', 1, 1, NULL, '2026-03-05 07:01:12'),
(161, 2, 'Hack Saw Frame 834 – Straight', 'hack-saw-frame-834-straight-161', '<p><strong>Material:</strong><br>High-quality steel with durable coating.</p><p><strong>Size:</strong><br>Standard straight frame size for 12-inch hack saw blades.</p><p><strong>Key Features:</strong></p><p>Strong steel construction for durability and stability</p><p>Straight frame design for optimal control and handling</p><p>Compatible with standard hack saw blades</p><p>Provides precise and clean cuts on metal and plastic</p><p>Ergonomic design reduces hand fatigue</p><p>Suitable for industrial, workshop, and household use</p>', '<p>Sturdy straight hack saw frame designed to hold blades securely for precise cutting of metal, plastic, and other materials.</p>', '', '', '', '', 3, 'HSF1001', '', 2, 437, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JYmWzz2XvY6ix0zXqyUD.png', 1, 1, NULL, '2026-03-05 07:00:40'),
(162, 2, 'Hack Saw Frame Adjustable – CY 018-01 – 12\"', 'hack-saw-frame-adjustable-cy-018-01-12--162', '<p><strong>Material:</strong><br>High-quality steel with durable finish and ergonomic handle.</p><p><strong>Size:</strong><br>12\" adjustable frame compatible with standard hack saw blades.</p><p><strong>Key Features:</strong></p><p>Adjustable frame for secure and flexible blade fitting</p><p>High-strength steel construction for durability and stability</p><p>Provides precise and clean cutting on metal, plastic, and other materials</p><p>Ergonomic handle for comfortable use</p><p>Suitable for industrial, workshop, and DIY applications</p><p>Compatible with standard 12-inch hack saw blades</p><p>&nbsp;</p>', '<p>Versatile 12-inch adjustable hack saw frame designed for secure blade fitting and precise cutting of metal, plastic, and other materials.</p>', '', '', '', '', 3, 'HSFA1001', '', 2, 240, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/ugCpb82I0vtBPi6ht3Ya.png', 1, 1, NULL, '2026-03-05 06:20:52'),
(163, 2, 'Hand Saw Wooden Handle with Fine Teeth – 16\" / 18\"', 'hand-saw-wooden-handle-with-fine-teeth-16-18--163', '<p><strong>Material:</strong><br>Hardened steel blade with ergonomic wooden handle.</p><p><strong>Size:</strong><br>16\" / 18\"</p><p><strong>Key Features:</strong></p><p>Fine-toothed hardened steel blade for precise cutting</p><p>Comfortable wooden handle for secure grip and control</p><p>Durable construction for long-lasting use</p><p>Suitable for carpentry, woodworking, and DIY projects</p><p>Available in 16\" and 18\" sizes for versatility</p><p>Ensures clean and accurate cuts with minimal splintering</p>', '<p>Durable hand saw with wooden handle and fine teeth, designed for precise cutting of wood in carpentry and woodworking tasks.</p>', '', '', '', '', 3, 'HSFT1001', '', 2, 188, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/h2lqOYaf0LlwGIbW9kQa.png', 1, 1, NULL, '2026-03-05 06:20:22'),
(164, 2, 'Hand Saw Wooden Handle with Rubber Grip (Tri-Angle Teeth)', 'hand-saw-wooden-handle-with-rubber-grip-tri-angle-teeth--164', '', '', '', '', '', '', 3, 'HSRG1002', '', 2, 266, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/93UScVqUGVVOeUnPIzbT.png', 1, 1, NULL, '2026-03-05 06:19:24'),
(165, 2, 'Hand Saw – Yellow & Black Handle with Fine Teeth', 'hand-saw-yellow-black-handle-with-fine-teeth-165', '<p><strong>Material:</strong><br>Hardened steel blade with ergonomic yellow-black plastic handle.</p><p><strong>Size:</strong><br>Standard hand saw size (blade length varies by model).</p><p><strong>Key Features:</strong></p><p>Fine-toothed hardened steel blade for precise cutting</p><p>Ergonomic yellow &amp; black handle for comfortable and secure grip</p><p>Durable construction for long-lasting use</p><p>Suitable for carpentry, woodworking, and DIY tasks</p><p>Minimizes splintering for clean and accurate cuts</p><p>Ideal for professional and household applications</p>', '<p>Durable hand saw with fine teeth and ergonomic yellow-black handle, designed for precise and smooth cutting of wood.</p>', '', '', '', '', 3, 'HSYB1001', '', 2, 177, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Ke3pTAJiDuL8S2KoaGZo.png', 1, 1, NULL, '2026-03-05 06:17:54'),
(166, 2, 'Rander Fall / Iron Planner – 1.5 / 1.75', 'rander-fall-iron-planner-1-5-1-75-166', '<p><strong>Material:</strong><br>Hardened steel blade with durable metal or cast body and ergonomic handle.</p><p><strong>Size:</strong><br>1.5 / 1.75</p><p><strong>Key Features:</strong></p><p>Sharp hardened steel blade for precise wood shaving</p><p>Durable body for stability and long-lasting performance</p><p>Ergonomic handle for comfortable grip and control</p><p>Suitable for smoothing, leveling, and shaping wood surfaces</p><p>Available in 1.5 and 1.75 sizes for versatile use</p><p>Ideal for professional carpentry and DIY woodworking tasks</p>', '<p>Durable rander fall and iron planner designed for smooth and precise wood surface finishing in carpentry and woodworking tasks.</p>', '', '', '', '', 3, 'RFIP1001', '', 2, 120, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/hqdgPiRMCymHKy1fcAKC.png', 1, 1, NULL, '2026-03-05 06:15:21'),
(167, 2, 'Compass Saw (Plastic Handle)', 'compass-saw-plastic-handle--167', '<p><strong>Material:</strong><br>High-carbon steel blade with durable plastic handle.</p><p><strong>Size:</strong><br>14\" blade length</p><p><strong>Key Features:</strong></p><p>Sharp high-carbon steel blade for precise cutting</p><p>Ergonomic plastic handle for comfortable and secure grip</p><p>Designed for curved, angled, and intricate cuts</p><p>Durable construction for long-lasting use</p><p>Suitable for carpentry, woodworking, and DIY projects</p><p>Ideal for professional and household applications</p>', '<p>Durable 14-inch compass saw with plastic handle, designed for precise cutting of curves, openings, and intricate shapes in wood.</p>', '', '', '', '', 3, 'CSPH1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/0pRGdgleMpRkUKErIPd7.png', 1, 1, NULL, NULL),
(168, 2, 'Adjustable Roller Handle Extension Pole', 'adjustable-roller-handle-extension-pole-168', '<p><strong>Material:</strong><br>Lightweight, durable aluminum or steel shaft with ergonomic plastic handle.</p><p><strong>Size:</strong><br>5\' adjustable length</p><p><strong>Key Features:</strong></p><p>Telescopic adjustable design for extended reach</p><p>Durable construction for long-lasting use</p><p>Ergonomic handle for comfortable grip and control</p><p>Ideal for painting ceilings, walls, and hard-to-reach areas</p><p>Lightweight design for ease of use</p><p>Suitable for professional and DIY painting projects</p>', '<p>Versatile 5-foot adjustable roller handle extension pole designed for easy painting of ceilings, walls, and hard-to-reach areas.</p>', '', '', '', '', 3, 'ARHEP1001', '', 2, 410, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JZPrkkl2yUzKc9b9Qg7F.png', 1, 1, NULL, '2026-03-05 06:13:15'),
(170, 2, 'Cup Hook 12 Pcs Set', 'cup-hook-12-pcs-set-170', '<p><strong>Material:</strong><br>High-quality metal with corrosion-resistant coating.</p><p><strong>Size:</strong><br>1–1.5\'\' and 2\'\'</p><p><strong>Key Features:</strong></p><p>12-piece set for versatile use</p><p>Durable and corrosion-resistant metal construction</p><p>Easy to install by screwing into wood or suitable surfaces</p><p>Suitable for hanging cups, utensils, keys, and lightweight items</p><p>Available in 1–1.5\'\' and 2\'\' sizes for different needs</p><p>Ideal for home, kitchen, workshop, and DIY projects</p>', '<p>Durable 12-piece cup hook set designed for securely hanging cups, utensils, and lightweight items in homes, kitchens, and workshops.</p>', '', '', '', '', 3, 'CH1001', '', 2, 158, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/iYAqPtcl6VgObIbFSsDA.png', 1, 1, NULL, '2026-03-05 06:08:23'),
(171, 2, 'Cup Wire Brush', 'cup-wire-brush-171', '<p><strong>Material:</strong><br>High-strength steel wires with sturdy cup base.</p><p><strong>Size:</strong><br>3\"</p><p><strong>Key Features:</strong></p><p>Durable steel wires for effective cleaning and rust removal</p><p>Compact 3-inch size for precision in tight spaces</p><p>Suitable for metalworking, fabrication, and automotive tasks</p><p>Strong construction for long-lasting performance</p><p>Can be used with angle grinders or by hand</p><p>Ideal for professional and DIY workshop applications</p>', '<p>Durable 3-inch cup wire brush designed for efficient cleaning, rust removal, and surface preparation on metal and other hard materials.</p>', '', '', '', '', 3, 'CWB1001', '', 2, 120, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/jXW3WGOrU1fvGMn5AEfW.png', 1, 1, NULL, '2026-03-05 06:07:16'),
(172, 2, 'Glue Gun – 40W & 60W', 'glue-gun-40w-60w-172', '<p><strong>Material:</strong><br>Heat-resistant plastic body with metal heating element.</p><p><strong>Size / Power:</strong></p><p>40W – Ideal for crafting and light DIY use</p><p>60W – Suitable for heavy-duty bonding and professional applications</p><p><strong>Key Features:</strong></p><p>Fast heating for quick adhesive application</p><p>Strong bonding for multiple materials</p><p>Ergonomic design for comfortable handling</p><p>Compatible with standard hot melt glue sticks</p><p>Available in 40W and 60W options</p><p>Ideal for crafts, repairs, and DIY projects</p>', '<p>Hot melt glue gun available in 40W and 60W variants for strong and fast adhesive bonding in craft, DIY, and light repair applications.</p>', '', '', '', '', 3, 'GG10001', '', 2, 219, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/kZAIbzNb215DLYXJI0Ji.png', 1, 1, NULL, '2026-03-05 06:03:51'),
(173, 2, 'Silicone Gun Fram Type-9\", Sheet 9\'\', Heavt Duty with Rubber Grip (Red) 9\'\', Gold Color - 15\'\'', 'silicone-gun-fram-type-9-sheet-9-heavt-duty-with-rubber-grip-red-9-gold-color---15--173', '<p><strong>Material:</strong><br>Heavy-duty metal frame with rubberized ergonomic grip.</p><p><strong>Size:</strong><br>9\" / 15\" (depending on variant)</p><p><strong>Key Features:</strong></p><p>Durable construction for heavy-duty use</p><p>Ergonomic rubber grip for comfort and control</p><p>Smooth sealant dispensing for precise application</p><p>Suitable for silicone, adhesives, and sealants</p><p>Available in multiple frame and color options</p><p>Ideal for construction, repairs, and DIY projects</p>', '<p>Heavy-duty silicone/caulking gun available in different frame types (9\" &amp; 15\") with ergonomic rubber grip for smooth sealant application.</p>', '', '', '', '', 3, 'SG10001', '', 2, 208, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/qMw0mhUO2beH1h4RMXCS.png', 1, 1, NULL, '2026-03-05 05:47:49'),
(174, 2, 'Snake Key Pad Lock 40mm/50mm/60mm/70mm', 'snake-key-pad-lock-40mm-50mm-60mm-70mm-174', '<p><strong>Material:</strong><br>Hardened steel body with corrosion-resistant coating.</p><p><strong>Size:</strong><br>40mm / 50mm / 60mm / 70mm</p><p><strong>Key Features:</strong></p><p>Snake key mechanism for enhanced security</p><p>Heavy-duty construction for durability</p><p>Rust-resistant and weatherproof design</p><p>Suitable for gates, doors, and storage units</p><p>Available in multiple sizes for versatile use</p><p>Strong shackle for improved anti-theft protection</p>', '<p>Heavy-duty snake key padlock available in 40mm, 50mm, 60mm, and 70mm sizes for enhanced security and durable locking.</p>', '', '', '', '', 3, 'SKPL10001', '', 2, 260, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/kWTXCsdhSCAd0tOtJwEb.png', 1, 1, NULL, '2026-03-05 05:47:09'),
(175, 2, 'pad Lock Pro.Quality (Cross Key) 50mm/63mm/75mm', 'pad-lock-pro-quality-cross-key-50mm-63mm-75mm-175', '<p><strong>Material:</strong><br>Solid metal body with hardened steel shackle and anti-rust coating.</p><p><strong>Size:</strong><br>50mm / 63mm / 75mm</p><p><strong>Key Features:</strong></p><p>Cross key mechanism for enhanced security</p><p>Heavy-duty solid body construction</p><p>Hardened steel shackle for cut resistance</p><p>Rust-resistant finish for long-term use</p><p>Available in multiple sizes for various applications</p><p>Ideal for gates, shops, warehouses, and storage security</p>', '<p>Professional-quality cross key padlock available in 50mm, 63mm, and 75mm sizes for high-security protection and long-lasting durability.</p>', '', '', '', '', 3, 'PLPQ10001', '', 2, 396, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/OIcOiP3hiazIkywEKo1Q.png', 1, 1, NULL, '2026-03-05 05:46:12'),
(176, 2, 'Paint Brush (Super) – 1\'\', 1.5\'\', 2\'\', 3\'\', 4\'\', 5\'\'', 'paint-brush-super-1-1-5-2-3-4-5--176', '<p><strong>Material:</strong><br>Durable synthetic or natural bristles with ergonomic wooden or plastic handle.</p><p><strong>Size:</strong><br>1\'\', 1.5\'\', 2\'\', 3\'\', 4\'\', 5\'\'</p><p><strong>Key Features:</strong></p><p>Smooth and precise paint application</p><p>Durable bristles for long-lasting use</p><p>Ergonomic handle for comfortable grip and control</p><p>Multiple sizes for detailed work and large surface coverage</p>', '<p>High-quality “Super” paint brush designed for smooth, precise, and efficient painting on walls, wood, and various surfaces.</p>', '', '', '', '', 3, 'PBS1001', '', 2, 25, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/WoHi6tGacz8OvXaTGBbc.png', 1, 1, NULL, '2026-03-05 05:43:41'),
(177, 2, 'Roller Brush – 4\'\' (White)', 'roller-brush-4-white--177', '<p><strong>Material:</strong><br>High-quality synthetic fibers with durable core and standard roller frame compatibility.</p><p><strong>Size:</strong><br>4\'\'</p><p><strong>Key Features:</strong></p><p>Soft, high-absorbency fibers for even paint coverage</p><p>Durable construction for long-lasting use</p><p>Compatible with standard roller frames</p><p>Provides smooth and streak-free finish</p><p>Suitable for walls, ceilings, doors, and furniture</p><p>Ideal for professional painters and DIY projects</p>', '<p>High-quality 4-inch roller brush designed for smooth and even paint application on walls, ceilings, and other surfaces.</p>', '', '', '', '', 3, 'RB1001', '', 2, 10, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/GWq3gpbihidMbceXeWis.png', 1, 1, NULL, '2026-03-05 05:42:00'),
(178, 2, 'Roller Brush – 4\'\' (Yellow)', 'roller-brush-4-yellow--178', '<p><strong>Material:</strong><br>High-quality synthetic fibers with durable roller core.</p><p><strong>Size:</strong><br>4\'\'</p><p><strong>Key Features:</strong></p><p>Dense, high-absorbency fibers for smooth and even coverage</p><p>Durable construction for long-lasting use</p><p>Compatible with standard roller frames</p><p>Minimizes streaks and roller marks for professional finish</p><p>Suitable for walls, ceilings, doors, and furniture</p><p>Ideal for professional painters and DIY projects</p>', '<p>Durable 4-inch yellow roller brush designed for smooth and even application of paint on walls, ceilings, and various surfaces.</p>', '', '', '', '', 3, 'RB1002', '', 2, 12, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/deSR1sEMNczFLBGQN8uh.png', 1, 1, NULL, '2026-03-05 05:41:34'),
(179, 2, 'Roller Handle – 4\'\'', 'roller-handle-4--179', '<p><strong>Material:</strong><br>Durable plastic or metal handle with roller frame attachment.</p><p><strong>Size:</strong><br>4\'\'</p><p><strong>Key Features:</strong></p><p>Compatible with standard 4-inch paint rollers</p><p>Ergonomic design for comfortable grip and control</p><p>Durable construction for long-lasting use</p><p>Provides smooth and even paint application</p><p>Suitable for walls, ceilings, doors, and furniture</p><p>Ideal for professional and DIY painting projects</p><p>&nbsp;</p>', '<p>Sturdy 4-inch roller handle designed for easy attachment and smooth operation of paint rollers for walls, ceilings, and other surfaces.</p>', '', '', '', '', 3, 'RH1001', '', 2, 52, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/M7H2lGiyo6MOCE6KMaTn.png', 1, 1, NULL, '2026-03-05 05:41:11'),
(180, 2, 'Roller Brush (Luxury) – 9\'\'', 'roller-brush-luxury-9--180', '<p><strong>Material:</strong><br>Premium synthetic fiber roller with reinforced core.</p><p><strong>Size:</strong><br>9\'\'</p><p><strong>Key Features:</strong></p><p>High-density fibers for smooth and even paint coverage</p><p>Luxury-grade quality for professional finishing</p><p>High paint absorption for faster coverage</p><p>Compatible with standard roller handles</p><p>Reduces streaks and splatter during painting</p>', '<p>Premium-quality 9-inch luxury roller brush designed for smooth, uniform, and professional paint application on large surfaces.</p>', '', '', '', '', 3, 'RBL1001', '', 2, 99, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/3MxJ5hXni9q6r5gv8hMD.png', 1, 1, NULL, '2026-03-05 05:39:49'),
(181, 2, 'Shovel Steel Handle (Round Shape)', 'shovel-steel-handle-round-shape--181', '<p><strong>Material:</strong><br>High-quality steel blade with durable steel handle.</p><p><strong>Size:</strong><br>Standard shovel size (round blade design).</p><p><strong>Key Features:</strong></p><p>Round-shaped blade for efficient digging and lifting</p><p>Strong steel handle for durability and heavy-duty use</p><p>Suitable for soil, sand, gravel, and construction materials</p><p>Robust construction for long-lasting performance</p><p>Comfortable handling for improved control</p><p>Ideal for construction, gardening, and agricultural applications</p>', '<p>Heavy-duty round shape shovel with steel handle, designed for digging, lifting, and material handling in construction and gardening tasks.</p>', '', '', '', '', 3, 'SSH1001', '', 2, 427, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/6smogorUjCfJvB8nPy5O.png', 1, 1, NULL, '2026-03-05 05:38:51'),
(182, 2, 'Tools Box Set – 38 Pcs', 'tools-box-set-38-pcs-182', '<p><strong>Material:</strong><br>High-grade steel tools with durable plastic storage case.</p><p><strong>Size:</strong><br>38 pieces set (assorted tools).</p><p><strong>Key Features:</strong></p><p>Complete 38-piece tool kit for multiple applications</p><p>High-quality steel tools for durability and strength</p><p>Organized storage box for easy carrying and storage</p><p>Suitable for home repair, maintenance, and DIY projects</p><p>Compact and portable design</p><p>Ideal for professional and household use</p>', '<p>Comprehensive 38-piece tool box set designed for everyday repair, maintenance, and DIY tasks at home or in workshops.</p>', '', '', '', '', 3, 'TBS1001', '', 2, 1436, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/xf8Ivmz8V57HzDhVAYB4.png', 1, 1, NULL, '2026-03-05 05:28:06'),
(183, 2, 'Test Pencil', 'test-pencil-183', '<p><strong>Material:</strong><br>Insulated plastic body with metal testing tip and internal indicator.</p><p><strong>Size:</strong><br>Standard test pencil size.</p><p><strong>Key Features:</strong></p><p>Detects electrical voltage quickly and safely</p><p>Built-in indicator light for easy identification</p><p>Insulated body for user safety</p><p>Slim design for access to tight spaces</p><p>Easy to use for electrical testing and troubleshooting</p><p>Suitable for professional and household applications</p>', '<p>Reliable test pencil designed for safely detecting electrical current and voltage in household and professional electrical work.</p>', '', '', '', '', 3, 'TP1001', '', 2, 38, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/1OkNPvEEzDOLT2hZb6Xl.png', 1, 1, NULL, '2026-03-05 05:18:28'),
(184, 2, 'Air Heat Gun', 'air-heat-gun-184', '<p><strong>Material:</strong><br>High-quality heat-resistant plastic body with durable internal heating elements.</p><p><strong>Size:</strong><br>2000 Watt power capacity (standard heat gun size).</p><p><strong>Key Features:</strong></p><p>Powerful 2000W motor for efficient heating performance</p><p>Suitable for paint removal, shrink wrapping, drying, and bending plastic</p><p>Ergonomic handle for comfortable and controlled operation</p><p>Durable heat-resistant construction</p><p>Consistent hot airflow for reliable results</p><p>Ideal for professional and DIY applications</p>', '<p>Powerful 2000W air heat gun designed for heating, shrinking, drying, and paint removal in professional and DIY applications.</p>', '', '', '', '', 3, 'AHG1001', '', 2, 1851, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/aSrrKsPAD4soe8VBQFDg.jpg', 1, 1, NULL, '2026-03-05 05:17:29'),
(185, 2, 'Angle Grinder', 'angle-grinder-185', '<p><strong>Material:</strong><br>Durable high-impact plastic body with metal gear housing and high-quality internal motor components.</p><p><strong>Size:</strong><br>850W power capacity (standard angle grinder size).</p><p><strong>Key Features:</strong></p><p>Powerful 850W motor for efficient performance</p><p>Suitable for cutting, grinding, polishing, and surface preparation</p><p>Ergonomic design for comfortable handling and control</p><p>Compatible with multiple grinding and cutting discs</p><p>Durable construction for long-lasting use</p><p>Ideal for professional, workshop, and DIY applications</p>', '<p>Compact and powerful 850W angle grinder designed for cutting, grinding, and polishing metal and other materials.</p>', '', '', '', '', 3, 'AG1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/P5J2uUYwsE5tVzhxrhJJ.jpg', 1, 1, NULL, NULL),
(186, 2, 'Angle Grinder', 'angle-grinder-186', '<p><strong>Material:</strong><br>High-impact plastic body with durable metal gear housing and high-quality motor components.</p><p><strong>Size:</strong><br>950W power capacity (standard angle grinder size).</p><p><strong>Key Features:</strong></p><p>Powerful 950W motor for heavy-duty performance</p><p>Suitable for cutting, grinding, polishing, and surface preparation</p><p>Ergonomic design for comfortable handling and control</p><p>Compatible with various cutting and grinding discs</p><p>Durable construction for long-term reliability</p><p>Ideal for professional, workshop, and DIY use</p>', '<p>High-performance 950W angle grinder designed for efficient cutting, grinding, and polishing in professional and DIY applications.</p>', '', '', '', '', 3, 'AG1002', '', 2, 1872, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/77ur6AOkTWqLXLHtOb3T.jpg', 1, 1, NULL, '2026-03-05 05:17:09'),
(187, 2, 'Chain Saw (Gasoline)', 'chain-saw-gasoline--187', '<p><strong>Material:</strong><br>Durable metal engine components with high-strength guide bar and chain, and impact-resistant body.</p><p><strong>Size:</strong><br>Standard gasoline chain saw size (varies by bar length and engine capacity).</p><p><strong>Key Features:</strong></p><p>Powerful gasoline engine for high cutting performance</p><p>Sharp chain for fast and precise wood cutting</p><p>Cordless operation for outdoor flexibility and mobility</p><p>Ergonomic handle for comfortable and controlled use</p><p>Durable construction for heavy-duty applications</p><p>Ideal for forestry, gardening, landscaping, and construction tasks</p>', '<p>Powerful gasoline chain saw designed for efficient wood cutting, tree trimming, and heavy-duty outdoor applications.</p>', '', '', '', '', 3, 'CS1001', '', 2, 8944, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JcarsJlg22h2YWjB0CPm.jpg', 1, 1, NULL, '2026-03-05 05:16:13'),
(188, 2, 'Demolition Hammer', 'demolition-hammer-188', '<p><strong>Material:</strong><br>High-strength metal internal components with durable impact-resistant outer body.</p><p><strong>Size:</strong><br>Standard demolition hammer size (power capacity varies by model).</p><p><strong>Key Features:</strong></p><p>High-impact performance for heavy-duty demolition work</p><p>Suitable for breaking concrete, brick, and masonry</p><p>Durable construction for long-lasting use</p><p>Ergonomic design for improved control and reduced fatigue</p><p>Strong motor for consistent performance</p><p>Ideal for construction, renovation, and industrial applications</p>', '<p>Heavy-duty demolition hammer designed for breaking concrete, masonry, and hard surfaces in construction and renovation work.</p>', '', '', '', '', 3, 'DH1001', '', 2, 102, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/2Bgerdbiu189N62dJR6f.jpg', 1, 1, NULL, NULL),
(189, 2, 'Electric Router', 'electric-router-189', '<p><strong>Material:</strong><br>Durable metal motor housing with high-impact plastic body and precision steel cutting components.</p><p><strong>Size:</strong><br>2200W power capacity (standard electric router size).</p><p><strong>Key Features:</strong></p><p>Powerful 2200W motor for heavy-duty woodworking tasks</p><p>Adjustable cutting depth for precision control</p><p>Ideal for trimming, grooving, shaping, and edging wood</p><p>Ergonomic handles for stability and comfort</p><p>Durable construction for long-term reliability</p><p>Suitable for professional carpentry and DIY woodworking projects</p>', '<p>High-power 2200W electric router designed for precise cutting, shaping, and edging in professional woodworking applications.</p>', '', '', '', '', 3, 'ER1001', '', 2, 7488, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/uz9oDZYJ10iTiUubUpMa.jpg', 1, 1, NULL, '2026-03-05 05:14:44'),
(190, 2, 'Electric Blower', 'electric-blower-190', '<p><strong>Material:</strong><br>High-impact plastic body with durable internal motor components.</p><p><strong>Size:</strong><br>650W power capacity (standard electric blower size).</p><p><strong>Key Features:</strong></p><p>Powerful 650W motor for strong airflow performance</p><p>Ideal for dust cleaning, debris removal, and air blowing tasks</p><p>Lightweight and ergonomic design for comfortable handling</p><p>Durable construction for long-lasting use</p><p>Suitable for workshop, home, and maintenance applications</p><p>Easy to operate for professional and DIY users</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>', '<p>Compact and powerful 650W electric blower designed for efficient cleaning, dust removal, and air blowing applications.</p>', '', '', '', '', 3, 'EB1001', '', 2, 2132, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/VfGHlFZMKeGk2BWhNQBA.jpg', 1, 1, NULL, '2026-03-05 05:14:08'),
(191, 2, 'Electric Drill', 'electric-drill-191', '<p><strong>Material:</strong><br>High-impact plastic body with durable metal chuck and high-quality internal motor components.</p><p><strong>Size:</strong><br>Standard electric drill size (power capacity varies by model).</p><p><strong>Key Features:</strong></p><p>Suitable for drilling and screw-driving applications</p><p>Compatible with multiple drill bits and accessories</p><p>Ergonomic design for comfortable handling and control</p><p>Durable construction for long-lasting performance</p><p>Provides precise and efficient drilling results</p><p>Ideal for professional, workshop, and DIY use</p>', '<p>Versatile electric drill designed for efficient drilling and fastening tasks in wood, metal, plastic, and masonry surfaces.</p>', '', '', '', '', 3, 'ED1001', '', 2, 1560, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/joWwmHskiiWTVAKD5YlI.jpg', 1, 1, NULL, '2026-03-05 05:13:41'),
(192, 2, 'Electric Planner', 'electric-planner-192', '<p><strong>Material:</strong><br>High-impact plastic body with durable steel cutting blades and precision motor components.</p><p><strong>Size:</strong><br>750W power capacity (standard electric planner size).</p><p><strong>Key Features:</strong></p><p>Powerful 750W motor for efficient wood planning</p><p>Precise blade system for smooth surface finishing and edge shaping</p><p>Ergonomic handle for comfortable use and better control</p><p>Durable construction for long-lasting performance</p><p>Suitable for carpentry, furniture making, and DIY projects</p><p>Ideal for professional and household woodworking tasks</p>', '<p>Powerful 750W electric planner designed for precise wood shaping, smoothing, and trimming in professional and DIY woodworking projects.</p><p>&nbsp;</p>', '', '', '', '', 3, 'EP1001', '', 2, 2860, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/wOLJlCFUxSlSJvjyZVik.jpg', 1, 1, NULL, '2026-03-05 05:12:47'),
(193, 2, 'Impact Drill', 'impact-drill-193', '<p><strong>Material:</strong><br>High-impact plastic body with durable metal chuck and high-quality internal motor components.</p><p><strong>Size:</strong><br>750W power capacity (standard impact drill size).</p><p><strong>Key Features:</strong></p><p>Powerful 750W motor for drilling and hammering tasks</p><p>Suitable for wood, metal, masonry, and concrete</p><p>Ergonomic handle for comfortable grip and control</p><p>Compatible with various drill bits and accessories</p><p>Durable construction for long-lasting performance</p><p>Ideal for professional, workshop, and DIY use</p>', '<p>Powerful 750W impact drill designed for efficient drilling and fastening in wood, metal, masonry, and concrete surfaces.</p>', '', '', '', '', 3, 'ID1001', '', 2, 2184, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/nT3Z2wctxgr1McvW9F89.jpg', 1, 1, NULL, '2026-03-05 05:11:56'),
(196, 2, 'Rotary Hammer', 'rotary-hammer-196', '<p><strong>Material:</strong><br>High-impact plastic body with reinforced metal components and precision motor assembly.</p><p><strong>Size:</strong><br>800W power capacity (standard rotary hammer size).</p><p><strong>Key Features:</strong></p><p>Powerful 800W motor for drilling and chiseling in masonry</p><p>Suitable for concrete, brick, and stone surfaces</p><p>Ergonomic handle for comfortable grip and control</p><p>Compatible with standard SDS drill bits</p><p>Durable construction for long-lasting performance</p><p>Ideal for professional construction and DIY masonry projects</p>', '<p>High-performance 800W rotary hammer designed for drilling, chiseling, and heavy-duty masonry work with precision and efficiency.</p>', '', '', '', '', 3, 'RH1003', '', 2, 5720, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/jUDnTeCe2vxEsSPLH8PS.jpg', 1, 1, NULL, '2026-03-05 05:10:45'),
(197, 2, '9000 AC SS Sheet', '9000-ac-ss-sheet-197', '<p><strong>Round Lock Specifications:</strong></p><p><strong>Type:</strong> Round lock with knob and key</p><p><strong>Material:</strong> Stainless steel (SS) sheet body</p><p><strong>Knob Size:</strong> 58 mm diameter</p><p><strong>Rose Plate Size:</strong> 80 mm diameter, brass finish</p><p><strong>Key Type:</strong> Brass key included</p><p><strong>Function:</strong> Door locking mechanism</p><p><strong>Finish:</strong> Polished stainless steel with brass rose plate</p><p><strong>Installation:</strong> Suitable for wooden or metal doors</p>', '', '', '', '', '', 2, 'RL1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/4zby0pEmwOW0X8o1Ad7m.png', 1, 1, NULL, NULL),
(198, 2, '7301 AC Dead Bolt – Single Knob', '7301-ac-dead-bolt-single-knob-198', '<p><strong>Specifications:</strong></p><p><strong>Type:</strong> Deadbolt lock, single knob</p><p><strong>Material:</strong> High-grade metal body with durable internal components</p><p><strong>Operation:</strong> Single knob locking mechanism</p><p><strong>Function:</strong> Secure door locking for residential and commercial use</p><p><strong>Finish:</strong> Corrosion-resistant, durable coating</p><p><strong>Installation:</strong> Suitable for standard wooden or metal doors</p><p><strong>Key:</strong> Brass or metal key included</p><p><strong>Dimensions:</strong> Standard deadbolt size (fits most doors)</p>', '', '', '', '', '', 2, 'DB1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/y1QLAtKHD4Rwr3gbtxSW.png', 1, 1, NULL, NULL),
(199, 2, '7312 SS Dead Bolt – Double', '7312-ss-dead-bolt-double-199', '<p><strong>Specifications – 7312 SS Dead Bolt – Double:</strong></p><p><strong>Type:</strong> Deadbolt lock, double-sided</p><p><strong>Material:</strong> Stainless steel (SS) body with durable internal components</p><p><strong>Operation:</strong> Double knob/turn locking mechanism</p><p><strong>Function:</strong> Enhanced security for doors requiring access control from both sides</p><p><strong>Finish:</strong> Polished stainless steel, corrosion-resistant</p><p><strong>Installation:</strong> Suitable for standard wooden or metal doors</p><p><strong>Key:</strong> Brass or metal key included for both sides</p><p><strong>Dimensions:</strong> Standard deadbolt size (fits most doors)</p><p>&nbsp;</p>', '', '', '', '', '', 2, 'DB1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/3WdgYa4ND7STAwl9Mq3H.png', 1, 1, NULL, NULL),
(200, 2, '888 Door Stopper SS', '888-door-stopper-ss-200', '<p><strong>Specifications – 888 Door Stopper SS:</strong></p><p><strong>Type:</strong> Door stopper</p><p><strong>Material:</strong> Stainless steel (SS) body</p><p><strong>Function:</strong> Prevents door from hitting walls or furniture</p><p><strong>Finish:</strong> Polished stainless steel, corrosion-resistant</p><p><strong>Installation:</strong> Floor-mounted or wall-mounted (depending on model)</p><p><strong>Size:</strong> Standard door stopper dimensions</p><p><strong>Durability:</strong> Long-lasting, resistant to wear and impact</p>', '', '', '', '', '', 2, 'DS1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/ati6i6p68SQz6tCzELRb.png', 1, 1, NULL, NULL),
(201, 2, '823 Door Stopper SS', '823-door-stopper-ss-201', '<p><strong>Specifications – 823 Door Stopper SS:</strong></p><p><strong>Type:</strong> Door stopper</p><p><strong>Material:</strong> Stainless steel (SS) body</p><p><strong>Function:</strong> Prevents doors from hitting walls or furniture</p><p><strong>Finish:</strong> Polished stainless steel, corrosion-resistant</p><p><strong>Installation:</strong> Floor-mounted or wall-mounted</p><p><strong>Size:</strong> Standard door stopper dimensions</p><p><strong>Durability:</strong> Long-lasting, impact-resistant for daily use</p>', '', '', '', '', '', 2, 'DS1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/dZcSElxfG7itd1BFDJnd.png', 1, 1, NULL, NULL),
(202, 2, 'Door Viewer with shutter', 'door-viewer-with-shutter-202', '<p><strong>Specifications – Door Viewer:</strong></p><p><strong>Type:</strong> Door viewer / peephole</p><p><strong>Material:</strong> Brass or stainless steel body with glass lens</p><p><strong>Function:</strong> Allows safe viewing of visitors outside the door</p><p><strong>Finish:</strong> Polished, corrosion-resistant</p><p><strong>Field of View:</strong> Wide-angle lens (typically 160°–200°)</p><p><strong>Installation:</strong> Fits standard door thickness (adjustable sleeve if applicable)</p><p><strong>Size:</strong> Standard peephole dimensions</p><p><strong>Durability:</strong> Scratch-resistant lens and long-lasting body</p>', '', '', '', '', '', 2, 'DV1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/syNIetXGjCVKV5USq6Rk.png', 1, 1, NULL, NULL),
(204, 2, 'Door Chain SS', 'door-chain-ss-204', '<p><strong>Specifications – Door Chain SS:</strong></p><p><strong>Type:</strong> Door security chain</p><p><strong>Material:</strong> Stainless steel (SS) chain and mounting plates</p><p><strong>Function:</strong> Provides additional security by limiting door opening</p><p><strong>Finish:</strong> Polished stainless steel, corrosion-resistant</p><p><strong>Installation:</strong> Surface-mounted on door and frame</p><p><strong>Length:</strong> Standard chain length (varies by model, typically 10–12 inches)</p><p><strong>Durability:</strong> Strong, impact-resistant chain for daily use</p>', '', '', '', '', '', 2, 'DC1003', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/AEwpH4ec5UDtYIcV3Twz.png', 1, 1, NULL, NULL),
(205, 2, 'Door Chain AC', 'door-chain-ac-205', '<p><strong>Specifications – Door Chain AC:</strong></p><p><strong>Type:</strong> Door security chain</p><p><strong>Material:</strong> High-quality alloy/metal (AC) with durable mounting plates</p><p><strong>Function:</strong> Enhances door security by restricting door opening</p><p><strong>Finish:</strong> Polished or coated corrosion-resistant surface</p><p><strong>Installation:</strong> Surface-mounted on door and frame</p><p><strong>Length:</strong> Standard chain length (typically 10–12 inches)</p><p><strong>Durability:</strong> Strong and long-lasting for everyday security use</p>', '', '', '', '', '', 2, 'DC1005', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/L5l8Gcmz8Ms2z2OO1Cxt.png', 1, 1, NULL, NULL),
(206, 2, '728 Door Knocker with Viewer (Zinc AC)', '728-door-knocker-with-viewer-zinc-ac--206', '<p><strong>Specifications – 728 Door Knocker with Viewer (Zinc AC):</strong></p><p><strong>Type:</strong> Door knocker with integrated viewer</p><p><strong>Material:</strong> Zinc alloy (AC) body with durable internal components</p><p><strong>Function:</strong> Allows visitors to announce presence and view outside safely</p><p><strong>Finish:</strong> Polished, corrosion-resistant coating</p><p><strong>Installation:</strong> Surface-mounted on standard wooden or metal doors</p><p><strong>Viewer Lens:</strong> Wide-angle lens for clear visibility</p><p><strong>Durability:</strong> Strong, long-lasting construction suitable for daily use</p><p><strong>Dimensions:</strong> Standard door knocker and viewer size</p>', '', '', '', '', '', 2, 'DK1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/uX8y8BAeQRnDDh7zScxu.png', 1, 1, NULL, NULL),
(207, 2, '729 Door Knocker with Viewer (Zinc AC)', '729-door-knocker-with-viewer-zinc-ac--207', '<p><strong>Specifications – 729 Door Knocker with Viewer (Zinc AC):</strong></p><p><strong>Type:</strong> Door knocker with integrated viewer</p><p><strong>Material:</strong> Zinc alloy (AC) body with durable internal components</p><p><strong>Function:</strong> Allows visitors to announce presence and provides safe viewing outside</p><p><strong>Finish:</strong> Polished, corrosion-resistant coating</p><p><strong>Installation:</strong> Surface-mounted on standard wooden or metal doors</p><p><strong>Viewer Lens:</strong> Wide-angle lens for clear visibility</p><p><strong>Durability:</strong> Strong and long-lasting construction for everyday use</p><p><strong>Dimensions:</strong> Standard door knocker and viewer size</p>', '', '', '', '', '', 2, 'DK1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/nvXNvds3K69EGNwo1jzs.png', 1, 1, NULL, NULL),
(210, 2, 'XH 052 Door Close', 'xh-052-door-close-210', '<p><strong>Specifications – XH 052 Door Closer:</strong></p><p><strong>Type:</strong> Hydraulic door closer</p><p><strong>Material:</strong> High-quality metal body with durable internal hydraulic components</p><p><strong>Function:</strong> Automatically closes doors after opening, controlling speed and preventing slamming</p><p><strong>Finish:</strong> Polished or powder-coated, corrosion-resistant</p><p><strong>Installation:</strong> Surface-mounted on door and frame</p><p><strong>Adjustability:</strong> Adjustable closing speed and latching force</p><p><strong>Durability:</strong> Long-lasting performance for high-traffic doors</p><p><strong>Dimensions:</strong> Standard door closer size (fits most residential and commercial doors)</p>', '', '', '', '', '', 2, 'DC1006', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/EIfMqkKoripYZoalAQQD.png', 1, 1, NULL, NULL),
(211, 2, '6271 Black – Liver Lock', '6271-black-liver-lock-211', '', '<p><strong>Specifications – 6271 Black – Liver Lock:</strong></p><p><strong>Type:</strong> Lever/liver lock</p><p><strong>Material:</strong> High-quality metal with black finish</p><p><strong>Function:</strong> Provides secure locking for doors</p><p><str', '', '', '', '', 2, 'LL1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/KLE3oVV8kq4cYTNnRKI1.png', 1, 1, NULL, NULL),
(212, 2, '6271 AB – Liver Lock', '6271-ab-liver-lock-212', '<p><strong>Specifications – 6271 AB – Liver Lock:</strong></p><p><strong>Type:</strong> Lever/liver lock</p><p><strong>Material:</strong> Alloy brass (AB) body</p><p><strong>Function:</strong> Provides secure locking for doors</p><p><strong>Finish:</strong> Polished, corrosion-resistant alloy brass</p><p><strong>Installation:</strong> Suitable for wooden or metal doors</p><p><strong>Durability:</strong> Long-lasting and strong for daily use</p><p><strong>Key:</strong> Brass or metal key included</p>', '', '', '', '', '', 2, 'LL1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/uUPNfdh93O9nJUBvwY1B.png', 1, 1, NULL, NULL),
(213, 2, '6271 SS – Liver Lock', '6271-ss-liver-lock-213', '<p><strong>Specifications – 6271 SS – Liver Lock:</strong></p><p><strong>Type:</strong> Lever/liver lock</p><p><strong>Material:</strong> Stainless steel (SS) body</p><p><strong>Function:</strong> Provides secure locking for doors</p><p><strong>Finish:</strong> Polished stainless steel, corrosion-resistant</p><p><strong>Installation:</strong> Suitable for wooden or metal doors</p><p><strong>Durability:</strong> Long-lasting and strong for daily use</p><p><strong>Key:</strong> Brass or metal key included</p>', '', '', '', '', '', 2, 'LL1003', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/NTWP2Wr2LY9ScqC5f85p.png', 1, 1, NULL, NULL),
(214, 2, '6211 SS – Liver Lock', '6211-ss-liver-lock-214', '<p><strong>Specifications – 6211 SS – Liver Lock:</strong></p><p><strong>Type:</strong> Lever/liver lock</p><p><strong>Material:</strong> Stainless steel (SS) body</p><p><strong>Function:</strong> Provides secure locking for doors</p><p><strong>Finish:</strong> Polished stainless steel, corrosion-resistant</p><p><strong>Installation:</strong> Suitable for wooden or metal doors</p><p><strong>Durability:</strong> Long-lasting and strong for daily use</p><p><strong>Key:</strong> Brass or metal key included</p>', '', '', '', '', '', 2, 'LL1004', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/mkkf51Ap1pGQdrfBn3sM.png', 1, 1, NULL, NULL),
(215, 2, '1314 B – Bike Pad Lock', '1314-b-bike-pad-lock-215', '', '<p><strong>Specifications – 1314 B – Bike Pad Lock&nbsp;</strong></p><p><strong>Type:</strong> Bike pad lock</p><p><strong>Material:</strong> High-quality metal body</p><p><strong>Function:</strong> Provides secure locking for bicycles and small gates</p>', '', '', '', '', 2, 'PL1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/9deeTPSdkLEMg9EvUai9.png', 1, 1, NULL, NULL),
(216, 2, 'Pad Lock CR 6360 Cross Key', 'pad-lock-cr-6360-cross-key-216', '<p><strong>Specifications – Pad Lock CR 6360 Cross Key:</strong></p><p><strong>Type:</strong> Pad lock with cross key mechanism</p><p><strong>Material:</strong> Durable metal body</p><p><strong>Function:</strong> Provides secure locking for doors, gates, and storage units</p><p><strong>Finish:</strong> Corrosion-resistant coating</p><p><strong>Key:</strong> Cross key included for enhanced security</p><p><strong>Durability:</strong> Long-lasting and strong</p><p><strong>Dimensions:</strong> Standard pad lock size</p>', '', '', '', '', '', 2, 'PL1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/wOW4qQd2d3KBOqt8WThj.png', 1, 1, NULL, NULL),
(217, 2, 'Pad Lock NP-60 – Matt', 'pad-lock-np-60-matt-217', '', '<p><strong>Specifications – Pad Lock NP-60 – Matt:</strong></p><p><strong>Type:</strong> Pad lock</p><p><strong>Material:</strong> High-quality metal body</p><p><strong>Function:</strong> Provides secure locking for gates, lockers, and storage units</p><p', '', '', '', '', 2, 'PL1003', '', 2, 100, '100', 2, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/CuzBk6DT87n6tv5WvWa9.png', 1, 1, NULL, NULL);
INSERT INTO `product` (`id`, `seller_id`, `name`, `slug`, `description`, `short_description`, `meta_title`, `meta_description`, `meta_keyword`, `product_tag`, `brand`, `sku`, `external_link`, `cash_dev_status`, `price`, `unit`, `stock_qty`, `stock_mini_qty`, `stock_status`, `manufacturer`, `download_link`, `discount`, `discount_status`, `shipping_days`, `free_shopping`, `delivery_days`, `flat_rate_status`, `flat_rate_price`, `vat`, `vat_status`, `tax`, `tax_status`, `thumnail_img`, `status`, `entry_by`, `created_at`, `updated_at`) VALUES
(219, 2, '310 Rim Lock – 12 Key – AC – Without Chain', '310-rim-lock-12-key-ac-without-chain-219', '<h3><strong>Specifications – 310 Rim Lock – 12 Key – AC – Without Chain</strong></h3><p><strong>Type:</strong> Rim lock</p><p><strong>Material:</strong> Alloy coating (AC) metal body</p><p><strong>Keys:</strong> 12 keys included</p><p><strong>Chain:</strong> Without chain</p><p><strong>Function:</strong> Secure door locking from inside and outside</p><p><strong>Finish:</strong> Corrosion-resistant coated finish</p><p><strong>Installation:</strong> Surface-mounted for wooden or metal doors</p>', '', '', '', '', '', 2, 'RL1010', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JFzSjp7MVDASs8c1pEOb.png', 1, 1, NULL, NULL),
(220, 2, '310 Rim Lock – 12 Key – SS – Without Chain', '310-rim-lock-12-key-ss-without-chain-220', '<h3><strong>Specifications – 310 Rim Lock – 12 Key – SS – Without Chain</strong></h3><p><strong>Type:</strong> Rim lock</p><p><strong>Material:</strong> Stainless steel (SS) body</p><p><strong>Keys:</strong> 12 keys included</p><p><strong>Chain:</strong> Without chain</p><p><strong>Function:</strong> Secure door locking mechanism</p><p><strong>Finish:</strong> Polished stainless steel, corrosion-resistant</p><p><strong>Installation:</strong> Surface-mounted door installation</p>', '', '', '', '', '', 2, 'RLSS1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/jQeESABZKPsIwUu4niwZ.png', 1, 1, NULL, NULL),
(221, 2, '310 Rim Lock – 18 Key – SS – Without Chain', '310-rim-lock-18-key-ss-without-chain-221', '<h3><strong>Specifications – 310 Rim Lock – 18 Key – SS – Without Chain</strong></h3><p><strong>Type:</strong> Rim lock</p><p><strong>Material:</strong> Stainless steel (SS) body</p><p><strong>Keys:</strong> 18 keys included</p><p><strong>Chain:</strong> Without chain</p><p><strong>Function:</strong> High-security door locking</p><p><strong>Finish:</strong> Corrosion-resistant stainless steel finish</p><p><strong>Installation:</strong> Suitable for wooden or metal doors</p>', '', '', '', '', '', 2, 'RLSS1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/tahGZTfVj7PjBVzJTP07.png', 1, 1, NULL, NULL),
(222, 2, '310 Rim Lock – 24 Key – SS – Without Chain', '310-rim-lock-24-key-ss-without-chain-222', '<h3><strong>Specifications – 310 Rim Lock – 24 Key – SS – Without Chain</strong></h3><p><strong>Type:</strong> Rim lock</p><p><strong>Material:</strong> Stainless steel (SS) body</p><p><strong>Keys:</strong> 24 keys included</p><p><strong>Chain:</strong> Without chain</p><p><strong>Function:</strong> Enhanced security locking system</p><p><strong>Finish:</strong> Polished stainless steel</p><p><strong>Installation:</strong> Surface-mounted door fitting</p>', '', '', '', '', '', 2, 'RLSS1003', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/cvhPwiR77ugaXmDDlSF4.png', 1, 1, NULL, NULL),
(223, 2, '310 Rim Lock – 6 Key – AC – Without Chain', '310-rim-lock-6-key-ac-without-chain-223', '<h3><strong>Specifications – 310 Rim Lock – 6 Key – AC – Without Chain</strong></h3><p><strong>Type:</strong> Rim lock</p><p><strong>Material:</strong> Alloy coating (AC) metal body</p><p><strong>Keys:</strong> 6 keys included</p><p><strong>Chain:</strong> Without chain</p><p><strong>Function:</strong> Standard door security locking</p><p><strong>Finish:</strong> Corrosion-resistant coated finish</p><p><strong>Installation:</strong> Surface-mounted installation</p>', '', '', '', '', '', 2, 'RLSS1004', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/FbyNE1Q7cRGLML3nLNTt.png', 1, 1, NULL, NULL),
(224, 2, '310 Rim Lock – 6 Key – SS – Without Chain', '310-rim-lock-6-key-ss-without-chain-224', '<h3><strong>Specifications – 310 Rim Lock – 6 Key – SS – Without Chain</strong></h3><p><strong>Type:</strong> Rim lock</p><p><strong>Material:</strong> Stainless steel (SS) body</p><p><strong>Keys:</strong> 6 keys included</p><p><strong>Chain:</strong> Without chain</p><p><strong>Function:</strong> Secure door locking mechanism</p><p><strong>Finish:</strong> Polished stainless steel</p><p><strong>Installation:</strong> Suitable for wooden or metal doors</p>', '', '', '', '', '', 2, 'RLSS1005', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/7FDK6HIfNms7MAdAiWx2.png', 1, 1, NULL, NULL),
(225, 2, '564-AC Auto Rim Lock', '564-ac-auto-rim-lock-225', '<h3><strong>Specifications – 564-AC Auto Rim Lock</strong></h3><p><strong>Type:</strong> Auto rim lock</p><p><strong>Material:</strong> Alloy coating (AC) metal body</p><p><strong>Operation:</strong> Automatic locking mechanism</p><p><strong>Function:</strong> Door locks automatically when closed</p><p><strong>Finish:</strong> Corrosion-resistant coated finish</p><p><strong>Installation:</strong> Surface-mounted door installation</p><p><strong>Durability:</strong> Strong and long-lasting for daily use</p>', '', '', '', '', '', 2, 'RSLL1006', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/jxpek1dPmoLKQkUuYYPP.png', 1, 1, NULL, NULL),
(226, 2, '138-22 – SS – Drawer Lock – JB Type', '138-22-ss-drawer-lock-jb-type-226', '<h2>Specifications – 138-22 – SS – Drawer Lock – JB Type</h2><p>• Type: Drawer lock (JB Type)<br>• Material: Stainless steel (SS) body<br>• Keys: 2 computer keys included<br>• Function: Secure locking for drawers and cabinets<br>• Finish: Rust-resistant stainless steel finish<br>• Installation: Surface-mounted installation<br>• Application: Wooden drawers, office cabinets, furniture units</p>', '', '', '', '', '', 2, 'DL1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/t2kdvgdXFlOnN11EWsnz.png', 1, 1, NULL, '2026-02-25 04:02:40'),
(227, 2, '138-22 – AC – Drawer Lock – JB Type', '138-22-ac-drawer-lock-jb-type-227', '<h2>Specifications – 138-22 – AC – Drawer Lock – JB Type</h2><p>• Type: Drawer lock (JB Type)<br>• Material: Alloy coating (AC) metal body<br>• Keys: 2 computer keys included<br>• Function: Drawer and cabinet security locking<br>• Finish: Corrosion-resistant coated finish<br>• Installation: Surface-mounted installation<br>• Application: Home and office furniture drawers</p>', '', '', '', '', '', 2, 'DL1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/ProGtwUmbmYZGoR0ddCy.png', 1, 1, NULL, NULL),
(228, 2, 'Furniture Lock – CP – Wave – Computer Key', 'furniture-lock-cp-wave-computer-key-228', '<h2>Specifications – Furniture Lock – AC – Wave – Computer Key</h2><p>• Type: Furniture lock (Wave design)<br>• Material: Alloy coating (AC) metal body<br>• Keys: Computer keys included<br>• Function: Furniture security locking system<br>• Finish: Corrosion-resistant coated finish<br>• Installation: Panel-mounted installation<br>• Application: Wooden furniture and storage cabinets</p>', '', '', '', '', '', 2, 'DL1003', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/24vJ9hoANNSONtMJfl35.png', 1, 1, NULL, NULL),
(232, 2, 'Showcase Lock', 'showcase-lock-232', '<h2>Specifications – Showcase Lock</h2><p>• Type: Showcase / glass cabinet lock<br>• Material: Metal body construction<br>• Keys: 2 keys included<br>• Function: Locking system for glass showcases and display cabinets<br>• Finish: Polished protective finish<br>• Installation: Glass-mounted installation<br>• Application: Shop showcases, display cabinets, glass doors</p>', '', '', '', '', '', 2, 'DL1004', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Ay91nkJGiWP0mvOthmLF.png', 1, 1, NULL, NULL),
(233, 2, 'LPG Regulator – Orange – 22mm', 'lpg-regulator-orange-22mm-233', '<h2>Specifications – LPG Regulator – Orange – 22mm</h2><p>• Type: LPG gas regulator<br>• Material: Metal body with protective coating<br>• Size: 22mm inlet connection<br>• Function: Controls and regulates LPG gas pressure safely<br>• Safety: Leak-resistant design with secure locking system<br>• Finish: Orange coated finish for visibility and identification<br>• Installation: Easy manual fitting to LPG cylinder<br>• Application: Household gas stove and LPG appliances</p>', '', '', '', '', '', 2, 'LPG1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/sbayscwKHudyU3qaW8os.png', 1, 1, NULL, NULL),
(234, 2, 'LPG Regulator – Silver – 22mm', 'lpg-regulator-silver-22mm-234', '<h2>Specifications – LPG Regulator – Silver – 22mm</h2><p>• Type: LPG gas regulator<br>• Material: Metal body construction<br>• Size: 22mm inlet connection<br>• Function: Gas pressure regulation for safe LPG usage<br>• Safety: Secure anti-leak locking mechanism<br>• Finish: Silver metallic finish (corrosion-resistant)<br>• Installation: Direct cylinder-mounted installation<br>• Application: Domestic LPG cylinders and cooking appliances</p>', '', '', '', '', '', 2, 'LPG1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/7QOhI0okOHcaZt9mCPEw.png', 1, 1, NULL, NULL),
(235, 2, 'Hydraulic Concealed Hinge 888 F-HIGH – Soza – SS & 1/2 Baka', 'hydraulic-concealed-hinge-888-f-high-soza-ss-1-2-baka-235', '<h2>Specifications – Hydraulic Concealed Hinge 888 F-HIGH – Soza – SS &amp; 1/2 Baka</h2><p>• Type: Hydraulic concealed hinge<br>• Material: Stainless steel (SS) body<br>• Function: Soft-closing hydraulic mechanism<br>• Opening Type: Half overlay (1/2 Baka)<br>• Installation: Concealed cabinet mounting<br>• Operation: Smooth and silent door closing<br>• Durability: Rust-resistant and long-lasting construction<br>• Application: Kitchen cabinet, wardrobe, and furniture doors</p>', '', '', '', '', '', 2, 'H1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/K4CAHgD8AX9pzd1IvXCV.png', 1, 1, NULL, NULL),
(236, 2, 'Normal Concealed Hinge 261-LOW – Soza', 'normal-concealed-hinge-261-low-soza-236', '<h2>Specifications – Normal Concealed Hinge 261-LOW – Soza</h2><p>• Type: Standard concealed hinge<br>• Material: Metal body construction<br>• Function: Regular cabinet door opening and closing<br>• Opening Type: Low / standard overlay hinge<br>• Installation: Concealed screw-mounted installation<br>• Operation: Smooth manual movement<br>• Finish: Corrosion-resistant coating<br>• Application: Cabinets, cupboards, and furniture doors</p>', '', '', '', '', '', 2, 'H1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/uORrKLtnkhADEFvDJxEn.png', 1, 1, NULL, NULL),
(237, 2, 'SF-9601 (A) Decoration Machine – 6\"', 'sf-9601-a-decoration-machine-6--237', '<h2>Specifications – SF-9601 (A) Decoration Machine – 6\"</h2><p>• Type: Wall decoration / paint texture roller machine<br>• Size: 6 inch roller width<br>• Material: Durable plastic body with patterned roller<br>• Function: Creates decorative paint textures and wall patterns<br>• Operation: Manual rolling application<br>• Handle: Ergonomic grip handle<br>• Application: Interior wall decoration and texture finishing<br>• Usage: Suitable for emulsion and decorative paints</p>', '', '', '', '', '', 2, 'DM1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/SBXEGMxogyPOYiCYNGOb.png', 1, 1, NULL, NULL),
(238, 2, 'GR-03 Soft Pattern Rubber – 6\"', 'gr-03-soft-pattern-rubber-6--238', '<h2>Specifications – GR-03 Soft Pattern Rubber – 6\"</h2><p>• Type: Pattern paint roller<br>• Size: 6 inch roller<br>• Material: Soft rubber roller surface<br>• Pattern: GR-03 decorative texture design<br>• Function: Creates uniform wall texture patterns<br>• Installation: Compatible with standard roller handle<br>• Application: Decorative wall painting and finishing</p>', '', '', '', '', '', 2, 'SPR1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/WtIkubj95mBaAtK3i7Gy.png', 1, 1, NULL, NULL),
(239, 2, 'SF-9501 (A) Decoration Machine – 7\"', 'sf-9501-a-decoration-machine-7--239', '<h2>Specifications – SF-9501 (A) Decoration Machine – 7\"</h2><p>• Type: Wall decoration / paint texture roller machine<br>• Size: 7 inch roller width<br>• Material: Heavy-duty plastic body with patterned roller<br>• Function: Creates decorative textures and wall patterns<br>• Operation: Manual rolling application<br>• Handle: Ergonomic anti-slip grip handle<br>• Application: Interior wall decoration and texture finishing<br>• Usage: Suitable for emulsion, plastic, and decorative paints<br>• Installation: Easy roller replacement and assembly</p>', '', '', '', '', '', 2, 'DM1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/6TLI6c3UjoW7xxjUJJF2.png', 1, 1, NULL, NULL),
(240, 2, 'Sponge Kit AJ-69', 'sponge-kit-aj-69-240', '<h2>Specifications – Sponge Kit AJ-69</h2><p>• Type: Paint sponge kit<br>• Material: High-density foam sponge<br>• Function: Decorative paint finishing and texture creation<br>• Usage: Suitable for wall painting, shading, and sponge effects<br>• Grip: Comfortable handheld design<br>• Application: Interior wall decoration and craft painting<br>• Compatibility: Works with emulsion and decorative paints<br>• Reusable: Washable and reusable sponge material<br>• Installation: Ready to use (no assembly required)</p>', '', '', '', '', '', 2, 'SK1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/V0pi1ROnuKp9ri2HGYke.png', 1, 1, NULL, NULL),
(241, 2, '5 / 8 Steps – 200 Kg Capacity', '5-8-steps-200-kg-capacity-241', '<h2>Aluminium Ladder – Industrial Grade I7100</h2><h3>General Specifications</h3><p>• Type: Industrial grade aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Heavy-duty industrial use<br>• Load Capacity: 200 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Usage: Home, warehouse, construction, maintenance, and commercial work<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight and easy to carry<br>• Installation: Foldable design, ready to use</p>', '<h4>5 / 8 Steps – 200 Kg Capacity</h4><p>• Step Configuration: 5 steps (A-frame) / 8 steps extended<br>• Capacity: 200 kg load support<br>• Structure: Compact folding ladder<br>• Ideal For: Household and light industrial tasks</p>', '', '', '', '', 2, 'L1001', '', 2, 5985, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/ewexjsV5y1aWBeMXC5l5.png', 1, 1, NULL, '2026-03-07 04:35:01'),
(244, 2, '6 / 10 Steps – 200 Kg Capacity', '6-10-steps-200-kg-capacity-244', '<h2>Aluminium Ladder – Industrial Grade I7100</h2><h3>General Specifications</h3><p>• Type: Industrial grade aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Heavy-duty industrial use<br>• Load Capacity: 200 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Usage: Home, warehouse, construction, maintenance, and commercial work</p>', '<h4>6 / 10 Steps – 200 Kg Capacity</h4><p>• Step Configuration: 6 steps (A-frame) / 10 steps extended<br>• Capacity: 200 kg load support<br>• Stability: Reinforced hinge locking system<br>• Ideal For: Medium-height maintenance work</p>', '', '', '', '', 2, 'L1002', '', 2, 7035, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Uh4BLH25OE15O4xEuNma.png', 1, 1, NULL, '2026-03-07 04:34:38'),
(245, 2, '7 / 12 Steps – 200 Kg Capacity', '7-12-steps-200-kg-capacity-245', '<h2>Aluminium Ladder – Industrial Grade I7100</h2><h3>General Specifications</h3><p>• Type: Industrial grade aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Heavy-duty industrial use<br>• Load Capacity: 200 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Usage: Home, warehouse, construction, maintenance, and commercial work</p>', '<h4>7 / 12 Steps – 200 Kg Capacity</h4><p>• Step Configuration: 7 steps (A-frame) / 12 steps extended<br>• Capacity: 200 kg load support<br>• Reach Height: Suitable for higher elevation work<br>• Ideal For: Industrial, electrical, and outdoor work</p>', '', '', '', '', 2, 'L1003', '', 2, 8085, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Ll1jDpOgrrNEDTvKafZF.jpg', 1, 1, NULL, '2026-03-07 05:10:01'),
(246, 2, '6 Steps – 180 Kg Capacity', '6-steps-180-kg-capacity-246', '<h2>Aluminium Ladder – Household Grade 1000</h2><p>• Type: Household aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Household / light-duty use<br>• Load Capacity: 180 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight, foldable, and easy to carry<br>• Installation: Ready-to-use folding design</p>', '<p>6 Steps – 180 Kg Capacity: Compact ladder for everyday household tasks</p>', '', '', '', '', 2, 'L1005', '', 2, 3024, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/uAXM2G2auBnmB0uLUe5X.jpg', 1, 1, NULL, '2026-03-07 05:09:38'),
(248, 2, '7 Steps – 180 Kg Capacity', '7-steps-180-kg-capacity-248', '<h2>Aluminium Ladder – Household Grade 1000</h2><p>• Type: Household aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Household / light-duty use<br>• Load Capacity: 180 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight, foldable, and easy to carry<br>• Installation: Ready-to-use folding design<br>• Usage: Home, garden, and light maintenance work</p>', '<p>7 Steps – 180 Kg Capacity: Medium-height ladder for indoor/outdoor tasks</p>', '', '', '', '', 2, 'L1006', '', 2, 3528, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/roy0p9gu9pHADAiWYJz5.jpg', 1, 1, NULL, '2026-03-07 05:09:00'),
(250, 2, '9 Steps – 180 Kg Capacity', '9-steps-180-kg-capacity-250', '<h2>Aluminium Ladder – Household Grade 1000</h2><p>• Type: Household aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Household / light-duty use<br>• Load Capacity: 180 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight, foldable, and easy to carry<br>• Installation: Ready-to-use folding design</p>', '<p>9 Steps – 180 Kg Capacity: Higher reach ladder suitable for lofts, high shelves, and ceilings</p>', '', '', '', '', 2, 'L1007', '', 2, 4536, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/4T6UKZ3qKO7RXgnMBII4.jpg', 1, 1, NULL, '2026-03-07 05:08:33'),
(251, 2, '5 Steps – 150 Kg Capacity', '5-steps-150-kg-capacity-251', '<h2>Aluminium Ladder – Household Grade 700</h2><p>• Type: Household aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Household / light-duty use<br>• Load Capacity: 150 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight, foldable, and easy to carry</p>', '<p>5 Steps – 150 Kg Capacity: Compact ladder for basic household tasks</p>', '', '', '', '', 2, 'L1008', '', 2, 2310, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/2GpHVMrDVsicMpYGh3iv.jpg', 1, 1, NULL, '2026-03-07 05:08:05'),
(252, 2, '6 Steps – 150 Kg Capacity', '6-steps-150-kg-capacity-252', '<h2>Aluminium Ladder – Household Grade 700</h2><p>• Type: Household aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Household / light-duty use<br>• Load Capacity: 150 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight, foldable, and easy to carry<br>• Installation: Ready-to-use folding design<br>• Usage: Home, garden, and light maintenance work</p>', '<p>6 Steps – 150 Kg Capacity: Slightly taller ladder for indoor use<br>&nbsp;</p>', '', '', '', '', 2, 'L1009', '', 2, 2583, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/OZEme9MnTuev7sBhgFsp.jpg', 1, 1, NULL, '2026-03-07 05:07:35'),
(253, 2, '7 Steps – 150 Kg Capacity', '7-steps-150-kg-capacity-253', '<h2>Aluminium Ladder – Household Grade 700</h2><p>• Type: Household aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Household / light-duty use<br>• Load Capacity: 150 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight, foldable, and easy to carry<br>• Installation: Ready-to-use folding design</p>', '<p>&nbsp;7 Steps – 150 Kg Capacity: Medium-height ladder for reaching cupboards or lofts<br>&nbsp;</p>', '', '', '', '', 2, 'L1010', '', 2, 3014, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/N4lvYhMRORHV8TNo8uKB.jpg', 1, 1, NULL, '2026-03-07 05:07:07'),
(254, 2, '8 Steps – 150 Kg Capacity', '8-steps-150-kg-capacity-254', '<h2>Aluminium Ladder – Household Grade 700</h2><p>• Type: Household aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Household / light-duty use<br>• Load Capacity: 150 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight, foldable, and easy to carry</p>', '<p>8 Steps – 150 Kg Capacity: Higher reach ladder for ceiling and exterior tasks</p>', '', '', '', '', 2, 'L1011', '', 2, 3444, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/WLOoePtDsGUF59PYgRtS.jpg', 1, 1, NULL, '2026-03-07 05:06:40'),
(255, 2, '9 Steps – 150 Kg Capacity', '9-steps-150-kg-capacity-255', '<h2>Aluminium Ladder – Household Grade 700</h2><p>• Type: Household aluminium ladder<br>• Material: High-strength aluminium alloy<br>• Grade: Household / light-duty use<br>• Load Capacity: 150 kg maximum load<br>• Design: Anti-slip wide steps with reinforced frame<br>• Safety: Non-slip rubber feet for stable grip<br>• Finish: Corrosion-resistant aluminium surface<br>• Portability: Lightweight, foldable, and easy to carry</p>', '<p>9 Steps – 150 Kg Capacity: Maximum reach ladder for higher shelves and maintenance</p>', '', '', '', '', 2, 'L1012', '', 2, 3875, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/EVbU8pqdE5nLBGpfMJQS.jpg', 1, 1, NULL, '2026-03-07 05:05:49'),
(256, 2, 'Concrete Nail – MS (Mild Steel)', 'concrete-nail-ms-mild-steel--256', '<h3>Available Sizes (Per KG)</h3><p>• 1\" Concrete Nail<br>• 1.5\" Concrete Nail<br>• 2\" Concrete Nail<br>• 2.5\" Concrete Nail<br>• 3\" Concrete Nail<br>• 4\" Concrete Nail</p>', '<h2>Concrete Nail – MS (Mild Steel)</h2><p>• Type: Mild steel (MS) concrete nails<br>• Material: High-quality mild steel<br>• Function: Heavy-duty fixing and fastening in concrete, brick, and masonry surfaces<br>• Finish: Corrosion-resistant metallic fini', '', '', '', '', 2, 'CN1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/D6hhsl9QcfVv3oPZSFnw.jpg', 1, 1, NULL, NULL),
(258, 2, 'Stainless Steel Screws (SS)', 'stainless-steel-screws-ss--258', '<h3>Available Sizes (Per KG)</h3><p><strong>7mm SS Screws</strong><br>• 1\"<br>• 1.25\"<br>• 1.5\"</p><p><strong>8mm SS Screws – Nickel Coated</strong><br>• 1\"<br>• 1.25\"<br>• 1.5\"<br>• 2\"</p><p><strong>8mm SS Screw – Wash</strong><br>• 1.5\"</p>', '<h2>Stainless Steel Screws (SS)</h2><p>• Type: Stainless steel screws<br>• Material: High-quality stainless steel<br>• Function: Fastening and fixing in wood, metal, and masonry surfaces<br>• Finish: Polished stainless steel or nickel-coated (depending on', '', '', '', '', 2, 'SSS1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/edplk6nO8F0l6HlDFmg5.jpg', 1, 1, NULL, NULL),
(259, 2, 'Brad Nails', 'brad-nails-259', '<h3>Available Sizes (Per Box)</h3><p>• T-20<br>• T-25<br>• T-32<br>• T-38<br>• T-50</p>', '<h2>Brad Nails</h2><p>• Type: Brad nails<br>• Material: High-quality mild steel<br>• Function: Fastening and finishing in woodworking and carpentry projects<br>• Finish: Smooth metallic finish, corrosion-resistant<br>• Installation: Compatible with manual', '', '', '', '', 2, 'BN1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/Y8xTqEpZz0YUksQx5wYw.jpg', 1, 1, NULL, NULL),
(260, 2, 'Combination Spanner Chrome', 'combination-spanner-chrome-260', '<p><strong>Material:</strong><br>Chrome-plated high-strength steel (Chrome Vanadium).</p><p><strong>Size:</strong><br>Available in multiple metric and inch sizes.</p><p><strong>Key Features:</strong></p><p>Dual open-end and ring-end design for versatility</p><p>Chrome-plated finish for rust resistance</p><p>Strong and durable construction</p><p>Provides firm grip and precise fit</p><p>Suitable for automotive, industrial, and DIY use</p><p>Long-lasting professional performance</p>', '<p>Durable chrome combination spanner featuring open-end and ring-end design for versatile fastening and loosening applications.</p>', '', '', '', '', 3, 'CSC10001', '', 2, 32, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/mreB8fkWCD1Z48wFIZsr.png', 1, 1, NULL, '2026-03-05 05:08:00'),
(261, 2, 'Foldable Cloth Drying Rack – 2 Feet – 8 Bar', 'foldable-cloth-drying-rack-2-feet-8-bar-261', '<p>Type: Foldable clothes drying rack<br>• Material: High-quality metal with powder-coated finish<br>• Size: 2 feet width<br>• Bars: 8 drying bars<br>• Function: Provides ample space for drying clothes indoors or outdoors<br>• Design: Foldable for easy storage when not in use<br>• Stability: Anti-slip feet for secure placement<br>• Usage: Suitable for household laundry, towels, shirts, and small garments<br>• Portability: Lightweight and easy to move</p>', '', '', '', '', '', 2, 'DR1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/QLN1YDHjIY5r6XArkyb0.jpg', 0, 1, NULL, '2026-07-08 05:56:31'),
(262, 2, 'Foldable Cloth Drying Rack – 2 Feet – 4 Bar', 'foldable-cloth-drying-rack-2-feet-4-bar-262', '<p>Type: Foldable clothes drying rack<br>• Material: High-quality metal with powder-coated finish<br>• Size: 2 feet width<br>• Bars: 4 drying bars<br>• Function: Compact drying solution for small loads of laundry<br>• Design: Foldable for space-saving storage<br>• Stability: Anti-slip feet for secure placement<br>• Usage: Ideal for shirts, small garments, and household laundry</p>', '', '', '', '', '', 2, 'DR1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/jAnGDUJfMmzMQRijt8yp.jpg', 0, 1, NULL, '2026-07-08 05:56:13'),
(263, 2, 'Double Open Spanner Bright Chrome', 'double-open-spanner-bright-chrome-263', '<p><strong>Material:</strong><br>High-strength chrome-plated steel (Bright Chrome Finish).</p><p><strong>Size:</strong><br>Available in various metric and inch size combinations.</p><p><strong>Key Features:</strong></p><p>Double open-end design for multi-size use</p><p>Bright chrome finish for rust resistance</p><p>Strong and durable construction</p><p>Provides secure grip and precise fit</p><p>Suitable for automotive and industrial applications</p><p>Ideal for professional and DIY use</p>', '<p>Bright chrome double open spanner designed for easy tightening and loosening of nuts and bolts in mechanical and maintenance work.</p>', '', '', '', '', 3, 'DOSBC10001', '', 2, 48, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 100.00000, '0', 0, '0', 0, '/backend/files/e9BE7GRg5k3NZIJGTdcd.png', 1, 1, NULL, '2026-03-05 05:02:56'),
(264, 2, 'Spanner Double Ring Bright Chrome', 'spanner-double-ring-bright-chrome-264', '<p><strong>Material:</strong><br>High-strength chrome-plated steel (Bright Chrome Finish).</p><p><strong>Size:</strong><br>Available in multiple metric and inch size combinations.</p><p><strong>Key Features:</strong></p><p>Double ring (box-end) design for stronger grip</p><p>Bright chrome finish for corrosion resistance</p><p>Durable and heavy-duty construction</p><p>Provides higher torque with reduced slipping</p><p>Suitable for professional and DIY applications</p><p>Long-lasting performance in tough working conditions</p>', '<p>Bright chrome double ring spanner designed for secure grip and high-torque fastening in automotive and mechanical applications.</p>', '', '', '', '', 3, 'SDRBC10001', '', 2, 40, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 100.00000, '0', 0, '0', 0, '/backend/files/UefOelNoKqkKqbT1htja.png', 1, 1, NULL, '2026-03-05 05:00:21'),
(265, 2, 'Foldable Cloth Drying Rack – 1.5 Feet – 8 Bar', 'foldable-cloth-drying-rack-1-5-feet-8-bar-265', '<p>Type: Foldable clothes drying rack<br>• Material: Durable metal with corrosion-resistant coating<br>• Size: 1.5 feet width<br>• Bars: 8 drying bars<br>• Function: Provides sufficient drying space for small households<br>• Design: Foldable for convenient storage<br>• Stability: Anti-slip feet for secure placement<br>• Usage: Suitable for towels, shirts, and small garments<br>• Portability: Easy to carry and store</p>', '', '', '', '', '', 2, 'DR1003', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/wMdXnLaGOFpp3K5hoooO.jpg', 0, 1, NULL, '2026-07-08 05:55:55'),
(266, 2, 'Foldable Cloth Drying Rack – 1.5 Feet – 4 Bar', 'foldable-cloth-drying-rack-1-5-feet-4-bar-266', '<p>Type: Foldable clothes drying rack<br>• Material: Durable metal with corrosion-resistant coating<br>• Size: 1.5 feet width<br>• Bars: 4 drying bars<br>• Function: Compact solution for drying small loads<br>• Design: Foldable for easy storage in limited spaces<br>• Stability: Anti-slip feet for safe placement<br>• Usage: Ideal for shirts, light laundry, and household garments</p>', '', '', '', '', '', 2, 'DR1004', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/6rPOc12YH2GKWhUaGH0E.jpg', 0, 1, NULL, '2026-07-08 05:55:36'),
(268, 2, 'Door Hinge (SS / MS)', 'door-hinge-ss-ms--268', '<h3>Variants Included</h3><p>• 4\" × 3\" × 2.5 mm – Boss – SS Screw = 164 taka<br>• 4\" × 3\" × 2.5 mm – Vikars / BMI – SS Screw = 164 taka<br>• 4\" × 3\" × 2.7 mm – Boss – SS Screw = 172 taka<br>• 4\" × 3\" × 2.7 mm – Vikars / BMI – SS Screw = 172 taka<br>• 4\" × 3\" × 2.5 mm – Boss – MS Screw = 149 taka<br>• 4\" × 3\" × 2.5 mm – Vikars / BMI – MS Screw = 149 taka<br>• 4\" × 3\" × 2.7 mm – Boss – MS Screw = 166 taka<br>• 4\" × 3\" × 2.7 mm – Vikars / BMI – MS Screw = 166 taka<br>• 5\" × 3\" × 2.7 mm – Vikars – SS Screw =252 taka</p>', '<p>Type: Door hinge<br>• Material: Stainless steel (SS) or Mild steel (MS) body, depending on variant<br>• Size: 4\" × 3\" (standard) and 5\" × 3\" (variant)<br>• Thickness: 2.5 mm / 2.7 mm<br>• Screw Type: SS screws or MS screws (depending on variant)<br>• F', '', '', '', '', 2, 'DH1002', '', 2, 149, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JQfpcqbkwpRQG1xCsp8i.png', 1, 1, NULL, '2026-03-06 05:33:46'),
(269, 2, 'Aluminium Level with Magnet-09\", 12\'\', 14\'\', 16\'\', 18\'\', 20\'\', 22\'\', 24\'\', 30\'\', 36\'\'', 'aluminium-level-with-magnet-09-12-14-16-18-20-22-24-30-36--269', '<p><strong>Material:</strong><br>High-grade aluminium body with integrated magnetic base and precision bubble vials.</p><p><strong>Size:</strong><br>09\" / 12\" / 14\" / 16\" / 18\" / 20\" / 22\" / 24\" / 30\" / 36\"</p><p><strong>Key Features:</strong></p><p>Durable and lightweight aluminium construction</p><p>Strong magnetic base for hands-free use</p><p>Clear, accurate bubble vials for precise leveling</p><p>Suitable for horizontal and vertical measurements</p><p>Available in multiple sizes for versatile applications</p><p>Ideal for construction, carpentry, and installation work</p>', '<p>Magnetic aluminium spirit level designed for accurate horizontal and vertical alignment in construction, carpentry, and installation work.</p>', '', '', '', '', 3, 'AL10001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 100.00000, '0', 0, '0', 0, '/backend/files/27ot0MRyWcmSQO3YFmx0.png', 1, 1, NULL, NULL),
(270, 2, 'Socket Chorme Plated', 'socket-chorme-plated-270', '<p><strong>Material:</strong><br>Chrome vanadium steel with chrome-plated finish.</p><p><strong>Size:</strong><br>Available in multiple metric and inch sizes (various drive sizes).</p><p><strong>Key Features:</strong></p><p>Strong chrome vanadium steel construction</p><p>Chrome-plated finish for rust resistance</p><p>Precise fit for improved torque and reduced slipping</p><p>Compatible with ratchets and torque wrenches</p><p>Suitable for automotive, industrial, and home use</p><p>Durable and long-lasting performance</p>', '<p>High-quality chrome plated socket designed for precise fastening and loosening of nuts and bolts in automotive and mechanical applications.</p>', '', '', '', '', 3, 'SCP10001', '', 2, 32, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 100.00000, '0', 0, '0', 0, '/backend/files/SX4xRyTMD379ceB3OYOq.png', 1, 1, NULL, '2026-03-08 15:46:49'),
(271, 2, 'Tower Bolt', 'tower-bolt-271', '<h3>Variants Included</h3><p>• 4\" Box Tower Bolt – Vikars / BMI = 50 taka<br>• 6\" Box Tower Bolt – Vikars / BMI / Boss-Heavy = 69 taka<br>• 8\" Box Tower Bolt – Vikars / BMI / Boss-Heavy = 88 taka<br>• 6\" Box Tower Bolt – Mirror (No Screw) = 79 taka<br>• 8\" Box Tower Bolt – Mirror (No Screw) = 96 taka<br>• 6\" Box Tower Bolt – Light – Boss / Vikars = 57 taka<br>• 8\" Box Tower Bolt – Light – Boss / Vikars = 73 taka<br>• 6\" Wave Tower Bolt – Vikars / BMI = 77 taka<br>• 8\" Wave Tower Bolt – Vikars / BMI = 90 taka<br>• 6\" Tower Bolt – Mirror Wave (No Screw) = 79 taka<br>• 8\" Tower Bolt – Mirror Wave (No Screw) = 100 taka</p>', '<p>Type: Door / Cabinet Tower Bolt<br>• Material: High-quality metal (Alloy / Zinc / Steel depending on variant)<br>• Size: 4\", 6\", 8\" available<br>• Finish: Standard metallic, heavy-duty, or mirror finish (depending on variant)<br>• Variants: Box type, L', '', '', '', '', 2, 'TB1001', '', 2, 51, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/T5p3R2SVpn4Oje03KjM1.png', 1, 1, NULL, '2026-03-06 05:29:10'),
(272, 2, 'Piano Hinge – 6”', 'piano-hinge-6--272', '<h3>Variants Included</h3><p>• 3/4\" × 0.40 mm – Boss / Vikars – Iron Pin = 68 taka<br>• 3/4\" × 0.60 mm – Boss / Vikars – Iron Pin = 118 taka<br>• 3/4\" × 0.80 mm – Boss / Vikars – Iron Pin = 180 taka<br>• 3/4\" × 0.80 mm – Boss / Vikars – SS Pin = 188 taka</p>', '<p>Type: Piano hinge / continuous hinge<br>• Material: High-quality metal body (Iron or Stainless Steel pin depending on variant)<br>• Size: 6 inches length, 3/4\" width<br>• Thickness: 0.40 mm / 0.60 mm / 0.80 mm<br>• Pin Type: Iron pin or SS (stainless s', '', '', '', '', 2, 'PH1001', '', 2, 68, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/0jxQLnfZZgPZGEP1Y6zi.png', 1, 1, NULL, '2026-03-06 05:24:16'),
(273, 2, 'Iron Drawer Lock with Steel Key', 'iron-drawer-lock-with-steel-key-273', '<p>Type: Drawer / Cabinet lock<br>• Material: Iron body with steel key<br>• Key Type: Steel key included<br>• Function: Provides secure locking for drawers, cabinets, and furniture<br>• Finish: Corrosion-resistant metallic finish<br>• Installation: Surface-mounted with included screws<br>• Durability: Strong, impact-resistant, and long-lasting<br>• Usage: Home, office, and furniture security</p>', '', '', '', '', '', 2, 'IDL1001', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/DIR31OtwlHjlkuKHUeI8.png', 1, 1, NULL, NULL),
(274, 2, 'Window Roller – Vikars 299', 'window-roller-vikars-299-274', '<p>Type: Window roller / sliding window wheel<br>• Material: High-quality metal body with durable wheel<br>• Function: Smooth sliding and movement of window sashes<br>• Finish: Corrosion-resistant coating for long-lasting performance<br>• Installation: Easy mounting on standard sliding window tracks<br>• Durability: Strong, impact-resistant, and wear-resistant<br>• Usage: Household, office, and commercial sliding windows<br>• Compatibility: Suitable for Vikars window frames and standard sliding windows</p>', '', '', '', '', '', 2, 'WR1001', '', 2, 60, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/iHB0oMk3GrO6yyJw2hQs.png', 1, 1, NULL, '2026-03-04 04:47:55'),
(275, 2, 'Window Roller – Orange', 'window-roller-orange-275', '<p>Type: Window roller / sliding window wheel<br>• Material: High-quality metal body with durable wheel<br>• Color: Orange coated finish<br>• Function: Smooth sliding and movement of window sashes<br>• Finish: Corrosion-resistant coating for long-lasting performance<br>• Installation: Easy mounting on standard sliding window tracks<br>• Durability: Strong, impact-resistant, and wear-resistant<br>• Usage: Household, office, and commercial sliding windows<br>• Compatibility: Suitable for standard window frames and sliding mechanisms</p>', '', '', '', '', '', 2, 'WR1002', '', 2, 61, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/bjBSJW8rrGPDj25ekWgR.png', 1, 1, NULL, '2026-03-04 04:46:56'),
(278, 2, 'SS Drawer Channel with 4 Ball', 'ss-drawer-channel-with-4-ball-278', '<p>Type: Drawer channel / telescopic slide<br>• Material: Stainless steel (SS) body with ball bearings<br>• Ball Bearings: 4-ball smooth sliding mechanism<br>• Function: Provides smooth and silent drawer movement<br>• Finish: Corrosion-resistant stainless steel finish<br>• Installation: Side-mounted installation with screws<br>• Durability: Strong, wear-resistant, and long-lasting<br>• Usage: Furniture drawers, cabinets, and office storage units<br>• Load Capacity: Suitable for light to medium weight drawers</p>', '', '', '', '', '', 2, 'DC1002', '', 2, 100, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/i9OAp2EfYlNPYmAT9Sin.png', 1, 1, NULL, '2026-03-31 11:32:14'),
(279, 1, 'WD-40 Multi use product (191 ml)', 'wd-40-multi-use-product-191-ml--279', '<p style=\"margin-left:0px;\"><strong>Key Features:</strong></p><ol><li><strong>Lubricates Moving Parts:</strong> Ensures smooth operation of hinges, wheels, pulleys, gears, and other mechanisms.</li><li><strong>Protects Against Rust &amp; Corrosion:</strong> Creates a protective barrier to shield metal surfaces from moisture and oxidation.</li><li><strong>Frees Stuck or Rusted Parts:</strong> Penetrates and loosens tight, jammed, or corroded components quickly.</li><li><strong>Removes Dirt &amp; Residue:</strong> Cleans grease, grime, tar, adhesive, and other tough build-ups with ease.</li><li><strong>Displaces Moisture:</strong> Effectively dries out damp electrical systems and prevents short circuits.</li><li><strong>Versatile Applications:</strong> Suitable for use in household maintenance, automotive care, industrial machinery, and outdoor equipment.</li></ol><p style=\"margin-left:0px;\">WD-40 is not just a spray—it’s a reliable tool for extending the life and performance of your equipment.</p>', '', '', '', '', '', 1, 'WD402001', '', 2, 420, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/kUN7DGG2IzNS1lBSWtZ9.png', 1, 1, NULL, '2026-07-06 06:05:21'),
(280, 1, 'Vt- 420 Vital Band- (50 mm)-10 Meter', 'vt--420-vital-band--50-mm--10-meter-280', '<p>&nbsp;</p><p>• Type: Waterproof sealing / insulation band<br>• Model: VT-420<br>• Width: 50 mm<br>• Length: 10 meters roll<br>• Material: High-adhesion waterproof membrane<br>• Function: Sealing joints, cracks, roof edges, window gaps, and leakage areas<br>• Adhesion: Strong self-adhesive backing for firm bonding<br>• Finish: Weather-resistant and UV-resistant surface<br>• Durability: Long-lasting, tear-resistant, and flexible<br>• Usage: Roofing, construction, waterproofing, plumbing, and repair works</p>', '', '', '', '', '', 5, 'VT4201001', '', 2, 478, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/tRGbbdMXG3gJCpTThnT0.png', 1, 1, NULL, '2026-04-27 14:36:57'),
(281, 1, 'Socket Chorme Plated', 'socket-chorme-plated-281', '<p><strong>Material:</strong><br>Chrome vanadium steel with chrome-plated finish.</p><p><strong>Size:</strong><br>Available in multiple metric and inch sizes (various drive sizes).</p><p><strong>Key Features:</strong></p><p>Strong chrome vanadium steel construction</p><p>Chrome-plated finish for rust resistance</p><p>Precise fit for improved torque and reduced slipping</p><p>Compatible with ratchets and torque wrenches</p><p>Suitable for automotive, industrial, and home use</p><p>Durable and long-lasting performance</p>', '<p>Size : 13mm, 14mm ,15mm</p>', '', '', '', '', 3, 'SKP1002', '', 2, 36, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/JXstqWtnqIHfrmEGqX7s.png', 0, 1, NULL, '2026-04-24 18:20:34'),
(282, 1, 'Socket Chorme Plated', 'socket-chorme-plated-282', '<p><strong>Material:</strong><br>Chrome vanadium steel with chrome-plated finish.</p><p><strong>Size:</strong><br>Available in multiple metric and inch sizes (various drive sizes).</p><p><strong>Key Features:</strong></p><p>Strong chrome vanadium steel construction</p><p>Chrome-plated finish for rust resistance</p><p>Precise fit for improved torque and reduced slipping</p><p>Compatible with ratchets and torque wrenches</p><p>Suitable for automotive, industrial, and home use</p><p>Durable and long-lasting performance</p>', '<p>Size: 18mm , 19mm</p>', '', '', '', '', 3, 'SKP1003', '', 2, 39, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/hfYo7x6NYFooHyl3M2DW.png', 0, 1, NULL, '2026-04-24 18:20:13'),
(283, 1, 'Socket Chorme Plated', 'socket-chorme-plated-283', '<p><strong>Material:</strong><br>Chrome vanadium steel with chrome-plated finish.</p><p><strong>Size:</strong><br>Available in multiple metric and inch sizes (various drive sizes).</p><p><strong>Key Features:</strong></p><p>Strong chrome vanadium steel construction</p><p>Chrome-plated finish for rust resistance</p><p>Precise fit for improved torque and reduced slipping</p><p>Compatible with ratchets and torque wrenches</p><p>Suitable for automotive, industrial, and home use</p><p>Durable and long-lasting performance</p>', '<p>Size:30mm</p>', '', '', '', '', 3, 'SKP1004', '', 2, 113, '100', 100, 1, 2, 0, '', 0.00, 1, 2, 0, '', 0, 80.00000, '0', 0, '0', 0, '/backend/files/K97A0o5KDtiggmNYC8GZ.png', 0, 1, NULL, '2026-04-24 18:15:02'),
(284, 1, 'Test-11111', 'test-11111-284', '<p>sd</p>', '<p>sd</p>', 'sd', 'sd', 'sd', 'sd', 3, '2232323', '', 2, 222, '22', 1, 1, 2, 0, '', 0.00, 1, 1, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/p52kiKWAVWZQKP8bBYAm.png', 0, 1, NULL, '2026-07-06 06:33:33'),
(285, 1, 'test bijon', 'test-bijon-285', '<p>dfdfdf</p>', '<p>dfdf</p>', '', '', '', '', 5, '3434', '', 2, 343434, '333', 34, 33, 2, 0, '', 0.00, 1, 1, 0, '', 0, 34.00000, '0', 0, '0', 0, '/backend/files/P1zdjS1tB0AZa4TiM0ZJ.png', 0, 1, NULL, '2026-07-06 06:34:03'),
(286, 2, 'nnn33', 'nnn33-286', '<p>sd</p>', '<p>sd</p>', 'sd', 'sd', 'sdsd', 'sd', 4, '34', '', 2, 34, '3', 33, 34, 2, 0, '', 0.00, 1, 1, 0, '', 0, 0.00000, '0', 0, '0', 0, '/backend/files/hyimBMNUp4qP1k7vVhOf.png', 0, 1, NULL, '2026-07-06 06:33:48');

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes`
--

CREATE TABLE `product_attributes` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `attributes_id` int(11) NOT NULL,
  `attr_status` int(11) NOT NULL COMMENT '0=delete action off\r\n1=delete action on \r\nwhen matching product_variants table then action working',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_attributes_values_history`
--

CREATE TABLE `product_attributes_values_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `attribute_id` int(11) DEFAULT NULL,
  `product_attribute_id` int(11) DEFAULT NULL,
  `product_att_value_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `pro_attr_val_his_id` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_variants_history`
--

CREATE TABLE `product_variants_history` (
  `id` bigint(20) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` float(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT current_timestamp(),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_variants_history`
--

INSERT INTO `product_variants_history` (`id`, `product_id`, `name`, `qty`, `price`, `image`, `color`, `updated_at`, `created_at`) VALUES
(16, 283, 'Test-3', 1, 200.00, NULL, NULL, '2026-03-08 15:12:18', '2026-03-08 15:12:18'),
(17, 283, 'Test-34', 1, 200.00, NULL, NULL, '2026-03-08 15:12:18', '2026-03-08 15:12:18'),
(18, 283, 'Test-34', 1, 200.00, NULL, NULL, '2026-03-08 15:12:18', '2026-03-08 15:12:18'),
(19, 283, 'Test40', 1, 250.00, NULL, NULL, '2026-03-08 15:12:18', '2026-03-08 15:12:18'),
(20, 283, 'Test41', 1, 300.00, NULL, NULL, '2026-03-08 15:12:18', '2026-03-08 15:12:18'),
(21, 282, 'Test-4', 1, 500.00, NULL, NULL, '2026-03-08 15:19:33', '2026-03-08 15:19:33'),
(22, 282, 'Test-44', 1, 350.00, NULL, NULL, '2026-03-08 15:19:33', '2026-03-08 15:19:33'),
(27, 270, 'Test-1', 1, 100.00, NULL, NULL, '2026-03-08 15:46:57', '2026-03-08 15:46:57'),
(28, 270, 'Test-2', 1, 200.00, NULL, NULL, '2026-03-08 15:46:57', '2026-03-08 15:46:57'),
(29, 270, 'Test-3', 100, 250.00, NULL, NULL, '2026-03-08 15:46:57', '2026-03-08 15:46:57'),
(30, 270, 'Test-5', 1, 600.00, NULL, NULL, '2026-03-08 15:46:57', '2026-03-08 15:46:57'),
(31, 278, '1\"', 1, 50.00, NULL, NULL, '2026-03-31 11:33:00', '2026-03-31 11:33:00'),
(32, 278, '2\"', 1, 60.00, NULL, NULL, '2026-03-31 11:33:00', '2026-03-31 11:33:00'),
(33, 278, '3\"', 1, 80.00, NULL, NULL, '2026-03-31 11:33:00', '2026-03-31 11:33:00'),
(34, 278, '4\"', 1, 90.00, NULL, NULL, '2026-03-31 11:33:00', '2026-03-31 11:33:00'),
(35, 278, '5\"', 1, 100.00, NULL, NULL, '2026-03-31 11:33:00', '2026-03-31 11:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_warranty`
--

CREATE TABLE `product_warranty` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warranty_name` varchar(255) NOT NULL,
  `days` int(11) NOT NULL,
  `price` double(10,5) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_warranty_history`
--

CREATE TABLE `product_warranty_history` (
  `id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `expire_on` datetime DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produc_categories`
--

CREATE TABLE `produc_categories` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produc_categories`
--

INSERT INTO `produc_categories` (`id`, `product_id`, `category_id`, `parent_id`) VALUES
(1, 1, 45, '1,6,45'),
(2, 2, 45, '1,6,45'),
(3, 3, 43, '1,6,43'),
(4, 4, 43, '1,6,43'),
(5, 5, 43, '1,6,43'),
(6, 6, 43, '1,6,43'),
(7, 7, 43, '1,6,43'),
(8, 8, 43, '1,6,43'),
(9, 9, 43, '1,6,43'),
(10, 10, 43, '1,6,43'),
(11, 11, 43, '1,6,43'),
(12, 12, 43, '1,6,43'),
(13, 13, 43, '1,6,43'),
(14, 14, 43, '1,6,43'),
(15, 15, 43, '1,6,43'),
(16, 16, 43, '1,6,43'),
(17, 17, 43, '1,6,43'),
(18, 18, 43, '1,6,43'),
(19, 19, 43, '1,6,43'),
(20, 20, 43, '1,6,43'),
(21, 21, 43, '1,6,43'),
(22, 22, 43, '1,6,43'),
(23, 23, 43, '1,6,43'),
(24, 24, 43, '1,6,43'),
(25, 25, 43, '1,6,43'),
(26, 26, 42, '1,6,42'),
(27, 27, 44, '1,6,44'),
(28, 28, 42, '1,6,42'),
(29, 29, 42, '1,6,42'),
(30, 30, 44, '1,6,44'),
(31, 31, 44, '1,6,44'),
(32, 32, 44, '1,6,44'),
(33, 33, 44, '1,6,44'),
(34, 34, 44, '1,6,44'),
(35, 35, 46, '1,6,46'),
(36, 36, 46, '1,6,46'),
(37, 37, 46, '1,6,46'),
(38, 38, 46, '1,6,46'),
(39, 39, 46, '1,6,46'),
(40, 40, 46, '1,6,46'),
(41, 41, 46, '1,6,46'),
(42, 42, 46, '1,6,46'),
(43, 43, 46, '1,6,46'),
(44, 45, 46, '1,6,46'),
(45, 46, 46, '1,6,46'),
(46, 47, 8, '1,8'),
(47, 48, 16, '3,16'),
(48, 49, 15, '3,15'),
(49, 50, 15, '3,15'),
(50, 51, 15, '3,15'),
(51, 52, 15, '3,15'),
(52, 53, 15, '3,15'),
(53, 54, 15, '3,15'),
(54, 55, 15, '3,15'),
(55, 56, 16, '3,16'),
(56, 57, 16, '3,16'),
(57, 58, 16, '3,16'),
(58, 59, 16, '3,16'),
(59, 60, 16, '3,16'),
(60, 61, 16, '3,16'),
(61, 62, 17, '3,17'),
(62, 63, 17, '3,17'),
(63, 64, 17, '3,17'),
(64, 65, 17, '3,17'),
(65, 66, 17, '3,17'),
(66, 67, 17, '3,17'),
(76, 76, 19, '3,19'),
(77, 83, 19, '3,19'),
(78, 85, 19, '3,19'),
(81, 69, 18, '3,18'),
(82, 75, 18, '3,18'),
(83, 74, 18, '3,18'),
(84, 73, 18, '3,18'),
(85, 72, 18, '3,18'),
(86, 71, 18, '3,18'),
(87, 70, 18, '3,18'),
(97, 98, 20, '3,20'),
(98, 99, 20, '3,20'),
(99, 100, 20, '3,20'),
(100, 101, 20, '3,20'),
(101, 102, 20, '3,20'),
(102, 103, 20, '3,20'),
(103, 104, 20, '3,20'),
(104, 105, 21, '3,21'),
(105, 106, 21, '3,21'),
(106, 107, 21, '3,21'),
(107, 108, 21, '3,21'),
(108, 109, 21, '3,21'),
(109, 110, 21, '3,21'),
(110, 111, 21, '3,21'),
(111, 112, 21, '3,21'),
(112, 113, 53, '2,53'),
(113, 114, 53, '2,53'),
(114, 115, 53, '2,53'),
(115, 116, 53, '2,53'),
(116, 117, 53, '2,53'),
(117, 118, 53, '2,53'),
(118, 119, 53, '2,53'),
(119, 120, 53, '2,53'),
(120, 121, 53, '2,53'),
(121, 122, 53, '2,53'),
(122, 123, 53, '2,53'),
(123, 124, 53, '2,53'),
(124, 125, 53, '2,53'),
(125, 126, 53, '2,53'),
(126, 127, 53, '2,53'),
(127, 128, 53, '2,53'),
(128, 129, 54, '2,54'),
(129, 130, 54, '2,54'),
(130, 131, 22, '3,22'),
(131, 132, 22, '3,22'),
(132, 134, 22, '3,22'),
(133, 135, 22, '3,22'),
(134, 136, 22, '3,22'),
(135, 137, 22, '3,22'),
(136, 138, 22, '3,22'),
(137, 139, 22, '3,22'),
(138, 140, 22, '3,22'),
(139, 141, 22, '3,22'),
(140, 142, 24, '3,24'),
(141, 146, 24, '3,24'),
(142, 147, 24, '3,24'),
(143, 148, 25, '3,25'),
(144, 149, 25, '3,25'),
(145, 150, 25, '3,25'),
(146, 151, 25, '3,25'),
(147, 152, 25, '3,25'),
(148, 153, 27, '3,27'),
(149, 154, 27, '3,27'),
(150, 156, 25, '3,25'),
(151, 157, 25, '3,25'),
(152, 158, 25, '3,25'),
(153, 159, 25, '3,25'),
(154, 160, 25, '3,25'),
(155, 161, 25, '3,25'),
(156, 162, 25, '3,25'),
(157, 163, 25, '3,25'),
(158, 164, 25, '3,25'),
(159, 165, 25, '3,25'),
(160, 166, 25, '3,25'),
(161, 167, 25, '3,25'),
(162, 168, 26, '3,26'),
(163, 170, 26, '3,26'),
(164, 171, 26, '3,26'),
(165, 172, 28, '3,28'),
(166, 173, 28, '3,28'),
(167, 174, 31, '3,31'),
(168, 175, 31, '3,31'),
(169, 176, 26, '3,26'),
(170, 177, 26, '3,26'),
(171, 178, 26, '3,26'),
(172, 179, 26, '3,26'),
(173, 180, 26, '3,26'),
(174, 181, 26, '3,26'),
(175, 182, 26, '3,26'),
(176, 183, 26, '3,26'),
(177, 184, 4, '4'),
(178, 185, 4, '4'),
(179, 186, 4, '4'),
(180, 187, 4, '4'),
(181, 188, 4, '4'),
(182, 189, 4, '4'),
(183, 190, 4, '4'),
(184, 191, 4, '4'),
(185, 192, 4, '4'),
(186, 193, 4, '4'),
(187, 196, 4, '4'),
(188, 197, 47, '1,6,47'),
(189, 198, 65, '1,6,65'),
(190, 199, 65, '1,6,65'),
(191, 200, 8, '1,8'),
(192, 201, 8, '1,8'),
(193, 202, 8, '1,8'),
(194, 204, 66, '1,8,66'),
(195, 205, 66, '1,8,66'),
(196, 206, 8, '1,8'),
(197, 207, 8, '1,8'),
(198, 210, 8, '1,8'),
(199, 211, 48, '1,6,48'),
(200, 212, 48, '1,6,48'),
(201, 213, 48, '1,6,48'),
(202, 214, 48, '1,6,48'),
(203, 215, 51, '1,6,51'),
(204, 216, 51, '1,6,51'),
(205, 217, 51, '1,6,51'),
(206, 219, 50, '1,6,50'),
(207, 220, 50, '1,6,50'),
(208, 221, 50, '1,6,50'),
(209, 222, 50, '1,6,50'),
(210, 223, 50, '1,6,50'),
(211, 224, 50, '1,6,50'),
(212, 225, 50, '1,6,50'),
(213, 226, 49, '1,6,49'),
(214, 227, 49, '1,6,49'),
(215, 228, 49, '1,6,49'),
(216, 232, 49, '1,6,49'),
(217, 233, 14, '1,14'),
(218, 234, 14, '1,14'),
(219, 235, 11, '1,11'),
(220, 236, 11, '1,11'),
(221, 237, 26, '3,26'),
(222, 238, 26, '3,26'),
(223, 239, 26, '3,26'),
(224, 240, 26, '3,26'),
(225, 241, 7, '1,7'),
(226, 244, 7, '1,7'),
(227, 245, 7, '1,7'),
(228, 246, 7, '1,7'),
(229, 248, 7, '1,7'),
(230, 250, 7, '1,7'),
(231, 251, 7, '1,7'),
(232, 252, 7, '1,7'),
(233, 253, 7, '1,7'),
(234, 254, 7, '1,7'),
(235, 255, 7, '1,7'),
(236, 256, 10, '1,10'),
(237, 258, 10, '1,10'),
(238, 259, 10, '1,10'),
(239, 260, 31, '3,31'),
(242, 263, 31, '3,31'),
(243, 264, 31, '3,31'),
(246, 268, 11, '1,11'),
(247, 269, 32, '3,32'),
(248, 270, 33, '3,33'),
(249, 271, 8, '1,8'),
(250, 272, 11, '1,11'),
(251, 273, 49, '1,6,49'),
(252, 274, 13, '1,13'),
(253, 275, 13, '1,13'),
(254, 278, 12, '1,12'),
(256, 280, 55, '2,55'),
(257, 281, 33, '3,33'),
(258, 282, 33, '3,33'),
(259, 283, 33, '3,33'),
(260, 1, 1, '1'),
(261, 1, 6, '1,6'),
(262, 1, 48, '1,6,48'),
(263, 1, 1, '1'),
(264, 1, 6, '1,6'),
(265, 1, 51, '1,6,51'),
(266, 280, 2, '2'),
(267, 280, 55, '2,55'),
(291, 97, 5, '5,34,36'),
(293, 95, 5, '5,34,36'),
(294, 94, 5, '5,34,36'),
(295, 93, 5, '5,34,36'),
(306, 87, 5, '5,34,35'),
(314, 90, 5, '5,34,35'),
(315, 88, 5, '5,34,35'),
(321, 96, 5, '5,34,36'),
(323, 279, 5, '5,34,35'),
(324, 86, 5, '5,34,35'),
(325, 284, 1, '1,6,47'),
(326, 286, 1, '1,6,44'),
(327, 285, 1, '1,6,45'),
(329, 92, 5, '5,34,36'),
(330, 91, 5, '5,34,36'),
(331, 266, 1, '1,9'),
(332, 265, 1, '1,9'),
(333, 262, 1, '1,9'),
(334, 261, 1, '1,9');

-- --------------------------------------------------------

--
-- Table structure for table `produc_img_history`
--

CREATE TABLE `produc_img_history` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produc_img_history`
--

INSERT INTO `produc_img_history` (`id`, `product_id`, `images`) VALUES
(1, 1, '/backend/files/698ac6006252b112.png'),
(2, 1, '/backend/files/698ac60063ac3251.png'),
(3, 1, '/backend/files/698ac60063f6e252.png'),
(4, 2, '/backend/files/698ac746e3cbb58.png'),
(5, 2, '/backend/files/698ac746e425c59.png'),
(6, 3, '/backend/files/698acbd12a8a7137.png'),
(7, 3, '/backend/files/698acbd12ad74139.png'),
(8, 3, '/backend/files/698acbd12b72e140.png'),
(9, 4, '/backend/files/698acc2b1646155.png'),
(10, 4, '/backend/files/698acc2b1684056.png'),
(11, 4, '/backend/files/698acc2b16b5257.png'),
(12, 5, '/backend/files/698acccd7e145147.png'),
(15, 7, '/backend/files/698ace2a2e99093.png'),
(16, 7, '/backend/files/698ace2a2ecbf94.png'),
(17, 6, '/backend/files/698ace674d723154.png'),
(18, 8, '/backend/files/698aced3589f152.png'),
(19, 8, '/backend/files/698aced358e2753.png'),
(20, 8, '/backend/files/698aced3591aa54.png'),
(21, 9, '/backend/files/698acf2f6393b71.png'),
(22, 9, '/backend/files/698acf2f63e1a72.png'),
(23, 10, '/backend/files/698acf944ee2176.png'),
(24, 10, '/backend/files/698acf944f2e977.png'),
(26, 11, '/backend/files/698acfdb8016782.png'),
(27, 11, '/backend/files/698acfea64f1081.png'),
(28, 12, '/backend/files/698ad044cc20f83.png'),
(29, 14, '/backend/files/698ad12e3a86387.png'),
(30, 14, '/backend/files/698ad12e3b87588.png'),
(31, 14, '/backend/files/698ad12e3bc0689.png'),
(32, 14, '/backend/files/698ad12e3befe90.png'),
(33, 15, '/backend/files/698ad201b209b73.png'),
(34, 15, '/backend/files/698ad201b25e174.png'),
(35, 15, '/backend/files/698ad201b2a0075.png'),
(36, 16, '/backend/files/698ad296817c367.png'),
(37, 16, '/backend/files/698ad29681f5d69.png'),
(38, 16, '/backend/files/698ad2968250170.png'),
(39, 17, '/backend/files/698ad3645027f96.png'),
(40, 18, '/backend/files/698ad3c2c20d3135.png'),
(41, 19, '/backend/files/698ad4351bc06118.png'),
(42, 19, '/backend/files/698ad4351c01b119.png'),
(43, 20, '/backend/files/698ad4b56589746.png'),
(44, 21, '/backend/files/698ad522a8fdc49.png'),
(45, 22, '/backend/files/698ad57c8dc4e91.png'),
(46, 23, '/backend/files/698ad5e7eb39985.png'),
(47, 24, '/backend/files/698ad6450e4a1102.png'),
(48, 24, '/backend/files/698ad6450e84d109.png'),
(49, 25, '/backend/files/698ad6a34570760.png'),
(50, 25, '/backend/files/698ad6a345aba61.png'),
(51, 26, '/backend/files/698ad79b472b7144.png'),
(52, 27, '/backend/files/698ad86a01bfc99.png'),
(53, 27, '/backend/files/698ad86a02726100.png'),
(54, 28, '/backend/files/698ad8d228916125.png'),
(55, 29, '/backend/files/698ad9c7b1ef1115.png'),
(56, 30, '/backend/files/698adb469d86d120.png'),
(57, 31, '/backend/files/698adef9bc4d4124.png'),
(58, 32, '/backend/files/698ae9b2421e4105.png'),
(59, 32, '/backend/files/698ae9b2426ac106.png'),
(60, 33, '/backend/files/698ae9ff1da9f108.png'),
(61, 34, '/backend/files/698aea556adf3103.png'),
(62, 34, '/backend/files/698aea556b168104.png'),
(63, 35, '/backend/files/698aeb07951bc32.png'),
(64, 35, '/backend/files/698aeb079558d34.png'),
(65, 35, '/backend/files/698aeb079586d38.png'),
(66, 36, '/backend/files/698aeb5af1eb039.png'),
(67, 36, '/backend/files/698aeb5af228740.png'),
(68, 37, '/backend/files/698aebaa841d95893-AC.png'),
(69, 37, '/backend/files/698aebaa8463a5893-AC_1.png'),
(70, 37, '/backend/files/698aebaa849905893-AC_2.png'),
(71, 38, '/backend/files/698aee0d043c911.png'),
(72, 39, '/backend/files/698aee7d7d80d18.png'),
(73, 39, '/backend/files/698aee7d7dc3c19.png'),
(74, 40, '/backend/files/698aeebbbcb9710.png'),
(75, 40, '/backend/files/698aeebbbd11812.png'),
(76, 40, '/backend/files/698aeebbbd49313.png'),
(77, 40, '/backend/files/698aeebbbd75c14.png'),
(78, 41, '/backend/files/698aef0ab473620.png'),
(79, 42, '/backend/files/698aef6e218d024.png'),
(80, 43, '/backend/files/698af1ce2aabe26.png'),
(81, 43, '/backend/files/698af1ce2aedd27.png'),
(82, 45, '/backend/files/698af2532a72b30.png'),
(83, 46, '/backend/files/698af302255f928.png'),
(84, 46, '/backend/files/698af302259f229.png'),
(85, 47, '/backend/files/698b0dc8e29389.png'),
(86, 48, '/backend/files/69958aaf69c7e2.png'),
(87, 48, '/backend/files/69958aaf6a1d33.png'),
(88, 49, '/backend/files/69969606c25664.png'),
(89, 49, '/backend/files/69969606c34d55.png'),
(90, 50, '/backend/files/6996ad26980b04 inchi diamond cutter standard quality cutting and laing saw.png'),
(91, 50, '/backend/files/6996ad26985265 - Copy.png'),
(92, 50, '/backend/files/6996ad26988147.png'),
(93, 51, '/backend/files/6996af10479539.png'),
(94, 51, '/backend/files/6996af1047c6b11.png'),
(95, 51, '/backend/files/6996af1047ecd12.png'),
(96, 51, '/backend/files/6996af10481a313.png'),
(97, 51, '/backend/files/6996af104845d15.png'),
(98, 51, '/backend/files/6996af104867416.png'),
(99, 52, '/backend/files/6996b05955c9c21.png'),
(100, 52, '/backend/files/6996b0595603422.png'),
(101, 53, '/backend/files/6996b5294e89d4 inchi diamond cutter standard quality cutting and laing saw.png'),
(102, 53, '/backend/files/6996b5294ed535 - Copy.png'),
(103, 54, '/backend/files/6996b5c8c10d217.png'),
(104, 54, '/backend/files/6996b5c8c161e19.png'),
(105, 55, '/backend/files/6996b666830fe20.png'),
(106, 56, '/backend/files/6996b870c0d1617.png'),
(107, 56, '/backend/files/6996b870c10a918.png'),
(108, 56, '/backend/files/6996b870c132d19.png'),
(109, 57, '/backend/files/6996b96cde4e811.png'),
(110, 57, '/backend/files/6996b96cde86812.png'),
(111, 57, '/backend/files/6996b96cdeb1713.png'),
(112, 58, '/backend/files/6996ba07100aa4.png'),
(113, 58, '/backend/files/6996ba07105095.png'),
(114, 59, '/backend/files/6996baf22e7de10.png'),
(115, 60, '/backend/files/6996bbda35b097.png'),
(116, 60, '/backend/files/6996bbda35eb18.png'),
(117, 60, '/backend/files/6996bbda361cf9.png'),
(118, 61, '/backend/files/6996bc4305c442.png'),
(119, 61, '/backend/files/6996bc430606f3.png'),
(120, 62, '/backend/files/6996be0c41ef04.png'),
(121, 63, '/backend/files/6996be974ea093.png'),
(122, 64, '/backend/files/6996bf1c183cb7.png'),
(123, 65, '/backend/files/6996bf6d6a1fe5.png'),
(124, 66, '/backend/files/6996bff13abee8.png'),
(125, 67, '/backend/files/6996c0565d9581.png'),
(128, 69, '/backend/files/6996ce64002b419.png'),
(129, 69, '/backend/files/6996ce64007ab20.png'),
(130, 70, '/backend/files/6996d1390792e27.png'),
(131, 70, '/backend/files/6996d13907ea328.png'),
(132, 71, '/backend/files/6996d29530d3b5.png'),
(133, 72, '/backend/files/6996d301af7669.png'),
(134, 72, '/backend/files/6996d301afb5e10.png'),
(135, 72, '/backend/files/6996d301aff6e11.png'),
(136, 72, '/backend/files/6996d301b025c12.png'),
(137, 72, '/backend/files/6996d301b060213.png'),
(138, 73, '/backend/files/6996d9838a17317.png'),
(139, 73, '/backend/files/6996d9838a57518.png'),
(140, 74, '/backend/files/699a7ceca8b6b26.png'),
(141, 75, '/backend/files/699a7dad4b6b823.png'),
(142, 75, '/backend/files/699a7dad4bb0f24.png'),
(143, 76, '/backend/files/699a7eacc995510.png'),
(144, 83, '/backend/files/699a80ec9e8d13.png'),
(145, 83, '/backend/files/699a80ec9ec744.png'),
(146, 85, '/backend/files/699a82936ffbc9.png'),
(147, 86, '/backend/files/699a874ce90adwd40 mup 277 ML.png'),
(148, 87, '/backend/files/699a88b070dfcwd40 mup 382 ML _1.png'),
(149, 87, '/backend/files/699a88b071209wd40 mup 382 ML.png'),
(150, 88, '/backend/files/699a8b6f7e4c5wd40 mup smart straw _1.png'),
(151, 88, '/backend/files/699a8b6f7ea06wd40 mup smart straw _2.png'),
(152, 88, '/backend/files/699a8b6f7eccewd40 mup smart straw _3.png'),
(153, 90, '/backend/files/699a8c1ddc766wd40 mup 4 Liter _3.png'),
(154, 90, '/backend/files/699a8c1ddcb77wd40 mup 4 Liter _5.png'),
(155, 91, '/backend/files/699a8f99d554aWD- 40 Specialist Chain Lube 360 Ml.png'),
(158, 93, '/backend/files/699a92929e46crsz_2silicone_360ml_back.png'),
(159, 93, '/backend/files/699a92929e8ccrsz_silicone_360ml.png'),
(160, 94, '/backend/files/699a93e1194c4WD 40 Specialist Brakes and Parts Cleaner 450 ml.png'),
(161, 94, '/backend/files/699a93e1198baWD 40 Specialist Brakes and Parts Cleaner 450 ml_1.png'),
(162, 95, '/backend/files/699a967ab65b8WD-40 Specialist Decreaser.png'),
(163, 95, '/backend/files/699a967ab68bfWD-40 Specialist Decreaser_1.png'),
(164, 95, '/backend/files/699a967ab7086WD-40 Specialist Decreaser_3.png'),
(165, 96, '/backend/files/699a97303d111WD 40 Specialist Air Condition Cleaner  360 ml.png'),
(166, 96, '/backend/files/699a97303d559WD 40 Specialist Air Condition Cleaner  360 ml_1.png'),
(167, 96, '/backend/files/699a97303d839WD 40 Specialist Air Condition Cleaner  360 ml_2.png'),
(168, 97, '/backend/files/699a9855a7517WD-40 Specialist Belt Dressing 360 ML.png'),
(169, 97, '/backend/files/699a9855a79acWD-40 Specialist Belt Dressing 360 ML_1.png'),
(170, 98, '/backend/files/699a9da4ac048Claw Hammer with fiber glass 160 z 08 oz.png'),
(171, 99, '/backend/files/699a9f2ea1adaBall Pein Hammer 08 oz `.png'),
(172, 100, '/backend/files/699aa05016fb4Chipping hammer with wooden handle.png'),
(173, 101, '/backend/files/699aa0a832173machinist hammer with wooden handle.png'),
(174, 102, '/backend/files/699aa11bda72cRubber mallat hammer with with fiber glass handle.png'),
(175, 102, '/backend/files/699aa11bdaab8Rubber mallat hammer with with fiber glass handle_1.png'),
(176, 103, '/backend/files/699aa1c5ec297Fiber glass handle.png'),
(177, 103, '/backend/files/699aa1c5ec572Fiber glass handle_1.png'),
(178, 104, '/backend/files/699aa22abf0bbTwo way mallat hammer with fiber glass handle  (1).png'),
(179, 104, '/backend/files/699aa22abf31cTwo way mallat hammer with fiber glass handle_1.png'),
(180, 105, '/backend/files/699aa698e83f7Adjustable Wrench Multi Color Bir Professional.png'),
(181, 105, '/backend/files/699aa698e8778Adjustable Wrench Multi Color Bir Professional_1.png'),
(182, 106, '/backend/files/699aa9e121be33.png'),
(183, 106, '/backend/files/699aa9e1223815.png'),
(184, 107, '/backend/files/699aaa5e1e5feAdjustable wrench  green handle.png'),
(185, 108, '/backend/files/699aab36903ccAdjustable wrench red.png'),
(186, 109, '/backend/files/699aabaea25e2L Handle Wrench 12X15 mm super.png'),
(187, 110, '/backend/files/699aac93012f011.png'),
(188, 110, '/backend/files/699aac930163912.png'),
(189, 110, '/backend/files/699aac930185e14.png'),
(190, 111, '/backend/files/699aad6d6a86aSocket  40 pc set.png'),
(191, 111, '/backend/files/699aad6d6ac80socket set 10 pc.png'),
(192, 112, '/backend/files/699aadef524b4T Handle socket 10 mm 8mm.png'),
(193, 112, '/backend/files/699aadef527cdT Handle socket 10 mm 8mm_1.png'),
(194, 113, '/backend/files/699ab7e2c9a2eV-Tech Rtv Vt 140b1 Se 56.8g.png'),
(195, 114, '/backend/files/699ab8e9f1f5fV-Tech Rtv Vt 141.png'),
(196, 115, '/backend/files/699abc10640f2V-Tech Rtv Vt 144 20 g.png'),
(197, 116, '/backend/files/699abf2c95fe2V-Tech Rtv Vt 151 Se 70 g.png'),
(198, 117, '/backend/files/699ac0d56579cV-Tech Rtv Vt 152 Se 70 g.png'),
(199, 118, '/backend/files/699ac1554e061V-Tech Rtv Vt 157 Se 70 g black.png'),
(200, 119, '/backend/files/699ac33232316V-Tech Rtv Vt 151 Se 70 g.png'),
(201, 120, '/backend/files/699ac3f6e4355V-Tech Rtv Vt 161 32g.png'),
(202, 121, '/backend/files/699ac5ccbacc7rsz_0974903_vt-160-vt-169-vital-tape-butyl-sealant-tape.jpg'),
(203, 122, '/backend/files/699ac6838294fV-Tech Rtv Vt 173 32 g.png'),
(204, 123, '/backend/files/699ac992d2bc5V-Tech Vt 200 clear.png'),
(205, 123, '/backend/files/699ac992d2ee0V-Tech Vt 200 clear_1.png'),
(206, 124, '/backend/files/699acabb63f85V-Tech Vt 201 clear_1.png'),
(207, 125, '/backend/files/699acbfa2fad2V-Tech Vt 220  White_1.png'),
(208, 125, '/backend/files/699acbfa2fec0V-Tech Vt 220  White_2.png'),
(209, 126, '/backend/files/699acc424141bVtech Vt 224.png'),
(210, 126, '/backend/files/699acc424191aVtech Vt 224_1.png'),
(211, 127, '/backend/files/699acf2412000V-Tech Vt 230  White.png'),
(212, 127, '/backend/files/699acf24123cdV-Tech Vt 230_3.png'),
(213, 128, '/backend/files/699acfa7f1e2bV-Tech Vt 620 sg.png'),
(214, 128, '/backend/files/699acfa7f21e8V-Tech Vt 620 sg_1.png'),
(215, 129, '/backend/files/699ad020c96c5Kai 104.png'),
(216, 129, '/backend/files/699ad020c9a03Kai 104_1.png'),
(217, 130, '/backend/files/699ad1292e299Bir 107.png'),
(218, 130, '/backend/files/699ad1292e6e6Bir 107_1.png'),
(219, 131, '/backend/files/699bd4e101ca41.png'),
(220, 131, '/backend/files/699bd4e1021d12.png'),
(221, 132, '/backend/files/699bd563514f93.png'),
(222, 134, '/backend/files/699bd5ea44a054.png'),
(223, 135, '/backend/files/699bd68abaf2e6.png'),
(224, 136, '/backend/files/699bd8b16d92c9.png'),
(225, 136, '/backend/files/699bd8b16e94010.png'),
(226, 136, '/backend/files/699bd8b16eca112.png'),
(227, 137, '/backend/files/699bd97a201cf11.png'),
(228, 137, '/backend/files/699bd97a206c113.png'),
(229, 138, '/backend/files/699bd9e456a5814.png'),
(230, 138, '/backend/files/699bd9e456e8c15.png'),
(231, 138, '/backend/files/699bd9e4570fe16.png'),
(232, 139, '/backend/files/699bdaa4a1c6d17.png'),
(233, 140, '/backend/files/699bdb0b4985218.png'),
(234, 141, '/backend/files/699bdb67b296822.png'),
(235, 141, '/backend/files/699bdb67b2cc523.png'),
(236, 141, '/backend/files/699bdb67b2f6a24.png'),
(237, 142, '/backend/files/699be52c0fc6c6.png'),
(238, 146, '/backend/files/699be6c8e81b83.png'),
(239, 147, '/backend/files/699be7cd730a06.png'),
(240, 148, '/backend/files/699bf84770d1716 pcs holes saw set_1.png'),
(241, 148, '/backend/files/699bf8477125f16 pcs holes saw set_2.png'),
(242, 149, '/backend/files/699bfa70ddd742 pces lock installation Kit.png'),
(243, 150, '/backend/files/699bfc0c35b535 pcs hole saw set_1.png'),
(244, 151, '/backend/files/699bfc5bcef0f5 pcs JIg Saw Blade.png'),
(245, 151, '/backend/files/699bfc5bcf3365 pcs JIg Saw Blade_1.png'),
(246, 152, '/backend/files/699bfcdf8652cChisel for wood.png'),
(247, 152, '/backend/files/699bfcdf86aaeChisel for wood_1.png'),
(248, 153, '/backend/files/699bfea5e95975.png'),
(249, 154, '/backend/files/699bff88e33791.png'),
(250, 156, '/backend/files/699c03ed55455Chisel for wood.png'),
(251, 156, '/backend/files/699c03ed55818Chisel for wood_1.png'),
(252, 157, '/backend/files/699c048802808Compass Saw ( Wooden Handle) 14 inchi.png'),
(253, 157, '/backend/files/699c048802b78Compass Saw ( Wooden Handle) 14 inchi_1.png'),
(254, 158, '/backend/files/699c04ee24b97Circular Saw Blade.png'),
(255, 159, '/backend/files/699c056112faaElectrode Holder 500a_1.png'),
(256, 159, '/backend/files/699c056113382Electrode Holder 500a_2.png'),
(257, 160, '/backend/files/699c0752f1616Hack Saw blade.png'),
(258, 161, '/backend/files/699c07cf29df0Hac Saw Frame 834 Straigt.png'),
(259, 162, '/backend/files/699c089854f34Hack saw frame adjustable  black.png'),
(260, 162, '/backend/files/699c0898552eaHack saw frame adjustable  black_1.png'),
(261, 163, '/backend/files/699c0946cced5Hand Saw Wooden Handle with Fire Teeth 16 and 18 inchi.png'),
(262, 164, '/backend/files/699c09cccf65127.png'),
(263, 165, '/backend/files/699c0a4e6285fHand Saw Yellow black handle with fire teeth.png'),
(264, 166, '/backend/files/699c0fc84dd26Rander Fall  iron planner 1.5.png'),
(265, 166, '/backend/files/699c0fc84e40bRander Fall  iron planner 1.5_1.png'),
(266, 167, '/backend/files/699c104711030Compass Saw ( plastic handle) 14 inchi.png'),
(267, 167, '/backend/files/699c1047114bdCompass Saw ( plastic handle) 14 inchi_1.png'),
(268, 168, '/backend/files/699c1146a27271.png'),
(269, 168, '/backend/files/699c1146a2a482.png'),
(270, 168, '/backend/files/699c1146a2c5c3.png'),
(271, 170, '/backend/files/699c11a6ca66412.png'),
(272, 171, '/backend/files/699c11ff2341710.png'),
(273, 171, '/backend/files/699c11ff2378d11.png'),
(274, 172, '/backend/files/699c1241767c24.png'),
(275, 174, '/backend/files/699c148254dcc7.png'),
(276, 175, '/backend/files/699c154e8b4982.png'),
(277, 176, '/backend/files/699c165078fcf13.png'),
(278, 177, '/backend/files/699c16d9dc8e315.png'),
(279, 177, '/backend/files/699c16d9dcd1416.png'),
(280, 178, '/backend/files/699c175034dca14.png'),
(281, 178, '/backend/files/699c1750352c320.png'),
(282, 179, '/backend/files/699c17a2efeb021.png'),
(283, 180, '/backend/files/699c1ad49b87919.png'),
(284, 181, '/backend/files/699c1bcdf302e26.png'),
(285, 181, '/backend/files/699c1bcdf348a27.png'),
(286, 182, '/backend/files/699c1d18a6dbd23.png'),
(287, 182, '/backend/files/699c1d18a72d524.png'),
(288, 183, '/backend/files/699c1d740361422.png'),
(289, 184, '/backend/files/699d1ec252753Untitled-1-01.jpg'),
(290, 185, '/backend/files/699d1f2e14ef2Untitled-1-02.jpg'),
(291, 186, '/backend/files/699d1f86ce56fUntitled-1-03.jpg'),
(292, 187, '/backend/files/699d1ff98e803Untitled-1-04.jpg'),
(293, 188, '/backend/files/699d20514fcbcUntitled-1-05.jpg'),
(294, 189, '/backend/files/699d20c4998abUntitled-1-07.jpg'),
(295, 190, '/backend/files/699d211c8600eUntitled-1-08.jpg'),
(296, 191, '/backend/files/699d2180f2c72Untitled-1-09.jpg'),
(297, 192, '/backend/files/699d228a1c24eUntitled-1-06.jpg'),
(298, 193, '/backend/files/699d22f08b7a6Untitled-1-10.jpg'),
(299, 196, '/backend/files/699d23530aa82Untitled-1-11.jpg'),
(300, 197, '/backend/files/699d405170864900 AC SS sheet.png'),
(301, 197, '/backend/files/699d405170c99900 AC SS sheet_1.png'),
(302, 198, '/backend/files/699d4fe08b3f27312 SS DEAD BOLT DOUBLE.png'),
(303, 199, '/backend/files/699d509318811254.png'),
(304, 200, '/backend/files/699d527560d1f888 DOOR STOPPER SS.png'),
(305, 201, '/backend/files/699d52ca4715ador stoppe ss vikar 823.png'),
(306, 202, '/backend/files/699d5499ac357door viewer with shutter _2.png'),
(307, 202, '/backend/files/699d5499ac851door viewer with shutter.png'),
(308, 204, '/backend/files/699d552eb43cavikars door chain.png'),
(309, 205, '/backend/files/699d556a40ffcvikars door chain 2.png'),
(310, 206, '/backend/files/699d560c59be3Vikar door knocer with viewer ac 728.png'),
(311, 207, '/backend/files/699d565c0eebfVikar door knocer with viewer ac 729.png'),
(312, 210, '/backend/files/699d5708475d0xh 052 door closer vikars.png'),
(313, 210, '/backend/files/699d570847964xh 052 door closer vikars_1.png'),
(314, 211, '/backend/files/699d617f9573dblack liver lock 6271.png'),
(315, 212, '/backend/files/699d61c54cd18Ab liver lock 6271.png'),
(316, 213, '/backend/files/699d6204e14ddss liver lock 6271.png'),
(317, 214, '/backend/files/699d62468c031xx liver lock 6211.png'),
(318, 215, '/backend/files/699d6391e938c1314 B BIKE PAD LOCK.png'),
(319, 216, '/backend/files/699d63cdd5ec7PAD LOCK CR 6360 CROSS KEY.png'),
(320, 217, '/backend/files/699d6400da631PAD LOCK NP 60 MATT.png'),
(321, 219, '/backend/files/699d676491458310 RIM LOCK 12 KEY AC WITHOUT CHAIN.png'),
(322, 220, '/backend/files/699d67ad51f37280.png'),
(323, 221, '/backend/files/699d67f11bdc6281.png'),
(324, 222, '/backend/files/699d682ce193c280.png'),
(325, 223, '/backend/files/699d6869489ec284.png'),
(326, 224, '/backend/files/699d689dacd24281.png'),
(327, 225, '/backend/files/699d68ce57b87310 RIM LOCK 12 KEY AC WITHOUT CHAIN.png'),
(328, 226, '/backend/files/699e741cc3e68138 22 SS DRAWER LOCK JB TYPE.png'),
(329, 227, '/backend/files/699e749dccfe6138 22 AC DRAWER LOCK JB TYPE.png'),
(330, 228, '/backend/files/699e74d95586eFURTINURE LOCK CP WAVE COMPUTER KEY.png'),
(331, 232, '/backend/files/699e758966434showcase lock.png'),
(332, 233, '/backend/files/699e75c6069e8LPG Regulator orange 22 mm.png'),
(333, 234, '/backend/files/699e7604c07aaLpg regulator silver 22 mm.png'),
(334, 235, '/backend/files/699e7763176c7293.png'),
(335, 236, '/backend/files/699e77a0d95c6291.png'),
(336, 236, '/backend/files/699e77a0d9c1c294.png'),
(337, 237, '/backend/files/699e792203bb9SF 9601 (A) Decoration Machine 6.png'),
(338, 237, '/backend/files/699e792203fb0SF 9601 (A) Decoration Machine 6_1.png'),
(339, 238, '/backend/files/699e79b875a67GR 03 soft Pattern Rubber 6.png'),
(340, 239, '/backend/files/699e7a4c52d16sf 9501 a decoration machine 7.png'),
(341, 240, '/backend/files/699e7bcf5843bsponge kit 1.png'),
(342, 240, '/backend/files/699e7bcf589f4sponge kit.png'),
(343, 241, '/backend/files/699e7d55d70655 8 steps 200 k_1.png'),
(344, 241, '/backend/files/699e7d55d73bd5 8 steps 200 k_4.png'),
(345, 241, '/backend/files/699e7d55d76d45 8 steps 200 k_5.png'),
(346, 244, '/backend/files/699e7dafcb1ae6 10 steps 200 kg capcaity_1.png'),
(347, 244, '/backend/files/699e7dafcb5226 10 steps 200 kg capcaity_2.png'),
(348, 244, '/backend/files/699e7dafcb7776 10 steps 200 kg capcaity_3.png'),
(349, 245, '/backend/files/699e7e22258b77 12 steps 200 kg capcaity.png'),
(350, 245, '/backend/files/699e7e2225bf87 12 steps 200 kg capcaity_1 - Copy.png'),
(351, 245, '/backend/files/699e7e2225e907 12steps 200 kg capcaity (1).png'),
(352, 245, '/backend/files/699e7e222608d7 12steps 200 kg capcaity_4.png'),
(371, 256, '/backend/files/699e87be3f5681  15   25 3 4 inchi concrete Nail  per kg.jpg'),
(372, 258, '/backend/files/699e890a25ac47.jpg'),
(373, 259, '/backend/files/699e8b4e3ae0fbrad nail t 20 t 25 t 32 t 38_4.jpg'),
(374, 259, '/backend/files/699e8b4e3b163brad nail t 20 t 25 t 32 t 38_1.jpg'),
(375, 260, '/backend/files/699e8d24b079frsz_9.png'),
(376, 261, '/backend/files/699e8e23c61c7WhatsApp Image 2026-01-12 at 122519 PM.jpg'),
(377, 262, '/backend/files/699e8e655d345WhatsApp Image 2026-01-12 at 122016 PM 1.jpg'),
(378, 263, '/backend/files/699e8e8766004rsz_2.png'),
(379, 264, '/backend/files/699e8f9165c6frsz_6.png'),
(380, 265, '/backend/files/699e8fe2c90beWhatsApp Image 2026-01-12 at 122545 PM.jpg'),
(381, 266, '/backend/files/699e905fbaab6WhatsApp Image 2026-01-12 at 122402 PM.jpg'),
(382, 268, '/backend/files/699e925330c4c7.png'),
(383, 268, '/backend/files/699e9253310ef8.png'),
(384, 269, '/backend/files/699e93d03dea2rsz_1.png'),
(385, 270, '/backend/files/699e96213888drsz_4.png'),
(386, 271, '/backend/files/699e98618fc169.png'),
(387, 272, '/backend/files/699e9bc39e7291.png'),
(388, 272, '/backend/files/699e9bc39eabf2.png'),
(389, 272, '/backend/files/699e9bc39ece53.png'),
(390, 273, '/backend/files/699e9c7756d8aIron Drawer Lock With Steel Key.png'),
(391, 273, '/backend/files/699e9c7757185Iron Drawer Lock With Steel Key_1.png'),
(392, 274, '/backend/files/699e9d362bf9612.png'),
(393, 274, '/backend/files/699e9d362c4d714.png'),
(394, 274, '/backend/files/699e9d362c81c15.png'),
(395, 275, '/backend/files/699e9d8253ab2Vikars-299 (Orange.png'),
(396, 275, '/backend/files/699e9d8253f49Vikars-299 (Orange_1.png'),
(397, 278, '/backend/files/699e9e01a3e77300.png'),
(398, 279, '/backend/files/69a686f3c3888wd40 mup 191 ML.png'),
(399, 280, '/backend/files/69a6930808cd6Vital Band vt 420.png'),
(400, 280, '/backend/files/69a69308091a6Vital Band vt 420_1.png'),
(401, 281, '/backend/files/69a90149aa2d4Socket chorme plated 08 mm 10 mm 11 mm 12 mm 13 mm 20 mm 21 mm 22 mm 23 mm 24 mm 25 mm 26 mm 27 mm 30 mm_2.png'),
(402, 281, '/backend/files/69a90149aa75bSocket chorme plated 08 mm 10 mm 11 mm 12 mm 13 mm 20 mm 21 mm 22 mm 23 mm 24 mm 25 mm 26 mm 27 mm 30 mm_3.png'),
(403, 282, '/backend/files/69a901c0c611bSocket chorme plated 08 mm 10 mm 11 mm 12 mm 13 mm 20 mm 21 mm 22 mm 23 mm 24 mm 25 mm 26 mm 27 mm 30 mm_2.png'),
(404, 282, '/backend/files/69a901c0c650eSocket chorme plated 08 mm 10 mm 11 mm 12 mm 13 mm 20 mm 21 mm 22 mm 23 mm 24 mm 25 mm 26 mm 27 mm 30 mm_3.png'),
(405, 283, '/backend/files/69a90222432edSocket chorme plated 08 mm 10 mm 11 mm 12 mm 13 mm 20 mm 21 mm 22 mm 23 mm 24 mm 25 mm 26 mm 27 mm 30 mm_2.png'),
(406, 283, '/backend/files/69a9022243691Socket chorme plated 08 mm 10 mm 11 mm 12 mm 13 mm 20 mm 21 mm 22 mm 23 mm 24 mm 25 mm 26 mm 27 mm 30 mm_3.png'),
(407, 255, '/backend/files/69abb22d9b8729 steps capacity 150kg.jpg'),
(408, 255, '/backend/files/69abb22d9bc569 steps capacity 150kg_1.jpg'),
(409, 255, '/backend/files/69abb22d9be9b9 steps capacity 150kg_2.jpg'),
(410, 254, '/backend/files/69abb260146e78 steps capacity 150kg_1.jpg'),
(411, 253, '/backend/files/69abb27b57a8e7 steps capacity 150kg.jpg'),
(412, 253, '/backend/files/69abb27b57e017 steps capacity 150kg_1.jpg'),
(413, 253, '/backend/files/69abb27b57fae7 steps capacity 150kg_4.jpg'),
(414, 252, '/backend/files/69abb297a2a866 steps capacity 150kg.jpg'),
(415, 252, '/backend/files/69abb297a2ce16 steps capacity 150kg_1.jpg'),
(416, 252, '/backend/files/69abb297a2e686 steps capacity 150kg_2.jpg'),
(417, 252, '/backend/files/69abb297a30466 steps capacity 150kg_4.jpg'),
(418, 251, '/backend/files/69abb2b53d2cd5 steps capacity 150kg.jpg'),
(419, 251, '/backend/files/69abb2b53d5825 steps capacity 150kg_1.jpg'),
(420, 251, '/backend/files/69abb2b53d7ad5 steps capacity 150kg_2.jpg'),
(421, 250, '/backend/files/69abb2d1a4c719 steps capacity 180kg.jpg'),
(422, 250, '/backend/files/69abb2d1a4f789 steps capacity 180kg_1.jpg'),
(423, 250, '/backend/files/69abb2d1a51ee9 steps capacity 180kg_2.jpg'),
(424, 250, '/backend/files/69abb2d1a54359 steps capacity 180kg_3.jpg'),
(425, 248, '/backend/files/69abb2ec6d7a47 steps capacity 180kg_1.jpg'),
(426, 248, '/backend/files/69abb2ec6db937 steps capacity 180kg_2.jpg'),
(427, 246, '/backend/files/69abb3127545b6 steps capacity 180kg.jpg'),
(428, 246, '/backend/files/69abb312759086 steps capacity 180kg_1.jpg'),
(429, 246, '/backend/files/69abb31275c846 steps capacity 180kg_2.jpg'),
(430, 246, '/backend/files/69abb31275f766 steps capacity 180kg_3.jpg'),
(431, 246, '/backend/files/69abb312762566 steps capacity 180kg_4.jpg'),
(432, 246, '/backend/files/69abb312765666 steps capacity 180kg_5.jpg'),
(433, 284, '/backend/files/69ef773dcb563v0b1Jv1oJFizZT737q4M.png'),
(434, 285, '/backend/files/69f1ae784cac9kUN7DGG2IzNS1lBSWtZ9.png'),
(435, 286, '/backend/files/69f1af015edd7kUN7DGG2IzNS1lBSWtZ9.png'),
(437, 92, '/backend/files/6a4b7c467eb93WD CC Front.jpg'),
(438, 92, '/backend/files/6a4b7c46800bdWD CC Back.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE `rule` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`id`, `name`, `status`) VALUES
(1, 'Admin', 1),
(3, 'Seller', 1);

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number_of_referell` varchar(255) DEFAULT NULL,
  `number_of_sales` varchar(255) DEFAULT NULL,
  `number_of_blogs` int(255) DEFAULT NULL,
  `salary_amount` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `salary`
--

INSERT INTO `salary` (`id`, `name`, `number_of_referell`, `number_of_sales`, `number_of_blogs`, `salary_amount`, `created_at`, `status`, `updated_at`) VALUES
(1, 'Salary Pack-1111111', '1000', '20', 30, '450', '2024-09-12 04:02:15', 1, '2024-09-12 04:02:15'),
(3, 'Salary Pack-2', '500', '600', 500, '256', '2024-09-13 03:10:19', 1, '2024-09-13 03:10:19'),
(4, 'Salary Pack-3', '600', '652', 25, '255', '2024-09-13 03:10:31', 1, '2024-09-13 03:10:31');

-- --------------------------------------------------------

--
-- Table structure for table `seller_ads`
--

CREATE TABLE `seller_ads` (
  `id` int(11) NOT NULL,
  `seller_id` int(11) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `send_message`
--

CREATE TABLE `send_message` (
  `id` int(11) NOT NULL,
  `candidate_name` varchar(255) DEFAULT NULL,
  `candidate_email` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `candidate_cc` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `send_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `send_message`
--

INSERT INTO `send_message` (`id`, `candidate_name`, `candidate_email`, `subject`, `candidate_cc`, `description`, `file`, `send_by`, `created_at`) VALUES
(3, 'fgdfg', 'mdbijon@gmail.com', 'sdf', 'mdbijon@gmail.com', 'mdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.commdbijon@gmail.com', NULL, 1, '2023-08-19 04:33:25'),
(4, 'dsfsfsdf', 'mdbijon@gmail.com', 'ssss', '', 'In Laravel, you can easily attach files to a model using the attach method, especially when dealing with relationships like Eloquent\'s BelongsToMany or HasMany relationships. However, since you mentioned attaching files, I\'ll assume you\'re working with file uploads in the context of a form submission.', '/backend/files/SVfaIInZEZCDCGheQiF2.png', 1, '2023-08-19 05:02:28'),
(5, 'dfgdfg', 'mdbijon@gmail.com', 'ssss', '', 'sfdsf', '/backend/files/GwEyNFbWS6qZzWUCwjOE.png', 1, '2023-08-19 05:14:41'),
(6, 'dsfdsfsdf', 'mdbijon@gmail.com', 'fdgdfg', '', 'fggfdg', '', 1, '2023-08-19 06:30:44'),
(7, 'Md. Gazi Giash Uddin', 'ib@gmail.com', 'New Subject', '', 'Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate Candidate', '/backend/files/88wrHYRxDG94tmZ0Endb.png', 1, '2023-08-19 06:31:37'),
(8, 'Ibraheem', 'mdbijon@gmail.com', 'New Subject', '', 'ffff', '/backend/files/m6RklwhKmcSifwgvTfH0.png', 1, '2023-08-19 06:45:59'),
(9, 'Abdur Rahman Ibraheem', 'mdbijon@gmail.com', 'New Subject', '', 'If you want to conditionally send an email with or without an attachment, you can modify your Mailable class to include the attachment only when a certain condition is met. Here\'s how you can achieve that:If you want to conditionally send an email with or without an attachment, you can modify your Mailable class to include the attachment only when a certain condition is met. Here\'s how you can achieve that:If you want to conditionally send an email with or without an attachment, you can modify your Mailable class to include the attachment only when a certain condition is met. Here\'s how you can achieve that:If you want to conditionally send an email with or without an attachment, you can modify your Mailable class to include the attachment only when a certain condition is met. Here\'s how you can achieve that:', '/backend/files/u1ujrkQMqTX6ES7VZh69.png', 1, '2023-08-19 06:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('11aIQTBMT1sjW4exxi7PP8OCUYPGYSgq83YSbsIO', NULL, '133.242.174.119', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiME9GSHdwdFVlaTZWMXlkTEtvMFhwOHZWMWhwVVRGZ2p1TmJDb1BBWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783098033),
('25YX84BMGNdTXa6mIZM48yPHJdA0iFMQQdopqXwz', NULL, '104.252.191.41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiN2NjTjBGWlpLdmkyVGZCbmVia1RZM3dUZ205TGFDSjU0MEk0Nng4QiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782909354),
('2chPzC2xz1gVuoZLzwrBCBoCMjdkWp9TeepUmUiY', NULL, '66.132.172.96', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoia1ZkOWY0aDZwc1BDWjZqWkFBZE51YnZXSHVnMnFrRERJNGR5bk5XMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783019269),
('37VdYqiUb9CAiouspc5JGcbsWe081VwiH7fuvJ72', NULL, '92.118.39.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSmo1VkJrWlprWmJQTFNmMFVUaEc1OWVWc1dOMlQ5ZWxmTFpXU0EzNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783543266),
('3etrSfRtsvWCDiOWVyhG8RA143U5oNDZGvlzv6Bi', NULL, '74.7.242.22', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.4; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRzVHaVdReW16VnV1b29YTGpNb1R3SHNRa1FMZmFNSzd4WjNVRHhSNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783674150),
('5PWtbrke3299hn2cJGN0pkr6md9eJY6wcRmxzqFS', NULL, '140.238.254.59', 'python-requests/2.31.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicjdyaER4Z0EyQzV0Vjg1WXY2NE9PVXRHMFEyZlVsRG80ZFlkQ2cwZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783159352),
('6ZuRD1KbbOkG4M2FWJQXr9zCS4kJrlpNhZMd2dWf', NULL, '154.28.229.82', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ3M0d1d0WVpLMnhzTlN2N0ZwZ0ZIWFFzWEJOZlNMaHJQZVpWU1YzMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905658),
('7cWLshMahSDKQSl7aepiI3Ng7kGNP9AaoXMoTxOP', NULL, '144.172.97.178', 'Python/3.13 aiohttp/3.14.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzhSckNXdlpaRnlJd2JzT1dzeDA4SE1MZXdsRlFCcnBoakExeWR0NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782908186),
('7mahrJyP4JKHQGurH1SMG69BrW34uFoAhHut5kCO', NULL, '45.156.87.177', 'Mozilla/5.0 (compatible; CT-WP-Scanner/1.0; +https://example.com/bot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieWpYckdkWEtxV0FvdG12a3Nma3h5Vm9qWnlCZ3ZqRkRtM0EzMW5ieCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905502),
('9IzsadoaKiPYCvNgjSR0iqDwYGxGtAZF8ahCMXeV', NULL, '34.148.58.193', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjZOcjI3cnhNRHR5enEySWZ0QUE1ZmZUU1pwNlZ6eWh2Z2FFN0xXRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782995534),
('9MGqvhSojDzzYtEBqN57w7Q9kiIgcTd4YmgcfBmf', NULL, '16.148.187.224', 'Mozilla/5.0 (compatible; wpbot/1.4; +https://forms.gle/ajBaxygz9jSR8p8G9)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWNNUlJCR0tWRExxYW9mNHhxbW9WbmtmdzcyTVprSUVtMFZ5bFVOQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783545491),
('bP7vJ1C6C4J1OiSbFdkAjEl2kS1U1kq69Tws2Rce', NULL, '35.200.145.136', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidHdKeG1yR3huUDNvMnRuZE1jZG5GTDBLZlFLNXhldEphMDMwM25GNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783165387),
('DmwaF6FQQ0foosMJhB6zDC6mOGQKtlNoxGQzkj29', NULL, '202.78.167.208', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVkVhTXNQQ0tXSkxEWFBKV0ZxUjNvc3E2eWRpTGNZNkJRYmhqUnpGeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905515),
('DNfKZB1VqfD2ajFNw3ubXiv3ByeLHdVYCBiOeyED', NULL, '103.196.9.244', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWUt4Z2ZzSVppaG9OVmhTeG9FeDFkODg5QnAwSEhLclJXdHp4SlVGaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905652),
('e4UMQGJFpKPGxaFkiOF7IsfQv8JTLsvtM97YfJLe', NULL, '74.7.241.63', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.4; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoib0JNUVVMVktqMnphWkplSHVYSW80dW5YazJITHR1R05MMVFYUURmayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782794685),
('eChNknWh5S40fJiCxgYGPmhhedpdY3ECBqoCN5gf', NULL, '204.76.203.56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEZzMW8yYTQ2RVBMVHdsQ21qWVpUU2x1MTlIVE5PREpBVENwOUNtayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783064454),
('fff2OM1pgKt9WTl0EDeHnfOkh5g3gDt0frpLAJXk', NULL, '34.241.251.95', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 Chrome/120 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkZISml2N2xYeTVyc2JNUVNoWVlsOHJHM3RwWjlrN0dJbVVidG00QyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905896),
('Fwf6Is8wIdf1M9IEYOOR085nKstmISxHeEvERiIN', NULL, '3.151.194.164', 'visionheight.com/scan Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZjVrSXMwZ1BRbUliNXB2VU56aUx3TFlKRG1QcDNSVlNkSzFoZGlHaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782819800),
('FZNynvzZs1hZDRSqEgqbwVt2w2MEej3HL082OTmx', NULL, '140.238.254.59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.113 Safari/537.36 Assetnote/1.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTJaTDV0ZG5ZWmxzMUpVc1d0dUg1UXVDRnVMamMxbUd6TFp2RHZZMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783159351),
('gBCLHcVHCdEiqDqKzmzNTVAUU6S1nJd75IBVUYvz', NULL, '92.118.39.126', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVk9QUU5rTTVrVTJaUFp0VEFMeXR6RElTVzd2cENURkprNjBRb3pJRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783458592),
('gyfFf5qRsNxpPmamAcoETF8lvhFKXB4Uh2ZXrkJK', NULL, '3.255.198.239', 'Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibTM2TWVmMkRZbVRzYXR3ZVVWVHlqOE05VU5udEhMUU9QS3hqd3JacSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783535102),
('h2h5Qb9ZsrUNBVtzpUKnjgYGodPPLizMJlwgf5yl', NULL, '178.105.99.125', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1 CibraxScanner/1.0 (+https://cibrax.com/scanner)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTBMa3lIcG5ndVZDR1NmOGtqVjNhemlRcUFvOVpzd3ZYdVUxNUZoSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905509),
('hMplC2gOEXWYvY8p21sMBUwI4NteGGHRrfVvifWe', NULL, '136.66.171.20', 'Mozilla/5.0 (compatible; CMS-Checker/1.0; +https://example.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGd0ek9OYmRGbGRzOVZWcnpoakh0aFhjcEFZYjc4TEdYQkhpanpLeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782995778),
('I8DNWjRsUudzJJLcfD7NFBAbxDvS1GVsifACRfPS', NULL, '100.51.194.111', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:128.0) Gecko/20100101 Firefox/128.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWhiRWhsRjQ4ZUdBSDY5QlY3ZzE5TzBoQkR6c2NDeGxvYUJnNkx5VSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782869292),
('IMdSQJvsTeKHkFwopQkQLUNSbav95FKuOLGiwhoW', NULL, '45.148.10.64', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTNKTENMNXR1UjFnQ2dyVmJ5T1dEOFlaN2dkVTFoNWRVU1BFdUxQZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783240009),
('JbUniocpR4VIf69dS2ptfkJfArBv4qeeU0XncGSK', NULL, '168.100.11.184', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3 Safari/605.1.15', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE4wVlA3MnFsc29ueVRUMGdPZlRHdU1veHVLWGVOckdSS0liSDZmTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782909169),
('jS3Pd1JNzhmhJk45IWJdDzrI6ijxkajYZBxGeDwL', NULL, '3.249.136.185', 'Mozilla/5.0 (compatible; NetcraftSurveyAgent/1.0; +info@netcraft.com)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiSzhyVmhHTmdWZXVtRjV1bWU1UHdRbFhqaWlqc1VyZDRhdnp1ckpwMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783733420),
('k4K7rVLTIZfmUjDnuNmIDJHWitTG0nEmycMsiZRQ', NULL, '134.199.233.221', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFBHTVZYaGVad3M0Q0NPaWxOalRmZXQ3VkR2QzltV2ttY2tiRkZTcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783149451),
('kklymyYczqcvDJEfBYaMZPdJ84vNTMEZkcmME6oc', NULL, '65.21.124.77', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibHRYckR6alNiV2pnZDczM1JZODl4ZGYzbkQybDBuckNEaldBc0NuTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905591),
('M9ClVEniwLQ7jNhDOJb3ZOWo3uKtx8J7jJT6yN4g', NULL, '3.229.8.174', 'Go-http-client/2.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlRQbVExcGxaMGlNeWZyamV1UHgyYWt4c3pIV0luenpLMEVFWFBINSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782961855),
('MividCxk4MA60SeodedyuVsojeBgznO9190Qat5e', NULL, '64.176.40.255', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWWJVWXNmMmJaTHc1STBqNmkzajB1ZlVNTEI4ZTVFVWcxZ2NMQXV5ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783015811),
('nJhWsYJOpWz8ZredloqLD8PyZH696BbLNEyQciXp', NULL, '199.45.155.89', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUFFsMkl4R1RUTWl2T2dtZmMyQ1RBUzhuZU5FMFlkcFhES2U4aTQ2ZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783646102),
('O055RXobKSh8qG3dHO5B7HlmKVvO5aht38MqlDoA', NULL, '154.28.229.82', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRk5FcGJRTElJMVhLTUc1ZmdMRFNUeTI5cE5mTjNtN1RLT1p5NXN6UyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905650),
('OFpVtBCKLgerLDJfLhoddGwuOKthTIroS3kOvhAB', NULL, '185.242.177.61', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNmp4ZGZqa05qUWROTEQ4QVREWkxjeWhvRk5zTnZvV1ljd3NRU1FhdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783218947),
('PZ5cD23zkYCXquRVGzuQql00o5L2zgKvWyseh8lF', NULL, '34.147.28.155', 'Scrapy/2.16.0 (+https://scrapy.org)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiamNJSDJRY29xbk16MUhQcjFqS3dTY2JGZktYaHkyZlI1SHVKRmhSbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782820181),
('rj1msKoz9cloZIXvvIZMnKF1Ef5S793YcDKccnAO', NULL, '103.4.251.73', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNjNtSnBTSnhoMjc1dXY1b003allobjJyTVdlQTlQQmFXUjRRUUp1ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782907284),
('Rna6qZrZElATDG4N2BWrwZ7PvddWfXYt2gMMitia', NULL, '161.35.105.6', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoicmlsN2x0ckR5MXZ0S1duVWhGaG5OQ3ZOSmVpNnUxNExHOVU5UGFjQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783229762),
('rr5fO4hz3dXD3YQehlydNRBfzGCtYhrQ9odg5HPg', NULL, '199.45.155.105', 'Mozilla/5.0 (compatible; CensysInspect/1.1; +https://about.censys.io/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidVlpTDV0ZElIY1pUQ1BOMWZNR21GTlExNE9RY255Vk5uM2poOFI1MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783705482),
('tB22epS7chBzxh8IkFPNK7cAWjgWt6OVVaVwTStL', NULL, '193.32.248.237', 'Mozilla/5.0 (Ubuntu; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDNyTHdHaG9BY1NSYUc2MHcyRlFXNnBUTWRjOFlWMmp2VE9Ub3EySSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905637),
('timz7cimXObpdvetxcG24IPfIGnGJMjTnObpk5cw', NULL, '149.50.96.188', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY05ydWk3QWhRaFNSUHJVYnBBcHVHY09ycUpiUTNybG84SWxXMEdKcCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782905671),
('TwvMG7cvLGw0YEYBV6EknS70kh7Z9kIJqwOFgOsT', NULL, '222.176.200.236', 'Mozilla/5.0 (Linux; U; Android 4.3; en-us; SM-N900T Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1EwUFRVMkw2SDdpM0RicVdyR3pMYTdLeFZYYTlvcnBkQXJHMWx5NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783534289),
('V3l85rINLztsu6t4bGUDK9xlHwRF2x2WcECRl02q', NULL, '182.242.168.177', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVpQUkpORjc0TDVYSWl4Z0pjaHFNblhBRTFsMUJUR3owd3dRMXdObSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783026990),
('VAK2Ai3mRyJUG3SlPMOgIvAZc6v52cdpdTrgLJkS', NULL, '104.252.191.246', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWkdiVXVoZGhiOUZQQ2tQT1k4dmgzT1NXM3dXRkx0ajNFcVFORDV1UiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782909354),
('vnC3ZnYji7nJY2y19u6hUYKqcz6CzSvrziAUucVP', NULL, '195.96.139.158', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibmxLVUdsM0VqYktqVTRTWUNUTHdibzdhbFFPSHNXS3hFM2o2ZFdMOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783725527),
('VW3bTfcOqPYHP8tf5uVIrQUtWQokv6cl05fP7Lx0', NULL, '103.4.251.147', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTWh6T3NqSk96c0tab3hzR3VPUDUxVDBPYjdVTVF5R0szQUE4RzFzdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782907286),
('wEKoG1TTnY1fek6OIcffNzDznBNRtU4ADURYOZWT', NULL, '133.242.174.119', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Mobile Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVE2NVFhS1ZUeFRRYW04Q2syVDlPSFZBZWlPanJvS0l3NGtBeHUzRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783337617),
('WpKz1UL5EHFXuGrw85f4mIbDqAOr9G9e5a6Tmxfc', NULL, '165.227.87.195', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVNEczBzY2g4UWJLUkxwSGZwdUF3QnE4Z3lsc05FZU9UTERieVc1OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782980893),
('XUSqYLiXvI2bMY3tmkEIL3ncrkVc5iuDMOR8hMiN', NULL, '185.242.177.64', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzlYWjRTM0lvT0tzTkh6RVAzcjR5UzBiaEt6SmlPTmlCT2pjUEhVeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783218946),
('YAihqtRNbh0EcPAOgU6cRQ0bNjJpcEBr5yLdNUbF', NULL, '104.252.191.41', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieFF2bjVieUtLRkYzQ0hyanYySnlncXM2MzBUdmlKMXZaVHhZYVZzMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782909368),
('yR1D9y6Og9bt6E5fFxCI2u4jAtmhethSuns1ipFg', NULL, '74.7.241.40', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; GPTBot/1.4; +https://openai.com/gptbot)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieDdKbWhwZTZGZ2hScVFzRUVYU0x1aldZTDk2Skt1bmxhYnJxMDFvbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783473609),
('yZ79IPZY2lHJwUoQLdtxEaEintwYe9y4KF0ZlRPR', NULL, '158.173.77.101', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:126.0) Gecko/20100101 Firefox/126.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZE1PUlFpN3Y2RjltYlZrVkswb3NrMmMyTGlKeGF1Z043cWt3OVFIOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783714608),
('ZgLyPeoLa1rbPkK9mwCaL9gYV4cBr0vTdFje9NV5', NULL, '103.4.251.147', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiakxLUndmODU0aVVacGxXUU1JRUhqbFVjV3d0RUNDR041aUw2d2VFdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1782907284),
('zjFzl9861bwpcvd9UVPK1mQJwxdrpyEIzGXEYx0z', NULL, '185.247.137.206', 'Mozilla/5.0 (compatible; InternetMeasurement/1.0; +https://internet-measurement.com/)', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnl2UFAyYVNXYVdiUURDOXB5N3JqUlRPV2xUcFBHVDhiZjllSG54OSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vYXBpdjEuYmlyLWVjb21tZXJjZS5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1783711543);

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(11) NOT NULL,
  `images` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `images`, `link`, `status`, `created_at`, `updated_at`) VALUES
(14, '/backend/slider_images/1772899438.jpg', 'https://birv2.futuregenit.com/category/category-grid?sub_slug=wd-40-multi-use-product-', 1, '2026-03-07 16:03:58', '2026-03-07 16:03:58'),
(15, '/backend/slider_images/1772899453.jpg', 'https://birv2.futuregenit.com/category/category-filter/?slug=vtech-silicon-rtv', 1, '2026-03-07 16:04:13', '2026-03-07 16:04:13'),
(16, '/backend/slider_images/1772899469.jpg', 'https://birv2.futuregenit.com/category/category-filter/?slug=foldable-clothes-drying-racks', 1, '2026-03-07 16:04:29', '2026-03-07 16:04:29');

-- --------------------------------------------------------

--
-- Table structure for table `slider_side_ads_models`
--

CREATE TABLE `slider_side_ads_models` (
  `id` int(11) NOT NULL,
  `adsOne` text NOT NULL,
  `adsTwo` text NOT NULL,
  `adsOneLink` varchar(255) DEFAULT NULL,
  `adsTwoLink` varchar(255) DEFAULT NULL,
  `Created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `slider_side_ads_models`
--

INSERT INTO `slider_side_ads_models` (`id`, `adsOne`, `adsTwo`, `adsOneLink`, `adsTwoLink`, `Created_at`, `Updated_at`) VALUES
(1, '/bannerImage/1771321578-ads1.gif', '/bannerImage/1771328476-ads2.gif', 'https://birv2.futuregenit.com/category/category-grid?sub_slug=wd-40-multi-use-product-', 'https://birv2.futuregenit.com/category/category-filter/?slug=nails-screws', '2024-03-03 06:14:03', '2026-03-07 16:02:42');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL COMMENT 'primary key of project table',
  `emp_id` varchar(255) DEFAULT NULL COMMENT 'primary key of employee table',
  `type` tinyint(4) DEFAULT 1,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `done_date` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 = Pending, 2 = Processing, 3 = Done',
  `email_files` varchar(3) DEFAULT 'No',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `project_id`, `emp_id`, `type`, `start_date`, `end_date`, `done_date`, `image`, `entry_by`, `status`, `email_files`, `created_at`, `updated_at`) VALUES
(1, 'bijon1114144', 'sdlkflskdfsdf\r\nsdf\r\nsdf', 3, '2', 1, '2023-07-19', '2023-07-26', NULL, '/backend/files/QESG49nK6XzDuTd953Lm.env', 1, 1, 'No', NULL, NULL),
(2, 'Tesssss', 'fasd', 4, '1', 1, '2023-07-14', '2023-07-28', NULL, '/backend/files/tAWzPRjL7xUKnSUcOpW3.env', 1, 2, 'No', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_setting`
--

CREATE TABLE `tbl_setting` (
  `name` varchar(255) NOT NULL,
  `deposit_service_charge` int(11) DEFAULT NULL COMMENT '%',
  `convert_php_amt` float DEFAULT NULL,
  `withdraw_service_charge` int(11) DEFAULT NULL COMMENT '%',
  `withdraw_minimum_amount` int(11) DEFAULT NULL,
  `minimum_trade_amount` int(11) DEFAULT NULL,
  `minimum_deposit_amount` int(11) DEFAULT NULL,
  `trade_fee` int(11) DEFAULT NULL COMMENT '%',
  `first_up_lin_com` int(11) DEFAULT NULL COMMENT '%',
  `second_up_lin_com` int(11) DEFAULT NULL COMMENT '%',
  `third_up_lin_com` int(11) DEFAULT NULL COMMENT '%',
  `trade_percent` int(11) DEFAULT NULL COMMENT '%',
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `hotline` varchar(255) NOT NULL,
  `emergency` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `copyright` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `admin_photo` varchar(244) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_phone` varchar(255) NOT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `pphoto` varchar(255) NOT NULL,
  `bg_color` varchar(255) DEFAULT NULL,
  `currency` varchar(150) DEFAULT NULL,
  `openinig_balance_date` date DEFAULT NULL,
  `reffer_bonus` int(11) DEFAULT NULL,
  `openinig_balance_comments` text DEFAULT NULL,
  `fblink` varchar(255) DEFAULT NULL,
  `twitterlink` varchar(255) DEFAULT NULL,
  `linkdinlink` varchar(255) DEFAULT NULL,
  `instragramlink` varchar(255) DEFAULT NULL,
  `store_policy` longtext DEFAULT NULL,
  `crypto_wallet_address` varchar(255) DEFAULT NULL,
  `master_pass_acc_no` varchar(255) DEFAULT NULL,
  `setting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `tbl_setting`
--

INSERT INTO `tbl_setting` (`name`, `deposit_service_charge`, `convert_php_amt`, `withdraw_service_charge`, `withdraw_minimum_amount`, `minimum_trade_amount`, `minimum_deposit_amount`, `trade_fee`, `first_up_lin_com`, `second_up_lin_com`, `third_up_lin_com`, `trade_percent`, `tel`, `email`, `address`, `hotline`, `emergency`, `photo`, `description`, `copyright`, `status`, `admin_photo`, `admin_name`, `admin_email`, `admin_phone`, `meta_keywords`, `meta_description`, `pphoto`, `bg_color`, `currency`, `openinig_balance_date`, `reffer_bonus`, `openinig_balance_comments`, `fblink`, `twitterlink`, `linkdinlink`, `instragramlink`, `store_policy`, `crypto_wallet_address`, `master_pass_acc_no`, `setting_id`) VALUES
('TRADING', 0, 64, 6, 10, 5, 10, 6, 9, 4, 3, 10, '+44245454545', 'info@abcd.com', 'Addres', '000000', '+000000', 'pic/2tAjiUpJ0X8GziIrKJJJ.png', 'Business Description', 'Copyright © 1995-2020 abc Inc. All Rights Reserved', 1, 'pic/ZOdc8nsWAMY1YELkp9zH.jpg', 'admin', 'info@admin.com', '+44245454545', NULL, NULL, '', '#ffffff', '£', '2020-05-13', 5, NULL, 'https://www.fiverr.com', 'https://www.facebook.com', 'https://web.whatsapp.com/', '#', '<p><strong>Cancellation / Return / Exchange Policy.</strong></p><p>We offer a minimum of 18 day returns guarantee on all our items and 30 day return on eligible items. If you are not completely satisfied with your item you may return the items to the seller, within the stipulated return period for a refund (&ldquo;money back guaranteed&rdquo;). Please, ensure you obtain a proof of return postage as items being returned are the responsibility of the customer until the items reach the seller. Refunds will take approximately 5 &ndash; 7 working days for the process once the goods have arrived to the seller. Sometimes it might take up to 30 days but in rare cases if you paid using credit card but in exceptional cases. We always advise payments are made through PayPal. Returned Items must be in their original packaging, and intact to avoid breakage in transit. . In the interest of hygiene, returns on earrings, cosmetics and underwear may not be accepted at any time. Swimwear may not be returned if the hygiene seal is broken. We guarantee to refund unworn or unwashed items when you return it in re-sellable condition,.</p><p><strong>Non-Returnable Items</strong></p><p>We don&rsquo;t accept returns for items such as food unless of course they&rsquo;re faulty. Our website and catalogue clearly show which items are excluded. If you&rsquo;re returning an electrical item, it must be unused and in its original sealed packaging.</p>', 'TPpMvdKfhENfJqYZsDJQLgEopMRBy15jeU', '225588996633', 1);

-- --------------------------------------------------------

--
-- Table structure for table `topheaderbanner`
--

CREATE TABLE `topheaderbanner` (
  `id` int(11) NOT NULL,
  `image` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topheaderbanner`
--

INSERT INTO `topheaderbanner` (`id`, `image`, `status`, `updated_at`, `created_at`) VALUES
(18, '/bannerImage/1772095068.gif', 'published', '2026-02-26 08:37:48', '2024-02-27 02:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `trackingevents`
--

CREATE TABLE `trackingevents` (
  `id` int(11) NOT NULL,
  `OrderID` text NOT NULL,
  `EventDate` timestamp NULL DEFAULT current_timestamp(),
  `EventDescription` varchar(255) DEFAULT NULL,
  `EventStatus` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL COMMENT '1= admin, 2= customer, 3=seller',
  `employee_id` int(11) DEFAULT NULL,
  `invite_code` varchar(255) DEFAULT NULL,
  `reffer_bonus` int(11) DEFAULT NULL,
  `join_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(225) DEFAULT NULL,
  `phone_number` varchar(225) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `address_1` text DEFAULT NULL,
  `country_1` varchar(255) DEFAULT NULL,
  `country_2` varchar(255) DEFAULT NULL,
  `address_2` text DEFAULT NULL,
  `address_3` text DEFAULT NULL,
  `website` varchar(225) DEFAULT NULL,
  `github` varchar(225) DEFAULT NULL,
  `twitter` varchar(225) DEFAULT NULL,
  `instagram` varchar(225) DEFAULT NULL,
  `facebook` varchar(225) DEFAULT NULL,
  `business_owner_name` varchar(255) DEFAULT NULL,
  `business_name` varchar(255) DEFAULT NULL,
  `business_name_slug` varchar(255) DEFAULT NULL,
  `business_register_num` varchar(255) DEFAULT NULL,
  `business_address` varchar(255) DEFAULT NULL,
  `business_warehouse_address` varchar(255) DEFAULT NULL,
  `phone_1` varchar(255) DEFAULT NULL,
  `phone_2` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `business_email` varchar(255) DEFAULT NULL,
  `business_phone` varchar(255) DEFAULT NULL,
  `business_return_name` varchar(255) DEFAULT NULL,
  `birthdate` varchar(255) DEFAULT NULL,
  `business_return_email` varchar(255) DEFAULT NULL,
  `landmark_2` varchar(255) DEFAULT NULL,
  `landmark_1` varchar(255) DEFAULT NULL,
  `business_return_address` varchar(255) DEFAULT NULL,
  `business_return_phone` varchar(255) DEFAULT NULL,
  `business_logo` varchar(255) DEFAULT NULL,
  `show_password` varchar(225) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `entry_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT 1,
  `home_status` int(11) DEFAULT NULL,
  `city_1` varchar(255) DEFAULT NULL,
  `city_2` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `employee_id`, `invite_code`, `reffer_bonus`, `join_id`, `name`, `first_name`, `last_name`, `email`, `image`, `phone_number`, `address`, `address_1`, `country_1`, `country_2`, `address_2`, `address_3`, `website`, `github`, `twitter`, `instagram`, `facebook`, `business_owner_name`, `business_name`, `business_name_slug`, `business_register_num`, `business_address`, `business_warehouse_address`, `phone_1`, `phone_2`, `gender`, `business_email`, `business_phone`, `business_return_name`, `birthdate`, `business_return_email`, `landmark_2`, `landmark_1`, `business_return_address`, `business_return_phone`, `business_logo`, `show_password`, `email_verified_at`, `password`, `remember_token`, `entry_by`, `created_at`, `updated_at`, `status`, `home_status`, `city_1`, `city_2`) VALUES
(1, 1, NULL, NULL, 75, 2, 'admin', '', '', 'admin@gmail.com', '/backend/files/TpBgBFtJZVnfGIjkKsS9.png', '968598989', '', '', '', '', '', '', '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', NULL, 'admin', NULL, '$2y$10$Nj1.lBwa3kRMEht8TQ/6Me8KFkx1Sd6o6DhBzs1iwsKt4xmMqQiJu', NULL, 1, '2023-12-17 02:13:10', '2026-03-01 05:07:47', 1, NULL, '', ''),
(2, 3, NULL, NULL, NULL, NULL, 'Bir Consumer', NULL, NULL, 'birconsumer@gmail.com', NULL, '01915728981', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$AhAAamJEkZJqGe58/eapxulyb.jwYivWYvxjzep77R4Q0VSHP0Nxa', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL),
(3, 3, NULL, NULL, NULL, NULL, 'Bir Tools', NULL, NULL, 'birtools@gmail.com', NULL, '01915728980', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$omMc4Er9OE5OgSQK3T/BCuqNtRQKSna8yKvB30jdKDFLG5lcFFraq', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL),
(4, 3, NULL, NULL, NULL, NULL, 'KGI HARDWARE ACCESSORIES LTD.', NULL, NULL, 'kgi@gmail.com', NULL, '01915728983', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$8skuvjMcW7vNBShoTzVJYe/0Uu4tOsSn5tOhBGaF.eatJ1HtUoFh.', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL),
(5, 3, NULL, NULL, NULL, NULL, 'BMI', NULL, NULL, 'bmi@gmail.com', NULL, '0169898989', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$PJOsolTbrmUFmZknLd0wteHkoLtxnrlalo5folPgeostx4oyhDV.q', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL),
(6, 2, NULL, '1772611648', NULL, 0, 'user', NULL, NULL, 'user@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user@gmail.com', NULL, '$2y$10$gizpOHUM7p1NedOnJO2jXOs2v6rRm4BxPGKxpq77JYc4X.oXchQBu', NULL, NULL, '2026-03-04 08:07:28', '2026-03-04 08:07:28', 1, NULL, NULL, NULL),
(7, 2, NULL, '1772717215', NULL, 0, 'alamin', NULL, NULL, 'alamin@gmail.com', NULL, NULL, NULL, 'null', NULL, NULL, 'null', 'null', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456', NULL, '$2y$10$yUqHcUio3K0zMvnoX5.b7O.GDll4W6LjM38sSJqIUCfhECH6u/uD.', NULL, NULL, '2026-03-05 13:26:55', '2026-03-05 13:26:55', 1, NULL, NULL, NULL),
(11, 2, NULL, '1772720121', NULL, 0, 'rana', '', '', 'rana@gmail.com', NULL, NULL, NULL, '', 'null', 'null', '', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', 'null', 'null', '1', '', '', '', 'null', '', 'null', 'null', '', '', NULL, 'rana@gmail.com', NULL, '$2y$10$59IDmXMZRXt4LBkR1xqi.eRhOo1hVgTOPwUnWoSl.YdGiUjPvH./y', NULL, NULL, '2026-03-05 14:15:21', '2026-03-05 14:15:21', 1, NULL, 'null', 'null'),
(15, 2, NULL, NULL, NULL, NULL, 'Rabeya', NULL, NULL, 'rabeya@gmail.com', NULL, '5989898999', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$lacZEQk3YZduhgjW5xb44u1cawaw2LwL9R2OUSLGkBpl3EAnxWCnG', NULL, NULL, '2026-03-05 14:22:48', '2026-03-05 14:22:48', 1, NULL, NULL, NULL),
(16, 2, NULL, '1772723548', NULL, 0, 'tamim', NULL, NULL, 'tamim@gmail.com', NULL, '019157289820', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'tamim@gmail.com', NULL, '$2y$10$A6DzIpOroUOERg7szlwCCObGaZGQ/E6zvgMkyaeokoH4qqy0NXimy', NULL, NULL, '2026-03-05 15:12:28', '2026-03-05 15:12:28', 1, NULL, NULL, NULL),
(17, 2, NULL, '1772723674', NULL, 0, 'hasan', NULL, NULL, 'hasan@gmail.com', NULL, '019157289823', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hasan@gmail.com', NULL, '$2y$10$cOKP.ccH3NjNgHkdi/QQJeaUrWkD1VqCFsQQzoLtHcfCv4ecw0nra', NULL, NULL, '2026-03-05 15:14:34', '2026-03-05 15:14:34', 1, NULL, NULL, NULL),
(18, 2, NULL, '1772723970', NULL, 0, 'kabir', '', '', 'kabir@gmail.com', NULL, NULL, NULL, '', 'null', 'null', '', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '123456789', 'null', '1', '', '', '', 'null', '', 'null', 'null', '', '', NULL, 'kabir@gmail.com', NULL, '$2y$10$k1x/CcesFVhRSfbu4oaDD.wH7oNiqdGrUd7RtGCPgiE5SDO4A60HG', NULL, NULL, '2026-03-05 15:19:30', '2026-03-05 15:19:30', 1, NULL, 'null', 'null'),
(19, 2, NULL, NULL, NULL, NULL, 'Kalam', NULL, NULL, 'kalam@gmail.com', NULL, '05454887878', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$iQnGKiJWX7xqeSuzNOe/TehbmEW8CMv75QM4onL4GCq.mUfWXL5Dm', NULL, NULL, '2026-03-10 07:08:38', '2026-03-10 07:08:38', 1, NULL, NULL, NULL),
(20, 2, NULL, NULL, NULL, NULL, 'df', NULL, NULL, 'df@gmail.com', NULL, 'df', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$HZIFQTxPRHVHF0FGlcFmtOHgmYGPX6ml7XhT8YYFKEsSh40R6FEaW', NULL, NULL, '2026-03-31 06:02:32', '2026-03-31 06:02:32', 1, NULL, NULL, NULL),
(21, 2, NULL, NULL, NULL, NULL, 'Test', NULL, NULL, 'test@gmail.com', NULL, '59797979', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$10$ucRBQaluaWrF8LdgxQ6H6OpW7ABo804s3qHnvsem3zbJElrttYE86', NULL, NULL, '2026-04-15 23:50:08', '2026-04-15 23:50:08', 1, NULL, NULL, NULL),
(22, 2, NULL, NULL, NULL, NULL, 'Test1', NULL, NULL, 'test3434@gmail.com', NULL, '259898989', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$dG75Ks/knE8dysQ9yY8Vaeez0mNAG6COfA2BjrPMVLOG4S7IJAAj.', NULL, NULL, '2026-04-16 00:04:37', '2026-04-16 00:04:37', 1, NULL, NULL, NULL),
(23, 2, NULL, NULL, NULL, NULL, 'Mrs. Ayesha', NULL, NULL, 'ayesa@gmail.com', NULL, '01988876927', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$1IIOXMUil/22x.UiTEz6KefxrSCHqqmTgtyoxJAJwu3tqz/139Vhy', NULL, NULL, '2026-04-16 03:54:16', '2026-04-16 03:54:16', 1, NULL, NULL, NULL),
(24, 2, NULL, NULL, NULL, NULL, 'ayan', NULL, NULL, 'ayan@gmail.com', NULL, '01915728982', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$Msm8jw3JPUSdsxvxtCFXcuSiJ44nHyAByvC3vpkO7gD0DVoM8k66S', NULL, NULL, '2026-04-16 04:42:51', '2026-04-16 04:42:51', 1, NULL, NULL, NULL),
(25, 2, NULL, NULL, NULL, NULL, 'sdf', NULL, NULL, 'sdf@gmailc.com', NULL, '878787', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$WDjuEsVxDi0sv55BlFrfLuXNmVLhTdJRXGp1NvBvsw.Cg0hfvGXXO', NULL, NULL, '2026-04-16 04:48:49', '2026-04-16 04:48:49', 1, NULL, NULL, NULL),
(26, 2, NULL, NULL, NULL, NULL, 'joynal', NULL, NULL, 'joynal111@gmail.com', NULL, '01915725555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$8rAaIZxVvxp03D6TAS0MEuB0N.SwtNp43RAdghiQJSPIhafNBN9be', NULL, NULL, '2026-04-16 04:50:52', '2026-04-16 04:50:52', 1, NULL, NULL, NULL),
(27, 2, NULL, NULL, NULL, NULL, 'Ibraheem', NULL, NULL, '56ibraheem@gmail.com', NULL, '01915728988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$iReLeqTPAkOlFSlnTGKN/uMV4WxuFzQmJosswfUJ5iGq0HpvmF2Ze', NULL, NULL, '2026-04-16 08:24:49', '2026-04-16 08:24:49', 1, NULL, NULL, NULL),
(28, 2, NULL, NULL, NULL, NULL, 'tessss', NULL, NULL, 'test456@gmail.com', NULL, '23487923874', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$HWBJeZTNWyzt4erC.0ql.e.9FiDi44mXX8OgSb2t0RR6q11wkJ7va', NULL, NULL, '2026-04-16 08:25:49', '2026-04-16 08:25:49', 1, NULL, NULL, NULL),
(29, 2, NULL, NULL, NULL, NULL, 'test15666', NULL, NULL, 'test15666@gmail.com', NULL, '9989899889', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$5yEoDNf.iBSItZG2T3euT.NcjxwjpwQPhuL.ZOLifRjck5.XvHnQq', NULL, NULL, '2026-04-21 07:53:48', '2026-04-21 07:53:48', 1, NULL, NULL, NULL),
(30, 2, NULL, '1777880453', NULL, 0, 'Sayed Shahidul Alam', NULL, NULL, 'ssalam247144@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'qqqqwwww1234', NULL, '$2y$12$Pf2fRbqyUL5to1qea1d16u66wNTrPPJ6BHuivLQrXXl3vN9mmdDvu', NULL, NULL, '2026-05-04 14:40:54', '2026-05-04 14:40:54', 1, NULL, NULL, NULL),
(31, 2, NULL, NULL, NULL, NULL, 'Rubel Das', NULL, NULL, 'rubeldas335@gmail.com', NULL, '01834260300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$wN/zI8hVUYPLwax6u0wVQuXnEBjkrZb.R2Brf2rZTJuTgb8C46sTK', NULL, NULL, '2026-05-05 00:55:13', '2026-05-05 00:55:13', 1, NULL, NULL, NULL),
(32, 3, NULL, NULL, NULL, NULL, 'Kai Project Management Servicess Ltd', NULL, NULL, 'marketing@birgh.net', NULL, '01704168997', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$CncF0CLKol9AfquiTgRXhOvRzhPt3z7nNRT.kX625QBYp0a2ZCFpC', NULL, 1, NULL, NULL, 1, NULL, NULL, NULL),
(33, 2, NULL, NULL, NULL, NULL, 'Sohag', NULL, NULL, 'amisohag07@gmail.com', NULL, '01768860335', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$P9Ee0kZkk.uxs807HoiUyekjPucJjcLgZiA9VZUv8Gg0ETBIojN2K', NULL, NULL, '2026-05-13 11:18:00', '2026-05-13 11:18:00', 1, NULL, NULL, NULL),
(34, 2, NULL, NULL, NULL, NULL, 'Mr Rahat', NULL, NULL, 'abc.sudo@gmail.com', NULL, '01304275857', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$lJvwaMFBq9wnGg6mDlQMLuAXR50lNHCIBDHohvOxWorPw/Otjn1y2', NULL, NULL, '2026-06-03 03:49:00', '2026-06-03 03:49:00', 1, NULL, NULL, NULL),
(35, 2, NULL, '1781104620', NULL, 0, 'Shourav pal', '', '', 'shouravk.2017@gmail.com', NULL, NULL, NULL, '', 'null', 'null', '', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '01798402598', 'null', '1', '', '', '', '2000-09-12', '', 'null', 'null', '', '', NULL, '123456789', NULL, '$2y$12$kBdGijNEIiHUfzA4Lr/K7ODyhDl0HPDJmgDjMkrAdaslmplxk1h6S', NULL, NULL, '2026-06-10 22:17:01', '2026-06-10 22:17:01', 1, NULL, 'null', 'null'),
(36, 2, NULL, '1781430560', NULL, 0, 'Prokash Deb', NULL, NULL, 'prokashdeb09@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'selp890', NULL, '$2y$12$weuVS.TFvQrUIDAKB9zFM.mzZIn8TZFJr0UhMVPJdIwUNKsdN177S', NULL, NULL, '2026-06-14 16:49:20', '2026-06-14 16:49:20', 1, NULL, NULL, NULL),
(37, 2, NULL, NULL, NULL, NULL, 'kawsar ahmed', NULL, NULL, 'sdsfa@ssfa.com', NULL, '01575124473', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$wTOOH3u754LXh6.b8YfvgOTy0jytNN0mm/8QqFVpExx29D407zl/u', NULL, NULL, '2026-06-24 15:47:07', '2026-06-24 15:47:07', 1, NULL, NULL, NULL),
(38, 2, NULL, NULL, NULL, NULL, 'Mehedi', NULL, NULL, 'mh110340@gmail.com', NULL, '01845659940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$j.hX435yfJGSdKSw5zhkOezxWPpG7BZq6hLonCPeV3b3I/oAI5z4u', NULL, NULL, '2026-07-06 17:09:33', '2026-07-06 17:09:33', 1, NULL, NULL, NULL),
(39, 2, NULL, NULL, NULL, NULL, 'Mohammad Shiblee Hasan', NULL, NULL, 'shiblee_hasan@yahoo.com', NULL, '01611200935', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$98CZncXUfNMr4FmkTapw4O5u/LOruoUHRlW6WHukKUBqSUBVIG2L2', NULL, NULL, '2026-07-07 13:22:33', '2026-07-07 13:22:33', 1, NULL, NULL, NULL),
(40, 2, NULL, NULL, NULL, NULL, 'Rupam', NULL, NULL, '01791122307_6a4dd78c39cb4@gmail.com', NULL, '01791122307', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$uS67S36QtwO3CSZzotVz9OC3RF7c4DpBduwJNy3uz2TGs5GBMi1Dq', NULL, NULL, '2026-07-08 11:52:28', '2026-07-08 11:52:28', 1, NULL, NULL, NULL),
(41, 2, NULL, '1783580525', NULL, 0, 'Dr Md Tafiqul Islam', '', '', 'tafiqulssansh@gmail.com', NULL, NULL, NULL, '', 'null', 'null', '', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '01785837630', 'null', '1', '', '', '', 'null', '', 'null', 'null', '', '', NULL, 'tasnim223344@', NULL, '$2y$12$ow7rU4ae15nFTjEY5bCgsOcjIDw3Qx0lYZJ.yKMgh7iQd3viBbvbu', NULL, NULL, '2026-07-09 14:02:06', '2026-07-09 14:02:06', 1, NULL, 'null', 'null'),
(42, 2, NULL, '1783596150', NULL, 0, 'Kaiser Ahmed', '', '', 'kaiser.ahmed@gmail.com', NULL, NULL, NULL, '', 'null', 'null', '', NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, '', '01713389850', '', '1', '', '', '', 'null', '', 'null', 'null', '', '', NULL, 'f+K?t.J%]', NULL, '$2y$12$v.cpUiDLr8BtM4YsrxS.fOsp7qUgxzV/wSlJnIXDYeytOARvlIu9a', NULL, NULL, '2026-07-09 18:22:30', '2026-07-09 18:22:30', 1, NULL, 'null', 'null'),
(43, 2, NULL, NULL, NULL, NULL, 'Farah Hossain', NULL, NULL, 'Farah.sub.billing@gmail.com', NULL, '01849747744', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$E/nOINv42WDXPV5jZi8lC.sNF8Uy4d8TZBA1misMRB8DdNEBRZY.O', NULL, NULL, '2026-07-10 12:13:14', '2026-07-10 12:13:14', 1, NULL, NULL, NULL),
(44, 2, NULL, NULL, NULL, NULL, 'Tuhin', NULL, NULL, 'tuhinmedia.01@gmail.com', NULL, '01682674158', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$I67WE0SSJwklwhL4.N4kMeAA9OnwEY1EKC/houPbCMWowpQkIQSaq', NULL, NULL, '2026-07-10 17:04:00', '2026-07-10 17:04:00', 1, NULL, NULL, NULL),
(45, 2, NULL, NULL, NULL, NULL, 'Mahir sadman Samin', NULL, NULL, 'samsamin127@gmail.com', NULL, '01620551475', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$DiCU2aqjXBXaJ.lAWY1RZ.dDGgWJVpnorZ45DBXqA2jB9q3qfd2YK', NULL, NULL, '2026-07-10 17:21:45', '2026-07-10 17:21:45', 1, NULL, NULL, NULL),
(46, 2, NULL, NULL, NULL, NULL, 'সুমন', NULL, NULL, '1750195522_6a50cb6be6531@gmail.com', NULL, '1750195522', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$C0MEHvBXFQTnFE0tH0QIYeUbhzP7iGoeLLSsNK/nyDLSfL2zAE/gq', NULL, NULL, '2026-07-10 17:37:32', '2026-07-10 17:37:32', 1, NULL, NULL, NULL),
(47, 2, NULL, NULL, NULL, NULL, 'Zafir Huq', NULL, NULL, 'zafir.huq@gmail.com', NULL, '8801715657790', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$2WigR2XaooWYJgZuzCZIMuACu3tbBZ1G9X8l.bEf9IyOHiLCXzgcC', NULL, NULL, '2026-07-10 23:01:12', '2026-07-10 23:01:12', 1, NULL, NULL, NULL),
(48, 2, NULL, NULL, NULL, NULL, 'Rashedur Rahman', NULL, NULL, 'rashed.rahaman1@gmail.com', NULL, '01814411691', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '$2y$12$MkpHbMqDeaA0gbkrG0294.olqtGCxHtxnY816VV38Bzuup.H6IfC6', NULL, NULL, '2026-07-11 16:58:26', '2026-07-11 16:58:26', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `customer_id`, `product_id`, `created_at`, `updated_at`) VALUES
(4, 16, 12, '2024-02-19 11:42:04', '2024-02-19 11:42:04'),
(5, 16, 13, '2024-02-19 11:42:18', '2024-02-19 11:42:18'),
(6, 1, 217, '2024-04-04 20:44:44', '2024-04-04 20:44:44'),
(7, 1, 211, '2024-04-04 20:45:18', '2024-04-04 20:45:18'),
(8, 1, 16, '2024-04-04 20:46:02', '2024-04-04 20:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `___pathao_tokens`
--

CREATE TABLE `___pathao_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `access_token` text NOT NULL,
  `refresh_token` text NOT NULL,
  `expires_in` int(11) NOT NULL,
  `expires_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `___pathao_tokens`
--

INSERT INTO `___pathao_tokens` (`id`, `access_token`, `refresh_token`, `expires_in`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzNTIiLCJhdWQiOlsiMjY3Il0sImV4cCI6MTc4NTMxNDU2MywibmJmIjoxNzc3NTM4NTYzLCJpYXQiOjE3Nzc1Mzg1NjMsImp0aSI6ImQ0YzM0MTM5YjY1OGY0MWEzNzRhMTg0MzExMDcyZjViYWNiM2Y1M2E2ZmU0ZTJhMGY1MjY2MWY4M2YwMjRmNTYiLCJtZXJjaGFudF9pZCI6Iks0b2VFOWtlMEIiLCJzY29wZXMiOltdfQ.Jy9lJfGHnuyxNzGjE3Ndw9x124jQrylJcMnIObXtua3tVeAL5A6DoW3IiBgIFYcwzQ7aBj7FIjQBmcu5I4XUdjhrOJ6RE6LX1wTqRq4myhGGK1RjcWp2fQE5mfNK7yIN_GA_SLLevAnL_pFTA7dcq0gDesjBuKBI0VEdfIzZ-hrnJVJHAJkgpqz8nKkDQCudSjvJVGKk_wzGb95gBLGruJI2J9bzBecFf88_IoitIMyfOTB0lIg4PtJcr-pbV9ysunX52i9vGxb-bKNFxHGOsRRHzMUUgBFe8l1FN0vyVcBapVBqdIP537bDTjVGhfRth7bKxfbELc8l8nUyJi3_7qKXu4_yMHQsymKCY19x2ztfhDxzIK4uVxct-LH17ouI10ZGJhU3086l42fiR8wVgh3FjCJE-galqlqOn2C7mo1uNyJdkpdSbCydeIqd72yzfSLWRatvQYqofAhzeXeomGXW7X516Npe91SYAUG9as19zCLvu2SkDvq4Zi4J4lfV-LgWXQ7uFryO8NvuJns2CLsiB-SCKH3d6uykwXwMFEN81G1POLoCq_T47doEVDkZK9HrHjeILhH1B1bHMwGM7Nd7cjqqHveCvGZ8UdAmi22oawzwSqBHm_fJu9BQAxXqaeqLu6jvbk8oKgMyOvjd82x2889BiLj92VhS3HA8sfc', 'def50200749ae4d8fe1d3a880cdeeac36e0833f1fd5e2613d584c90999610fa142d7e223baa4dd035358b2a590b2dcb120de9d1bd4a0e3c3015ca1ba169e7b459c547cd0a0231dcac32e9e0db26eeb0ba661bf0cccc1425fe7a313ff048c8667c8c84541b7935c17e0c9cf0f15b64d014630dcd3096b836ebbc7a99c3e1ee7e29dc6f0c36fcd7f61a010bdf33a4299c032482cdc297f563d73221a0d7376ecd583610afaf6c81b28d95795ac6020336341d2601a2110d4b9f1cf6f8cc75923d943b74f7546efa153f980df978b6ac0a6654643d4589e4d322ebeaac79dd1a2acfc430ef7a430e58ccbb5ba6c6730f1905a766cf60255b87ca3579bed59c29dae5880a0097531f344f46420c2d0dc815ca570542329c6665ede3303985a53442434d5b06e18e2f32c4dbe3ed07b04000b8c4d4c5d6522bf1a5e0117b31b28c573728b864c5fb9e19cc8f0998597c5e7b6ba372c55f9a144d83f', 7776000, '2026-07-29 02:42:43', '2026-04-30 02:42:43', '2026-04-30 02:42:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `annual_pay`
--
ALTER TABLE `annual_pay`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apply_job`
--
ALTER TABLE `apply_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes_values`
--
ALTER TABLE `attributes_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_master`
--
ALTER TABLE `bank_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bank_short_code`
--
ALTER TABLE `bank_short_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogcategorys`
--
ALTER TABLE `blogcategorys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug_unique` (`slug`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_commission_history`
--
ALTER TABLE `category_commission_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat_messages`
--
ALTER TABLE `chat_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_buyer_id` (`buyer_id`),
  ADD KEY `idx_seller_id` (`seller_id`),
  ADD KEY `idx_sender_id` (`sender_id`);

--
-- Indexes for table `circumstances`
--
ALTER TABLE `circumstances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `promocode` (`promocode`);

--
-- Indexes for table `couponusehistorys`
--
ALTER TABLE `couponusehistorys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dealsbanners`
--
ALTER TABLE `dealsbanners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_docs`
--
ALTER TABLE `employee_docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_holidays`
--
ALTER TABLE `employee_holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_employee_holidays_used_holiday` (`used_holiday`);

--
-- Indexes for table `employee_leave_request`
--
ALTER TABLE `employee_leave_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_type`
--
ALTER TABLE `employee_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `holiday`
--
ALTER TABLE `holiday`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_product_slider_category`
--
ALTER TABLE `home_product_slider_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_allocation`
--
ALTER TABLE `leave_allocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_list`
--
ALTER TABLE `leave_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_rule`
--
ALTER TABLE `leave_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_type`
--
ALTER TABLE `leave_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_history`
--
ALTER TABLE `order_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pathao_tokens`
--
ALTER TABLE `pathao_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_environment` (`environment`);

--
-- Indexes for table `payment_type`
--
ALTER TABLE `payment_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_pay_item`
--
ALTER TABLE `payroll_pay_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pay_group`
--
ALTER TABLE `pay_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `product_attributes`
--
ALTER TABLE `product_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_attributes_values_history`
--
ALTER TABLE `product_attributes_values_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_variants_history`
--
ALTER TABLE `product_variants_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warranty`
--
ALTER TABLE `product_warranty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_warranty_history`
--
ALTER TABLE `product_warranty_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produc_categories`
--
ALTER TABLE `produc_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produc_img_history`
--
ALTER TABLE `produc_img_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rule`
--
ALTER TABLE `rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seller_ads`
--
ALTER TABLE `seller_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_message`
--
ALTER TABLE `send_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slider_side_ads_models`
--
ALTER TABLE `slider_side_ads_models`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `topheaderbanner`
--
ALTER TABLE `topheaderbanner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trackingevents`
--
ALTER TABLE `trackingevents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `business_name_slug` (`business_name_slug`),
  ADD UNIQUE KEY `phone_number` (`phone_number`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `___pathao_tokens`
--
ALTER TABLE `___pathao_tokens`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `annual_pay`
--
ALTER TABLE `annual_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `apply_job`
--
ALTER TABLE `apply_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `attributes_values`
--
ALTER TABLE `attributes_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `bank_master`
--
ALTER TABLE `bank_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `bank_short_code`
--
ALTER TABLE `bank_short_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blogcategorys`
--
ALTER TABLE `blogcategorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `category_commission_history`
--
ALTER TABLE `category_commission_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `chat_messages`
--
ALTER TABLE `chat_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `circumstances`
--
ALTER TABLE `circumstances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `couponusehistorys`
--
ALTER TABLE `couponusehistorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealsbanners`
--
ALTER TABLE `dealsbanners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `employee_docs`
--
ALTER TABLE `employee_docs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_holidays`
--
ALTER TABLE `employee_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `employee_leave_request`
--
ALTER TABLE `employee_leave_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `employee_type`
--
ALTER TABLE `employee_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holiday`
--
ALTER TABLE `holiday`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `home_product_slider_category`
--
ALTER TABLE `home_product_slider_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `leave_allocation`
--
ALTER TABLE `leave_allocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_list`
--
ALTER TABLE `leave_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leave_rule`
--
ALTER TABLE `leave_rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_type`
--
ALTER TABLE `leave_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `orders_product`
--
ALTER TABLE `orders_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `order_history`
--
ALTER TABLE `order_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pathao_tokens`
--
ALTER TABLE `pathao_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_type`
--
ALTER TABLE `payment_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payroll_pay_item`
--
ALTER TABLE `payroll_pay_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pay_group`
--
ALTER TABLE `pay_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT for table `product_attributes`
--
ALTER TABLE `product_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_attributes_values_history`
--
ALTER TABLE `product_attributes_values_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_variants_history`
--
ALTER TABLE `product_variants_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `product_warranty`
--
ALTER TABLE `product_warranty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_warranty_history`
--
ALTER TABLE `product_warranty_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produc_categories`
--
ALTER TABLE `produc_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- AUTO_INCREMENT for table `produc_img_history`
--
ALTER TABLE `produc_img_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rule`
--
ALTER TABLE `rule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `salary`
--
ALTER TABLE `salary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seller_ads`
--
ALTER TABLE `seller_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `send_message`
--
ALTER TABLE `send_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `slider_side_ads_models`
--
ALTER TABLE `slider_side_ads_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_setting`
--
ALTER TABLE `tbl_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `topheaderbanner`
--
ALTER TABLE `topheaderbanner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `trackingevents`
--
ALTER TABLE `trackingevents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `___pathao_tokens`
--
ALTER TABLE `___pathao_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
