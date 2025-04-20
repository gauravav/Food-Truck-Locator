-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: sql9.freemysqlhosting.net
-- Generation Time: Oct 21, 2023 at 07:09 PM
-- Server version: 5.5.62-0ubuntu0.14.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

-- SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
-- SET AUTOCOMMIT = 0;
-- START TRANSACTION;
-- SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql9655242`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountdetails`
--

CREATE DATABASE IF NOT EXISTS foodTruck;

DROP TABLE IF EXISTS `accountdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accountdetails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `login_type` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Food_Truck_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

--
-- Dumping data for table `accountdetails`
--

INSERT INTO `accountdetails` (`id`, `username`, `password`, `email`, `firstname`, `lastname`, `login_type`, `status`, `created_at`, `Food_Truck_ID`) VALUES
(25, 'gauravav', 'gaurav11596', 'avulagaurav@gmail.com', 'Gaurav', 'Avula', 'user', 'active', '2023-05-01 06:48:30', '17'),
(26, 'rkatar', 'rkatari', 'rkatari@uncc.edu', 'Rohan', 'Katari', 'user', 'active', '2023-05-01 06:53:32', '14'),
(27, 'Amar', 'amar', 'amar@gmail.com', 'Amar', 'Chowdary', 'user', 'active', '2023-05-01 07:17:38', '15'),
(28, 'Yashu', 'yashu', 'yashu@gmail.com', 'Yashaswini', 'Golla', 'user', 'active', '2023-05-01 07:36:04', '16'),
(29, 'Anudeep', 'anudeep', 'anudeep@gmail.com', 'Anudeep', 'Murala', 'user', 'active', '2023-05-01 09:48:32', '18'),
(30, 'Rudra', 'rudra', 'rudra@gmail.com', 'Rudra', 'Attuluri', 'user', 'active', '2023-05-01 10:06:40', '19'),
(31, 'Lahari', 'lahari', 'lahari@gmail.com', 'Lahari', 'Prathapagiri', 'user', 'active', '2023-05-01 10:22:25', '20'),
(32, 'Harold', 'harold', 'harold@gmail.com', 'Harolds', 'Cooper', 'user', 'active', '2023-05-02 07:25:26', '21'),
(33, 'testtruck', 'testtruck', 'testtruck@gmail.com', 'Test', 'Truck', 'user', 'active', '2023-05-02 22:34:23', NULL),
(34, 'temp', 'temp', 'temp@gmail.com', 'temp', 'temp', 'user', 'active', '2023-05-03 00:46:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `foodtruckinformation`
--

DROP TABLE IF EXISTS `foodtruckinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodtruckinformation` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(500) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Website` varchar(200) DEFAULT NULL,
  `Hours` varchar(50) NOT NULL,
  `Latitude` float DEFAULT NULL,
  `Longitude` float DEFAULT NULL,
  `Notes` varchar(255) DEFAULT NULL,
  `What3Words` varchar(255) NOT NULL,
  `updated_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
);

--
-- Dumping data for table `foodtruckinformation`
--

INSERT INTO `foodtruckinformation` (`ID`, `Name`, `Description`, `Address`, `PhoneNumber`, `Email`, `Website`, `Hours`, `Latitude`, `Longitude`, `Notes`, `What3Words`, `updated_time`) VALUES
(14, 'Salty Donuts', 'Artisanal donut shoppe & coffee bar focusing on chef-made, small-batch, craft donuts.', '910 Pavilion Blvd, Charlotte, NC 28262, USA', '+17048333613', 'donuts@saltydonut.com', 'https://www.saltydonut.com', '7AM - 7PM', 35.3239, -80.713, 'We are out of raspberry donuts for today.\nTomorrow is our last day. \n', 'graceful.shuttling.celebrations', '2023-05-03 04:47:09'),
(15, 'Blasian Asian', 'We serve a Korean & American fusion menu with a lot of Seoul and flavors', '705 Pavilion Blvd, Charlotte, NC 28262, USA', '+19887487956', 'blasian@gmail.com', 'http://www.blasianasianway.com', '7AM - 8PM', 35.3289, -80.7136, NULL, 'resigned.marker.concur', '2023-05-01 07:55:46'),
(16, 'Tacos el Flacko', 'We are a 2nd generation taqueria with a unique menu, selling the best tacos in Charlotte.', '6228 Waterford Hills Dr, Charlotte, NC 28269, USA', '+19848032919', 'tacoelf@gmail.com', 'https://flackotacos.com/', '12PM - 8PM', 35.3337, -80.8007, NULL, 'begin.timbered.resides', '2023-05-01 07:46:42'),
(17, 'Halal Food Cart', 'OneStop truck for the famous halal food- meats & falafel combos', '9430 John Kirk Dr, Charlotte, NC 28213, USA', '+16587965456', 'halalcart@gmail.com', 'https://halalfoodcartcharlotte.cafecityguide.website/', '11AM - 4AM', 35.3053, -80.7243, NULL, 'birthday.plea.unstated', '2023-05-01 08:15:39'),
(18, 'Nacho Average Truck', 'This is Charlotte\'s FIRST Nacho Truck. You will find gourmet nachos here, all with homemade toppings. We have a set menu and some specialty items that will rotate on the truck weekly. ', '4542 Perkins Rd, Charlotte, NC 28269, USA', '+13476656989', 'nachavg@gmail.com', 'https://www.nachoaveragetruck.com', '11AM - 7PM', 35.3036, -80.8207, NULL, 'dearly.conditioning.traffic', '2023-05-01 10:21:28'),
(19, '225 Street Food', 'Fusion street eats with The Perfect Temperature! Culture Creative Cuisine Brought to you by #NoRecipeCLT.', '1001 E W.T. Harris Blvd Suite U, Charlotte, NC 28213, USA', '+16748889987', '225sf@gmail.com', 'https://www.225streetfood.com/', '12PM - 8PM', 35.2943, -80.7392, NULL, 'plume.abandonment.riskiest', '2023-05-01 10:16:48'),
(20, 'Repicci\'s Italian Ice & Gelato', 'We specialize in serving the very best, real Italian Ice and gelato from our food trucks nationwide.', '1200 N Church St, Charlotte, NC 28206, USA', '+14865465348', 'repicciice@gmail.com', 'http://www.italianice.com', '12PM - 12AM', 35.2372, -80.8314, NULL, 'shaped.smile.hits', '2023-05-01 10:30:41');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `foodtruck_id` int NOT NULL,
  `rating` int NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `foodtruck_id` (`foodtruck_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`foodtruck_id`) REFERENCES `foodtruckinformation` (`ID`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accountdetails` (`id`)
);

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `foodtruck_id`, `rating`, `comment`, `created_at`) VALUES
(30, 27, 15, 3, 'This has fantastic food.', '2023-05-01 07:30:36'),
(31, 27, 15, 3, 'Good', '2023-05-01 07:32:44'),
(32, 31, 14, 5, 'Tasty Donuts, must try!', '2023-05-01 10:32:01'),
(33, 30, 15, 5, 'Must try the dumplings', '2023-05-01 10:33:39'),
(34, 29, 16, 5, 'Awesome tacos!!', '2023-05-01 10:34:43'),
(35, 29, 16, 3, '', '2023-05-01 10:34:44'),
(36, 28, 17, 5, 'Yummy Chicken over rice, five-stars!', '2023-05-01 10:35:53'),
(37, 28, 17, 5, '', '2023-05-01 10:35:59'),
(38, 27, 18, 5, 'Thumbs up for gourmet nachos!', '2023-05-01 10:37:49'),
(39, 27, 18, 3, '', '2023-05-01 10:38:07'),
(40, 26, 19, 5, 'Must try street food, pocket-friendly', '2023-05-01 10:39:07'),
(41, 25, 20, 5, 'Wide variety of flavors, must try marshmallow gelato', '2023-05-01 10:40:45'),
(52, 33, 14, 5, 'Shakes are special here.!', '2023-05-03 02:17:58'),
(53, 32, 14, 3, 'Test COmment', '2023-05-03 02:43:27');

--

--
-- Table structure for table `favfoodtrucks`
--

DROP TABLE IF EXISTS `favfoodtrucks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favfoodtrucks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `foodtruck_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `foodtruck_id` (`foodtruck_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `favfoodtrucks_ibfk_1` FOREIGN KEY (`foodtruck_id`) REFERENCES `foodtruckinformation` (`ID`),
  CONSTRAINT `favfoodtrucks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accountdetails` (`id`)
);

--
-- Dumping data for table `favfoodtrucks`
--

INSERT INTO `favfoodtrucks` (`id`, `user_id`, `foodtruck_id`, `created_at`) VALUES
(49, 26, 17, '2023-05-01 11:02:01'),
(50, 26, 15, '2023-05-02 07:22:14');

-- --------------------------------------------------------

/*
-- Indexes for dumped tables
--

--
-- Indexes for table `accountdetails`
--
ALTER TABLE `accountdetails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favfoodtrucks`
--
ALTER TABLE `favfoodtrucks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foodtruck_id` (`foodtruck_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `foodtruckinformation`
--
ALTER TABLE `foodtruckinformation`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foodtruck_id` (`foodtruck_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountdetails`
--
ALTER TABLE `accountdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `favfoodtrucks`
--
ALTER TABLE `favfoodtrucks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `foodtruckinformation`
--
ALTER TABLE `foodtruckinformation`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `favfoodtrucks`
--
ALTER TABLE `favfoodtrucks`
  ADD CONSTRAINT `favfoodtrucks_ibfk_1` FOREIGN KEY (`foodtruck_id`) REFERENCES `foodtruckinformation` (`ID`),
  ADD CONSTRAINT `favfoodtrucks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accountdetails` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`foodtruck_id`) REFERENCES `foodtruckinformation` (`ID`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `accountdetails` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

*/