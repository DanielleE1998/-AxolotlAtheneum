-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2021 at 11:14 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `ISBN` int(11) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `Author_Name` varchar(45) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Cover_Picture` varchar(255) NOT NULL,
  `Edition` int(11) NOT NULL,
  `Publisher` varchar(45) NOT NULL,
  `Publication_Year` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Minimum_thresh` int(11) NOT NULL,
  `Buying_Price` int(11) NOT NULL,
  `Selling_Price` int(11) NOT NULL,
  `Book Rating` int(11) DEFAULT NULL,
  `Shopping_Carts_Customer_ID` int(11) NOT NULL,
  `Shopping_Carts_Users_User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `Customer_ID` varchar(45) DEFAULT NULL,
  `Order_Time` datetime DEFAULT NULL,
  `Order_Status` varchar(45) DEFAULT NULL,
  `Order_Price` int(11) DEFAULT NULL,
  `Order_Address` varchar(255) DEFAULT NULL,
  `Order_Payment` varchar(45) DEFAULT NULL,
  `Ordered_ISBN` varchar(45) DEFAULT NULL,
  `Users_User_ID` int(11) NOT NULL,
  `Payment_Info_CustomerID` int(11) NOT NULL,
  `Payment_Info_Payment_CardNum` int(11) NOT NULL,
  `Books_ISBN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `CustomerID` int(11) NOT NULL,
  `Payment_CarNum` varchar(45) NOT NULL,
  `Pyment_CardType` varchar(45) DEFAULT NULL,
  `Payment_CardExp` date DEFAULT NULL,
  `Users_User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `promotions`
--

CREATE TABLE `promotions` (
  `Promotion_ID` int(11) NOT NULL,
  `Promotion_Code` varchar(45) NOT NULL,
  `Promotion_Start` date DEFAULT NULL,
  `Promotion_End` date DEFAULT NULL,
  `Promotion_Discount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `shopping_carts`
--

CREATE TABLE `shopping_carts` (
  `Customer_ID` int(11) NOT NULL,
  `Book_ISBN` int(11) DEFAULT NULL,
  `Promo_Code` varchar(45) DEFAULT NULL,
  `Cart_Total` int(11) DEFAULT NULL,
  `Users_User_ID` int(11) NOT NULL,
  `Promotions_Promotion_ID` int(11) NOT NULL,
  `Payment_Info_CustomerID` int(11) NOT NULL,
  `Payment_Info_Payment_CardNum` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` int(11) NOT NULL,
  `Is_Admin` int(11) NOT NULL DEFAULT 0,
  `User_IsActive` int(11) NOT NULL DEFAULT 0,
  `User_ActivationCode` varchar(45) DEFAULT NULL,
  `User_IsSubscribed` int(11) DEFAULT 0,
  `User_Name` varchar(45) NOT NULL,
  `User_Phone` varchar(45) NOT NULL,
  `User_Email` varchar(45) NOT NULL,
  `User_Password` varchar(45) NOT NULL,
  `User_Address` varchar(45) DEFAULT NULL,
  `User_City` varchar(45) DEFAULT NULL,
  `User_Zip` int(11) DEFAULT NULL,
  `User_CardType` varchar(45) DEFAULT NULL,
  `User_CardNum` int(11) DEFAULT NULL,
  `User_CardExp` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users_has_orders`
--

CREATE TABLE `users_has_orders` (
  `Users_User_ID` int(11) NOT NULL,
  `Orders_Order_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`,`Users_User_ID`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`CustomerID`,`Users_User_ID`);

--
-- Indexes for table `promotions`
--
ALTER TABLE `promotions`
  ADD PRIMARY KEY (`Promotion_ID`);

--
-- Indexes for table `shopping_carts`
--
ALTER TABLE `shopping_carts`
  ADD PRIMARY KEY (`Customer_ID`,`Users_User_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Indexes for table `users_has_orders`
--
ALTER TABLE `users_has_orders`
  ADD PRIMARY KEY (`Users_User_ID`,`Orders_Order_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_info`
--
ALTER TABLE `payment_info`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `promotions`
--
ALTER TABLE `promotions`
  MODIFY `Promotion_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `User_ID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
