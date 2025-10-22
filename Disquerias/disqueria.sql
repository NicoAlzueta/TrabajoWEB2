-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2025 a las 01:24:01
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `albumes` (
  `ID_album` int(11) NOT NULL,
  `nombre_album` varchar(50) NOT NULL,
  `lanzamiento_album` date NOT NULL,
  `cantidad_canciones` int(11) NOT NULL,
  `genero_album` varchar(50) NOT NULL,
  `ID_autor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `autores` (
  `ID_autor` int(11) NOT NULL,
  `nombre_autor` varchar(100) NOT NULL,
  `pais_autor` varchar(100) NOT NULL,
  `cant_albumes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `albumes`
  ADD PRIMARY KEY (`ID_album`),
  ADD KEY `ID_autor` (`ID_autor`);

ALTER TABLE `autores`
  ADD PRIMARY KEY (`ID_autor`);


ALTER TABLE `albumes`
  MODIFY `ID_album` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `autores`
  MODIFY `ID_autor` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `albumes`
  ADD CONSTRAINT `albumes_ibfk_1` FOREIGN KEY (`ID_autor`) REFERENCES `autores` (`ID_autor`);


CREATE TABLE `usuarios` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL UNIQUE,
  `password_hash` varchar(255) NOT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


INSERT INTO `usuarios` (`username`, `password_hash`, `is_admin`) VALUES
('webadmin', 'admin', 1);

INSERT INTO `autores` (`ID_autor`, `nombre_autor`, `pais_autor`, `cant_albumes`) VALUES
(1, 'Soda Stereo', 'Argentina', 7),
(2, 'Taylor Swift', 'USA', 11),
(3, 'Daft Punk', 'Francia', 4);

INSERT INTO `albumes` (`ID_album`, `nombre_album`, `lanzamiento_album`, `cantidad_canciones`, `genero_album`, `ID_autor`) VALUES
(1, 'Signos', '1986-11-10', 8, 'Rock en Español', 1),
(2, 'Sueño Stereo', '1995-06-29', 12, 'Rock Alternativo', 1),
(3, 'Midnights', '2022-10-21', 13, 'Synth-pop', 2),
(4, 'Discovery', '2001-03-13', 14, 'French House', 3);

ALTER TABLE `usuarios`
  ADD UNIQUE KEY `username` (`username`);

ALTER TABLE `usuarios`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2; -- Empieza en 2 si insertaste 1


COMMIT;
