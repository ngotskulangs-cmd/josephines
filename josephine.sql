-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2025 at 07:51 AM
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
-- Database: `josephine`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `name`, `description`, `price`, `category`, `created_at`, `updated_at`) VALUES
(2, 'Tapsilog', 'a', 110.00, 'Appetizer', '2025-10-29 06:31:59', '2025-10-29 06:31:59'),
(3, 'Tapsilog', '', 110.00, 'Main Course', '2025-10-29 06:45:46', '2025-10-29 06:45:46'),
(4, 'Tapsilog', '', 110.00, 'Appetizer', '2025-10-29 06:46:03', '2025-10-29 06:46:03'),
(5, 'Tapsilog', '', 110.00, 'Appetizer', '2025-10-29 06:46:07', '2025-10-29 06:46:07'),
(6, 'Tapsilog', '', 110.00, 'Appetizer', '2025-10-29 06:46:11', '2025-10-29 06:46:11'),
(7, 'Tapsilog', '', 110.00, 'Appetizer', '2025-10-29 06:46:15', '2025-10-29 06:46:15'),
(8, 'Tapsilog', '', 110.00, 'Appetizer', '2025-10-29 06:46:20', '2025-10-29 06:46:20'),
(9, 'Tapsilog', '', 110.00, 'Appetizer', '2025-10-29 06:46:25', '2025-10-29 06:46:25'),
(10, 'Tapsilog', '', 110.00, 'Appetizer', '2025-10-29 06:46:30', '2025-10-29 06:46:30');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `order_id` int(11) NOT NULL,
  `payment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `customize` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderdetails`
--

INSERT INTO `orderdetails` (`order_id`, `payment_id`, `user_id`, `product_name`, `quantity`, `price`, `order_date`, `customize`) VALUES
(1, 1, 1, 'Classic Caesar Salad', 1, 298.00, '2025-10-28 21:39:26', 'No Customization'),
(2, 1, 1, 'Greek Salad', 1, 280.00, '2025-10-28 21:39:26', 'No Customization'),
(3, 2, 1, 'Classic Caesar Salad', 2, 298.00, '2025-10-29 04:11:45', 'No Customization'),
(4, 3, 1, 'Classic Caesar Salad', 4, 298.00, '2025-10-29 05:38:01', 'No Customization'),
(5, 3, 1, 'Greek Salad', 2, 280.00, '2025-10-29 05:38:01', 'No Customization'),
(6, 3, 1, 'Smoked Salmon In Caviar', 1, 408.00, '2025-10-29 05:38:01', 'No Customization');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reference_number` varchar(100) NOT NULL,
  `screenshot_path` varchar(255) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `delivery_type` enum('pickup','delivery') DEFAULT 'pickup',
  `delivery_address` text DEFAULT NULL,
  `delivery_status` enum('pending','preparing','out_for_delivery','delivered','cancelled') DEFAULT 'pending',
  `payment_status` enum('pending','verified','rejected') DEFAULT 'pending',
  `mop` enum('Payonline','COD') NOT NULL DEFAULT 'Payonline',
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `user_id`, `reference_number`, `screenshot_path`, `total_amount`, `delivery_type`, `delivery_address`, `delivery_status`, `payment_status`, `mop`, `payment_date`) VALUES
(1, 1, 'COD-1761687565526', 'COD', 578.00, 'delivery', '12 sdfcsdv sdfvdfg', 'cancelled', 'verified', 'COD', '2025-10-28 21:39:26'),
(2, 1, 'COD-1761711105321', 'COD', 596.00, 'delivery', '43 hvutfdd trcdrydyr', 'delivered', 'verified', 'COD', '2025-10-29 04:11:45'),
(3, 1, 'COD-1761716280584', 'COD', 2160.00, 'delivery', '212 bfghthyt fhyfh', 'pending', 'pending', 'COD', '2025-10-29 05:38:00');

-- --------------------------------------------------------

--
-- Table structure for table `reservationdetails`
--

CREATE TABLE `reservationdetails` (
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `reservation_date` date NOT NULL,
  `reservation_time` time NOT NULL,
  `number_of_people` int(11) NOT NULL,
  `status` varchar(50) DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `created_at`) VALUES
(1, 'ebreo', 'ebreorj05@gmail.com', '$2y$10$m1vE5gUJE6GfksvbalYLEeMeDFLvB8fp1AJhTvH/u7af7Smdhx5.i', '2025-10-28 21:38:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `idx_payment_id` (`payment_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_payment_status` (`payment_status`),
  ADD KEY `idx_reference_number` (`reference_number`);

--
-- Indexes for table `reservationdetails`
--
ALTER TABLE `reservationdetails`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reservationdetails`
--
ALTER TABLE `reservationdetails`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `reservationdetails`
--
ALTER TABLE `reservationdetails`
  ADD CONSTRAINT `reservationdetails_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
