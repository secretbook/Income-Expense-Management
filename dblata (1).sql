-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2025 at 11:48 AM
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
-- Database: `dblata`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_master`
--

CREATE TABLE `bank_master` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(50) NOT NULL,
  `bank_ac` varchar(110) NOT NULL,
  `ifsc` varchar(100) NOT NULL,
  `bank_address` text NOT NULL,
  `bank_date` date NOT NULL,
  `bank_amount` double NOT NULL,
  `createdby` int(11) NOT NULL,
  `lastupdated` date NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `createdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bank_master`
--

INSERT INTO `bank_master` (`bank_id`, `bank_name`, `bank_ac`, `ifsc`, `bank_address`, `bank_date`, `bank_amount`, `createdby`, `lastupdated`, `ipaddress`, `createdate`) VALUES
(0, 'CASH', '0', '0', '-', '2024-02-01', 200, 1, '2024-02-01', '192.168.0.17', '2024-02-01 11:07:15'),
(1, 'SBI', '39003730650', 'SBIN0016156', 'New Rajendra Nagar, Raipur, C. G.', '2024-02-01', 1000, 1, '2024-07-10', '192.168.0.19', '2024-02-25 15:04:50');

-- --------------------------------------------------------

--
-- Table structure for table `card_assign`
--

CREATE TABLE `card_assign` (
  `card_assign_id` int(11) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `valid_upto` varchar(11) NOT NULL,
  `value_of_card` varchar(100) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `cost_of_card` varchar(100) NOT NULL,
  `assign_date` date NOT NULL,
  `expiry_date` date NOT NULL,
  `card_number` varchar(11) NOT NULL,
  `pay_mode` varchar(50) NOT NULL,
  `amount` double NOT NULL,
  `is_expired` int(10) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card_assign`
--

INSERT INTO `card_assign` (`card_assign_id`, `package_name`, `valid_upto`, `value_of_card`, `customer_id`, `cost_of_card`, `assign_date`, `expiry_date`, `card_number`, `pay_mode`, `amount`, `is_expired`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(1, '6', '91', '2500', 1, '2000', '2024-07-11', '2024-10-10', '1', 'cash', 2000, 0, '192.168.0.11', 0, '2024-07-23', '0000-00-00'),
(2, '7', '182', '7000', 20, '5000', '2024-07-25', '2025-01-23', '400', 'card', 300, 0, '192.168.0.24', 0, '2024-07-26', '2024-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `card_offer`
--

CREATE TABLE `card_offer` (
  `card_id` int(11) NOT NULL,
  `package_name` varchar(50) NOT NULL,
  `card_cost` varchar(30) NOT NULL,
  `value_service` varchar(50) NOT NULL,
  `valid_upto` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `card_offer`
--

INSERT INTO `card_offer` (`card_id`, `package_name`, `card_cost`, `value_service`, `valid_upto`, `status`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(6, 'Gold', '2000', '2500', '91', 1, '192.168.0.11', 1, '2024-07-23', '2024-07-23'),
(7, 'Diamond', '5000', '7000', '182', 1, '192.168.0.11', 1, '2024-07-23', '0000-00-00'),
(8, 'platinum', '10000', '14000', '365', 1, '192.168.0.11', 1, '2024-07-23', '0000-00-00'),
(10, 'Silver', '656.76', '56757.78', '7.5', 1, '192.168.0.24', 1, '2024-07-26', '2024-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `company_setting`
--

CREATE TABLE `company_setting` (
  `compid` int(11) NOT NULL,
  `comp_name` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `location` varchar(200) NOT NULL,
  `pin` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `gst` varchar(16) NOT NULL,
  `term_condition` text NOT NULL,
  `comp_logo` varchar(100) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_setting`
--

INSERT INTO `company_setting` (`compid`, `comp_name`, `first_name`, `last_name`, `contact`, `email`, `location`, `pin`, `address`, `gst`, `term_condition`, `comp_logo`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(1, 'Salon Software', '', '', '9907856533', 'daveadame@velzon.com', 'Raipur', '4221100', 'Raipur Chhattisgarh', '775454545454543', 'This is term and conditions', 'DOC1718192877986.3.jpg', '192.168.0.11', 1, '0000-00-00', '2024-07-20');

-- --------------------------------------------------------

--
-- Table structure for table `customer_master`
--

CREATE TABLE `customer_master` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) NOT NULL,
  `customer_mobile` varchar(10) NOT NULL,
  `customer_mobile1` varchar(10) NOT NULL,
  `customer_email` varchar(40) NOT NULL,
  `customer_dob` date NOT NULL,
  `anniversary_date` date NOT NULL,
  `customer_address` text NOT NULL,
  `customer_code` varchar(50) NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `opening_bal` int(11) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL,
  `membership` int(10) NOT NULL,
  `status` int(10) NOT NULL,
  `assign_date` date NOT NULL,
  `valid_upto` int(11) NOT NULL,
  `value_of_card` varchar(100) NOT NULL,
  `cost_of_card` varchar(100) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `card_number` int(11) NOT NULL,
  `expiry_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_master`
--

INSERT INTO `customer_master` (`customer_id`, `customer_name`, `customer_mobile`, `customer_mobile1`, `customer_email`, `customer_dob`, `anniversary_date`, `customer_address`, `customer_code`, `code`, `type`, `opening_bal`, `ipaddress`, `createdby`, `createdate`, `lastupdated`, `membership`, `status`, `assign_date`, `valid_upto`, `value_of_card`, `cost_of_card`, `package_name`, `card_number`, `expiry_date`) VALUES
(10, 'poonam', '7767676767', '7767676767', 'poonam@gmail.com', '1998-07-26', '1996-07-25', 'Bhakhara', 'CUST00001', 1, 'customer', 0, '192.168.0.24', 1, '2024-07-26', '0000-00-00', 0, 1, '0000-00-00', 0, '', '', '', 0, '0000-00-00'),
(11, 'Diksha', '6676767765', '6676767765', 'diksha@gmail.com', '0000-00-00', '0000-00-00', '', 'CUST00002', 2, 'customer', 0, '192.168.0.24', 1, '2024-07-26', '2024-07-26', 0, 1, '0000-00-00', 0, '', '', '', 0, '0000-00-00'),
(19, 'tushali', '7767676767', '', '', '0000-00-00', '0000-00-00', 'fhgtdyt', 'CUST00003', 3, 'customer', 0, '192.168.0.24', 0, '2024-07-26', '0000-00-00', 0, 1, '0000-00-00', 0, '', '', '', 0, '0000-00-00'),
(20, 'kajal', '6676767765', '6676767765', 'kajal@gmail.com', '2024-07-25', '2024-07-25', 'ddfgfds', 'CUST00004', 4, 'customer', 0, '192.168.0.24', 0, '2024-07-26', '0000-00-00', 0, 1, '0000-00-00', 0, '', '', '', 0, '0000-00-00'),
(22, 'Radhika', '6787876876', '7878768678', 'radhika@gmail.com', '2024-07-10', '2024-07-01', 'Raipur', 'SUPP00001', 1, 'supplier', 0, '192.168.0.24', 1, '2024-07-26', '2024-07-26', 0, 1, '0000-00-00', 0, '', '', '', 0, '0000-00-00'),
(24, 'Richa', '6576476767', '6547577676', 'richa@gmail.com', '2024-07-26', '2024-07-25', 'testing', 'SUPP00002', 2, 'supplier', 0, '192.168.0.24', 1, '2024-07-26', '2024-07-26', 0, 1, '0000-00-00', 0, '', '', '', 0, '0000-00-00'),
(25, 'Naveen', '6554654654', '6554654654', 'naveen@gmail.com', '2024-07-25', '2024-07-26', 'Bhilai', 'SUPP00003', 3, 'supplier', 0, '192.168.0.24', 0, '2024-07-26', '0000-00-00', 0, 1, '0000-00-00', 0, '', '', '', 0, '0000-00-00'),
(35, 'ghfdghf', '5547547575', '6765765767', 'tytry@gmail.com', '2024-07-25', '2024-07-24', 'fgfdgd', 'CUST00005', 5, 'customer', 0, '192.168.0.24', 0, '2024-07-26', '0000-00-00', 0, 1, '0000-00-00', 0, '', '', '', 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `demo`
--

CREATE TABLE `demo` (
  `demo_id` int(11) NOT NULL,
  `todo_id` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `is_cancelled` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demo`
--

INSERT INTO `demo` (`demo_id`, `todo_id`, `status`, `mobile`, `is_cancelled`, `description`, `task_id`) VALUES
(34, 7, 'In progress', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `demo1`
--

CREATE TABLE `demo1` (
  `demo_id` int(11) NOT NULL,
  `todo_id` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `mobile` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `demo1`
--

INSERT INTO `demo1` (`demo_id`, `todo_id`, `status`, `mobile`) VALUES
(2, 8, 'In progress', '8888888888'),
(3, 9, 'Completed', '9999999999');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `emp_code` varchar(100) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `employee_name` varchar(200) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `email_id` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `ptext` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `designation_id` int(11) NOT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `login_id` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `createdby` int(11) NOT NULL,
  `updatedate` datetime DEFAULT NULL,
  `ipaddress` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `emp_code`, `code`, `employee_name`, `mobile_no`, `email_id`, `address`, `photo`, `ptext`, `password`, `designation_id`, `salt`, `status`, `login_id`, `createdate`, `createdby`, `updatedate`, `ipaddress`) VALUES
(1, 'EMP00001', 1, 'mallika dutta', '3434453434', '234@dfgdfg', 'sfsdf', NULL, NULL, '1212', 1, NULL, 1, NULL, '2024-07-23 17:28:22', 1, NULL, '192.168.0.11');

-- --------------------------------------------------------

--
-- Table structure for table `expense_group`
--

CREATE TABLE `expense_group` (
  `ex_group_id` int(11) NOT NULL,
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `lastupdated` date NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `createdate` datetime NOT NULL,
  `sessionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `expense_group`
--

INSERT INTO `expense_group` (`ex_group_id`, `group_name`, `status`, `type`, `createdby`, `lastupdated`, `ipaddress`, `createdate`, `sessionid`) VALUES
(3, 'testing', 1, 'expense', 1, '0000-00-00', '192.168.0.24', '2024-07-26 16:11:50', 0);

-- --------------------------------------------------------

--
-- Table structure for table `expense_master`
--

CREATE TABLE `expense_master` (
  `exp_id` int(11) NOT NULL,
  `ex_group_id` int(11) NOT NULL,
  `exp_name` varchar(250) NOT NULL,
  `exp_amount` double NOT NULL,
  `exp_date` date NOT NULL,
  `site_id` int(11) NOT NULL,
  `exp_mode` varchar(11) NOT NULL,
  `exp_aproved_by` varchar(250) NOT NULL,
  `remark` varchar(250) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `mode_type` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `createdby` int(11) NOT NULL,
  `lastupdated` date NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `createdate` datetime NOT NULL,
  `sessionid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `expense_master`
--

INSERT INTO `expense_master` (`exp_id`, `ex_group_id`, `exp_name`, `exp_amount`, `exp_date`, `site_id`, `exp_mode`, `exp_aproved_by`, `remark`, `bank_id`, `mode_type`, `type`, `createdby`, `lastupdated`, `ipaddress`, `createdate`, `sessionid`) VALUES
(2, 3, '', 700, '2024-07-26', 0, 'upi', '', '', 1, '', '', 1, '0000-00-00', '192.168.0.24', '2024-07-26 16:16:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `u_name` varchar(20) NOT NULL,
  `status` varchar(200) NOT NULL,
  `mobile` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `u_name`, `status`, `mobile`) VALUES
(1, '', '', ''),
(2, 'poonam', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `gst_master`
--

CREATE TABLE `gst_master` (
  `gst_id` int(11) NOT NULL,
  `gst_name` varchar(100) NOT NULL,
  `sgst` double NOT NULL,
  `cgst` double NOT NULL,
  `igst` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gst_master`
--

INSERT INTO `gst_master` (`gst_id`, `gst_name`, `sgst`, `cgst`, `igst`) VALUES
(1, 'GST@ 0%', 0, 0, 0),
(2, 'IGST@ 0%', 0, 0, 0),
(3, 'GST@ 5%', 2.5, 2.5, 0),
(4, 'IGST@ 5%', 0, 0, 5),
(5, 'GST@ 12%', 6, 6, 0),
(6, 'IGST@ 12%', 0, 0, 12),
(7, 'GST@ 18%', 9, 9, 0),
(8, 'IGST@ 18%', 0, 0, 18),
(9, 'GST@ 0.25%', 0.125, 0.125, 0),
(10, 'IGST@ 0.25%', 0, 0, 0.25),
(11, 'GST@ 3%', 1.5, 1.5, 0),
(12, 'IGST@ 3%', 0, 0, 3),
(13, 'GST@ 28%', 14, 14, 0),
(14, 'IGST@ 28%', 0, 0, 28);

-- --------------------------------------------------------

--
-- Table structure for table `lata`
--

CREATE TABLE `lata` (
  `Sno` int(11) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `dt` int(11) NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lata`
--

INSERT INTO `lata` (`Sno`, `email`, `password`, `dt`) VALUES
(1, 'hw@gamil.com', '', 2147483647),
(2, 'pooja@gmail.com', '', 2147483647),
(3, 'pooja@gmail.com', '', 2147483647),
(4, 'pooja@gmail.com', '', 2147483647),
(5, 'rajesh@gmail.com', '', 2147483647),
(6, 'rajesh@gmail.com', '', 2147483647),
(7, 'raj@gmail.com', '', 2147483647);

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
(7, 'Java', 'In progress', '7887687664'),
(8, 'Python', 'In progress', '8888888888'),
(9, 'Javascript', 'Completed', '9999999999'),
(10, 'HTML', 'Completed', '4444444444'),
(11, 'CSS', 'Completed', '5555555555'),
(12, 'REACT', 'Completed', '7777777777');

-- --------------------------------------------------------

--
-- Table structure for table `m_designation`
--

CREATE TABLE `m_designation` (
  `designation_id` int(11) NOT NULL,
  `designation` varchar(100) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_designation`
--

INSERT INTO `m_designation` (`designation_id`, `designation`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(1, 'devloper', '192.168.0.11', 1, '2024-07-23', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `m_product_category`
--

CREATE TABLE `m_product_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_product_category`
--

INSERT INTO `m_product_category` (`category_id`, `category_name`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(1, 'Shampoo', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(2, 'Mask', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(3, 'Conditioner', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(4, 'Face Wash', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(5, 'Oil', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(6, 'Wax', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(7, 'Serum', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(8, 'Cream', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(9, 'Spray', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(10, 'Texture', '59.153.97.112', 1, '2024-07-19', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `m_unit`
--

CREATE TABLE `m_unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL,
  `is_deleted` int(11) NOT NULL,
  `deleted_by` int(11) NOT NULL,
  `deleted_datetime` datetime NOT NULL,
  `deleted_by_ip` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `m_unit`
--

INSERT INTO `m_unit` (`unit_id`, `unit_name`, `ipaddress`, `createdby`, `createdate`, `lastupdated`, `is_deleted`, `deleted_by`, `deleted_datetime`, `deleted_by_ip`) VALUES
(6, 'PCS', '192.168.0.10', 1, '2024-05-16', '2024-05-23', 0, 0, '0000-00-00 00:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `m_users`
--

CREATE TABLE `m_users` (
  `userid` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `emailid` varchar(50) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `usertype` varchar(50) NOT NULL,
  `ipaddress` varchar(25) NOT NULL,
  `createdate` datetime NOT NULL,
  `lastupdated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `m_users`
--

INSERT INTO `m_users` (`userid`, `store_id`, `status`, `username`, `password`, `emailid`, `contact_no`, `usertype`, `ipaddress`, `createdate`, `lastupdated`) VALUES
(1, 0, 1, 'admin', '123', 'pnipesh@gmail.com', '9770131555', 'admin', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 1, 1, 'mallika', '123', 'trinitymallika@gmail.com', '7999363814', 'user', '192.168.0.16', '2024-05-04 10:31:57', '2024-05-31 11:00:58'),
(7, 9, 1, 'radhika', '123', 'trinityradhika@gmail.com', '9926974335', 'user', '::1', '2024-05-18 11:05:21', '2024-05-20 14:52:18');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `bill_no` varchar(10) NOT NULL,
  `total_due` float NOT NULL,
  `paydate` date NOT NULL,
  `payamt` float NOT NULL,
  `advance_id` int(11) NOT NULL,
  `advance_amt` float NOT NULL,
  `advance_mode` varchar(100) NOT NULL,
  `remark` text NOT NULL,
  `package_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `prod_billing_id` int(11) NOT NULL,
  `g_total` float NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL,
  `service_type` int(11) NOT NULL COMMENT ' 1 for package and 0 for cash,upi,card and 2 for card_purchase',
  `is_close` int(11) NOT NULL,
  `balance_adv_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `customer_id`, `bill_no`, `total_due`, `paydate`, `payamt`, `advance_id`, `advance_amt`, `advance_mode`, `remark`, `package_id`, `type`, `prod_billing_id`, `g_total`, `ipaddress`, `createdby`, `createdate`, `lastupdated`, `service_type`, `is_close`, `balance_adv_amount`) VALUES
(1, 35, '00001', 0, '2024-07-26', 1200, 0, 0, '', '', 0, 'product', 0, 1063, '192.168.0.11', 1, '2024-07-26', '0000-00-00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment_detail`
--

CREATE TABLE `payment_detail` (
  `payment_detailid` int(11) NOT NULL,
  `paid_amt` float NOT NULL,
  `paymode` varchar(100) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `payment_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `prod_billing_id` int(11) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL,
  `package_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_detail`
--

INSERT INTO `payment_detail` (`payment_detailid`, `paid_amt`, `paymode`, `bank_id`, `payment_id`, `type`, `prod_billing_id`, `ipaddress`, `createdby`, `createdate`, `lastupdated`, `package_id`) VALUES
(1, 100, 'cash', 0, 1, 'product', 1, '192.168.0.11', 1, '2024-07-26', '0000-00-00', 0),
(2, 100, 'card', 0, 1, 'product', 1, '192.168.0.11', 1, '2024-07-26', '0000-00-00', 0),
(3, 1000, 'upi', 0, 1, 'product', 1, '192.168.0.11', 1, '2024-07-26', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_billing`
--

CREATE TABLE `product_billing` (
  `prod_billing_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `bill_no` varchar(100) NOT NULL,
  `bill_date` date NOT NULL,
  `remark` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `total_amt` float NOT NULL,
  `cgst_amt` float NOT NULL,
  `cgst` int(11) NOT NULL,
  `sgst` int(11) NOT NULL,
  `sgst_amt` float NOT NULL,
  `g_total` float NOT NULL,
  `payamt` float NOT NULL,
  `in_cash` float NOT NULL,
  `in_card` float NOT NULL,
  `in_upi` float NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `createtime` time NOT NULL,
  `lastupdated` date NOT NULL,
  `service_type` int(11) NOT NULL COMMENT ' 1 for package and 0 for cash,upi,card',
  `package_id` int(11) NOT NULL,
  `settled_closed` int(11) NOT NULL COMMENT 'for payment '
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_billing`
--

INSERT INTO `product_billing` (`prod_billing_id`, `customer_id`, `bill_no`, `bill_date`, `remark`, `type`, `total_amt`, `cgst_amt`, `cgst`, `sgst`, `sgst_amt`, `g_total`, `payamt`, `in_cash`, `in_card`, `in_upi`, `ipaddress`, `createdby`, `createdate`, `createtime`, `lastupdated`, `service_type`, `package_id`, `settled_closed`) VALUES
(1, 35, '00001', '2024-07-26', '', 'product', 1062.5, 0, 0, 0, 0, 1063, 1200, 100, 100, 1000, '192.168.0.11', 1, '2024-07-26', '17:42:55', '0000-00-00', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_billing_detail`
--

CREATE TABLE `product_billing_detail` (
  `prod_bill_detail_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `rate` float NOT NULL,
  `discount` varchar(100) NOT NULL,
  `total` float NOT NULL,
  `prod_billing_id` int(11) NOT NULL,
  `type` varchar(50) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL,
  `service_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_billing_detail`
--

INSERT INTO `product_billing_detail` (`prod_bill_detail_id`, `product_id`, `qty`, `rate`, `discount`, `total`, `prod_billing_id`, `type`, `employee_id`, `ipaddress`, `createdby`, `createdate`, `lastupdated`, `service_type`) VALUES
(1, 1, '1', 1250, '15', 1062.5, 1, 'product', 1, '192.168.0.11', 1, '2024-07-26', '0000-00-00', 0),
(2, 1, '1', 1250, '', 1250, 0, 'product', 1, '192.168.0.11', 1, '2024-07-26', '0000-00-00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_master`
--

CREATE TABLE `product_master` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `rate` float NOT NULL,
  `unit_id` int(11) NOT NULL,
  `opening_stock` float NOT NULL,
  `opening_date` date NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_master`
--

INSERT INTO `product_master` (`product_id`, `category_id`, `product_name`, `rate`, `unit_id`, `opening_stock`, `opening_date`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(1, 1, 'Tibolli Shampoo', 1250, 6, 30, '2024-06-30', '192.168.0.11', 1, '2024-07-19', '2024-07-26'),
(2, 1, 'QOD MAX PRIME SHAMPOO', 1500, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(3, 2, 'QOD MAX PRIME MASK', 1500, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(4, 5, 'growth oil', 0, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(5, 6, 'hair wax', 0, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(6, 1, 'Nashi ARGAN Shampoo 200ml', 1450, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(7, 3, 'Nashi ARGAN Conditioner 200ml', 1450, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(8, 1, 'S P Luxe Oil Shampoo 200 Ml', 1600, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(9, 1, 'S p Balanca scalp Shampoo 200 ml', 1600, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(10, 8, 'O3+ Whaitning S P F 30 50 gm', 490, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(11, 7, 'K J Serum 50 ML', 1900, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(12, 1, 'S P REPAIR Shampoo 250 Ml', 1600, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(13, 2, 'S p Repair mask 200 ml', 1750, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(14, 6, 'Hair Wax Hold 50 g', 195, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(15, 1, 'S P Clear Scalp Shampoo250 ml', 1600, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(16, 2, 'S P Balance Scalp Mask 200 M l', 1575, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(17, 5, 'S P Luxe oil Keratin Mask 150 Ml', 1750, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(18, 5, 'S. P Luxe Oil 100 ml', 2850, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(19, 1, 'Senso Calm Shampoo 250 ml', 650, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(20, 8, 'Whiteing Cream SPF 30', 490, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(21, 1, 'Tibolli Shampoo300 ml', 1250, 6, 20, '2024-07-19', '192.168.0.11', 1, '2024-07-19', '2024-07-26'),
(22, 3, 'Tibolli Conditioner 300 ml', 1250, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(23, 8, 'schwarzkopf hair spry', 330, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(24, 1, 'Gk balance sampoo300ml', 1800, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(25, 3, 'Gk balance condisner 300ml', 1800, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(26, 6, 'mold&amp;hold wax', 425, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(27, 2, 'volume bouster mask', 660, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(28, 1, 'Fusion Shampoo 250 ml', 1100, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(29, 2, 'Fusion Mask 150 ml', 150, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(30, 10, 'Texture Touch 75ml', 675, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(31, 4, 'Wella Oil Reflection 100 ml', 1150, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(32, 5, 'SP Luxe Oil 30 ml', 1150, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(33, 3, 'G K Moisturizing Conditioner , 300 ml', 1950, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(34, 1, 'G K Moisturizing Shampoo , 300 ml', 1950, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(35, 3, 'Juvexing UV/UVA Shield Conditioner 150 ml', 1100, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(36, 1, 'Juvexing UV/UVA Shield Shampoo 150 ml', 1100, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(37, 3, 'Juvexing UV/UVA Shield Conditioner 240 ml', 1500, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(38, 1, 'Juvexing UV/UVA Shield Shampoo 240 ml', 1500, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(39, 4, 'O3+ Brightening Whitening Face Wash, 50gm', 385, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(40, 4, 'O3+ Hydrating &amp; Soothing Face Wash, 50gm', 385, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(41, 8, 'O3+ Derma Fresh Cream SPF-40, 50gm', 490, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(42, 8, 'O3+ Eye Circle Cream, 15gm', 445, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(43, 8, 'O3+Whiteing Night Repair Cream, 50gm', 955, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(44, 8, 'O3+ Seaweed Night Cream, 50gm', 955, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(45, 8, 'O3+ Seaweed Cream SPF-15, 50gm', 955, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(46, 8, 'O3+ Whitening Day Cream, 50gm', 955, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(47, 1, 'Brillance Shampoo 250ml', 650, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(48, 1, 'Clean scalp Shampoo 250ml', 680, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(49, 1, 'Enrich Shampoo 250ml', 680, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(50, 1, 'volume boster Shampoo 250ml', 620, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(51, 2, 'Senso clm Mask 150ml', 730, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(52, 2, 'Brilliance Mask Coarse 150ml', 695, 1, 0, '2024-07-19', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(53, 2, 'Enrich Mask 150ml', 730, 6, 0, '2024-07-19', '192.168.0.11', 1, '2024-07-19', '2024-07-23'),
(54, 5, 'Wella Oil Reflection 30ml', 650, 6, 0, '2024-07-19', '192.168.0.11', 1, '2024-07-19', '2024-07-23'),
(55, 2, 'werwer', 0, 6, 0, '2024-07-04', '192.168.0.11', 1, '2024-07-25', '2024-07-26'),
(56, 4, 'werwer', 0, 6, 0, '2024-07-04', '192.168.0.11', 0, '2024-07-25', '0000-00-00'),
(57, 5, '23232', 0, 6, 10, '2024-07-25', '192.168.0.11', 1, '2024-07-25', '2024-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_details`
--

CREATE TABLE `purchase_details` (
  `purchase_detailsid` int(11) NOT NULL,
  `purchaseid` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` double NOT NULL,
  `sq_ft` int(11) NOT NULL,
  `rate` double NOT NULL,
  `discount` double NOT NULL COMMENT 'percentage',
  `taxable_amt` double NOT NULL,
  `gst_amt` double NOT NULL,
  `igst_amt` double NOT NULL,
  `cgst` float NOT NULL,
  `sgst` float NOT NULL,
  `igst` float NOT NULL,
  `total_amt` double NOT NULL,
  `gst_id` varchar(50) NOT NULL,
  `tax_type` varchar(200) NOT NULL,
  `type` varchar(20) NOT NULL,
  `amcfromdate` date NOT NULL,
  `amctodate` date NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_details`
--

INSERT INTO `purchase_details` (`purchase_detailsid`, `purchaseid`, `product_id`, `qty`, `sq_ft`, `rate`, `discount`, `taxable_amt`, `gst_amt`, `igst_amt`, `cgst`, `sgst`, `igst`, `total_amt`, `gst_id`, `tax_type`, `type`, `amcfromdate`, `amctodate`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(2, 2, 1, 1, 0, 1250, 15, 1062.5, 0, 0, 0, 0, 0, 1062.5, '2', 'inclusive', 'purchase', '0000-00-00', '0000-00-00', '192.168.0.11', 1, '2024-07-25', '0000-00-00'),
(5, 4, 3, 1, 0, 1500, 15, 1275, 0, 0, 0, 0, 0, 1275, '1', 'inclusive', 'purchase', '0000-00-00', '0000-00-00', '192.168.0.11', 1, '2024-07-25', '0000-00-00'),
(6, 4, 3, 12, 0, 1500, 15, 15300, 0, 0, 0, 0, 0, 15300, '1', 'inclusive', 'purchase', '0000-00-00', '0000-00-00', '192.168.0.11', 1, '2024-07-25', '0000-00-00'),
(7, 5, 1, 1, 0, 1250, 15, 1062.5, 0, 0, 0, 0, 0, 1062.5, '2', 'inclusive', 'purchase', '0000-00-00', '0000-00-00', '192.168.0.11', 1, '2024-07-25', '0000-00-00'),
(8, 6, 2, 1, 0, 1500, 15, 1214.29, 0, 0, 0, 0, 5, 1275, '4', 'inclusive', 'purchase', '0000-00-00', '0000-00-00', '192.168.0.11', 1, '2024-07-25', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_entry`
--

CREATE TABLE `purchase_entry` (
  `purchaseid` int(11) NOT NULL,
  `purchase_no` varchar(20) NOT NULL,
  `return_bill_no` varchar(10) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_return_date` varchar(10) NOT NULL,
  `remark` text NOT NULL,
  `grand_total` float NOT NULL,
  `in_cash` float NOT NULL,
  `in_card` float NOT NULL,
  `in_upi` float NOT NULL,
  `type` varchar(20) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `purchase_entry`
--

INSERT INTO `purchase_entry` (`purchaseid`, `purchase_no`, `return_bill_no`, `customer_id`, `purchase_date`, `purchase_return_date`, `remark`, `grand_total`, `in_cash`, `in_card`, `in_upi`, `type`, `createdby`, `createdate`, `ipaddress`, `lastupdated`) VALUES
(2, '00002', '', 4, '2024-07-25', '', 'ASD', 1063, 1000, 1000, 1000, 'purchase', 1, '2024-07-25', '192.168.0.11', '2024-07-25'),
(4, '00004', '', 4, '2024-07-25', '', '', 16575, 2000, 3000, 5000, 'purchase', 1, '2024-07-25', '192.168.0.11', '2024-07-25'),
(5, '00005', '', 3, '2024-07-25', '', 'lkjlkjk', 1063, 100, 100, 100, 'purchase', 1, '2024-07-25', '192.168.0.11', '0000-00-00'),
(6, '00006', '', 9, '2024-07-25', '', 'sdasd', 1275, 100, 100, 100, 'purchase', 1, '2024-07-25', '192.168.0.11', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `receipt_stock`
--

CREATE TABLE `receipt_stock` (
  `receipt_stock_id` int(11) NOT NULL,
  `receipt_no` varchar(100) NOT NULL,
  `receipt_date` date NOT NULL,
  `remark` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `receipt_stock`
--

INSERT INTO `receipt_stock` (`receipt_stock_id`, `receipt_no`, `receipt_date`, `remark`, `type`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(1, '00001', '2024-06-26', '', 'receipt_stock', '192.168.0.11', 1, '2024-07-24', '2024-07-24'),
(2, '00002', '2024-06-27', '', 'receipt_stock', '192.168.0.11', 1, '2024-06-27', '0000-00-00'),
(4, '00003', '2024-07-10', '444', 'receipt_stock', '192.168.0.19', 1, '2024-07-10', '2024-07-10'),
(5, '00004', '2024-07-10', '111', 'receipt_stock', '192.168.0.19', 1, '2024-07-10', '0000-00-00'),
(6, '00005', '2024-07-24', 'asdd', 'receipt_stock', '192.168.0.11', 1, '2024-07-24', '0000-00-00'),
(7, '00006', '2024-07-24', 'sd', 'receipt_stock', '192.168.0.11', 1, '2024-07-24', '0000-00-00'),
(8, '00007', '2024-07-26', 'testing', 'receipt_stock', '192.168.0.24', 1, '2024-07-26', '2024-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `receipt_stock_lower`
--

CREATE TABLE `receipt_stock_lower` (
  `receipt_stock_lower_id` int(11) NOT NULL,
  `receipt_stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(31, '2024-03-14', '2024-03-22', 'jghjghjhghfghgfh'),
(32, '2024-03-23', '2024-03-26', 'fgfdgfdg');

-- --------------------------------------------------------

--
-- Table structure for table `service_category`
--

CREATE TABLE `service_category` (
  `ser_cate_id` int(11) NOT NULL,
  `ser_cat_name` varchar(100) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_category`
--

INSERT INTO `service_category` (`ser_cate_id`, `ser_cat_name`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(2, 'Hair/Texture', '59.153.97.112', 1, '2024-06-01', '2024-07-16'),
(5, 'Hair/Absolution Color', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(6, 'Hair/Treatments', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(7, 'Hair/Style Enhanchers', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(8, 'Hair/Haircut &amp; Styling', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(9, 'Beauty/Heel peel', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(10, 'Beauty/Nail Filing Paint', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(11, 'Beauty/Kasmara facials', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(12, 'Beauty/Bridal Package', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(13, 'Beauty/Make UP', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(14, 'Beauty/Body Polishing', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(15, 'Beauty/Brazilian Luxury (Stripless) Wax', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(16, 'Beauty/Rica Luxury Wax', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(17, 'Beauty/Chocolate Wax', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(18, 'Beauty/Honey Wax', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(19, 'Beauty/O3+Bleach', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(20, 'Beauty/OXY Bleach', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(21, 'Beauty/O3+D-Tan', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(22, 'Beauty/Threading', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(23, 'Beauty/Padicure', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(24, 'Beauty/Manicure', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(25, 'Beauty/O3+Facial', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(26, 'Beauty/Normal Facial', '59.153.97.112', 1, '2024-07-16', '0000-00-00'),
(27, 'Beauty/Clean Up &amp; Facials', '59.153.97.112', 1, '2024-07-16', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `service_master`
--

CREATE TABLE `service_master` (
  `service_id` int(11) NOT NULL,
  `ser_cate_id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `service_rate` varchar(100) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_master`
--

INSERT INTO `service_master` (`service_id`, `ser_cate_id`, `service_name`, `service_rate`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(16, 2, 'Botox treatment upto sholder', '5500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(17, 2, 'Boto treatment below sholder', '6000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(18, 2, 'Botox treatment mid lenghth', '6750', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(19, 2, 'Botox treatment wasit lenght:', '7500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(20, 2, 'Botox treatment men', '2500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(21, 2, 'Gk Keratin Man', '1500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(22, 2, 'Tibollii MId Length:', '6500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(23, 2, 'Tibolli Waist Length', '7500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(24, 2, 'Tibolli Man', '2500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(25, 2, 'Tibolli Uptu Sholder', '5500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(26, 2, 'Tiboll Beloe Sholder', '6000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(27, 2, 'Permanent Blowdry , Upto Shoulder', '4000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(28, 2, 'Permanent Blowdry ,Below Shoulder', '4500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(30, 2, 'Permanent Blowdry ,Mid Length', '5000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(31, 2, 'Permanent Blowdry ,Waist Length', '5500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(32, 2, 'Gk Keratin Spa , Men', '1500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(33, 2, 'Gk Keratin ,Men', '2500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(34, 2, 'Keratin with Straightening,Men', '4000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(35, 2, 'Straightening/ Rebonding, Upto Shoulder', '6500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(36, 2, 'Straightening/ Rebonding, Below Shoulder', '7000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(37, 2, 'Straightening/ Rebonding, Mid Length', '8000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(38, 2, 'Straightening/ Rebonding, Waist Length', '9000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(39, 2, 'Straightening/ Rebonding, Men', '3000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(40, 2, 'Hair Relaxing/Smoothing, Upto Shoulder', '5000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(41, 2, 'Hair Relaxing/Smoothing, Below Shoulder', '6000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(42, 2, 'Hair Relaxing/Smoothing, Mid Length', '7000', '59.153.97.112', 1, '2024-07-13', '2024-07-16'),
(43, 2, 'Hair Relaxing/Smoothing, Waist Length', '8000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(44, 2, 'Hair Relaxing/Smoothing, Men', '2500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(45, 2, 'Gk. Keratin, Upto Shoulder', '7500', '122.173.133.127', 1, '2024-07-13', '2024-07-13'),
(46, 2, 'Gk .Keratin, Below Shoulder', '8500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(47, 2, 'Gk. Keratin, Mid Length', '9000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(48, 2, 'GK Keratin, Waist Length', '10000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(49, 2, 'Gk.Keratin Spa, Upto Shoulder', '1800', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(50, 2, 'Gk.Keratin Spa, Below Shoulder', '1900', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(51, 2, 'Gk.Keratin Spa, Mid Length', '2000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(52, 2, 'Gk.Keratin Spa. Waist Length', '2100', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(53, 2, 'Gk.Keratin with Straightening,Upto Shoulder', '10000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(54, 2, 'Gk.Keratin with Straightening,Below Shoulder', '12000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(55, 2, 'Gk.Keratin with Straightening,Mid Length', '13000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(56, 2, 'Gk.Keratin with Straightening,Waist Length', '14000', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(57, 2, 'Fringe Straightening', '1500', '122.173.133.127', 1, '2024-07-13', '0000-00-00'),
(59, 5, 'Root Touch up Man Beard Moustache', '380', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(60, 5, 'Root Touch Up Women Matrix', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(61, 5, 'Global Colour,Wella,Upto Shoulder', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(62, 5, 'Global Colour,Wella,Below Shoulder', '3000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(63, 5, 'Global Colour,Wella,Mid Length', '3500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(64, 5, 'Global Colour,Wella, Waist Length', '4000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(65, 5, 'Global Colour, schwarzkopf Men', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(66, 5, 'Schwarkopf Roottouch upWoman', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(67, 5, 'Global Colour,Matrix, Upto Shoulder', '2000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(68, 5, 'Global Colour,Matrix,Below Shoulder', '2400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(69, 5, 'Global Colour,Matrix,Mid Length', '2800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(70, 5, 'Global Colour,Matrix,Waist Length', '3200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(71, 5, 'Global Colour,Matrix, Men', '900', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(72, 5, 'Extra for Ammonia Free / lllumina Colour', '400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(73, 5, 'Single Streaks High Light', '500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(74, 5, 'Double Streaks High Light', '900', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(75, 5, 'Triple Streaks High Light', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(76, 5, 'Four Streaks High Light', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(77, 5, 'Five Streaks High Light', '1875', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(78, 5, 'Six Streaks High Light', '2250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(79, 5, 'Seven Streaks High Light', '3000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(80, 5, 'Eight Streaks High Light', '2600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(81, 5, 'Nine Streaks High Light', '2925', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(82, 5, 'Ten Streaks High Light', '3250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(83, 5, 'Eleven Streaks High Light', '3575', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(84, 5, 'Twelve Streaks High Light', '3900', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(85, 5, 'Thirteen Streaks High Light', '4225', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(86, 5, 'Fourteen Streaks High Light', '4550', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(87, 5, 'Fifteen Streaks High Light', '4875', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(88, 5, 'Sixteen Streaks High Light', '4875', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(89, 5, 'Schwarkopf Root Touc up Women', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(90, 5, 'Root Touch Up Moustache/ Side Locks Matrik', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(91, 5, 'Ombre Colouring, Upto shoulder', '4500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(92, 5, 'Ombre Colouring, Below Shoulder', '6000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(93, 5, 'Ombre Colouring, Mid Length', '7000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(94, 5, 'Ombre Colouring, Waist Length', '8000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(95, 5, 'Extra for Ammonia Free Colour', '350', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(96, 5, 'Balayage Colouring, Upto Shoulder', '5000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(97, 5, 'Balayage Colouring, Below Shoulder', '6000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(98, 5, 'Balayage Colouring, Mid Length', '7000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(99, 5, 'Balayage Colouring, Waist Length', '7500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(100, 6, 'Sp Keratin Mid Length', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(101, 6, 'Sp Keratin Waist Langth', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(102, 6, 'Sp Keratin Man', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(103, 6, 'Sp Keratin Restore Upto Shoulder', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(104, 6, 'Sp Leratin Restore Below Shoulder', '2250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(105, 6, 'Sp Keratin Restore Mid Length', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(106, 6, 'Sp Keratin Restore Waist Langth', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(107, 6, 'Sp Keratin Restore Man', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(108, 6, 'Sp Keratin Upto Shoulder', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(109, 6, 'Sp Keratin Below Shoulder', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(110, 6, 'Sp Anti Dandruff Upto Shoulder', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(111, 6, 'Sp Anti Dandruff Below Shoulder', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(112, 6, 'Sp Anti Dandruff Mid Length', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(113, 6, 'Sp Anti Dandruff Waist Length', '2400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(114, 6, 'Sp Anti Dandruff Man', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(115, 6, 'Sp Anti Hair Fall Upto Shoulder', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(116, 6, 'Sp Anti Hair Fall Below Shoulder', '2250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(117, 6, 'Sp Anti Hair Fall Mid Length', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(118, 6, 'Sp Anti Fall Waist Langth', '2750', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(119, 6, 'Sp Anti Hair Fall Man', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(120, 6, 'Treatment for Instant Hair Recovery,Waist Length', '2100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(121, 6, 'Treatment for Instant Hair Recovery,Men', '1300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(122, 6, 'Treatment for Instant Hair Recovery, Upto Shoulder', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(123, 6, 'Treatment for Instant Hair Recovery, Below Shoulder', '2000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(124, 6, 'Treatment for Instant Hair Recovery, Mid Length', '2000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(125, 6, 'Silk Treatments, Upto Shoulder', '1100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(126, 6, 'Silk Treatments, Below Shoulder', '1350', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(127, 6, 'Silk Treatments, Mid Length', '1300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(128, 6, 'Silk Treatments, Waist length', '1400', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(129, 6, 'Silk Treatments, Men', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(130, 6, 'Treatment for Dry Damage Hair, Upto Shoulder', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(131, 6, 'Treatment for Dry Damage Hair, Below Shoulder', '1300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(132, 6, 'Treatment for Dry Damage Hair, Mid Length', '1450', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(133, 6, 'Treatment for Dry Damage Hair, Waist Length', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(134, 6, 'Colour Shine Treatment, Upto Shoulder', '1300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(135, 6, 'Colour Shine Treatment, Below Shoulder', '1400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(136, 6, 'Colour Shine Treatment, Mid Length', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(137, 6, 'Colour Shine Treatment, Waist length', '1600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(138, 6, 'Colour Shine Treatment, Men', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(139, 6, 'Treatment for Hair Fall, Upto Shouder', '1400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(140, 6, 'Treatment for Hair Fall, Below Shoulder', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(141, 6, 'Treatment for Hair Fall, Mid Length', '1600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(142, 6, 'Treatment for Hair Fall, Waist Length', '1700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(143, 6, 'Treatment for Hair Fall, Men', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(144, 6, 'Treatment for dandruff, Upto Shoulder', '1400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(145, 6, 'Treatment for dandruff, Below Shoulder', '1250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(146, 6, 'Treatment for dandruff, Mid Length', '1350', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(147, 6, 'Treatment for dandruff, Waist Length', '1700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(148, 6, 'Treatment for dandruff, Men', '1050', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(149, 6, 'Oil Reflection,Upto Shoulder', '1400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(150, 6, 'Oil Reflection,Below Shoulder', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(151, 6, 'Oil Reflection,Mid Length', '1600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(152, 6, 'Oil Reflection,Waist Length', '1700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(153, 6, 'Oil Reflection, Men', '1050', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(154, 7, 'Flat Iron, Upto Shoulder', '550', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(155, 7, 'Flat Iron, Below Shoulder', '700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(156, 7, 'Flat Iron, Mid Length', '800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(157, 7, 'Flat Iron, Waist Length', '900', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(158, 7, 'Tongs/ Curlz, Upto Shoulder', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(159, 7, 'Tongs/ Curlz, Below Shoulder', '700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(160, 7, 'Tongs/ Curlz, Mid Length', '850', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(161, 7, 'Tongs/ Curlz, Waist Length', '950', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(162, 7, 'Blow Dry, Upto Shoulder', '350', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(163, 7, 'Blow Dry, Below Shoulder', '400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(164, 7, 'Blow Dry, Mid Length', '500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(165, 7, 'Blow Dry, Waist Length', '550', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(166, 7, 'Hair Do Normal', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(167, 7, 'Hair Do Advance', '750', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(168, 8, 'finch cut', '125', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(169, 8, 'Baby Normal Haircut (Under12)', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(170, 8, 'Baby Cut &amp; Styling (Under 12)', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(171, 8, 'Men Normal Haircut', '250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(172, 8, 'Men Cut &amp; Styling', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(173, 8, 'Shaving', '100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(174, 8, 'Beard/Moustache Trim', '100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(175, 8, 'Beard Styling', '150', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(176, 8, 'Baba Normal Haircut (Under 12)', '126', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(177, 8, 'Baba Cut &amp; Styling (Under 12)', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(178, 8, 'Hair Wash, Men', '125', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(179, 8, 'Hair Wash, Women', '250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(180, 8, 'Head Massage, Classic', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(181, 8, 'Head Massage,Olive', '350', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(182, 8, 'Head Massage,Aroma', '400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(183, 8, 'Body Massage, Classic', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(184, 8, 'Body Massage, Olive', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(185, 8, 'Body Massage, Aroma', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(186, 8, 'Woman Normal Hair Cut', '400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(187, 8, 'Woman Cut &amp; Styling', '500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(188, 9, 'Heel peel', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(189, 10, 'Nail Filing Paint', '150', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(190, 11, 'kasmara cleanup', '1700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(191, 11, 'Kasmara Facial', '5000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(192, 11, 'Kasmara Goji Luxury Facial', '5000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(193, 11, 'Kasmara 24k Gold Luxury Facial', '6000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(194, 12, 'Executive Wedding-day Groom Packages', '6000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(195, 12, 'Executive Pree-Groom Packages', '12500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(196, 12, 'Pree-Bridal Package', '8500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(197, 12, 'Wedding-day Bridal Package with Kyralon', '6500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(198, 12, 'Executive Pree-Bridal Package', '17500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(199, 12, 'Executive Wedding-day Bridal Package with M.A.C.', '11000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(200, 12, 'Pree-Groom Package', '6000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(201, 12, 'Wedding-day Groom Packages with Kyralon', '3500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(202, 13, 'Bridal Makeup,with MAC', '11000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(203, 13, 'Reception Makeup, with MAC', '8000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(204, 13, 'Engagement Makeup, with MAC', '5500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(205, 13, 'Party Makeup, with MAC', '5500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(206, 13, 'Simple Makeup, with MAC', '3500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(207, 13, 'Groom Makeup, with MAC', '1700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(208, 13, 'Simple Makeup, with Kryolan', '1700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(209, 13, 'Party Makeup, with Kryolan', '2800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(210, 13, 'Engagement Makeup, with Kryolan', '3000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(211, 13, 'Reception Makeup, with Kryolan', '4000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(212, 13, 'Bridal Makeup,with Kryolan', '5500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(213, 13, 'Groom Makeup, with Kryolan', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(214, 13, 'Hair Style Extra', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(215, 13, 'Saree Draping Extra', '500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(216, 14, 'Fruit Body Polish', '2200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(217, 14, 'D-Tan Body Polish', '2800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(218, 14, 'Hydrating Body Polish', '3300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(219, 14, 'Claring Body Polish', '3800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(220, 14, 'Chocolate Body Polish', '4500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(221, 15, 'Bodycare Stripless Wax, Neck', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(222, 15, 'Bodycare Stripless Wax, Full Face', '700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(223, 15, 'Bodycare Stripless Wax, Sidelock', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(224, 15, 'Bodycare Stripless Wax, Chin', '100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(225, 15, 'Bodycare Stripless Wax, Lower Lip', '100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(226, 15, 'Bodycare Stripless Wax, Upper lip', '80', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(227, 15, 'Bodycare Stripless Wax, Forehead', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(228, 15, 'Bodycare Stripless Wax, Brazilian Wax', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(229, 15, 'Bodycare Stripless Wax, Eyebrows', '80', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(230, 15, 'Bodycare Stripless Wax,Under arms', '250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(231, 15, 'Rica Stripless Wax, Eyebrows', '100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(232, 14, 'Rica Stripless Wax, Forehead', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(233, 15, 'Rica Stripless Wax, Upper lip', '100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(234, 15, 'Rica Stripless Wax, Lower Lip', '100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(235, 15, 'Rica Stripless Wax, Chin', '150', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(236, 15, 'Rica Stripless Wax, Sidelock', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(237, 15, 'Rica Stripless Wax, Full Face', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(238, 15, 'Rica Stripless Wax, Neck', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(239, 15, 'Rica Stripless Wax, Under arms', '225', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(240, 15, 'Rica Stripless Wax, Brazilian Wax', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(241, 16, 'Rica Luxury Wax, Full Face', '525', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(242, 16, 'Rica Luxury Wax, Under arms', '250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(243, 16, 'Rica Luxury Wax, Half arms', '450', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(244, 16, 'Rica Luxury Wax, Full arms', '700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(245, 16, 'Rica Luxury Wax, Full Back', '750', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(246, 16, 'Rica Luxury Wax, Half legs', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(247, 16, 'Rica Luxury Wax, Full legs', '900', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(248, 16, 'Rica Luxury Wax, Bikini Line', '1200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(249, 16, 'Rica Luxury Wax, Full Body', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(250, 17, 'Chocolate Wax, Full Face', '250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(251, 17, 'Chocolate Wax, Under arms', '120', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(252, 16, 'Chocolate Wax, Half arms', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(253, 17, 'Chocolate Wax, Full arms', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(254, 17, 'Chocolate Wax, Full Back', '450', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(255, 17, 'Chocolate Wax, Half legs', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(256, 17, 'Chocolate Wax, Full legs', '520', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(257, 17, 'Chocolate Wax, BIkini Line', '975', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(258, 17, 'Chocolate Wax, Full Body', '1350', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(259, 18, 'Honey Wax, Full Face', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(260, 18, 'Honey Wax, Under arms', '100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(261, 18, 'Honey Wax, Half arms', '150', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(262, 18, 'Honey Wax, Full arms', '275', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(263, 18, 'Honey Wax, Full Back', '375', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(264, 18, 'Honey Wax, Half legs', '225', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(265, 18, 'Honey Wax, Full legs', '400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(266, 18, 'Honey Wax, Bikini Line', '875', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(267, 18, 'Honey Wax, Full Body', '1125', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(268, 19, 'O3+ Bleach, Full Face Neck', '450', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(269, 19, 'O3+ Bleach, Full Face, Neck &amp; Blouse Line', '450', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(270, 19, 'O3+ Bleach, Under arms', '250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(271, 19, 'O3+ Bleach, Half arms', '350', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(272, 19, 'O3+ Bleach, Full arms', '450', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(273, 19, 'O3+ Bleach, Half Back', '400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(274, 19, 'O3+ Bleach, Full Back', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(275, 19, 'O3+ Bleach, Half legs', '450', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(276, 19, 'O3+ Bleach, Full legs', '650', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(277, 19, 'O3+ Bleach, Full Body', '2800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(278, 20, 'HAf back Bleach', '800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(279, 20, 'Cheryl.s Gold bleach', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(280, 20, 'OXY Bleach, Full Face Neck', '500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(281, 20, 'OXY Bleach, Full Face, Neck &amp; Blouse Line', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(282, 20, 'OXY Bleach, Under Arms', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(283, 20, 'OXY Bleach, Full arms', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(284, 20, 'OXY Bleach, Half Back', '500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(285, 20, 'OXY Bleach, Full Back', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(286, 20, 'OXY Bleach, Half Legs', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(287, 20, 'OXY Bleach, Full Legs', '900', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(288, 20, 'OXY Bleach, Full Body', '3000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(289, 21, 'O3+ D-Tan,Full Face,Neck,Blouse Line', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(290, 21, 'O3+ D-Tan, Full Face', '350', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(291, 21, 'O3+ D-Tan, Full Face, Neck', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(292, 21, 'O3+ D-Tan, Under arms', '175', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(293, 21, 'O3+ D-Tan, Half arms', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(294, 21, 'O3+ D-Tan, Full arms', '450', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(295, 21, 'O3+ D-Tan, Half Back', '475', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(296, 21, 'O3+ D-Tan, Full back', '900', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(297, 21, 'O3+ D-Tan, Foot', '180', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(298, 21, 'O3+ D-Tan, Half Legs', '550', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(299, 21, 'O3+ D-Tan, Full legs', '975', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(300, 21, 'O3+ D-Tan, Full Body', '2250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(301, 22, 'Threading,Eyebrows', '30', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(302, 22, 'Threading, Fore head', '35', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(303, 22, 'Threading, Upper Lips', '30', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(304, 21, 'Threading, Lower lips', '30', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(305, 22, 'Threading, Chin', '40', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(306, 22, 'Threading, Sidelock', '50', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(307, 22, 'Threading, Full face', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(308, 23, 'Heel Peel Treatment', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(309, 23, 'Extra for Paraffin Wax', '300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(310, 23, 'Herbal Pedicure', '500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(311, 23, 'French Pedicure', '525', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(312, 23, 'Spa Pedicure', '750', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(313, 23, 'O3+ Pedilogix Pedicure', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(314, 23, 'Nail Filing &amp; Paint', '75', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(315, 24, 'Hand Sitting Menicure', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(316, 24, 'Extra for Paraffin Wax', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(317, 24, 'Herbal Manicure', '500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(318, 24, 'French Manicure', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(319, 24, 'Spa Manicure', '800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(320, 24, 'O3+ Pedilogix Manicure', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(321, 25, 'O3+ Shine $ Glowing Facial', '3000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(322, 25, 'O3+ Bridal Oxygenating Glow Fecial', '3500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(323, 24, 'O3+ Bridal Vitamin -C Glowing Facial', '3500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(324, 25, 'O3+ Bridal Rediant glowing facial', '4000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(325, 25, 'Oxygen Facial', '2000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(326, 25, 'Bridal Facial', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(327, 25, 'Anti-tan Faical', '2000', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(328, 25, 'Seaweed Facial', '2000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(329, 25, 'Whitening Facial', '2000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(330, 25, 'Adult Acne Clear Facial', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(331, 25, 'Seaweed Treatment Facial', '2700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(332, 25, 'Whitening Treatment Faical', '2700', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(333, 25, 'Seaweed Luxury Facial', '3000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(334, 25, 'Whitening Luxury Facial', '3000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(335, 25, 'Power Brightening Facial', '3400', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(336, 25, 'Ultra Relaxing Facial', '2000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(337, 25, 'Time Expert Facial', '3500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(338, 25, 'Daimond Luxury Facial', '3500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(339, 26, 'Cheryls facial Glow vite', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(340, 26, 'cheryls Oxy blast', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(341, 26, 'Cheryls Tan Clear', '1500', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(342, 26, 'Cheryls vita Lift', '1800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(343, 26, 'D-Tan', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(344, 26, 'Active Charcoal Facial', '1300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(345, 26, 'Red Wine Facial', '1300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(346, 26, 'Men&#039;s Fairness Facial', '1100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(347, 26, 'Fruit Facial', '1100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(348, 26, 'Brightening Facial', '1100', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(349, 26, 'Melanoclear Skin Whitening Facial', '1300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(350, 26, 'Gold Facial', '1300', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(351, 26, 'Diamond Facial', '1500', '59.153.97.112', 1, '2024-07-19', '2024-07-19'),
(352, 26, 'Shahnaz&#039;s Gold Facial', '2500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(353, 26, 'Shahnaz&#039;s Diamond Facial', '3500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(354, 27, 'O3+Pawar Mask', '1000', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(355, 27, 'O3+ Pawar Mask', '1500', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(356, 27, 'Cleasing Scrub', '200', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(357, 27, 'O3+ Cleap up', '800', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(358, 27, 'O3+ D-Tan Clean up', '1250', '59.153.97.112', 1, '2024-07-19', '0000-00-00'),
(359, 27, 'Normal Clean up', '600', '59.153.97.112', 1, '2024-07-19', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `setting_id` int(11) NOT NULL,
  `cgst` varchar(100) NOT NULL,
  `sgst` varchar(100) NOT NULL,
  `bill_count` varchar(100) NOT NULL,
  `product_discount` varchar(100) NOT NULL,
  `service_discount` varchar(100) NOT NULL,
  `bill_prefix` varchar(100) NOT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL,
  `createdate` date NOT NULL,
  `lastupdated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`setting_id`, `cgst`, `sgst`, `bill_count`, `product_discount`, `service_discount`, `bill_prefix`, `ipaddress`, `createdby`, `createdate`, `lastupdated`) VALUES
(1, '9', '9', '123', '15', '18', '', '192.168.0.24', 1, '0000-00-00', '2024-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `sms_template`
--

CREATE TABLE `sms_template` (
  `sms_temp_id` int(11) NOT NULL,
  `sms_temp_head` varchar(100) NOT NULL,
  `sms_temp_desc` text DEFAULT NULL,
  `status` int(11) NOT NULL,
  `login_id` int(11) DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `ipaddress` varchar(100) NOT NULL,
  `createdby` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `sms_template`
--

INSERT INTO `sms_template` (`sms_temp_id`, `sms_temp_head`, `sms_temp_desc`, `status`, `login_id`, `createdate`, `updatedate`, `ipaddress`, `createdby`) VALUES
(1, 'Free Facial with Straightening', 'Free Facial worth Rs.1100 with Straightening/ Rebonding/Smoothing/Relaxing @Rs.4999.00 T&amp;C Apply, for details call 8349720066, 0771-4906668, Jawed Habib New Rajendra Nagar Raipur. RAYAAN ASSOCIATE', 1, NULL, '2024-07-16 16:15:00', '2024-07-16 16:15:00', '192.168.0.13', 0),
(3, 'Free Facial RPR', 'Free Facial worth Rs.1100 with Keratin @Rs.5499.00 T&amp;C Apply, for details call 8349720066, 0771-4906668, Jawed Habib New Rajendra Nagar Raipur. RAYAAN ASSOCIATE', 1, NULL, '2024-07-16 16:14:38', '2024-07-16 16:14:38', '192.168.0.13', 0),
(4, 'Free Haircut n Styling RPR', 'Free Haircut n Styling i/c Hair wash with Shampoo n Conditioner n Blow Dry with Globel Colour/Highlights @Rs.2499 T&amp;C Apply, for details call 8349720066, 0771-4906668, Jawed Habib New Rajendra Nagar Raipur. RAYAAN ASSOCIATE', 1, NULL, '2024-07-16 16:15:22', NULL, '192.168.0.13', 0),
(5, 'Free Upper Lip n Chin RPR', 'Free Upper Lip n Chin Brazelian wax with Hale Leg n arm Rica Luxry Wax @Rs.1249 T&amp;C Apply, for details call 8349720066, 0771-4906668, Jawed Habib New Rajendra Nagar Raipur. RAYAAN ASSOCIATE', 1, NULL, '2024-07-16 16:15:36', NULL, '192.168.0.13', 0),
(6, 'Free Full arm wax RPR', 'Free Full arm wax with 03 Facial @Rs.2499 T&amp;C Apply, for details call 8349720066, 0771-4906668, Jawed Habib New Rajendra Nagar Raipur. RAYAAN ASSOCIATE', 1, NULL, '2024-07-16 16:15:48', NULL, '192.168.0.13', 0),
(7, 'Hydra Facial', 'Dear customer, Rs. 500.00 off for Hydra Facial, for details call 8349720066, 0771-4906668, Jawed Habib New Rajendra Nagar Raipur. RAYAAN ASSOCIATE', 1, NULL, '2024-07-16 16:16:00', NULL, '192.168.0.13', 0),
(8, 'Hair Spa', 'Dear customer, get Hair Spa @ Rs 1150, for details call 8349720066, 0771-4906668, Jawed Habib New Rajendra Nagar Raipur. RAYAAN ASSOCIATE', 1, NULL, '2024-07-16 16:16:11', NULL, '192.168.0.13', 0),
(9, 'O3 Facial', 'Dear Customer get Free Full arm wax with O3 Facial @Rs.2499, for details call 8349720066, 0771-490666, Jawed Habib New Rajendra Nagar Raipur. RYANCG', 1, NULL, '2024-07-16 16:16:38', NULL, '192.168.0.13', 0),
(10, 'Colour/Highlights', 'Dear Customer get Free Haircut with Global Colour/Highlights @Rs.2499, for details call 8349720066, 0771-490666, Jawed Habib New Rajendra Nagar Raipur. RYANCG', 1, NULL, '2024-07-16 16:16:55', NULL, '192.168.0.13', 0),
(11, 'get Straightening/Rebonding/Smoothing/Relaxing', 'Dear Customer get Straightening/Rebonding/Smoothing/Relaxing @Rs.4999, for details call 8349720066, 0771-490666, Jawed Habib New Rajendra Nagar Raipur. RYANCG', 1, NULL, '2024-07-16 16:17:09', NULL, '192.168.0.13', 0),
(12, 'Get Keratin', 'Dear Customer get Keratin @Rs.5499, for details call 8349720066, 0771-490666, Jawed Habib New Rajendra Nagar Raipur. RYANCG', 1, NULL, '2024-07-16 16:17:22', NULL, '192.168.0.13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `software_expired`
--

CREATE TABLE `software_expired` (
  `soft_exp_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `expired_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `software_expired`
--

INSERT INTO `software_expired` (`soft_exp_id`, `start_date`, `expired_date`) VALUES
(4, '2024-02-01', '2026-02-01');

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
(4, '2024-04-06', '13:16:00', '12:16:00', 'gfhfghgf', 'medium', 7);

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
(14, 'Foods', 'hgfhfghgfh', 'Bank', '2024-03-14', 8000, 1),
(15, 'Foods', 'ytytrytry', 'Cheque', '2024-03-27', 600, 1),
(16, 'Debt', 'retretr', 'Cheque', '2024-03-27', 8000, 0),
(17, 'Gift', 'jhgjhgj', 'Cash', '2024-03-21', 10000, 1),
(18, 'Others', 'tyty', 'Cheque', '2024-03-29', 4000, 1),
(19, 'Salary', 'jgjghj', 'Cash', '2024-03-30', 1000, 0),
(20, 'Business', 'tgyhtytr', 'Cash', '2024-03-20', 7000, 1),
(21, 'Business', 'bnbb', 'Bank', '2024-03-20', 4000, 0),
(22, 'Gift', 'Buy gift for my mother', 'Cash', '2024-05-17', 1000, 0),
(23, 'Loan', 'Ram', 'Cheque', '2024-05-17', 5000, 1),
(24, 'Gift', 'testting', 'Cash', '2025-04-20', 100, 0);

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
-- Indexes for table `bank_master`
--
ALTER TABLE `bank_master`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `card_assign`
--
ALTER TABLE `card_assign`
  ADD PRIMARY KEY (`card_assign_id`);

--
-- Indexes for table `card_offer`
--
ALTER TABLE `card_offer`
  ADD PRIMARY KEY (`card_id`);

--
-- Indexes for table `company_setting`
--
ALTER TABLE `company_setting`
  ADD PRIMARY KEY (`compid`);

--
-- Indexes for table `customer_master`
--
ALTER TABLE `customer_master`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `demo`
--
ALTER TABLE `demo`
  ADD PRIMARY KEY (`demo_id`);

--
-- Indexes for table `demo1`
--
ALTER TABLE `demo1`
  ADD PRIMARY KEY (`demo_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indexes for table `expense_group`
--
ALTER TABLE `expense_group`
  ADD PRIMARY KEY (`ex_group_id`);

--
-- Indexes for table `expense_master`
--
ALTER TABLE `expense_master`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`);

--
-- Indexes for table `gst_master`
--
ALTER TABLE `gst_master`
  ADD PRIMARY KEY (`gst_id`);

--
-- Indexes for table `lists`
--
ALTER TABLE `lists`
  ADD PRIMARY KEY (`todo_id`);

--
-- Indexes for table `m_designation`
--
ALTER TABLE `m_designation`
  ADD PRIMARY KEY (`designation_id`);

--
-- Indexes for table `m_product_category`
--
ALTER TABLE `m_product_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `m_unit`
--
ALTER TABLE `m_unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `m_users`
--
ALTER TABLE `m_users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payment_detail`
--
ALTER TABLE `payment_detail`
  ADD PRIMARY KEY (`payment_detailid`);

--
-- Indexes for table `product_billing`
--
ALTER TABLE `product_billing`
  ADD PRIMARY KEY (`prod_billing_id`);

--
-- Indexes for table `product_billing_detail`
--
ALTER TABLE `product_billing_detail`
  ADD PRIMARY KEY (`prod_bill_detail_id`);

--
-- Indexes for table `product_master`
--
ALTER TABLE `product_master`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `purchase_details`
--
ALTER TABLE `purchase_details`
  ADD PRIMARY KEY (`purchase_detailsid`);

--
-- Indexes for table `purchase_entry`
--
ALTER TABLE `purchase_entry`
  ADD PRIMARY KEY (`purchaseid`);

--
-- Indexes for table `receipt_stock`
--
ALTER TABLE `receipt_stock`
  ADD PRIMARY KEY (`receipt_stock_id`);

--
-- Indexes for table `receipt_stock_lower`
--
ALTER TABLE `receipt_stock_lower`
  ADD PRIMARY KEY (`receipt_stock_lower_id`);

--
-- Indexes for table `rem`
--
ALTER TABLE `rem`
  ADD PRIMARY KEY (`rem_id`);

--
-- Indexes for table `service_category`
--
ALTER TABLE `service_category`
  ADD PRIMARY KEY (`ser_cate_id`);

--
-- Indexes for table `service_master`
--
ALTER TABLE `service_master`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `sms_template`
--
ALTER TABLE `sms_template`
  ADD PRIMARY KEY (`sms_temp_id`);

--
-- Indexes for table `software_expired`
--
ALTER TABLE `software_expired`
  ADD PRIMARY KEY (`soft_exp_id`);

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
-- AUTO_INCREMENT for table `bank_master`
--
ALTER TABLE `bank_master`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `card_assign`
--
ALTER TABLE `card_assign`
  MODIFY `card_assign_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `card_offer`
--
ALTER TABLE `card_offer`
  MODIFY `card_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company_setting`
--
ALTER TABLE `company_setting`
  MODIFY `compid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_master`
--
ALTER TABLE `customer_master`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `demo`
--
ALTER TABLE `demo`
  MODIFY `demo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `demo1`
--
ALTER TABLE `demo1`
  MODIFY `demo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expense_group`
--
ALTER TABLE `expense_group`
  MODIFY `ex_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `expense_master`
--
ALTER TABLE `expense_master`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gst_master`
--
ALTER TABLE `gst_master`
  MODIFY `gst_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lists`
--
ALTER TABLE `lists`
  MODIFY `todo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `m_designation`
--
ALTER TABLE `m_designation`
  MODIFY `designation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `m_product_category`
--
ALTER TABLE `m_product_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `m_unit`
--
ALTER TABLE `m_unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `m_users`
--
ALTER TABLE `m_users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_detail`
--
ALTER TABLE `payment_detail`
  MODIFY `payment_detailid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_billing`
--
ALTER TABLE `product_billing`
  MODIFY `prod_billing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product_billing_detail`
--
ALTER TABLE `product_billing_detail`
  MODIFY `prod_bill_detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product_master`
--
ALTER TABLE `product_master`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `purchase_details`
--
ALTER TABLE `purchase_details`
  MODIFY `purchase_detailsid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_entry`
--
ALTER TABLE `purchase_entry`
  MODIFY `purchaseid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `receipt_stock`
--
ALTER TABLE `receipt_stock`
  MODIFY `receipt_stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `receipt_stock_lower`
--
ALTER TABLE `receipt_stock_lower`
  MODIFY `receipt_stock_lower_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rem`
--
ALTER TABLE `rem`
  MODIFY `rem_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `service_category`
--
ALTER TABLE `service_category`
  MODIFY `ser_cate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `service_master`
--
ALTER TABLE `service_master`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sms_template`
--
ALTER TABLE `sms_template`
  MODIFY `sms_temp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `software_expired`
--
ALTER TABLE `software_expired`
  MODIFY `soft_exp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `testid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `tansid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
