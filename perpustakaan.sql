-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Apr 2026 pada 06.12
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `password`, `nama_admin`) VALUES
(1, 'rara', '2345', 'rara'),
(2, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `id_anggota` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `nama_anggota` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `kelas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `anggota`
--

INSERT INTO `anggota` (`id_anggota`, `nis`, `nama_anggota`, `username`, `password`, `kelas`) VALUES
(14, '3456', 'nunu', 'nunu', 'lele', 'xi dkv 2'),
(15, 'efwwef', 'wfeewf', 'wfefew', 'fewwef', 'fwefew'),
(16, '2345', 'rama', 'rama', 'ruru', 'xi rpl2'),
(17, '1213', 'rahma', 'rahma', 'rahma', 'xi rpl3'),
(18, 'rahmaa', 'rahmaa', 'rahmaa', '$2y$10$/zJClP7EB6uW54.HfeT/YumvjIUsa1.eE88tXRn1MaCtcpRSNvcrK', 'x1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul_buku` varchar(100) NOT NULL,
  `pengarang` varchar(100) NOT NULL,
  `penerbit` varchar(100) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `status` enum('tersedia','tidak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul_buku`, `pengarang`, `penerbit`, `tahun_terbit`, `status`) VALUES
(10, 'dongeng', 'didi', 'didi', '2019', 'tidak'),
(11, 'werw', 'rewr', 'ewrwr', '2029', 'tidak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_anggota` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_kembali` datetime NOT NULL,
  `status_transaksi` enum('peminjaman','pengembalian') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_anggota`, `id_buku`, `tgl_pinjam`, `tgl_kembali`, `status_transaksi`) VALUES
(2, 1, 2, '2026-04-09 14:42:00', '0000-00-00 00:00:00', ''),
(3, 1, 3, '2026-04-15 15:56:00', '0000-00-00 00:00:00', ''),
(4, 1, 4, '2026-04-02 13:08:00', '0000-00-00 00:00:00', ''),
(5, 1, 5, '2026-04-10 15:29:00', '0000-00-00 00:00:00', ''),
(6, 1, 6, '2026-04-07 13:51:00', '0000-00-00 00:00:00', ''),
(7, 1, 7, '2026-04-08 14:01:00', '2026-04-10 14:04:30', 'pengembalian'),
(9, 1, 7, '2026-04-08 14:04:00', '2026-04-10 14:04:53', 'pengembalian'),
(10, 7, 8, '2026-04-13 07:24:00', '2026-04-13 08:01:58', 'pengembalian'),
(11, 8, 7, '2026-04-01 08:01:00', '2026-04-13 08:56:51', 'pengembalian'),
(12, 13, 7, '2026-04-14 08:57:00', '2026-04-13 08:57:41', 'pengembalian'),
(13, 14, 9, '2026-04-13 09:07:22', '2026-04-13 09:22:07', 'pengembalian'),
(14, 14, 10, '2026-04-08 10:16:00', '2026-04-13 10:16:47', 'pengembalian'),
(15, 17, 11, '2026-04-13 10:17:35', '2026-04-13 10:17:43', 'pengembalian'),
(16, 16, 10, '2026-04-07 10:19:00', '2026-04-13 10:19:59', 'pengembalian'),
(17, 18, 10, '2026-04-13 10:20:46', '2026-04-13 10:20:50', 'pengembalian');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`id_anggota`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `anggota`
--
ALTER TABLE `anggota`
  MODIFY `id_anggota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
