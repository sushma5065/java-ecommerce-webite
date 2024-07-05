CREATE TABLE `cart` (
  `productid` int(11) NOT NULL,
  `productname` varchar(255) NOT NULL,
  `productdescription` text DEFAULT NULL,
  `productimage_url` varchar(255) DEFAULT NULL,
  `productprice` decimal(10,2) NOT NULL,
  `email` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
