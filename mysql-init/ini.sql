-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 08-04-2025 a las 13:44:59
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquileres`
--

CREATE TABLE `alquileres` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `libro_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Volcado de datos para la tabla `alquileres`
--

INSERT INTO `alquileres` (`id`, `cliente_id`, `libro_id`) VALUES
(12, 4, 6),
(15, 2, 4),
(16, 2, 7),
(17, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(255) COLLATE utf16_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`id`, `nombre`, `fecha_nacimiento`, `nacionalidad`) VALUES
(1, 'Gabriel García Márquezs', '1927-03-06', 'Colombiana'),
(2, 'Julio Cortázar (Actualizado)', '1914-08-25', 'Argentino'),
(3, 'Mario Vargas Llosa', '1936-03-28', 'Peruana'),
(4, 'Fernando Gomez', '2024-11-19', 'Colombiano'),
(5, 'Alejandro ', '2024-11-05', 'Colombiano'),
(6, 'Santiago Mendoza', '2024-11-13', 'Colombiano'),
(7, 'Oliver Herrera', '2024-11-13', 'Colombiano'),
(8, 'Humberto Lozada', '2001-10-03', 'Colombiano'),
(9, 'Julio Cortázar', '1914-08-25', 'Argentino');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) COLLATE utf16_spanish_ci DEFAULT NULL,
  `correo` varchar(255) COLLATE utf16_spanish_ci DEFAULT NULL,
  `telefono` varchar(255) COLLATE utf16_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `telefono`) VALUES
(1, 'Juan Pérez', 'juan.perez@example.com', '123456789'),
(2, 'María López', 'maria.lopez@example.com', '987654321'),
(3, 'Carlos Gómez', 'carlos.gomez@example.com', '456123789'),
(4, 'Ana Martínez', 'ana.martinez@example.com', '789456123'),
(5, 'Luis Fernández', 'luis.fernandez@example.com', '321654987');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) COLLATE utf16_spanish_ci DEFAULT NULL,
  `autor_id` int(11) DEFAULT NULL,
  `anio_publicacion` int(11) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor_id`, `anio_publicacion`, `disponible`) VALUES
(1, 'Cien años de soledad', 1, 1969, 1),
(3, 'La casa de los espíritu', 2, 1982, 1),
(4, 'La ciudad y los perros', 3, 1963, 0),
(6, 'Traiding', 4, 2024, 0),
(7, 'Metodos Numericos', 5, 2012, 1),
(8, 'Ingles 2.13', 6, 2016, 1),
(9, 'LPA  2', 7, 2024, 1),
(10, 'JavaFX 346', 8, 2015, 1),
(11, 'Java desde cero', 5, 2018, 1),
(14, 'Flutters 255', 2, 2015, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquileres`
--
ALTER TABLE `alquileres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `libro_id` (`libro_id`);

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `autor_id` (`autor_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquileres`
--
ALTER TABLE `alquileres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquileres`
--
ALTER TABLE `alquileres`
  ADD CONSTRAINT `alquileres_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `alquileres_ibfk_2` FOREIGN KEY (`libro_id`) REFERENCES `libros` (`id`);

--
-- Filtros para la tabla `libros`
--
ALTER TABLE `libros`
  ADD CONSTRAINT `libros_ibfk_1` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;