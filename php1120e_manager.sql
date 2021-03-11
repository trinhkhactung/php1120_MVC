-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 11, 2021 at 02:26 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php1120e_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `facultys`
--

CREATE TABLE `facultys` (
  `id` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `facultys`
--

INSERT INTO `facultys` (`id`, `title`, `description`, `created_at`) VALUES
(1, 'Công nghệ thông tin', 'Mô tả khoa công nghệ thông tin', '2021-01-19 19:44:49'),
(2, 'Kế toán kiểm toán', 'Mô tả khoa Kế toán kiểm toán', '2021-01-19 19:44:49'),
(3, 'Khoa thiết kế đồ họa', 'Mô tả Khoa thiết kế đồ họa', '2021-01-19 19:44:49'),
(5, 'Khoa điện tử', 'Mô tả khoa điện tử', '2021-01-21 19:23:05'),
(6, 'Khoa điện tử', 'Mô tả khoa điện tử', '2021-03-01 19:45:52');

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE `points` (
  `students_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `point` float NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `points`
--

INSERT INTO `points` (`students_id`, `subject_id`, `point`, `created_at`) VALUES
(1, 1, 100, '2021-01-19 19:48:58'),
(3, 2, 90, '2021-01-19 19:49:18'),
(2, 2, 75, '2021-01-19 19:49:57'),
(1, 2, 95, '2021-01-19 20:49:13');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `facultys_id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `addres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `facultys_id`, `name`, `phone`, `email`, `addres`, `status`, `created_at`) VALUES
(1, 1, 'Trịnh Khắc Tùng', '0989888999', 'khactung7@gmail.com', 'Hà Nội', 1, '2021-01-19 19:46:14'),
(2, 2, 'Cao Văn Nam 1', '0987656999', 'vannam@gmail.com', 'Hà Trung', 1, '2021-01-19 19:46:14'),
(3, 3, 'Trần Công Minh', '0989789999', 'congminh@gmail.com', 'Hà Trung', 1, '2021-01-19 19:46:14');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `times` tinyint(4) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `title`, `times`, `created_at`) VALUES
(1, 'Lập trình PHP', 60, '2021-01-05 19:48:10'),
(2, 'Thiế kế Photoshop', 70, '2021-01-05 19:48:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `passw` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bytes` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `addres` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `passw`, `bytes`, `addres`, `status`, `created_at`) VALUES
(1, 'Adminstrator', '0989888999', 'admin@gmail.com', '1edea1f77f9bfaad1dc1768456649d2c', '2134ergerg5464*()', 'Hà Nội', 1, '2021-01-21 19:53:20'),
(2, 'Tung TK', '0987867989', 'tungtk@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '', 'Hà Nội', 1, '2021-01-21 19:53:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `facultys`
--
ALTER TABLE `facultys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
  ADD KEY `students_id` (`students_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `facultys_id` (`facultys_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `facultys`
--
ALTER TABLE `facultys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `points`
--
ALTER TABLE `points`
  ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`students_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `points_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `frk_studen_faculty` FOREIGN KEY (`facultys_id`) REFERENCES `facultys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
