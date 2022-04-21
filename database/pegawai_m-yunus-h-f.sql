-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 21, 2022 at 06:08 AM
-- Server version: 8.0.28
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pegawai_m-yunus-h-f`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `datapegawai`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `datapegawai`;
CREATE TABLE IF NOT EXISTS `datapegawai` (
`nip` varchar(20)
,`nama` varchar(100)
,`jenis_kelamin` enum('L','P')
,`nama_unit` varchar(100)
,`alamat` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_04_21_051340_create_unitkerja_table', 1),
(7, '2022_04_21_051454_create_pegawai_table', 1),
(8, '2022_04_21_052327_create_datapegawai_view', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

DROP TABLE IF EXISTS `pegawai`;
CREATE TABLE IF NOT EXISTS `pegawai` (
  `nip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jenis_kelamin` enum('L','P') COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_kerja` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `pegawai_unit_kerja_foreign` (`unit_kerja`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`nip`, `nama`, `jenis_kelamin`, `unit_kerja`, `created_at`, `updated_at`) VALUES
('10001', 'Adi Nugroho', 'L', 1, '2022-04-20 23:01:25', '2022-04-20 23:01:25'),
('10002', 'Imam Setiawan', 'L', 1, '2022-04-20 23:02:15', '2022-04-20 23:02:15'),
('10003', 'Putri Sejati', 'P', 1, '2022-04-20 23:02:30', '2022-04-20 23:02:30'),
('10004', 'Azinnudin Achzab', 'L', 2, '2022-04-20 23:02:42', '2022-04-20 23:02:42');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unitkerja`
--

DROP TABLE IF EXISTS `unitkerja`;
CREATE TABLE IF NOT EXISTS `unitkerja` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama_unit` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unitkerja`
--

INSERT INTO `unitkerja` (`id`, `nama_unit`, `alamat`) VALUES
(1, 'Guru', 'Jakarta'),
(2, 'Tendik', 'Jakarta');

-- --------------------------------------------------------

--
-- Structure for view `datapegawai`
--
DROP TABLE IF EXISTS `datapegawai`;

DROP VIEW IF EXISTS `datapegawai`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `datapegawai`  AS SELECT `pegawai`.`nip` AS `nip`, `pegawai`.`nama` AS `nama`, `pegawai`.`jenis_kelamin` AS `jenis_kelamin`, `unitkerja`.`nama_unit` AS `nama_unit`, `unitkerja`.`alamat` AS `alamat` FROM (`pegawai` join `unitkerja`) WHERE (`pegawai`.`unit_kerja` = `unitkerja`.`id`) ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_unit_kerja_foreign` FOREIGN KEY (`unit_kerja`) REFERENCES `unitkerja` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
