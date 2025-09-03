-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 03, 2025 at 03:48 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `income_expense_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `lists`
--

CREATE TABLE `lists` (
  `todo_id` int(11) NOT NULL,
  `todo_text` varchar(20) NOT NULL,
  `todo_status` varchar(20) NOT NULL,
  `todo_mobile` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lists`
--

INSERT INTO `lists` (`todo_id`, `todo_text`, `todo_status`, `todo_mobile`) VALUES
(1, 'test', 'In progress', '7879798798'),
(7, 'Java', 'In progress', '7887687664'),
(8, 'Python', 'In progress', '8888888888'),
(9, 'Javascript', 'Completed', '9999999999'),
(10, 'HTML', 'Completed', '4444444444'),
(11, 'CSS', 'Completed', '5555555555'),
(12, 'REACT', 'Completed', '7777777777'),
(13, 'jhjh', 'Completed', '7879798798'),
(14, 'hghjghjg', 'Completed', '7879798798'),
(15, 'tyytytyut123', 'Completed', '6666666688');

-- --------------------------------------------------------

--
-- Table structure for table `rem`
--

CREATE TABLE `rem` (
  `rem_id` int(11) NOT NULL,
  `rem_start` date NOT NULL,
  `rem_end` date NOT NULL,
  `rem_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rem`
--

INSERT INTO `rem` (`rem_id`, `rem_start`, `rem_end`, `rem_desc`) VALUES
(32, '2024-03-23', '2024-03-26', 'fgfdgfdg'),
(33, '2025-09-02', '2025-09-06', 'testing123');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `task_id` int(11) NOT NULL,
  `task_date` date NOT NULL,
  `task_stime` time NOT NULL,
  `task_etime` time NOT NULL,
  `task_desc` text NOT NULL,
  `task_priority` varchar(25) NOT NULL,
  `todo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`task_id`, `task_date`, `task_stime`, `task_etime`, `task_desc`, `task_priority`, `todo_id`) VALUES
(3, '2024-03-14', '14:42:00', '22:42:00', 'gfhgf', 'high', 7),
(4, '2024-04-06', '13:16:00', '12:16:00', 'gfhfghgf', 'medium', 7),
(5, '2025-09-03', '20:01:00', '22:01:00', 'testing123', 'low', 0);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `testid` int(11) NOT NULL,
  `test_name` varchar(20) NOT NULL,
  `status` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `tansid` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `paymentMode` varchar(50) NOT NULL,
  `cdate` date NOT NULL,
  `amount` float NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`tansid`, `category`, `label`, `paymentMode`, `cdate`, `amount`, `type`) VALUES
(9, 'Foods', 'ghgg', 'Cash', '2024-02-24', 6565, 0),
(10, 'Business', 'money', 'Bank', '2024-02-26', 4000, 0),
(12, 'Foods', 'gjhhy', 'Bank', '2024-03-21', 776, 0),
(13, 'Shopping', 'Shyam', 'Cheque', '2024-03-27', 4000, 1),
(15, 'Foods', 'ytytrytry', 'Cheque', '2024-03-27', 600, 1),
(16, 'Debt', 'retretr', 'Cheque', '2024-03-27', 8000, 0),
(17, 'Gift', 'jhgjhgj', 'Cash', '2024-03-21', 10000, 1),
(18, 'Others', 'tyty', 'Cheque', '2024-03-29', 4000, 1),
(19, 'Salary', 'jgjghj', 'Cash', '2024-03-30', 1000, 0),
(20, 'Business', 'tgyhtytr', 'Cash', '2024-03-20', 7000, 1),
(21, 'Business', 'bnbb', 'Bank', '2024-03-20', 4000, 0),
(22, 'Gift', 'Buy gift for my mother', 'Cash', '2024-05-17', 1000, 0),
(23, 'Loan', 'Ram', 'Cheque', '2024-05-17', 5000, 1),
(24, 'Gift', 'testting', 'Cash', '2025-04-20', 100, 0),
(25, 'Shopping', 'test6565', 'Cash', '2025-09-02', 87, 0),
(26, 'Foods', '10testing', 'Bank', '2025-09-03', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Sno` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Sno`, `email`, `password`, `dt`) VALUES
(1, 'user@gmail.com', '12345678', '2023-12-08 22:12:57'),
(2, 'ghgh@gmail.com', '', '2023-12-08 22:16:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`todo_id`);

--
-- Indexes for table `rem`
--
ALTER TABLE `rem`
  ADD PRIMARY KEY (`rem_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`task_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`testid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`tansid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lists`
--
ALTER TABLE `lists`
  MODIFY `todo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `rem`
--
ALTER TABLE `rem`
  MODIFY `rem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `testid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `tansid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
