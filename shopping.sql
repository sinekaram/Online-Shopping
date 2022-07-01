-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2022 at 05:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE `alert` (
  `id` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alert`
--

INSERT INTO `alert` (`id`, `description`) VALUES
(2, 'hurry V necked Shirt going to be sold out. Only 4 left');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `email` varchar(100) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `product_total` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`email`, `id`, `quantity`, `product_total`) VALUES
('preethi@gmail.com', 1, 1, 9000),
('sin@gmail.com', 2, 1, 800);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `body` varchar(1000) DEFAULT NULL,
  `response` varchar(200) DEFAULT 'not seen'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `email`, `subject`, `body`, `response`) VALUES
(24, 'kir@gmail.com', 'Related to Shipping', 'hello  ye', 'will reach soon'),
(26, 'preethi@gmail.com', 'my product details', 'venam', 'will reach soon'),
(27, 'sin@gmail.com', 'my product details', 'alugai', 'will reach soon');

--
-- Triggers `message`
--
DELIMITER $$
CREATE TRIGGER `send_msg3` BEFORE INSERT ON `message` FOR EACH ROW set new.response = "will reach soon"
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `orderDate` varchar(100) DEFAULT NULL,
  `deliveryDate` varchar(100) DEFAULT NULL,
  `orderTotal` int(11) DEFAULT NULL,
  `paymentMethod` varchar(100) DEFAULT NULL,
  `transactionId` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'processing',
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `orderDate`, `deliveryDate`, `orderTotal`, `paymentMethod`, `transactionId`, `status`, `email`) VALUES
(1000, '2022-07-01 15:21:45', '2022-07-08 15:21:45.000000', 4800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1001, '2022-07-01 15:25:00', '2022-07-08 15:25:00.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1002, '2022-07-01 15:26:23', '2022-07-08 15:26:23.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1003, '2022-07-01 15:43:57', '2022-07-08 15:43:57.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1004, '2022-07-01 15:45:45', '2022-07-08 15:45:45.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1005, '2022-07-01 15:47:56', '2022-07-08 15:47:56.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1006, '2022-07-01 15:49:46', '2022-07-08 15:49:46.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1007, '2022-07-01 15:50:14', '2022-07-08 15:50:14.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1008, '2022-07-01 15:51:58', '2022-07-08 15:51:58.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1009, '2022-07-01 16:09:31', '2022-07-08 16:09:31.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1010, '2022-07-01 16:11:17', '2022-07-08 16:11:17.000000', 4800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1011, '2022-07-01 16:12:01', '2022-07-08 16:12:01.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com'),
(1012, '2022-07-01 16:12:25', '2022-07-08 16:12:25.000000', 800, 'Cash on delivery(COD)', '', 'processing', 'sin@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `category`, `price`, `gender`, `description`, `count`) VALUES
(1, 'Round necked Shirt', 'Shirt', 9000, 'Men', 'Round necked shirt, long sleeve, yellow color, cotton fabric, only dry wash', 5),
(2, 'V necked Shirt', 'Shirt', 800, 'Men', 'Round necked shirt, long sleeve, yellow color, cotton fabric', 4),
(3, 'V necked Shirt', 'Shirt', 9000, 'Men', 'Round necked shirt', 10),
(4, 'Tore Jean', 'Jean', 1000, 'Women', 'light blue, Torn', 10),
(5, '3/4th pant', 'pant', 800, 'Men', 'black color', 10),
(6, 'long kurti', 'kurti', 900, 'Women', 'yellow color', 10),
(7, 'palazzo', 'pant', 100, 'Men', 'red color', 10);

--
-- Triggers `product`
--
DELIMITER $$
CREATE TRIGGER `alertc` AFTER UPDATE ON `product` FOR EACH ROW BEGIN
	IF new.count < 5 then
    	If (SELECT count(*) FROM alert where id = new.id) then
        	update alert set description = concat('hurry ',new.name," going to be sold out. Only ",new.count,' left');
        ELSE
        	insert into alert(id,description) 
        	values(new.id,concat('hurry ',new.name," going to be sold out. Only ",new.count,' left'));	
        end if;
    ELSE
    	delete from alert where alert.id=new.id;
    end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `productorder`
--

CREATE TABLE `productorder` (
  `order_id` int(11) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `productorder`
--

INSERT INTO `productorder` (`order_id`, `id`, `quantity`, `price`) VALUES
(1000, 1, 1, 9000),
(1001, 2, 1, 800),
(1000, 2, 6, 4800),
(1001, 2, 1, 800),
(1002, 2, 1, 800),
(1003, 2, 1, 800),
(1004, 2, 1, 800),
(1005, 2, 1, 800),
(1006, 2, 1, 800),
(1007, 2, 1, 800),
(1008, 2, 1, 800),
(1009, 2, 1, 800),
(1010, 2, 6, 4800),
(1011, 2, 1, 800),
(1012, 2, 1, 800);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobileNumber` bigint(20) NOT NULL,
  `securityQuestion` varchar(200) NOT NULL,
  `answer` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `email`, `mobileNumber`, `securityQuestion`, `answer`, `password`, `address`, `city`, `state`, `country`) VALUES
('jumana', 'jum@gmail.com', 9080798772, 'What was your first car?', 'Morris Garage', 'juni', '12th clinton street', 'manhattan', 'new york', 'USA'),
('kirupa', 'kir@gmail.com', 9087654321, 'What was your first car?', 'bmw', '123', '2/101, south street', 'thanjavur', 'tamilnadu', 'india'),
('paaru', 'par@gmail.com', 9998764, 'What was your first car?', 'bmw', '1234', '8,kk nagar', 'trichy', 'Haryana', 'US'),
('preethi', 'pre@gmail.com', 9876543210, 'What was your first car?', 'audi', '1234', '8,kk nagar', 'arakonam', 'UP', 'india'),
('Preethi', 'preethi@gmail.com', 9347489601, 'What is the name of your first pet?', 'julie', 'preethi', '137,Middle street', 'nagari', 'AP', 'India'),
('sandhiya', 'san@gmail.com', 9876654321, 'What was your first car?', 'bmw', '123', '70, T nagar', 'kundoor', 'Rajastan', 'india'),
('sineka', 'sin@gmail.com', 6381450713, 'What is the name of your first pet?', 'julie', '1234', '70, T nagar', 'Madurai', 'AP', 'India');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alert`
--
ALTER TABLE `alert`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD KEY `id` (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productorder`
--
ALTER TABLE `productorder`
  ADD KEY `id` (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `productorder`
--
ALTER TABLE `productorder`
  ADD CONSTRAINT `productorder_ibfk_2` FOREIGN KEY (`id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `productorder_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
