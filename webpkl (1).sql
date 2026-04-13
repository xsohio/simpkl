-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2025 at 05:52 PM
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
-- Database: `webpkl`
--

-- --------------------------------------------------------

--
-- Table structure for table `jurnal_harian`
--

CREATE TABLE `jurnal_harian` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time DEFAULT NULL,
  `jam_keluar` time DEFAULT NULL,
  `kegiatan` text NOT NULL,
  `foto_kegiatan` varchar(255) DEFAULT NULL,
  `status_validasi` enum('pending','valid','tolak') DEFAULT 'pending',
  `komentar_pembimbing` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jurnal_harian`
--

INSERT INTO `jurnal_harian` (`id`, `siswa_id`, `tanggal`, `jam_masuk`, `jam_keluar`, `kegiatan`, `foto_kegiatan`, `status_validasi`, `komentar_pembimbing`) VALUES
(1, 1, '2025-11-22', '07:00:00', '17:00:00', 'blablablablablablablabla', '', 'valid', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `laporan_pkl`
--

CREATE TABLE `laporan_pkl` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `judul_laporan` varchar(200) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `jenis_laporan` enum('mingguan','akhir') NOT NULL,
  `status_pembimbing` enum('pending','revisi','disetujui') DEFAULT 'pending',
  `status_wakasek` enum('pending','disetujui') DEFAULT 'pending',
  `catatan_revisi` text DEFAULT NULL,
  `tampil_di_publik` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mitra_industri`
--

CREATE TABLE `mitra_industri` (
  `id` int(11) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat_perusahaan` text DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mitra_industri`
--

INSERT INTO `mitra_industri` (`id`, `nama_perusahaan`, `alamat_perusahaan`, `website`, `logo`, `created_at`) VALUES
(1, 'PT Teknologi', 'bandung', '', NULL, '2025-11-22 17:19:47');

-- --------------------------------------------------------

--
-- Table structure for table `nilai_pkl`
--

CREATE TABLE `nilai_pkl` (
  `id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `pembimbing_id` int(11) NOT NULL,
  `nilai_sikap` int(11) DEFAULT 0,
  `nilai_keterampilan` int(11) DEFAULT 0,
  `nilai_laporan` int(11) DEFAULT 0,
  `nilai_akhir` decimal(5,2) DEFAULT NULL,
  `predikat` char(2) DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pkl_anggota`
--

CREATE TABLE `pkl_anggota` (
  `id` int(11) NOT NULL,
  `pengajuan_id` int(11) NOT NULL,
  `siswa_id` int(11) NOT NULL,
  `status_keanggotaan` enum('aktif','nonaktif') DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pkl_anggota`
--

INSERT INTO `pkl_anggota` (`id`, `pengajuan_id`, `siswa_id`, `status_keanggotaan`) VALUES
(1, 1, 1, 'aktif');

-- --------------------------------------------------------

--
-- Table structure for table `pkl_pengajuan`
--

CREATE TABLE `pkl_pengajuan` (
  `id` int(11) NOT NULL,
  `ketua_id` int(11) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alamat_perusahaan` text NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `file_dokumen` varchar(255) DEFAULT NULL,
  `status_pembimbing` enum('pending','disetujui','ditolak') DEFAULT 'pending',
  `status_wakasek` enum('pending','disetujui','ditolak') DEFAULT 'pending',
  `pembimbing_id` int(11) DEFAULT NULL,
  `tanggal_pengajuan` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pkl_pengajuan`
--

INSERT INTO `pkl_pengajuan` (`id`, `ketua_id`, `nama_perusahaan`, `alamat_perusahaan`, `website`, `file_dokumen`, `status_pembimbing`, `status_wakasek`, `pembimbing_id`, `tanggal_pengajuan`) VALUES
(1, 1, 'PT Teknologi', 'banduung\r\n', NULL, '../assets/uploads/1763833684_Screenshot_23-11-2025_04039_localhost.jpeg', 'disetujui', 'disetujui', 5, '2025-11-23 00:48:04');

-- --------------------------------------------------------

--
-- Table structure for table `profil_guru`
--

CREATE TABLE `profil_guru` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nip` varchar(30) DEFAULT NULL,
  `jabatan` varchar(100) DEFAULT NULL,
  `jabatan_terakhir` varchar(100) DEFAULT NULL,
  `tempat_lahir` varchar(50) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profil_siswa`
--

CREATE TABLE `profil_siswa` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `foto_profil` varchar(255) DEFAULT NULL,
  `jenis_kelamin` enum('Laki-laki','Perempuan') DEFAULT NULL,
  `agama` varchar(50) DEFAULT NULL,
  `tempat_lahir` varchar(100) DEFAULT NULL,
  `tanggal_lahir` date DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `golongan_darah` enum('A','B','AB','O') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `profil_siswa`
--

INSERT INTO `profil_siswa` (`id`, `user_id`, `nis`, `kelas`, `jurusan`, `no_hp`, `foto_profil`, `jenis_kelamin`, `agama`, `tempat_lahir`, `tanggal_lahir`, `alamat`, `golongan_darah`) VALUES
(1, 1, '1234123', 'XI', 'RPL', '12351231231', 'SISWA_1_1764087314.png', 'Laki-laki', 'Islam', '', '0000-00-00', '', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama_depan` varchar(50) NOT NULL,
  `nama_belakang` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('siswa','pembimbing','wakasek','admin') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nama_depan`, `nama_belakang`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'samsul', 'pea', 'samsul@gmail.com', '$2y$10$MGXDT8FBZQBW7CBOITNWa.8bLcw4zCD1EQA/v0OKRB4sGUZLTtYMi', 'siswa', '2025-11-21 15:47:41'),
(3, 'Super', 'Admin', 'admin@smk.id', '$2y$10$v.gxhdBhGfX0yOZJi/k8lOIipXLBn7PYrQSl8jB/DInMNQ12MIEwy', 'admin', '2025-11-21 16:32:55'),
(4, 'Bapak', 'Wakasek', 'wakasek@smk.id', '$2y$10$rKI8ixBhdlHCebZ9rlTMjOVajqRDDr.DSnapFSe3.p.pp6qyP2n9O', 'wakasek', '2025-11-21 16:32:55'),
(5, 'Ibu', 'Guru', 'pembimbing@smk.id', '$2y$10$rKI8ixBhdlHCebZ9rlTMjOVajqRDDr.DSnapFSe3.p.pp6qyP2n9O', 'pembimbing', '2025-11-21 16:32:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jurnal_harian`
--
ALTER TABLE `jurnal_harian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indexes for table `laporan_pkl`
--
ALTER TABLE `laporan_pkl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indexes for table `mitra_industri`
--
ALTER TABLE `mitra_industri`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nilai_pkl`
--
ALTER TABLE `nilai_pkl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indexes for table `pkl_anggota`
--
ALTER TABLE `pkl_anggota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengajuan_id` (`pengajuan_id`),
  ADD KEY `siswa_id` (`siswa_id`);

--
-- Indexes for table `pkl_pengajuan`
--
ALTER TABLE `pkl_pengajuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ketua_id` (`ketua_id`);

--
-- Indexes for table `profil_guru`
--
ALTER TABLE `profil_guru`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `profil_siswa`
--
ALTER TABLE `profil_siswa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nis` (`nis`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jurnal_harian`
--
ALTER TABLE `jurnal_harian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `laporan_pkl`
--
ALTER TABLE `laporan_pkl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mitra_industri`
--
ALTER TABLE `mitra_industri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nilai_pkl`
--
ALTER TABLE `nilai_pkl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pkl_anggota`
--
ALTER TABLE `pkl_anggota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pkl_pengajuan`
--
ALTER TABLE `pkl_pengajuan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `profil_guru`
--
ALTER TABLE `profil_guru`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profil_siswa`
--
ALTER TABLE `profil_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jurnal_harian`
--
ALTER TABLE `jurnal_harian`
  ADD CONSTRAINT `jurnal_harian_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `laporan_pkl`
--
ALTER TABLE `laporan_pkl`
  ADD CONSTRAINT `laporan_pkl_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `nilai_pkl`
--
ALTER TABLE `nilai_pkl`
  ADD CONSTRAINT `nilai_pkl_ibfk_1` FOREIGN KEY (`siswa_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pkl_anggota`
--
ALTER TABLE `pkl_anggota`
  ADD CONSTRAINT `pkl_anggota_ibfk_1` FOREIGN KEY (`pengajuan_id`) REFERENCES `pkl_pengajuan` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pkl_anggota_ibfk_2` FOREIGN KEY (`siswa_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `pkl_pengajuan`
--
ALTER TABLE `pkl_pengajuan`
  ADD CONSTRAINT `pkl_pengajuan_ibfk_1` FOREIGN KEY (`ketua_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `profil_guru`
--
ALTER TABLE `profil_guru`
  ADD CONSTRAINT `profil_guru_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profil_siswa`
--
ALTER TABLE `profil_siswa`
  ADD CONSTRAINT `profil_siswa_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
