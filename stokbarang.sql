-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2019 at 05:46 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stokbarang`
--

-- --------------------------------------------------------

--
-- Table structure for table `jualbarang`
--

CREATE TABLE `jualbarang` (
  `id` int(6) NOT NULL,
  `idBarang` char(6) NOT NULL,
  `idKlien` char(6) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jualbarang`
--

INSERT INTO `jualbarang` (`id`, `idBarang`, `idKlien`, `jumlah`, `tanggal`) VALUES
(2, 'MIM001', 'C00001', 90, '2019-05-24');

-- --------------------------------------------------------

--
-- Table structure for table `klien`
--

CREATE TABLE `klien` (
  `id` char(6) NOT NULL,
  `namaDepan` varchar(20) NOT NULL,
  `namaBelakang` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `klien`
--

INSERT INTO `klien` (`id`, `namaDepan`, `namaBelakang`) VALUES
('C00001', 'Alyvia', 'Tedjip');

-- --------------------------------------------------------

--
-- Table structure for table `penyuplai`
--

CREATE TABLE `penyuplai` (
  `id` char(6) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penyuplai`
--

INSERT INTO `penyuplai` (`id`, `nama`) VALUES
('S00001', 'Supplier 1');

-- --------------------------------------------------------

--
-- Table structure for table `restokbarang`
--

CREATE TABLE `restokbarang` (
  `id` int(6) NOT NULL,
  `idBarang` char(6) NOT NULL,
  `idPenyuplai` char(6) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restokbarang`
--

INSERT INTO `restokbarang` (`id`, `idBarang`, `idPenyuplai`, `jumlah`, `tanggal`) VALUES
(1, 'MIM001', 'S00001', 90, '2019-05-31'),
(8, 'MIM001', 'S00001', 76, '2019-05-30'),
(9, 'KRX001', 'S00001', 78, '2019-05-31'),
(10, 'MIM001', 'S00001', 80, '2019-05-31');

-- --------------------------------------------------------

--
-- Table structure for table `stokbarang`
--

CREATE TABLE `stokbarang` (
  `id` char(7) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `label` varchar(20) DEFAULT NULL,
  `jumlahDitangan` int(6) NOT NULL DEFAULT '0',
  `jumlahDijual` int(6) NOT NULL DEFAULT '0',
  `jumlahDirestok` int(6) NOT NULL DEFAULT '0',
  `jumlahMinimal` int(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stokbarang`
--

INSERT INTO `stokbarang` (`id`, `nama`, `label`, `jumlahDitangan`, `jumlahDijual`, `jumlahDirestok`, `jumlahMinimal`) VALUES
('KRX001', 'Rexona', 'Black and White', 0, 0, 78, 25),
('MIM001', 'Indomie', 'Goreng', 320, 90, 166, 50);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jualbarang`
--
ALTER TABLE `jualbarang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBarang` (`idBarang`),
  ADD KEY `idKlien` (`idKlien`);

--
-- Indexes for table `klien`
--
ALTER TABLE `klien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `penyuplai`
--
ALTER TABLE `penyuplai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restokbarang`
--
ALTER TABLE `restokbarang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idBarang` (`idBarang`),
  ADD KEY `idPenyuplai` (`idPenyuplai`);

--
-- Indexes for table `stokbarang`
--
ALTER TABLE `stokbarang`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jualbarang`
--
ALTER TABLE `jualbarang`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `restokbarang`
--
ALTER TABLE `restokbarang`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jualbarang`
--
ALTER TABLE `jualbarang`
  ADD CONSTRAINT `jualbarang_ibfk_1` FOREIGN KEY (`idBarang`) REFERENCES `stokbarang` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `jualbarang_ibfk_2` FOREIGN KEY (`idKlien`) REFERENCES `klien` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `restokbarang`
--
ALTER TABLE `restokbarang`
  ADD CONSTRAINT `restokbarang_ibfk_1` FOREIGN KEY (`idBarang`) REFERENCES `stokbarang` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `restokbarang_ibfk_2` FOREIGN KEY (`idPenyuplai`) REFERENCES `penyuplai` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
