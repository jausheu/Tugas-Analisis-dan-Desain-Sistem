-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Sep 2024 pada 09.31
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan_jausha`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `anggota`
--

CREATE TABLE `anggota` (
  `ID_member` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `ID_buku` int(11) NOT NULL AUTO_INCREMENT,
  `judul_buku` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `tahun_terbit` int(11) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  PRIMARY KEY (`ID_buku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `petugas`
--

CREATE TABLE `petugas` (
  `ID_petugas` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) NOT NULL,
  `no_telepon` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_petugas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `peminjaman`
--

CREATE TABLE `peminjaman` (
  `ID_peminjaman` int(11) NOT NULL AUTO_INCREMENT,
  `ID_buku` int(11) NOT NULL,
  `ID_member` int(11) NOT NULL,
  `ID_petugas` int(11) NOT NULL,
  `tanggal_peminjaman` date NOT NULL,
  `tanggal_pengembalian` date NOT NULL,
  PRIMARY KEY (`ID_peminjaman`),
  CONSTRAINT `fk_buku` FOREIGN KEY (`ID_buku`) REFERENCES `buku` (`ID_buku`) ON DELETE CASCADE,
  CONSTRAINT `fk_member` FOREIGN KEY (`ID_member`) REFERENCES `anggota` (`ID_member`) ON DELETE CASCADE,
  CONSTRAINT `fk_petugas` FOREIGN KEY (`ID_petugas`) REFERENCES `petugas` (`ID_petugas`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservasi`
--

CREATE TABLE `reservasi` (
  `ID_reservasi` int(11) NOT NULL AUTO_INCREMENT,
  `ID_buku` int(11) NOT NULL,
  `ID_member` int(11) NOT NULL,
  `tanggal_reservasi` date NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_reservasi`),
  CONSTRAINT `fk_reservasi_buku` FOREIGN KEY (`ID_buku`) REFERENCES `buku` (`ID_buku`) ON DELETE CASCADE,
  CONSTRAINT `fk_reservasi_member` FOREIGN KEY (`ID_member`) REFERENCES `anggota` (`ID_member`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
