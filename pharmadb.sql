-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Anamakine: localhost:8889
-- Üretim Zamanı: 15 Haz 2022, 07:39:54
-- Sunucu sürümü: 5.7.34
-- PHP Sürümü: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `pharmadb`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `costumer`
--

CREATE TABLE `costumer` (
  `cost_ID` int(11) NOT NULL,
  `fname` text COLLATE utf8mb4_turkish_ci,
  `lname` text COLLATE utf8mb4_turkish_ci,
  `gender` text COLLATE utf8mb4_turkish_ci,
  `age` int(11) DEFAULT NULL,
  `contact` int(30) DEFAULT NULL,
  `cost_mail` varchar(30) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `cost_pass` varchar(30) COLLATE utf8mb4_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Tablo döküm verisi `costumer`
--

INSERT INTO `costumer` (`cost_ID`, `fname`, `lname`, `gender`, `age`, `contact`, `cost_mail`, `cost_pass`) VALUES
(1, 'Yağız', 'Gürdamar', 'Erkek', 21, 1111111111, 'yagizgurdamar2001@gmail.com', '552001'),
(2, 'Ali', 'Görgün', 'men', 22, 11111, 'aligorgun@gmail.com', '2121'),
(8, 'yağız', 'aaa', 'men', 21, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `medicines`
--

CREATE TABLE `medicines` (
  `med_ID` int(11) NOT NULL,
  `med_cat` varchar(30) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_turkish_ci,
  `price` varchar(30) COLLATE utf8mb4_turkish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Pharmacist`
--

CREATE TABLE `Pharmacist` (
  `phar_ID` int(11) NOT NULL,
  `fname` text COLLATE utf8mb4_turkish_ci,
  `lname` text COLLATE utf8mb4_turkish_ci,
  `gender` text COLLATE utf8mb4_turkish_ci,
  `admin_mail` varchar(30) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `admin_pass` varchar(30) COLLATE utf8mb4_turkish_ci DEFAULT NULL,
  `contact` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `Sales`
--

CREATE TABLE `Sales` (
  `sales_ID` int(11) NOT NULL,
  `phar_ID` int(11) NOT NULL,
  `cost_ID` int(11) NOT NULL,
  `med_ID` int(11) NOT NULL,
  `count` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `costumer`
--
ALTER TABLE `costumer`
  ADD PRIMARY KEY (`cost_ID`);

--
-- Tablo için indeksler `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`med_ID`);

--
-- Tablo için indeksler `Pharmacist`
--
ALTER TABLE `Pharmacist`
  ADD PRIMARY KEY (`phar_ID`);

--
-- Tablo için indeksler `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`sales_ID`),
  ADD KEY `phar_ID` (`phar_ID`),
  ADD KEY `cost_ID` (`cost_ID`),
  ADD KEY `med_ID` (`med_ID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `costumer`
--
ALTER TABLE `costumer`
  MODIFY `cost_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `medicines`
--
ALTER TABLE `medicines`
  MODIFY `med_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `Pharmacist`
--
ALTER TABLE `Pharmacist`
  MODIFY `phar_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`phar_ID`) REFERENCES `Sales` (`sales_ID`),
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`cost_ID`) REFERENCES `Sales` (`sales_ID`),
  ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`med_ID`) REFERENCES `Sales` (`sales_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
