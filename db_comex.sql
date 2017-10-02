-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 02-10-2017 a las 18:49:20
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
-- Base de datos: `db_comex`
--
CREATE DATABASE IF NOT EXISTS `db_comex` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `db_comex`;

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
(1, 1, 'CIF'),
(2, 1, 'FAS'),
(3, 1, 'FOB'),
(4, 1, 'CIP'),
(5, 2, 'Aquellos firmados principalmente en un contexto latinoamericano con el fin de intercambiar mercancías y materias primas.'),
(6, 2, 'Son considerados de alcance intermedio, por abrir arancelariamente los mercados, además de abrirse a temas que no son comerciales.'),
(7, 2, 'Acuerdo a nivel de entrada tan sólo se incluyen materias arancelarias que liberan parcialmente el comercio a un reducido tipo de bienes.'),
(8, 2, 'Tan completo como los TLC, pero además incluye materias del ámbito político y de cooperación en campos muy diversos.'),
(9, 3, 'Servicio Nacional Aduanas'),
(10, 3, 'Dirección General de Movilización Nacional'),
(11, 3, 'Carabineros de Chile'),
(12, 3, 'Secretaría Regional Ministerial'),
(13, 4, 'Liner'),
(14, 4, 'Flexitank'),
(15, 4, 'Pound Tainer'),
(16, 4, 'Open top container'),
(17, 5, 'Ecuador - México - Perú - Chile'),
(18, 5, 'Brasil - Argentina - Chile - Paraguay - Uruguay'),
(19, 5, 'México - Colombia - Perú - Chile'),
(20, 5, 'Colombia - Ecuador - México - Chile'),
(21, 6, 'transporte por mar de mercancías nacionales o nacionalizadas, aunque sea por fuera de sus aguas territoriales pero sin tocar puerto extranjero. '),
(22, 6, 'transporte por mar o vías navegables de mercancías entre distintos puertos, independiente del país.'),
(25, 6, 'Transporte marítimo de personas y mercancías entre puertos'),
(26, 6, 'Despacho de mercancías nacionalizadas a puertos de destino dentro de sudamérica, así como pasajeros y otros.'),
(27, 7, 'Autentifica que el producto es apto para ingresar al país'),
(28, 7, 'Indica el origen del producto para fines de regulación legal'),
(29, 7, 'Indica que el producto fue fabricado en otro país distinto de Chile'),
(30, 7, 'Acredita el origen del producto para efectos de beneficios relacionados con la rebaja de aranceles'),
(31, 8, 'Bill of Lading - Carta de Porte - Despacho Internacional'),
(32, 8, 'Air Way Bill - Despacho Terrestre Internacional - Bill of Lading'),
(33, 8, 'Marine International Bill - Air Way Bill - Carta de Porte'),
(34, 8, 'Bill of Lading - Carta de Porte - Air Way Bill'),
(35, 9, 'SAG'),
(36, 9, 'SOFOFA'),
(37, 9, 'ADUANA'),
(38, 9, 'DIRECON'),
(39, 10, 'Carga rodante en buques especiales para este tipo de cargas'),
(40, 10, 'Carga granel enviada en contenedores especiales para ello'),
(41, 10, 'Buques especializados en transporte de contenedores rodantes'),
(42, 10, 'Carga unitarizada en contenedores de 10 pies.'),
(43, 11, 'CIF'),
(44, 11, 'FAS'),
(45, 11, 'FOB'),
(46, 11, 'EXW'),
(47, 12, 'Revisión por parte de la aduana de las mercancías físicamente'),
(48, 12, 'Revisión documental por parte de la aduana respecto al conocimiento de embarque'),
(49, 12, 'Revisión física y con documentos de la carga importada'),
(50, 12, 'Revisión de parte de Aduanas y SAG a nivel documental.'),
(51, 13, 'Realizar la tramitación legal de ingreso y salida de mercancías del país'),
(52, 13, 'Revisar el pago de IVA exportador '),
(53, 13, 'Generar los documentos de tramitación de certificados de origen'),
(54, 13, 'Generar el transporte interno, externo e internacional de mercancías'),
(55, 14, 'FAS'),
(56, 14, 'CPT'),
(57, 14, 'CFR'),
(58, 14, 'DAT'),
(59, 15, 'Inspectores de control de siniestros en IMO'),
(60, 15, 'Comisarios de averías que inspeccionan los siniestros de cargas.'),
(61, 15, 'Documentos contables asociados a Seguros'),
(62, 15, 'Indicadores claves de gestión de seguros'),
(63, 16, 'El pagaré no es transable en el Mercado y la Letra es un documento de activo fijo'),
(64, 16, 'La letra es transable en el mercado y el Pagaré depende del monto involucrado.'),
(65, 16, 'La letra es un documento de venta contado y el Pagaré es transable sólo en el ámbito interno.'),
(66, 16, 'El Pagaré puede ser transable en el mercado y la letra solo es un documento de cobro de una deuda financiera.'),
(67, 17, 'El primer contenedor tiene equipo de refrigeración desconectado y se usa para carga general seca y el segundo para carga refrigerada con equipo operativo.'),
(68, 17, 'Ambos son High Cube'),
(69, 17, 'No existen diferencias en sus dimensiones'),
(70, 17, 'Son utilizados para transportar todo tipo de embarques de manera ótpima.'),
(71, 18, 'Es un documento que se atiene a normas ecológicas'),
(72, 18, 'Deben ser revisados por el Organismo medioambiental competente.'),
(73, 18, 'Es aquella que exige un warrant o garantia de stock de productos disponibles para despacho en almacenes portuarios.'),
(74, 18, 'La Cláusula verde corresponde a una Norma ISO.'),
(75, 19, 'Indirecta y financiera'),
(76, 19, 'directa y bancaria.'),
(77, 19, 'Dólares y yuanes'),
(78, 19, 'Euro y libra esterlina'),
(79, 20, 'Es una venta limitada en euros para la Unión Europea'),
(80, 20, 'Se considera con hasta con un máximo de tres meses pago contado.'),
(81, 20, 'Contempla modalidad de pago al término de la operación con tres meses de gracia.'),
(82, 20, 'Es un crédito de libre disponibilidad en dolares para financiar importaciones.');

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
(2, 1, 2),
(3, 2, 5),
(4, 3, 10),
(5, 4, 14),
(6, 5, 19),
(7, 6, 21),
(8, 7, 30),
(9, 8, 34),
(10, 9, 35),
(11, 10, 39),
(12, 11, 45),
(13, 12, 48),
(14, 13, 51),
(15, 14, 57),
(16, 15, 60),
(17, 16, 66),
(18, 17, 67),
(19, 18, 73),
(20, 19, 76),
(21, 20, 82);

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
(1, 'Incoterm que no incluyen gastos de aduana en origen', 0),
(2, 'Los Acuerdos de Complementación Económica (ACE), son:', 0),
(3, '¿Quién autoriza importación explosivos?', 0),
(4, 'What do you need for transport bulk liquid?', 0),
(5, 'Indique cuáles son los países miembros de la Alianza del Pacífico', 0),
(6, 'Defina Cabotaje', 0),
(7, 'Cuál es la utilidad de un certificado de origen', 0),
(8, 'Indique los distintos nombres con el que se conoce el conocimiento de embarque', 0),
(9, 'Quién emite el certificado fitosanitario en Chile', 0),
(10, 'Qué es una carga Ro-Ro', 0),
(11, 'Con qué Incoterm se calcula la balanza comercial del país', 0),
(12, 'Qué es el Aforo Documental', 0),
(13, 'Indique cuál es la función del Agente de Aduanas', 0),
(14, 'Cuál de los siguientes incoterms es exclusivo del transporte marítimo', 0),
(15, 'Qué son los surveyors en el ambito de los seguros', 0),
(16, 'Cuál es la diferencia entre una letra de cambio y un pagaré en el ámbito de comex bancario', 0),
(17, 'Diferencia entre 40NOR y 40Reffer', 0),
(18, 'Qué es una Carta de Crédito con cláusula verde', 0),
(19, 'Dos tipos de cobranza extranjera en comex ', 0),
(20, 'Qué es una venta u operación contado en el area bancaria de comex', 0);

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
  MODIFY `id_alternativas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT de la tabla `correctas`
--
ALTER TABLE `correctas`
  MODIFY `id_correctas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `id_preguntas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
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
