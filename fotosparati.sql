-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 06-12-2021 a las 15:23:12
-- Versión del servidor: 5.6.49-cll-lve
-- Versión de PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fotosparati`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `contrasena` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `admin`
--

INSERT INTO `admin` (`id`, `nombre`, `email`, `contrasena`, `activo`) VALUES
(1, 'Carlos Argueta', 'carlosargue@gmail.com', 'asdf', 1),
(5, 'Roberto López', 'roberto@gmail.com', 'asdf', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articulo`
--

CREATE TABLE `articulo` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `precio` bigint(20) UNSIGNED DEFAULT NULL,
  `modelo` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `marca` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `usuario_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `articulo`
--

INSERT INTO `articulo` (`id`, `descripcion`, `precio`, `modelo`, `marca`, `usuario_id`) VALUES
(1, 'CELULAR PARA TRABAJO', 500, 'A20', 'SAMSUMG', 1),
(2, 'CELULAR DE OFICINA', 400, 'APPLE I50', 'APPLE', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carro_compra`
--

CREATE TABLE `carro_compra` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` int(10) DEFAULT NULL,
  `foto_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nombre` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `contrasena` varchar(255) COLLATE utf8_bin NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `email`, `contrasena`, `activo`) VALUES
(1, 'JUAN PEREZ', 'JP@EMAIL.COM', '123456', 1),
(2, 'MARIA PAZ', 'MP@EMAIL.COM', '123456', 1),
(3, 'Carlos Argueta', 'carlosargue@gmail.com', 'asdf', 1),
(4, 'Karla Mijares', 'karla@gmail.com', '123123', 1),
(5, 'Juan Perez', 'juan@gmail.com', '123456', 1),
(6, 'Pedro Picapiedra', 'pedro@gmail.com', 'pedro', 1),
(7, 'Vilma Picapiedra', 'vilma@gmail.com', 'vilma', 1),
(8, 'Samuel Argueta', 'samuel@email.com', 'samuel', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `descripcion` varchar(150) COLLATE utf8_bin DEFAULT NULL,
  `articulo_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id`, `descripcion`, `articulo_id`) VALUES
(1, 'Trabaja bien en condiciones duras', 1),
(2, 'Trabaja regular', 1),
(3, 'Trabaja Mal', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto`
--

CREATE TABLE `foto` (
  `id` int(10) UNSIGNED NOT NULL,
  `contenido` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `titulo` varchar(150) CHARACTER SET latin1 DEFAULT NULL,
  `activa` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `foto`
--

INSERT INTO `foto` (`id`, `contenido`, `titulo`, `activa`) VALUES
(1, '1.jpg', 'Verde', 1),
(2, '2.jpg', 'Olas', 1),
(4, '4.jpg', 'Fotos Varias', 1),
(7, '7.jpg', 'aleatorio', 1),
(9, '9.PNG', 'abc foto', 1),
(10, '10.jpg', 'foto de pruebas', 1),
(12, '12.jpg', 'GPS', 1),
(13, '13.jpg', 'Cuadro', 1),
(14, '14.jpg', 'test', 1),
(15, '15.jpg', 'Foto test 22', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `foto2`
--

CREATE TABLE `foto2` (
  `id` int(10) NOT NULL,
  `contenido` char(255) COLLATE utf8_bin DEFAULT NULL,
  `titulo` char(255) COLLATE utf8_bin DEFAULT NULL,
  `activa` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `foto2`
--

INSERT INTO `foto2` (`id`, `contenido`, `titulo`, `activa`) VALUES
(1, '1.jpg', 'Verde', 1),
(2, '2.jpg', 'Olas', 1),
(3, '3.jpg', 'Árboles', 1),
(4, '4.jpg', 'ByN', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lista_deseo`
--

CREATE TABLE `lista_deseo` (
  `id` int(10) UNSIGNED NOT NULL,
  `cliente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `foto_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `lista_deseo`
--

INSERT INTO `lista_deseo` (`id`, `cliente_id`, `foto_id`) VALUES
(23, 3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden`
--

CREATE TABLE `orden` (
  `id` int(10) UNSIGNED NOT NULL,
  `fecha` varchar(255) DEFAULT NULL,
  `cliente_id` int(10) DEFAULT NULL,
  `total` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden`
--

INSERT INTO `orden` (`id`, `fecha`, `cliente_id`, `total`) VALUES
(40, '2018-11-08', 2, 1.00),
(41, '2018-11-07', 2, 2.00),
(42, '2018-11-07', 2, 3.00),
(43, '2021-12-02', 3, 1.00),
(44, '2021-12-02', 3, 1.00),
(45, '2021-12-02', 3, 3.00),
(46, '2021-12-03T21:45:20.146Z', 3, 1.00),
(47, '2021-12-04T18:23:02.006Z', 3, 3.00),
(48, '2021-12-06T16:26:09.640Z', 7, 2.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orden_detalle`
--

CREATE TABLE `orden_detalle` (
  `id` int(10) UNSIGNED NOT NULL,
  `orden_id` int(10) UNSIGNED NOT NULL,
  `foto_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `orden_detalle`
--

INSERT INTO `orden_detalle` (`id`, `orden_id`, `foto_id`) VALUES
(40, 40, 2),
(41, 41, 1),
(42, 41, 2),
(43, 42, 2),
(44, 42, 1),
(45, 42, 4),
(46, 43, 1),
(47, 44, 2),
(48, 45, 1),
(49, 45, 2),
(51, 45, 4),
(52, 46, 1),
(53, 47, 4),
(54, 47, 2),
(56, 47, 1),
(57, 48, 4),
(58, 48, 12);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `articulo`
--
ALTER TABLE `articulo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `carro_compra`
--
ALTER TABLE `carro_compra`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foto_id` (`foto_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_celular` (`articulo_id`);

--
-- Indices de la tabla `foto`
--
ALTER TABLE `foto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `foto2`
--
ALTER TABLE `foto2`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `lista_deseo`
--
ALTER TABLE `lista_deseo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FOTOFK2` (`foto_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `orden`
--
ALTER TABLE `orden`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orden_id` (`orden_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `articulo`
--
ALTER TABLE `articulo`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `carro_compra`
--
ALTER TABLE `carro_compra`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `foto`
--
ALTER TABLE `foto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `lista_deseo`
--
ALTER TABLE `lista_deseo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `orden`
--
ALTER TABLE `orden`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT de la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `comentarioCelular` FOREIGN KEY (`articulo_id`) REFERENCES `articulo` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `lista_deseo`
--
ALTER TABLE `lista_deseo`
  ADD CONSTRAINT `FOTOFK2` FOREIGN KEY (`foto_id`) REFERENCES `foto2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `clientesv1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orden_detalle`
--
ALTER TABLE `orden_detalle`
  ADD CONSTRAINT `fotosFR` FOREIGN KEY (`foto_id`) REFERENCES `foto2` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ordenDetalleFR` FOREIGN KEY (`orden_id`) REFERENCES `orden` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
