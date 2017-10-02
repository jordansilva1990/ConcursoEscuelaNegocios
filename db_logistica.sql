-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-10-2017 a las 19:40:08
-- Versión del servidor: 10.1.22-MariaDB
-- Versión de PHP: 7.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_logistica`
--
CREATE DATABASE IF NOT EXISTS `db_logistica` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `db_logistica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alternativas`
--

CREATE TABLE `alternativas` (
  `id_alternativas` int(11) NOT NULL,
  `id_preguntas` int(11) NOT NULL,
  `alternativa` longtext COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alternativas`
--

INSERT INTO `alternativas` (`id_alternativas`, `id_preguntas`, `alternativa`) VALUES
(1, 1, '120 cms. x 120 cms.'),
(2, 1, '100 cms. x 100 cms.'),
(3, 1, '100 cms. x 120 cms.'),
(4, 1, '120 cms. x 80 cms.'),
(5, 2, 'Administrar una empresa'),
(6, 2, 'Gestionar la flota de distribución'),
(7, 2, ' Calcular la cantidad óptima a comprar'),
(8, 2, 'Administrar grandes centros de distribución'),
(9, 3, 'Las estanterías son el sistema de almacenamiento más popular en los grandes centros de distribución'),
(10, 3, 'Las estanterías sirven para poner productos pequeños y los racks sirven para poner pallets'),
(11, 3, 'Los racks son ideales para almacenar mercadería a granel'),
(12, 3, 'Los racks sirven para poner productos pequeños y las estanterías sirven para poner pallets'),
(13, 4, ' 20 pies y 40 pies'),
(14, 4, '20 metros y 40 metros'),
(15, 4, '20 metros cuadrados y 40 metros cuadrados'),
(16, 4, '20 pulgadas y 40 pulgadas'),
(17, 5, 'Rotación de inventarios'),
(18, 5, 'FIFO'),
(19, 5, 'Ventas por vendedor'),
(20, 5, 'Rotación del personal'),
(21, 6, 'La antigüedad del stock'),
(22, 6, 'La cantidad de productos distintos que se debe controlar en el almacén'),
(23, 6, 'El tiempo promedio que tarda un proveedor en abastecer a un cliente'),
(24, 6, 'La norma de código de barra que rige en Chile'),
(25, 7, 'Cuánto tiempo es líder una empresa dentro de una industria'),
(26, 7, 'El tiempo promedio tanto de recepción como de despacho'),
(27, 7, 'Cuánto tarda un proveedor desde que se pone una Orden de Compra hasta que el producto está en las instalaciones del cliente'),
(28, 7, 'La velocidad promedio a la que circulan los vehículos dentro de un centro de distribución'),
(29, 8, 'El primero que entra es el primero que sale'),
(30, 8, 'El último que entra es el primero que sale'),
(31, 8, 'El que tiene fecha de vencimiento más lejana es el primero que sale'),
(32, 8, 'El que tiene fecha de vencimiento más cercana es el primero que sale'),
(33, 9, 'Hacer ingeniería inversa para entender cómo funcionan los procesos logísticos'),
(34, 9, 'La inversión que se hace en Logística'),
(35, 9, 'Todo lo que regresa y que ha quedado en la cadena de abastecimiento: devoluciones, embalajes, etc.'),
(36, 9, 'Invertir el proceso de logística para ver dónde hay oportunidades de mejora'),
(37, 10, 'EOC, que significa Entrega Óptima de Cantidad'),
(38, 10, 'Lote Económico de Compra o EOQ (por sus siglas en inglés)'),
(39, 10, 'COC: Cantidad Óptima de Compra'),
(40, 10, 'SUC: Stock Único de Compra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correctas`
--

CREATE TABLE `correctas` (
  `id_correctas` int(11) NOT NULL,
  `id_preguntas` int(11) NOT NULL,
  `id_alternativas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `correctas`
--

INSERT INTO `correctas` (`id_correctas`, `id_preguntas`, `id_alternativas`) VALUES
(1, 1, 3),
(2, 2, 7),
(3, 3, 10),
(4, 4, 13),
(5, 5, 17),
(6, 6, 22),
(7, 7, 27),
(8, 8, 32),
(9, 9, 35),
(10, 10, 38);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `id_preguntas` int(11) NOT NULL,
  `pregunta` longtext COLLATE utf8_spanish_ci NOT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`id_preguntas`, `pregunta`, `estado`) VALUES
(1, 'Las medidas del pallet usado mayoritariamente en Chile son:', 0),
(2, 'Un WMS sirve para:', 0),
(3, 'Cuál de las siguientes afirmaciones es verdadera:', 0),
(4, 'Las medidas estándares de los contenedores son:', 0),
(5, 'Un KPI típico de Logística es:', 0),
(6, 'La sigla SKU dice relación con:', 0),
(7, 'El “Lead Time” mide:', 0),
(8, 'La sigla FEFO hace referencia a lo siguiente al momento de escoger qué producto sacar de un almacén:', 0),
(9, 'La Logística Inversa se refiere a:', 0),
(10, 'El modelo clásico que calcula cuánto stock pedir (pedido óptimo) se creó hace un siglo y se llama:', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alternativas`
--
ALTER TABLE `alternativas`
  ADD PRIMARY KEY (`id_alternativas`),
  ADD KEY `fk_alt_preg_idx` (`id_preguntas`);

--
-- Indices de la tabla `correctas`
--
ALTER TABLE `correctas`
  ADD PRIMARY KEY (`id_correctas`),
  ADD KEY `fk_correcta_pre_idx` (`id_preguntas`),
  ADD KEY `fk_correcta_alt_idx` (`id_alternativas`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`id_preguntas`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alternativas`
--
ALTER TABLE `alternativas`
  MODIFY `id_alternativas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT de la tabla `correctas`
--
ALTER TABLE `correctas`
  MODIFY `id_correctas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_preguntas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alternativas`
--
ALTER TABLE `alternativas`
  ADD CONSTRAINT `fk_alt_preg` FOREIGN KEY (`id_preguntas`) REFERENCES `preguntas` (`id_preguntas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `correctas`
--
ALTER TABLE `correctas`
  ADD CONSTRAINT `fk_correcta_alt` FOREIGN KEY (`id_alternativas`) REFERENCES `alternativas` (`id_alternativas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_correcta_pre` FOREIGN KEY (`id_preguntas`) REFERENCES `preguntas` (`id_preguntas`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
