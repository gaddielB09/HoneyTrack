-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-11-2024 a las 21:07:05
-- Versión del servidor: 8.0.39-0ubuntu0.24.04.2
-- Versión de PHP: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `HoneyTrack`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AREA`
--

CREATE TABLE `AREA` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `AREA`
--

INSERT INTO `AREA` (`codigo`, `descripcion`) VALUES
('ARDMP', 'Area de materia prima'),
('ARDPT', 'Area de productos terminados');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COMPRA_MATERIA_PRIMA`
--

CREATE TABLE `COMPRA_MATERIA_PRIMA` (
  `materiaPrima` varchar(5) NOT NULL,
  `solicitudCompra` int NOT NULL,
  `cantidad` int NOT NULL,
  `importe` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `COMPRA_MATERIA_PRIMA`
--

INSERT INTO `COMPRA_MATERIA_PRIMA` (`materiaPrima`, `solicitudCompra`, `cantidad`, `importe`) VALUES
('AIF6P', 3, 80, 72000.00),
('AIS24', 1, 80, 72000.00),
('AIS4P', 2, 80, 100800.00),
('AIUM5', 2, 80, 115200.00),
('AIZF6', 3, 80, 129600.00),
('BALS2', 1, 80, 21600.00),
('BAZF6', 3, 80, 36000.00),
('BFLP6', 3, 80, 28800.00),
('BLA4S', 2, 80, 28800.00),
('BLUM5', 2, 80, 36000.00),
('CAZ6F', 3, 80, 36000.00),
('CCS24', 1, 80, 86400.00),
('CCS4P', 2, 80, 93600.00),
('CCUM5', 2, 80, 129600.00),
('CCZ6P', 3, 80, 59200.00),
('CCZF6', 3, 80, 96000.00),
('CFS24', 1, 80, 28800.00),
('CFS4P', 2, 80, 36000.00),
('CFUM5', 2, 80, 43200.00),
('CFZ6F', 3, 80, 43200.00),
('CPS24', 1, 80, 43200.00),
('CPS4P', 2, 80, 50400.00),
('CPU5S', 2, 80, 86400.00),
('CPZF6', 3, 80, 57600.00),
('CZF6P', 3, 80, 57600.00),
('MAZ6F', 3, 80, 57600.00),
('MR8SP', 2, 80, 64800.00),
('MRS24', 1, 80, 57600.00),
('MRUM5', 2, 80, 86400.00),
('MRZ6F', 3, 80, 100800.00),
('PAMS2', 1, 80, 288000.00),
('PAUM5', 2, 80, 432000.00),
('PB4S4', 2, 80, 158400.00),
('PBBS2', 1, 80, 144000.00),
('PBU5S', 2, 80, 216000.00),
('PBZ6F', 3, 80, 144000.00),
('PBZF6', 3, 80, 216000.00),
('PE4SP', 2, 80, 302400.00),
('PEF6L', 3, 80, 216000.00),
('PEF6P', 3, 80, 144000.00),
('PES24', 1, 80, 288000.00),
('PEUM5', 2, 80, 360000.00),
('PFLP6', 3, 80, 432000.00),
('PFOL6', 3, 80, 504000.00),
('PMA4S', 2, 80, 360000.00),
('PSZ6F', 3, 80, 302400.00),
('PSZF6', 3, 80, 288000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_LOTE`
--

CREATE TABLE `EDO_LOTE` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `EDO_LOTE`
--

INSERT INTO `EDO_LOTE` (`codigo`, `descripcion`) VALUES
('PENDI', 'Pendiente'),
('VALID', 'Validado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_PUESTO`
--

CREATE TABLE `EDO_PUESTO` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `EDO_PUESTO`
--

INSERT INTO `EDO_PUESTO` (`codigo`, `descripcion`) VALUES
('ACTIV', 'ACTIVO'),
('BAJA', 'BAJA'),
('INACT', 'INACTIVO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_REQUISICION`
--

CREATE TABLE `EDO_REQUISICION` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `EDO_REQUISICION`
--

INSERT INTO `EDO_REQUISICION` (`codigo`, `descripcion`) VALUES
('APROB', 'Aprobada'),
('CANCE', 'Cancelada'),
('PENDI', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_SOLICITUD_COMPRA`
--

CREATE TABLE `EDO_SOLICITUD_COMPRA` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `EDO_SOLICITUD_COMPRA`
--

INSERT INTO `EDO_SOLICITUD_COMPRA` (`codigo`, `descripcion`) VALUES
('ACEPT', 'Aceptada'),
('CANCE', 'Cancelada'),
('ENPRO', 'En proceso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_VERIFICACION`
--

CREATE TABLE `EDO_VERIFICACION` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `EDO_VERIFICACION`
--

INSERT INTO `EDO_VERIFICACION` (`codigo`, `descripcion`) VALUES
('ENPRO', 'En progreso'),
('TERMI', 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLEADO`
--

CREATE TABLE `EMPLEADO` (
  `num` int NOT NULL,
  `nombrePila` varchar(16) NOT NULL,
  `primApell` varchar(24) NOT NULL,
  `segApell` varchar(24) DEFAULT NULL,
  `numCont` varchar(10) NOT NULL,
  `correoElectronico` varchar(32) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `puesto` varchar(5) DEFAULT NULL,
  `edoEmpleado` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `EMPLEADO`
--

INSERT INTO `EMPLEADO` (`num`, `nombrePila`, `primApell`, `segApell`, `numCont`, `correoElectronico`, `rfc`, `puesto`, `edoEmpleado`) VALUES
(1, 'Gaddiel', 'Barrios', 'Uriarte', '6641234567', 'Gaddiel@gmail.com', 'BAUG8007229H5', 'ADMIN', 'ACTIV'),
(2, 'Brandon', 'Gonzalez', 'Gonzalez', '6649876543', 'Brandon@gmail.com', 'GOGB9803024B7', 'ADMIN', 'ACTIV'),
(3, 'Andres', 'Cuevas', 'Zapata', '6644567890', 'Andres@gmail.com', 'CZAA9205103A6', 'ADMIN', 'ACTIV'),
(4, 'Yadira', 'Salazar ', 'Urtuzuastegui', '6643456789', 'Yadira@gmail.com', 'SAUY7606113N6', 'ADMIN', 'ACTIV'),
(5, 'Alexa', 'Perez', 'Morales', '6648765432', 'Alexa@gmail.com', 'PEMA980503V7', 'ANAIN', 'INACT'),
(6, 'Omar ', 'Gonzalez', 'Gonzalez', '6642345678', 'Omar @gmail.com', 'GOGO9208211M0', 'ANAIN', 'ACTIV'),
(7, 'Axl', 'Gonzalez', 'Penaloza', '6645678901', 'Axl@gmail.com', 'GOPA8906206L5', 'ANAIN', 'INACT'),
(8, 'Horus', 'Gonzalez', 'Penaloza', '6647654321', 'Horus@gmail.com', 'GOPH9403229J9', 'ANAIN', 'ACTIV'),
(9, 'Eduardo', 'Ruiz', 'Garcia', '6646543210', 'Eduardo@gmail.com', 'RUGE750711M9', 'ANAIN', 'ACTIV'),
(10, 'Carlos', 'Martinez', 'Gutierrez', '6648901234', 'Carlos@gmail.com', 'MAGC8905174M3', 'RECEP', 'ACTIV'),
(11, 'Esperanza', 'Salazar ', 'Espinoza', '6643128907', 'Esperanza@gmail.com', 'SAEE6709226L0', 'RECEP', 'INACT'),
(12, 'Cathy', 'Soto', 'Garcia', '6647683410', 'Cathy@gmail.com', 'SOGC9212102V9', 'RECEP', 'ACTIV'),
(13, 'Kira', 'Garfias', 'Gonzalez', '6645392718', 'Kira@gmail.com', 'GAGK950512H1', 'RECEP', 'ACTIV'),
(14, 'Cesar', 'Soto', 'Quintana', '6642048756', 'Cesar@gmail.com', 'SOQC8807235A5', 'RECEP', 'INACT'),
(15, 'Gabriel', 'Herrera', 'Gonzalez', '6649435102', 'Gabriel@gmail.com', 'HEGG9509201B3', 'GRDMP', 'ACTIV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LINEA_DE_PROD`
--

CREATE TABLE `LINEA_DE_PROD` (
  `num` int NOT NULL,
  `nombre` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `LINEA_DE_PROD`
--

INSERT INTO `LINEA_DE_PROD` (`num`, `nombre`) VALUES
(1, 'Ensamble completo'),
(2, 'Ensamble completo'),
(3, 'Ensamble completo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LINEA_PROD_PROD_TERMINADO`
--

CREATE TABLE `LINEA_PROD_PROD_TERMINADO` (
  `num` int NOT NULL,
  `lineaProd` int NOT NULL,
  `prodTerminado` varchar(5) NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `LINEA_PROD_PROD_TERMINADO`
--

INSERT INTO `LINEA_PROD_PROD_TERMINADO` (`num`, `lineaProd`, `prodTerminado`, `fecha`, `cantidad`) VALUES
(1, 1, 'GS24P', '2024-11-06 12:28:49', 20),
(2, 1, 'GS24U', '2024-11-06 12:58:49', 16),
(3, 2, 'GZFO6', '2024-11-06 13:28:49', 12),
(4, 3, 'GZFL6', '2024-11-06 13:58:49', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOTE`
--

CREATE TABLE `LOTE` (
  `num` int NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `porcentaje` float DEFAULT NULL,
  `edoLote` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `LOTE`
--

INSERT INTO `LOTE` (`num`, `descripcion`, `porcentaje`, `edoLote`) VALUES
(1, 'Lote de materia prima para el producto GYS24', 0, 'PENDI'),
(2, 'Lote de materia prima para el producto GS24P', 100, 'VALID'),
(3, 'Lote de materia prima para el producto GS24U', 100, 'VALID'),
(4, 'Lote de materia prima para el producto GZF06', 100, 'VALID'),
(5, 'Lote de materia prima para el producto GZFL6', 100, 'VALID');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOTE_VERIFICACION`
--

CREATE TABLE `LOTE_VERIFICACION` (
  `num` int NOT NULL,
  `lote` int NOT NULL,
  `verificacion` int NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `LOTE_VERIFICACION`
--

INSERT INTO `LOTE_VERIFICACION` (`num`, `lote`, `verificacion`, `fecha`) VALUES
(2, 2, 2, '2024-11-05 13:00:25'),
(3, 3, 3, '2024-11-05 13:02:25'),
(4, 4, 4, '2024-11-05 18:10:51'),
(5, 5, 5, '2024-11-05 18:15:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATERIA_PRIMA`
--

CREATE TABLE `MATERIA_PRIMA` (
  `codigo` varchar(5) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `largo` decimal(10,2) NOT NULL,
  `alto` decimal(10,2) NOT NULL,
  `ancho` decimal(10,2) NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `volumen` decimal(10,2) NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `MATERIA_PRIMA`
--

INSERT INTO `MATERIA_PRIMA` (`codigo`, `nombre`, `descripcion`, `costo`, `largo`, `alto`, `ancho`, `peso`, `volumen`, `stock`) VALUES
('AIF6P', 'Almacenamiento Interno Z Flip 6', '128 GB de almacenamiento UFS 3.1', 900.00, 0.60, 0.65, 0.15, 20.00, 0.59, 62),
('AIS24', 'Almacenamiento Interno S24', '128 GB de almacenamiento UFS 3.1', 900.00, 0.60, 0.65, 0.15, 20.00, 0.59, 0),
('AIS4P', 'Almacenamiento Interno S24+', '256 GB de almacenamiento UFS 3.1', 1260.00, 0.65, 0.65, 0.15, 30.00, 0.63, 60),
('AIUM5', 'Almacenamiento Interno S24 Ultra', '256 GB de almacenamiento UFS 3.1', 1440.00, 0.70, 0.70, 0.15, 30.00, 0.73, 64),
('AIZF6', 'Almacenamiento Interno Z Fold 6', '256 GB de almacenamiento UFS 3.1', 1620.00, 0.70, 0.70, 0.15, 30.00, 0.73, 68),
('BALS2', 'Batería Li-ion S24', 'Batería de 3900 mAh', 270.00, 0.60, 7.50, 0.30, 45.00, 1.35, 0),
('BAZF6', 'Batería Li-ion Z Fold 6', 'Batería de 4500 mAh', 450.00, 0.70, 8.00, 0.40, 60.00, 2.24, 68),
('BFLP6', 'Batería Li-ion Z Flip 6', 'Batería de 3500 mAh', 360.00, 0.70, 8.00, 0.30, 50.00, 1.68, 62),
('BLA4S', 'Batería Li-ion S24+', 'Batería de 4900 mAh', 360.00, 0.70, 8.00, 0.35, 55.00, 1.96, 60),
('BLUM5', 'Batería Li-ion S24 Ultra', 'Batería de 5000 mAh', 450.00, 0.75, 8.00, 0.40, 65.00, 2.24, 64),
('CAZ6F', 'Cámara Frontal Z Flip 6', 'Cámara de 10 MP', 450.00, 0.50, 3.50, 0.20, 8.00, 0.35, 62),
('CCS24', 'Carcasa Chasis S24', 'Chasis de aluminio con cristal Gorilla Glass Victus 2', 1080.00, 7.50, 16.00, 0.80, 100.00, 9.60, 0),
('CCS4P', 'Carcasa Chasis S24+', 'Chasis de aluminio con cristal Gorilla Glass Victus 2', 1170.00, 8.00, 16.50, 0.85, 120.00, 11.00, 60),
('CCUM5', 'Carcasa Chasis S24 Ultra', 'Chasis de aluminio con cristal Gorilla Glass Victus 2', 1620.00, 8.50, 17.00, 0.90, 150.00, 13.00, 64),
('CCZ6P', 'Carcasa Chasis Z Flip 6', 'Carcasa exterior chasis del Samsung Galaxy Z Flip 6', 740.00, 8.60, 7.40, 1.60, 50.00, 101.10, 62),
('CCZF6', 'Carcasa Chasis Z Fold 6', 'Carcasa chasis exterior del Samsung Galaxy Z Fold 6.', 1200.00, 16.20, 7.60, 1.60, 75.00, 198.72, 68),
('CFS24', 'Cámara Frontal S24', 'Cámara de 12 MP', 360.00, 0.50, 3.50, 0.20, 8.00, 0.35, 0),
('CFS4P', 'Cámara Frontal S24+', 'Cámara de 12 MP', 450.00, 0.50, 3.50, 0.25, 10.00, 0.44, 60),
('CFUM5', 'Cámara Frontal S24 Ultra', 'Cámara de 12 MP', 540.00, 0.55, 3.50, 0.30, 12.00, 0.58, 64),
('CFZ6F', 'Cámara Frontal Z Fold 6', 'Cámara de 10 MP', 540.00, 0.50, 3.50, 0.20, 8.00, 0.35, 68),
('CPS24', 'Cámara Principal S24', 'Cámara de 50 MP gran angular', 540.00, 0.50, 6.00, 0.25, 12.00, 0.75, 0),
('CPS4P', 'Cámara Principal S24+', 'Cámara de 50 MP gran angular', 630.00, 0.50, 6.00, 0.25, 15.00, 0.75, 60),
('CPU5S', 'Cámara Principal S24 Ultra', 'Cámara de 200 MP gran angular', 1080.00, 0.70, 6.50, 0.30, 20.00, 1.37, 64),
('CPZF6', 'Cámara Principal Z Fold 6', 'Cámara de 50 MP gran angular', 720.00, 0.50, 6.00, 0.25, 15.00, 0.75, 68),
('CZF6P', 'Cámara Principal Z Flip 6', 'Cámara de 50 MP gran angular', 720.00, 0.50, 6.00, 0.25, 12.00, 0.75, 62),
('MAZ6F', 'Memoria RAM Z Flip 6', '8 GB de LPDDR5 RAM', 720.00, 0.70, 1.00, 0.15, 25.00, 1.05, 62),
('MR8SP', 'Memoria RAM 8GB S24+', '8 GB de LPDDR5 RAM', 810.00, 0.70, 1.00, 0.15, 30.00, 1.05, 60),
('MRS24', 'Memoria RAM S24', '8 GB de LPDDR5 RAM', 720.00, 0.70, 1.00, 0.15, 25.00, 1.05, 0),
('MRUM5', 'Memoria RAM S24 Ultra', '12 GB de LPDDR5 RAM', 1080.00, 0.75, 1.00, 0.20, 35.00, 1.40, 64),
('MRZ6F', 'Memoria RAM Z Fold 6', '12 GB de LPDDR5 RAM', 1260.00, 0.70, 1.00, 0.20, 40.00, 1.40, 68),
('PAMS2', 'Pantalla AMOLED S24', 'Pantalla Dynamic AMOLED 2X de 6.1 120 Hz HDR10+', 3600.00, 6.10, 13.06, 0.07, 35.00, 2.60, 0),
('PAUM5', 'Pantalla AMOLED S24 Ultra', 'Pantalla Dynamic AMOLED 2X de 6.8 120 Hz, HDR10+', 5400.00, 6.80, 15.50, 0.09, 70.00, 4.40, 64),
('PB4S4', 'Placa Base Base S24+', 'Placa base con todos los componentes integrados', 1980.00, 7.50, 11.50, 0.30, 130.00, 26.00, 60),
('PBBS2', 'Placa Base Base S24', 'Placa base con todos los componentes integrados', 1800.00, 7.00, 10.00, 0.30, 120.00, 21.00, 0),
('PBU5S', 'Placa Base Base S24 Ultra', 'Placa base con todos los componentes integrados', 2700.00, 8.00, 12.00, 0.35, 150.00, 33.60, 64),
('PBZ6F', 'Placa Base Base Z Flip 6', 'Placa base con todos los componentes integrados', 1800.00, 7.00, 10.00, 0.30, 120.00, 21.00, 62),
('PBZF6', 'Placa Base Base Z Fold 6', 'Placa base con todos los componentes integrados', 2700.00, 8.00, 12.00, 0.35, 150.00, 33.60, 68),
('PE4SP', 'Procesador Exynos S24+', 'Qualcomm Snapdragon 8 Gen 3', 3780.00, 0.70, 0.70, 0.25, 12.00, 0.12, 60),
('PEF6L', 'Pantalla Exterior Super AMOLED Z Fold 6', 'Pantalla Dynamic AMOLED 2X de 6.2', 2700.00, 6.20, 13.00, 0.70, 35.00, 2.50, 68),
('PEF6P', 'Pantalla Exterior Super AMOLED Z Flip 6', 'Pantalla Super AMOLED de 1.9', 1800.00, 1.90, 6.00, 0.70, 15.00, 0.80, 62),
('PES24', 'Procesador Exynos S24', 'Qualcomm Snapdragon 8 Gen 3', 3600.00, 0.70, 0.70, 0.25, 10.00, 0.12, 0),
('PEUM5', 'Procesador Exynos S24 Ultra ', 'Qualcomm Snapdragon 8 Gen 3', 4500.00, 0.80, 0.80, 0.30, 15.00, 0.24, 64),
('PFLP6', 'Pantalla Principal Flex AMOLED Z Flip 6', 'Pantalla plegable Dynamic AMOLED 2X de 6.7', 5400.00, 6.70, 15.00, 0.80, 55.00, 3.50, 62),
('PFOL6', 'Pantalla Principal Flex AMOLED Z Fold 6', 'Pantalla plegable Dynamic AMOLED 2X de 7.6', 6300.00, 7.60, 16.00, 0.80, 70.00, 5.50, 68),
('PMA4S', 'Pantalla AMOLED S24+', 'Pantalla Dynamic AMOLED 2X de 6.7 120 Hz, HDR10+', 4500.00, 6.70, 14.50, 0.08, 55.00, 3.50, 60),
('PSZ6F', 'Procesador Snapdragon Z Flip 6', 'Qualcomm Snapdragon 8 Gen 3', 3780.00, 0.70, 0.70, 0.25, 10.00, 0.12, 62),
('PSZF6', 'Procesador Snapdragon Z Fold 6', 'Qualcomm Snapdragon 8 Gen 3', 3600.00, 0.70, 0.70, 0.25, 10.00, 0.12, 68);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATERIA_PRIMA_LOTE`
--

CREATE TABLE `MATERIA_PRIMA_LOTE` (
  `num` int NOT NULL,
  `materiaPrima` varchar(5) NOT NULL,
  `lote` int NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `MATERIA_PRIMA_LOTE`
--

INSERT INTO `MATERIA_PRIMA_LOTE` (`num`, `materiaPrima`, `lote`, `cantidad`) VALUES
(1, 'AIS24', 1, 80),
(1, 'BALS2', 1, 80),
(1, 'CCS24', 1, 80),
(1, 'CFS24', 1, 80),
(1, 'CPS24', 1, 80),
(1, 'MRS24', 1, 80),
(1, 'PAMS2', 1, 80),
(1, 'PBBS2', 1, 80),
(1, 'PES24', 1, 80),
(2, 'AIS4P', 2, 80),
(2, 'BLA4S', 2, 80),
(2, 'CCS4P', 2, 80),
(2, 'CFS4P', 2, 80),
(2, 'CPS4P', 2, 80),
(2, 'MR8SP', 2, 80),
(2, 'PB4S4', 2, 80),
(2, 'PE4SP', 2, 80),
(2, 'PMA4S', 2, 80),
(3, 'AIUM5', 3, 80),
(3, 'BLUM5', 3, 80),
(3, 'CCUM5', 3, 80),
(3, 'CFUM5', 3, 80),
(3, 'CPU5S', 3, 80),
(3, 'MRUM5', 3, 80),
(3, 'PAUM5', 3, 80),
(3, 'PBU5S', 3, 80),
(3, 'PEUM5', 3, 80),
(4, 'AIZF6', 4, 80),
(4, 'BAZF6', 4, 80),
(4, 'CCZF6', 4, 80),
(4, 'CFZ6F', 4, 80),
(4, 'CPZF6', 4, 80),
(4, 'MRZ6F', 4, 80),
(4, 'PBZF6', 4, 80),
(4, 'PEF6L', 4, 80),
(4, 'PFOL6', 4, 80),
(4, 'PSZF6', 4, 80),
(5, 'AIF6P', 5, 80),
(5, 'BFLP6', 5, 80),
(5, 'CAZ6F', 5, 80),
(5, 'CCZ6P', 5, 80),
(5, 'CZF6P', 5, 80),
(5, 'MAZ6F', 5, 80),
(5, 'PBZ6F', 5, 80),
(5, 'PEF6P', 5, 80),
(5, 'PFLP6', 5, 80),
(5, 'PSZ6F', 5, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATERIA_PRIMA_PROD_TERMINADO`
--

CREATE TABLE `MATERIA_PRIMA_PROD_TERMINADO` (
  `num` int NOT NULL,
  `materiaPrima` varchar(5) NOT NULL,
  `prodTerminado` varchar(5) NOT NULL,
  `cantidad` int NOT NULL,
  `costoTotalPorMateria` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `MATERIA_PRIMA_PROD_TERMINADO`
--

INSERT INTO `MATERIA_PRIMA_PROD_TERMINADO` (`num`, `materiaPrima`, `prodTerminado`, `cantidad`, `costoTotalPorMateria`) VALUES
(1, 'AIS24', 'GYS24', 1, 900.00),
(1, 'BALS2', 'GYS24', 1, 270.00),
(1, 'CCS24', 'GYS24', 1, 1080.00),
(1, 'CFS24', 'GYS24', 1, 360.00),
(1, 'CPS24', 'GYS24', 1, 540.00),
(1, 'MRS24', 'GYS24', 1, 720.00),
(1, 'PAMS2', 'GYS24', 1, 3600.00),
(1, 'PBBS2', 'GYS24', 1, 1800.00),
(1, 'PES24', 'GYS24', 1, 3600.00),
(2, 'AIS4P', 'GS24P', 1, 1260.00),
(2, 'BLA4S', 'GS24P', 1, 360.00),
(2, 'CCS4P', 'GS24P', 1, 1170.00),
(2, 'CFS4P', 'GS24P', 1, 450.00),
(2, 'CPS4P', 'GS24P', 1, 630.00),
(2, 'MR8SP', 'GS24P', 1, 810.00),
(2, 'PB4S4', 'GS24P', 1, 1980.00),
(2, 'PE4SP', 'GS24P', 1, 3780.00),
(2, 'PMA4S', 'GS24P', 1, 4500.00),
(3, 'AIUM5', 'GS24U', 1, 1440.00),
(3, 'BLUM5', 'GS24U', 1, 450.00),
(3, 'CCUM5', 'GS24U', 1, 1620.00),
(3, 'CFUM5', 'GS24U', 1, 540.00),
(3, 'CPU5S', 'GS24U', 1, 1080.00),
(3, 'MRUM5', 'GS24U', 1, 1080.00),
(3, 'PAUM5', 'GS24U', 1, 5400.00),
(3, 'PBU5S', 'GS24U', 1, 2700.00),
(3, 'PEUM5', 'GS24U', 1, 4500.00),
(4, 'AIZF6', 'GZFO6', 1, 1620.00),
(4, 'BAZF6', 'GZFO6', 1, 450.00),
(4, 'CCZF6', 'GZFO6', 1, 1200.00),
(4, 'CFZ6F', 'GZFO6', 1, 540.00),
(4, 'CPZF6', 'GZFO6', 1, 720.00),
(4, 'MRZ6F', 'GZFO6', 1, 1260.00),
(4, 'PBZF6', 'GZFO6', 1, 2700.00),
(4, 'PEF6L', 'GZFO6', 1, 2700.00),
(4, 'PFOL6', 'GZFO6', 1, 6300.00),
(4, 'PSZF6', 'GZFO6', 1, 3600.00),
(5, 'AIF6P', 'GZFL6', 1, 900.00),
(5, 'BFLP6', 'GZFL6', 1, 360.00),
(5, 'CAZ6F', 'GZFL6', 1, 450.00),
(5, 'CCZ6P', 'GZFL6', 1, 740.00),
(5, 'CZF6P', 'GZFL6', 1, 720.00),
(5, 'MAZ6F', 'GZFL6', 1, 720.00),
(5, 'PBZ6F', 'GZFL6', 1, 1800.00),
(5, 'PEF6P', 'GZFL6', 1, 1800.00),
(5, 'PFLP6', 'GZFL6', 1, 5400.00),
(5, 'PSZ6F', 'GZFL6', 1, 3780.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVIMIENTO`
--

CREATE TABLE `MOVIMIENTO` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(128) NOT NULL,
  `tipoMovimiento` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `MOVIMIENTO`
--

INSERT INTO `MOVIMIENTO` (`codigo`, `descripcion`, `tipoMovimiento`) VALUES
('MV001', 'Entrada de Materia Prima: PMA4S', 'ENTRA'),
('MV002', 'Entrada de Materia Prima: BLA4S', 'ENTRA'),
('MV003', 'Entrada de Materia Prima: CPS4P', 'ENTRA'),
('MV004', 'Entrada de Materia Prima: CFS4P', 'ENTRA'),
('MV005', 'Entrada de Materia Prima: PE4SP', 'ENTRA'),
('MV006', 'Entrada de Materia Prima: MR8SP', 'ENTRA'),
('MV007', 'Entrada de Materia Prima: AIS4P', 'ENTRA'),
('MV008', 'Entrada de Materia Prima: PB4S4', 'ENTRA'),
('MV009', 'Entrada de Materia Prima: CCS4P', 'ENTRA'),
('MV010', 'Entrada de Materia Prima: PAUM5', 'ENTRA'),
('MV011', 'Entrada de Materia Prima: BLUM5', 'ENTRA'),
('MV012', 'Entrada de Materia Prima: CPU5S', 'ENTRA'),
('MV013', 'Entrada de Materia Prima: CFUM5', 'ENTRA'),
('MV014', 'Entrada de Materia Prima: PEUM5', 'ENTRA'),
('MV015', 'Entrada de Materia Prima: MRUM5', 'ENTRA'),
('MV016', 'Entrada de Materia Prima: AIUM5', 'ENTRA'),
('MV017', 'Entrada de Materia Prima: PBU5S', 'ENTRA'),
('MV018', 'Entrada de Materia Prima: CCUM5', 'ENTRA'),
('MV019', 'Entrada de Materia Prima: PFOL6', 'ENTRA'),
('MV020', 'Entrada de Materia Prima: PEF6L', 'ENTRA'),
('MV021', 'Entrada de Materia Prima: BAZF6', 'ENTRA'),
('MV022', 'Entrada de Materia Prima: CPZF6', 'ENTRA'),
('MV023', 'Entrada de Materia Prima: CFZ6F', 'ENTRA'),
('MV024', 'Entrada de Materia Prima: PSZF6', 'ENTRA'),
('MV025', 'Entrada de Materia Prima: MRZ6F', 'ENTRA'),
('MV026', 'Entrada de Materia Prima: AIZF6', 'ENTRA'),
('MV027', 'Entrada de Materia Prima: PBZF6', 'ENTRA'),
('MV028', 'Entrada de Materia Prima: CCZF6', 'ENTRA'),
('MV029', 'Entrada de Materia Prima: PFLP6', 'ENTRA'),
('MV030', 'Entrada de Materia Prima: PEF6P', 'ENTRA'),
('MV031', 'Entrada de Materia Prima: BFLP6', 'ENTRA'),
('MV032', 'Entrada de Materia Prima: CZF6P', 'ENTRA'),
('MV033', 'Entrada de Materia Prima: CFZ6F', 'ENTRA'),
('MV034', 'Entrada de Materia Prima: PSZ6F', 'ENTRA'),
('MV035', 'Entrada de Materia Prima: MRZ6F', 'ENTRA'),
('MV036', 'Entrada de Materia Prima: AIF6P', 'ENTRA'),
('MV037', 'Entrada de Materia Prima: PBZ6F', 'ENTRA'),
('MV038', 'Entrada de Materia Prima: CCZ6P', 'ENTRA'),
('MV039', 'Translado de Materia Prima: PMA4S', 'TRANS'),
('MV040', 'Translado de Materia Prima: BLA4S', 'TRANS'),
('MV041', 'Translado de Materia Prima: CPS4P', 'TRANS'),
('MV042', 'Translado de Materia Prima: CFS4P', 'TRANS'),
('MV043', 'Translado de Materia Prima: PE4SP', 'TRANS'),
('MV044', 'Translado de Materia Prima: MR8SP', 'TRANS'),
('MV045', 'Translado de Materia Prima: AIS4P', 'TRANS'),
('MV046', 'Translado de Materia Prima: PB4S4', 'TRANS'),
('MV047', 'Translado de Materia Prima: CCS4P', 'TRANS'),
('MV048', 'Translado de Materia Prima: PAUM5', 'TRANS'),
('MV049', 'Translado de Materia Prima: BLUM5', 'TRANS'),
('MV050', 'Translado de Materia Prima: CPU5S', 'TRANS'),
('MV051', 'Translado de Materia Prima: CFUM5', 'TRANS'),
('MV052', 'Translado de Materia Prima: PEUM5', 'TRANS'),
('MV053', 'Translado de Materia Prima: MRUM5', 'TRANS'),
('MV054', 'Translado de Materia Prima: AIUM5', 'TRANS'),
('MV055', 'Translado de Materia Prima: PBU5S', 'TRANS'),
('MV056', 'Translado de Materia Prima: CCUM5', 'TRANS'),
('MV057', 'Translado de Materia Prima: PFOL6', 'TRANS'),
('MV058', 'Translado de Materia Prima: PEF6L', 'TRANS'),
('MV059', 'Translado de Materia Prima: BAZF6', 'TRANS'),
('MV060', 'Translado de Materia Prima: CPZF6', 'TRANS'),
('MV061', 'Translado de Materia Prima: CFZ6F', 'TRANS'),
('MV062', 'Translado de Materia Prima: PSZF6', 'TRANS'),
('MV063', 'Translado de Materia Prima: MRZ6F', 'TRANS'),
('MV064', 'Translado de Materia Prima: AIZF6', 'TRANS'),
('MV065', 'Translado de Materia Prima: PBZF6', 'TRANS'),
('MV066', 'Translado de Materia Prima: CCZF6', 'TRANS'),
('MV067', 'Translado de Materia Prima: PFLP6', 'TRANS'),
('MV068', 'Translado de Materia Prima: PEF6P', 'TRANS'),
('MV069', 'Translado de Materia Prima: BFLP6', 'TRANS'),
('MV070', 'Translado de Materia Prima: CZF6P', 'TRANS'),
('MV071', 'Translado de Materia Prima: CFZ6F', 'TRANS'),
('MV072', 'Translado de Materia Prima: PSZ6F', 'TRANS'),
('MV073', 'Translado de Materia Prima: MRZ6F', 'TRANS'),
('MV074', 'Translado de Materia Prima: AIF6P', 'TRANS'),
('MV075', 'Translado de Materia Prima: PBZ6F', 'TRANS'),
('MV076', 'Translado de Materia Prima: CCZ6P', 'TRANS'),
('MV077', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV078', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV079', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV080', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV081', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV082', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV083', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV084', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV085', 'Salida de materia prima para ensamblaje de Galaxy S24+.', 'SALID'),
('MV086', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV087', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV088', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV089', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV090', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV091', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV092', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV093', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV094', 'Salida de materia prima para ensamblaje de Galaxy S24 Ultra.', 'SALID'),
('MV095', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV096', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV097', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV098', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV099', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV100', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV101', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV102', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV103', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV104', 'Salida de materia prima para ensamblaje de Galaxy Z Fold 6.', 'SALID'),
('MV105', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV106', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV107', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV108', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV109', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV110', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV111', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV112', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV113', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV114', 'Salida de materia prima para ensamblaje de Galaxy Z Flip 6.', 'SALID'),
('MV115', 'Entrada de producto terminado: GS24P', 'ENTRA'),
('MV116', 'Entrada de producto terminado: GS24U', 'ENTRA'),
('MV117', 'Entrada de producto terminado: GZFO6', 'ENTRA'),
('MV118', 'Entrada de producto terminado: GZFL6', 'ENTRA'),
('MV119', 'Translado de producto terminado: GS24P', 'TRANS'),
('MV120', 'Translado de producto terminado: GS24U', 'TRANS'),
('MV121', 'Translado de producto terminado: GZFO6', 'TRANS'),
('MV122', 'Translado de producto terminado: GZFL6', 'TRANS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVIMIENTO_MATERIA_PRIMA`
--

CREATE TABLE `MOVIMIENTO_MATERIA_PRIMA` (
  `num` int NOT NULL,
  `movimiento` varchar(5) NOT NULL,
  `materiaPrima` varchar(5) NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `MOVIMIENTO_MATERIA_PRIMA`
--

INSERT INTO `MOVIMIENTO_MATERIA_PRIMA` (`num`, `movimiento`, `materiaPrima`, `fecha`, `cantidad`) VALUES
(1, 'MV001', 'PMA4S', '2024-11-05 08:00:00', 80),
(2, 'MV002', 'BLA4S', '2024-11-05 08:08:03', 80),
(3, 'MV003', 'CPS4P', '2024-11-05 08:16:06', 80),
(4, 'MV004', 'CFS4P', '2024-11-05 08:24:09', 80),
(5, 'MV005', 'PE4SP', '2024-11-05 08:32:12', 80),
(6, 'MV006', 'MR8SP', '2024-11-05 08:40:14', 80),
(7, 'MV007', 'AIS4P', '2024-11-05 08:48:17', 80),
(8, 'MV008', 'PB4S4', '2024-11-05 08:56:20', 80),
(9, 'MV009', 'CCS4P', '2024-11-05 09:04:23', 80),
(10, 'MV010', 'PAUM5', '2024-11-05 09:12:26', 80),
(11, 'MV011', 'BLUM5', '2024-11-05 09:20:29', 80),
(12, 'MV012', 'CPU5S', '2024-11-05 09:28:32', 80),
(13, 'MV013', 'CFUM5', '2024-11-05 09:36:35', 80),
(14, 'MV014', 'PEUM5', '2024-11-05 09:44:37', 80),
(15, 'MV015', 'MRUM5', '2024-11-05 09:52:40', 80),
(16, 'MV016', 'AIUM5', '2024-11-05 10:00:43', 80),
(17, 'MV017', 'PBU5S', '2024-11-05 10:08:46', 80),
(18, 'MV018', 'CCUM5', '2024-11-05 10:16:48', 80),
(19, 'MV019', 'PFOL6', '2024-11-05 10:24:51', 80),
(20, 'MV020', 'PEF6L', '2024-11-05 10:32:54', 80),
(21, 'MV021', 'BAZF6', '2024-11-05 10:40:57', 80),
(22, 'MV022', 'CPZF6', '2024-11-05 10:48:59', 80),
(23, 'MV023', 'CFZ6F', '2024-11-05 10:57:02', 80),
(24, 'MV024', 'PSZF6', '2024-11-05 11:05:05', 80),
(25, 'MV025', 'MRZ6F', '2024-11-05 11:13:08', 80),
(26, 'MV026', 'AIZF6', '2024-11-05 11:21:11', 80),
(27, 'MV027', 'PBZF6', '2024-11-05 11:29:14', 80),
(28, 'MV028', 'CCZF6', '2024-11-05 11:37:17', 80),
(29, 'MV029', 'PFLP6', '2024-11-05 11:45:20', 80),
(30, 'MV030', 'PEF6P', '2024-11-05 11:53:22', 80),
(31, 'MV031', 'BFLP6', '2024-11-05 12:01:25', 80),
(32, 'MV032', 'CZF6P', '2024-11-05 12:09:28', 80),
(33, 'MV033', 'CAZ6F', '2024-11-05 12:17:31', 80),
(34, 'MV034', 'PSZ6F', '2024-11-05 12:25:34', 80),
(35, 'MV035', 'MAZ6F', '2024-11-05 12:33:36', 80),
(36, 'MV036', 'AIF6P', '2024-11-05 12:41:39', 80),
(37, 'MV037', 'PBZ6F', '2024-11-05 12:49:42', 80),
(38, 'MV038', 'CCZ6P', '2024-11-05 12:57:45', 80),
(39, 'MV039', 'PMA4S', '2024-11-05 13:05:48', 80),
(40, 'MV040', 'BLA4S', '2024-11-05 13:13:51', 80),
(41, 'MV041', 'CPS4P', '2024-11-05 13:21:53', 80),
(42, 'MV042', 'CFS4P', '2024-11-05 13:29:56', 80),
(43, 'MV043', 'PE4SP', '2024-11-05 13:37:59', 80),
(44, 'MV044', 'MR8SP', '2024-11-05 13:46:02', 80),
(45, 'MV045', 'AIS4P', '2024-11-05 13:54:05', 80),
(46, 'MV046', 'PB4S4', '2024-11-05 14:02:08', 80),
(47, 'MV047', 'CCS4P', '2024-11-05 14:10:11', 80),
(48, 'MV048', 'PAUM5', '2024-11-05 14:18:14', 80),
(49, 'MV049', 'BLUM5', '2024-11-05 14:26:17', 80),
(50, 'MV050', 'CPU5S', '2024-11-05 14:34:20', 80),
(51, 'MV051', 'CFUM5', '2024-11-05 14:42:23', 80),
(52, 'MV052', 'PEUM5', '2024-11-05 14:50:26', 80),
(53, 'MV053', 'MRUM5', '2024-11-05 14:58:29', 80),
(54, 'MV054', 'AIUM5', '2024-11-05 15:06:32', 80),
(55, 'MV055', 'PBU5S', '2024-11-05 15:14:35', 80),
(56, 'MV056', 'CCUM5', '2024-11-05 15:22:38', 80),
(57, 'MV057', 'PFOL6', '2024-11-05 15:30:41', 80),
(58, 'MV058', 'PEF6L', '2024-11-05 15:38:44', 80),
(59, 'MV059', 'BAZF6', '2024-11-05 15:46:47', 80),
(60, 'MV060', 'CPZF6', '2024-11-05 15:54:50', 80),
(61, 'MV061', 'CFZ6F', '2024-11-05 16:02:53', 80),
(62, 'MV062', 'PSZF6', '2024-11-05 16:10:56', 80),
(63, 'MV063', 'MRZ6F', '2024-11-05 16:18:59', 80),
(64, 'MV064', 'AIZF6', '2024-11-05 16:27:02', 80),
(65, 'MV065', 'PBZF6', '2024-11-05 16:35:05', 80),
(66, 'MV066', 'CCZF6', '2024-11-05 16:43:08', 80),
(67, 'MV067', 'PFLP6', '2024-11-05 16:51:11', 80),
(68, 'MV068', 'PEF6P', '2024-11-05 16:59:14', 80),
(69, 'MV069', 'BFLP6', '2024-11-05 17:07:17', 80),
(70, 'MV070', 'CZF6P', '2024-11-05 17:15:20', 80),
(71, 'MV071', 'CAZ6F', '2024-11-05 17:23:23', 80),
(72, 'MV072', 'PSZ6F', '2024-11-05 17:31:26', 80),
(73, 'MV073', 'MAZ6F', '2024-11-05 17:39:29', 80),
(74, 'MV074', 'AIF6P', '2024-11-05 17:47:32', 80),
(75, 'MV075', 'PBZ6F', '2024-11-05 17:55:35', 80),
(76, 'MV076', 'CCZ6P', '2024-11-05 18:03:38', 80),
(77, 'MV077', 'PMA4S', '2024-11-06 08:55:44', 20),
(78, 'MV078', 'BLA4S', '2024-11-06 09:00:49', 20),
(79, 'MV079', 'CPS4P', '2024-11-06 09:05:53', 20),
(80, 'MV080', 'CFS4P', '2024-11-06 09:10:58', 20),
(81, 'MV081', 'PE4SP', '2024-11-06 09:16:01', 20),
(82, 'MV082', 'MR8SP', '2024-11-06 09:21:05', 20),
(83, 'MV083', 'AIS4P', '2024-11-06 09:26:11', 20),
(84, 'MV084', 'PB4S4', '2024-11-06 09:31:17', 20),
(85, 'MV085', 'CCS4P', '2024-11-06 09:36:22', 20),
(86, 'MV086', 'PAUM5', '2024-11-06 09:41:28', 16),
(87, 'MV087', 'BLUM5', '2024-11-06 09:46:34', 16),
(88, 'MV088', 'CPU5S', '2024-11-06 09:51:39', 16),
(89, 'MV089', 'CFUM5', '2024-11-06 09:56:45', 16),
(90, 'MV090', 'PEUM5', '2024-11-06 10:01:50', 16),
(91, 'MV091', 'MRUM5', '2024-11-06 10:06:55', 16),
(92, 'MV092', 'AIUM5', '2024-11-06 10:12:00', 16),
(93, 'MV093', 'PBU5S', '2024-11-06 10:17:05', 16),
(94, 'MV094', 'CCUM5', '2024-11-06 10:22:10', 16),
(95, 'MV095', 'PFOL6', '2024-11-06 10:27:14', 12),
(96, 'MV096', 'PEF6L', '2024-11-06 10:32:19', 12),
(97, 'MV097', 'BAZF6', '2024-11-06 10:37:24', 12),
(98, 'MV098', 'CPZF6', '2024-11-06 10:42:29', 12),
(99, 'MV099', 'CFZ6F', '2024-11-06 10:47:34', 12),
(100, 'MV100', 'PSZF6', '2024-11-06 10:52:39', 12),
(101, 'MV101', 'MRZ6F', '2024-11-06 10:57:44', 12),
(102, 'MV102', 'AIZF6', '2024-11-06 11:02:49', 12),
(103, 'MV103', 'PBZF6', '2024-11-06 11:07:54', 12),
(104, 'MV104', 'CCZF6', '2024-11-06 11:12:59', 12),
(105, 'MV105', 'PFLP6', '2024-11-06 11:18:04', 18),
(106, 'MV106', 'PEF6P', '2024-11-06 11:23:09', 18),
(107, 'MV107', 'BFLP6', '2024-11-06 11:28:14', 18),
(108, 'MV108', 'CZF6P', '2024-11-06 11:33:19', 18),
(109, 'MV109', 'CAZ6F', '2024-11-06 11:38:24', 18),
(110, 'MV110', 'PSZ6F', '2024-11-06 11:43:29', 18),
(111, 'MV111', 'MAZ6F', '2024-11-06 11:48:34', 18),
(112, 'MV112', 'AIF6P', '2024-11-06 11:53:39', 18),
(113, 'MV113', 'PBZ6F', '2024-11-06 11:58:44', 18),
(114, 'MV114', 'CCZ6P', '2024-11-06 12:03:49', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVIMIENTO_PROD_TERMINADO`
--

CREATE TABLE `MOVIMIENTO_PROD_TERMINADO` (
  `num` int NOT NULL,
  `movimiento` varchar(5) NOT NULL,
  `prodTerminado` varchar(5) NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `MOVIMIENTO_PROD_TERMINADO`
--

INSERT INTO `MOVIMIENTO_PROD_TERMINADO` (`num`, `movimiento`, `prodTerminado`, `fecha`, `cantidad`) VALUES
(1, 'MV115', 'GS24P', '2024-11-06 12:33:49', 20),
(2, 'MV116', 'GS24U', '2024-11-06 13:03:49', 16),
(3, 'MV117', 'GZFO6', '2024-11-06 13:33:49', 12),
(4, 'MV118', 'GZFL6', '2024-11-06 14:03:49', 18),
(5, 'MV119', 'GS24P', '2024-11-06 14:33:49', 20),
(6, 'MV120', 'GS24U', '2024-11-06 14:38:49', 16),
(7, 'MV121', 'GZFO6', '2024-11-06 14:42:32', 12),
(8, 'MV122', 'GZFL6', '2024-11-06 14:47:49', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROD_TERMINADO`
--

CREATE TABLE `PROD_TERMINADO` (
  `codigo` varchar(8) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `costoNeto` decimal(10,2) NOT NULL,
  `largo` decimal(10,2) NOT NULL,
  `alto` decimal(10,2) NOT NULL,
  `ancho` decimal(10,2) NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `volumen` decimal(10,2) NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PROD_TERMINADO`
--

INSERT INTO `PROD_TERMINADO` (`codigo`, `nombre`, `descripcion`, `costoNeto`, `largo`, `alto`, `ancho`, `peso`, `volumen`, `stock`) VALUES
('GS24P', 'Galaxy S24+', 'Smartphone de gama alta, pantalla grande', 14940.00, 16.10, 7.80, 0.80, 200.00, 100.46, 20),
('GS24U', 'Galaxy S24 Ultra', 'Smartphone con cámara avanzada, 5G', 18810.00, 16.50, 7.80, 0.90, 228.00, 115.83, 16),
('GYS24', 'Galaxy S24', 'Smartphone de gama alta, 5G', 12870.00, 15.60, 7.30, 0.80, 168.00, 91.10, 0),
('GZFL6', 'Galaxy Z Flip 6', 'Smartphone plegable compacto', 16670.00, 8.50, 7.20, 1.00, 187.00, 61.20, 18),
('GZFO6', 'Galaxy Z Fold 6', 'Smartphone plegable, pantalla flexible', 21090.00, 16.70, 7.80, 1.30, 280.00, 169.34, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PUESTO`
--

CREATE TABLE `PUESTO` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `PUESTO`
--

INSERT INTO `PUESTO` (`codigo`, `descripcion`) VALUES
('ADMIN', 'Adiministrador'),
('ANAIN', 'Analista de inventario'),
('GRDMP', 'Gestor de materia prima'),
('RECEP', 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REQUISICION`
--

CREATE TABLE `REQUISICION` (
  `num` int NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `empleado` int DEFAULT NULL,
  `lineaProd` int DEFAULT NULL,
  `edoRequisicion` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `REQUISICION`
--

INSERT INTO `REQUISICION` (`num`, `descripcion`, `empleado`, `lineaProd`, `edoRequisicion`) VALUES
(1, 'Requisicion para el producto GYS24', 15, 1, 'PENDI'),
(2, 'Requisicion para los productos GS24P y GS24U', 15, 2, 'APROB'),
(3, 'Requisicion para los productos GZFO6 y GZFL6', 15, 3, 'APROB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REQUISICION_MATERIA_PRIMA`
--

CREATE TABLE `REQUISICION_MATERIA_PRIMA` (
  `num` int NOT NULL,
  `requisicion` int NOT NULL,
  `materiaPrima` varchar(5) NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `REQUISICION_MATERIA_PRIMA`
--

INSERT INTO `REQUISICION_MATERIA_PRIMA` (`num`, `requisicion`, `materiaPrima`, `fecha`, `cantidad`) VALUES
(1, 1, 'AIS24', '2024-11-06 08:30:29', 10),
(1, 1, 'BALS2', '2024-11-06 08:05:04', 10),
(1, 1, 'CCS24', '2024-11-06 08:40:38', 10),
(1, 1, 'CFS24', '2024-11-06 08:15:12', 10),
(1, 1, 'CPS24', '2024-11-06 08:10:09', 10),
(1, 1, 'MRS24', '2024-11-06 08:25:23', 10),
(1, 1, 'PAMS2', '2024-11-06 08:00:00', 10),
(1, 1, 'PBBS2', '2024-11-06 08:35:34', 10),
(1, 1, 'PES24', '2024-11-06 08:20:17', 10),
(2, 2, 'AIS4P', '2024-11-06 09:16:11', 20),
(2, 2, 'BLA4S', '2024-11-06 08:50:49', 20),
(2, 2, 'CCS4P', '2024-11-06 09:26:22', 20),
(2, 2, 'CFS4P', '2024-11-06 09:00:58', 20),
(2, 2, 'CPS4P', '2024-11-06 08:55:53', 20),
(2, 2, 'MR8SP', '2024-11-06 09:11:05', 20),
(2, 2, 'PB4S4', '2024-11-06 09:21:17', 20),
(2, 2, 'PE4SP', '2024-11-06 09:06:01', 20),
(2, 2, 'PMA4S', '2024-11-06 08:45:44', 20),
(3, 2, 'AIUM5', '2024-11-06 10:02:00', 16),
(3, 2, 'BLUM5', '2024-11-06 09:36:34', 16),
(3, 2, 'CCUM5', '2024-11-06 10:12:10', 16),
(3, 2, 'CFUM5', '2024-11-06 09:46:45', 16),
(3, 2, 'CPU5S', '2024-11-06 09:41:39', 16),
(3, 2, 'MRUM5', '2024-11-06 09:56:55', 16),
(3, 2, 'PAUM5', '2024-11-06 09:31:28', 16),
(3, 2, 'PBU5S', '2024-11-06 10:07:05', 16),
(3, 2, 'PEUM5', '2024-11-06 09:51:50', 16),
(4, 3, 'AIZF6', '2024-11-06 10:52:51', 12),
(4, 3, 'BAZF6', '2024-11-06 10:27:24', 12),
(4, 3, 'CCZF6', '2024-11-06 11:02:00', 12),
(4, 3, 'CFZ6F', '2024-11-06 10:37:35', 12),
(4, 3, 'CPZF6', '2024-11-06 10:32:30', 12),
(4, 3, 'MRZ6F', '2024-11-06 10:47:46', 12),
(4, 3, 'PBZF6', '2024-11-06 10:57:56', 12),
(4, 3, 'PEF6L', '2024-11-06 10:22:19', 12),
(4, 3, 'PFLP6', '2024-11-06 11:07:06', 18),
(4, 3, 'PFOL6', '2024-11-06 10:17:14', 12),
(4, 3, 'PSZF6', '2024-11-06 10:42:41', 12),
(5, 3, 'AIF6P', '2024-11-06 11:42:42', 18),
(5, 3, 'BFLP6', '2024-11-06 11:17:16', 18),
(5, 3, 'CAZ6F', '2024-11-06 11:27:27', 18),
(5, 3, 'CCZ6P', '2024-11-06 11:52:53', 18),
(5, 3, 'CZF6P', '2024-11-06 11:22:22', 18),
(5, 3, 'MAZ6F', '2024-11-06 11:37:37', 18),
(5, 3, 'PBZ6F', '2024-11-06 11:47:47', 18),
(5, 3, 'PEF6P', '2024-11-06 11:12:11', 18),
(5, 3, 'PSZ6F', '2024-11-06 11:32:32', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RESGUARDO`
--

CREATE TABLE `RESGUARDO` (
  `codigo` varchar(5) NOT NULL,
  `cantidad` int NOT NULL,
  `descripcion` varchar(48) NOT NULL,
  `materiaPrima` varchar(5) DEFAULT NULL,
  `prodTerminado` varchar(5) DEFAULT NULL,
  `ubicacion` varchar(8) DEFAULT NULL,
  `area` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `RESGUARDO`
--

INSERT INTO `RESGUARDO` (`codigo`, `cantidad`, `descripcion`, `materiaPrima`, `prodTerminado`, `ubicacion`, `area`) VALUES
('RG001', 60, 'Resguardo de PMA4S dentro del almacen', 'PMA4S', NULL, '01A0104A', 'ARDMP'),
('RG002', 60, 'Resguardo de BLA4S dentro del almacen', 'BLA4S', NULL, '01A0104B', 'ARDMP'),
('RG003', 60, 'Resguardo de CPS4P dentro del almacen', 'CPS4P', NULL, '01A0104C', 'ARDMP'),
('RG004', 60, 'Resguardo de CFS4P dentro del almacen', 'CFS4P', NULL, '01A0201A', 'ARDMP'),
('RG005', 60, 'Resguardo de PE4SP dentro del almacen', 'PE4SP', NULL, '01A0201B', 'ARDMP'),
('RG006', 60, 'Resguardo de MR8SP dentro del almacen', 'MR8SP', NULL, '01A0201C', 'ARDMP'),
('RG007', 60, 'Resguardo de AIS4P dentro del almacen', 'AIS4P', NULL, '01A0202A', 'ARDMP'),
('RG008', 60, 'Resguardo de PB4S4 dentro del almacen', 'PB4S4', NULL, '01A0202B', 'ARDMP'),
('RG009', 60, 'Resguardo de CCS4P dentro del almacen', 'CCS4P', NULL, '01A0202C', 'ARDMP'),
('RG010', 64, 'Resguardo de PAUM5 dentro del almacen', 'PAUM5', NULL, '01A0203A', 'ARDMP'),
('RG011', 64, 'Resguardo de BLUM5 dentro del almacen', 'BLUM5', NULL, '01A0203B', 'ARDMP'),
('RG012', 64, 'Resguardo de CPU5S dentro del almacen', 'CPU5S', NULL, '01A0203C', 'ARDMP'),
('RG013', 64, 'Resguardo de CFUM5 dentro del almacen', 'CFUM5', NULL, '01A0204A', 'ARDMP'),
('RG014', 64, 'Resguardo de PEUM5 dentro del almacen', 'PEUM5', NULL, '01A0204B', 'ARDMP'),
('RG015', 64, 'Resguardo de MRUM5 dentro del almacen', 'MRUM5', NULL, '01A0204C', 'ARDMP'),
('RG016', 64, 'Resguardo de AIUM5 dentro del almacen', 'AIUM5', NULL, '01A0301A', 'ARDMP'),
('RG017', 64, 'Resguardo de PBU5S dentro del almacen', 'PBU5S', NULL, '01A0301B', 'ARDMP'),
('RG018', 64, 'Resguardo de CCUM5 dentro del almacen', 'CCUM5', NULL, '01A0301C', 'ARDMP'),
('RG019', 68, 'Resguardo de PFOL6 dentro del almacen', 'PFOL6', NULL, '01A0302A', 'ARDMP'),
('RG020', 68, 'Resguardo de PEF6L dentro del almacen', 'PEF6L', NULL, '01A0302B', 'ARDMP'),
('RG021', 68, 'Resguardo de BAZF6 dentro del almacen', 'BAZF6', NULL, '01A0302C', 'ARDMP'),
('RG022', 68, 'Resguardo de CPZF6 dentro del almacen', 'CPZF6', NULL, '01A0303A', 'ARDMP'),
('RG023', 68, 'Resguardo de CFZ6F dentro del almacen', 'CFZ6F', NULL, '01A0303B', 'ARDMP'),
('RG024', 68, 'Resguardo de PSZF6 dentro del almacen', 'PSZF6', NULL, '01A0303C', 'ARDMP'),
('RG025', 68, 'Resguardo de MRZ6F dentro del almacen', 'MRZ6F', NULL, '01A0304A', 'ARDMP'),
('RG026', 68, 'Resguardo de AIZF6 dentro del almacen', 'AIZF6', NULL, '01A0304B', 'ARDMP'),
('RG027', 68, 'Resguardo de PBZF6 dentro del almacen', 'PBZF6', NULL, '01A0304C', 'ARDMP'),
('RG028', 68, 'Resguardo de CCZF6 dentro del almacen', 'CCZF6', NULL, '01A0401A', 'ARDMP'),
('RG029', 62, 'Resguardo de PFLP6 dentro del almacen', 'PFLP6', NULL, '01A0401B', 'ARDMP'),
('RG030', 62, 'Resguardo de PEF6P dentro del almacen', 'PEF6P', NULL, '01A0401C', 'ARDMP'),
('RG031', 62, 'Resguardo de BFLP6 dentro del almacen', 'BFLP6', NULL, '01A0402A', 'ARDMP'),
('RG032', 62, 'Resguardo de CZF6P dentro del almacen', 'CZF6P', NULL, '01A0402B', 'ARDMP'),
('RG033', 62, 'Resguardo de CFZ6F dentro del almacen', 'CAZ6F', NULL, '01A0402C', 'ARDMP'),
('RG034', 62, 'Resguardo de PSZ6F dentro del almacen', 'PSZ6F', NULL, '01A0403A', 'ARDMP'),
('RG035', 62, 'Resguardo de MRZ6F dentro del almacen', 'MAZ6F', NULL, '01A0403B', 'ARDMP'),
('RG036', 62, 'Resguardo de AIF6P dentro del almacen', 'AIF6P', NULL, '01A0403C', 'ARDMP'),
('RG037', 62, 'Resguardo de PBZ6F dentro del almacen', 'PBZ6F', NULL, '01A0404A', 'ARDMP'),
('RG038', 62, 'Resguardo de CCZ6P dentro del almacen', 'CCZ6P', NULL, '01A0404B', 'ARDMP'),
('RG039', 20, 'Resguaro de GS24P dentro del almacen', NULL, 'GS24P', '02A0101A', 'ARDPT'),
('RG040', 16, 'Resguaro de GS24U dentro del almacen', NULL, 'GS24U', '02A0101B', 'ARDPT'),
('RG041', 12, 'Resguaro de GZFO6 dentro del almacen', NULL, 'GZFO6', '02A0101C', 'ARDPT'),
('RG042', 18, 'Resguaro de GZFL6 dentro del almacen', NULL, 'GZFL6', '02A0102A', 'ARDPT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROL`
--

CREATE TABLE `ROL` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ROL`
--

INSERT INTO `ROL` (`codigo`, `descripcion`) VALUES
('ADMIN', 'Creacion de usuarios y configuracion del sistema'),
('ANAIN', 'Actualizar y gestionar inventarios'),
('GRDMP', 'Realizar compras y requisiciones de materia prima'),
('RECEP', 'Registra, recepciona y verifica inventario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `SOLICITUD_COMPRA`
--

CREATE TABLE `SOLICITUD_COMPRA` (
  `num` int NOT NULL,
  `fecha` datetime NOT NULL,
  `canTotalPorMateria` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `IVA` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `edoSolicitudCompra` varchar(5) DEFAULT NULL,
  `empleado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `SOLICITUD_COMPRA`
--

INSERT INTO `SOLICITUD_COMPRA` (`num`, `fecha`, `canTotalPorMateria`, `subtotal`, `IVA`, `total`, `edoSolicitudCompra`, `empleado`) VALUES
(1, '2024-11-04 13:00:00', 80, 1029600.00, 164736.00, 1194336.00, 'ENPRO', 15),
(2, '2024-11-04 14:15:22', 80, 2700000.00, 432000.00, 3132000.00, 'ACEPT', 15),
(3, '2024-11-04 15:02:40', 80, 3020800.00, 483328.00, 3504128.00, 'ACEPT', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIPO_MOVIMIENTO`
--

CREATE TABLE `TIPO_MOVIMIENTO` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `TIPO_MOVIMIENTO`
--

INSERT INTO `TIPO_MOVIMIENTO` (`codigo`, `descripcion`) VALUES
('AJUST', 'Ajuste'),
('ENTRA', 'Entrada'),
('SALID', 'Salida'),
('TRANS', 'Translado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UBICACION`
--

CREATE TABLE `UBICACION` (
  `codigo` varchar(8) NOT NULL,
  `nombreContenedor` varchar(12) NOT NULL,
  `pasillo` varchar(2) NOT NULL,
  `lado` varchar(2) NOT NULL,
  `bahia` varchar(2) NOT NULL,
  `nivel` varchar(2) NOT NULL,
  `posicion` varchar(2) NOT NULL,
  `capacidad` int NOT NULL,
  `largo` decimal(10,2) NOT NULL,
  `alto` decimal(10,2) NOT NULL,
  `ancho` decimal(10,2) NOT NULL,
  `volumen` decimal(10,2) NOT NULL,
  `area` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `UBICACION`
--

INSERT INTO `UBICACION` (`codigo`, `nombreContenedor`, `pasillo`, `lado`, `bahia`, `nivel`, `posicion`, `capacidad`, `largo`, `alto`, `ancho`, `volumen`, `area`) VALUES
('01A0101A', 'Bin', '01', 'A', '01', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0101B', 'Bin', '01', 'A', '01', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0101C', 'Bin', '01', 'A', '01', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0102A', 'Bin', '01', 'A', '01', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0102B', 'Bin', '01', 'A', '01', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0102C', 'Bin', '01', 'A', '01', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0103A', 'Bin', '01', 'A', '01', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0103B', 'Bin', '01', 'A', '01', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0103C', 'Bin', '01', 'A', '01', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0104A', 'Bin', '01', 'A', '01', '04', 'A', 2064, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0104B', 'Bin', '01', 'A', '01', '04', 'B', 3687, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0104C', 'Bin', '01', 'A', '01', '04', 'C', 9635, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0201A', 'Bin', '01', 'A', '02', '01', 'A', 16424, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0201B', 'Bin', '01', 'A', '02', '01', 'B', 60222, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0201C', 'Bin', '01', 'A', '02', '01', 'C', 6882, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0202A', 'Bin', '01', 'A', '02', '02', 'A', 11470, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0202B', 'Bin', '01', 'A', '02', '02', 'B', 277, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0202C', 'Bin', '01', 'A', '02', '02', 'C', 657, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0203A', 'Bin', '01', 'A', '02', '03', 'A', 1642, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0203B', 'Bin', '01', 'A', '02', '03', 'B', 3226, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0203C', 'Bin', '01', 'A', '02', '03', 'C', 5275, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0204A', 'Bin', '01', 'A', '02', '04', 'A', 12459, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0204B', 'Bin', '01', 'A', '02', '04', 'B', 30111, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0204C', 'Bin', '01', 'A', '02', '04', 'C', 5161, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0301A', 'Bin', '01', 'A', '03', '01', 'A', 9899, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0301B', 'Bin', '01', 'A', '03', '01', 'B', 215, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0301C', 'Bin', '01', 'A', '03', '01', 'C', 555, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0302A', 'Bin', '01', 'A', '03', '02', 'A', 1313, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0302B', 'Bin', '01', 'A', '03', '02', 'B', 2890, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0302C', 'Bin', '01', 'A', '03', '02', 'C', 3226, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0303A', 'Bin', '01', 'A', '03', '03', 'A', 9635, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0303B', 'Bin', '01', 'A', '03', '03', 'B', 20647, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0303C', 'Bin', '01', 'A', '03', '03', 'C', 60222, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0304A', 'Bin', '01', 'A', '03', '04', 'A', 5161, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0304B', 'Bin', '01', 'A', '03', '04', 'B', 9899, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0304C', 'Bin', '01', 'A', '03', '04', 'C', 215, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0401A', 'Bin', '01', 'A', '04', '01', 'A', 36, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0401B', 'Bin', '01', 'A', '04', '01', 'B', 2064, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0401C', 'Bin', '01', 'A', '04', '01', 'C', 9033, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0402A', 'Bin', '01', 'A', '04', '02', 'A', 4301, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0402B', 'Bin', '01', 'A', '04', '02', 'B', 9635, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0402C', 'Bin', '01', 'A', '04', '02', 'C', 20647, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0403A', 'Bin', '01', 'A', '04', '03', 'A', 60222, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0403B', 'Bin', '01', 'A', '04', '03', 'B', 6882, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0403C', 'Bin', '01', 'A', '04', '03', 'C', 12248, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0404A', 'Bin', '01', 'A', '04', '04', 'A', 344, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0404B', 'Bin', '01', 'A', '04', '04', 'B', 71, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01A0404C', 'Bin', '01', 'A', '04', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0101A', 'Bin', '01', 'B', '01', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0101B', 'Bin', '01', 'B', '01', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0101C', 'Bin', '01', 'B', '01', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0102A', 'Bin', '01', 'B', '01', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0102B', 'Bin', '01', 'B', '01', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0102C', 'Bin', '01', 'B', '01', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0103A', 'Bin', '01', 'B', '01', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0103B', 'Bin', '01', 'B', '01', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0103C', 'Bin', '01', 'B', '01', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0104A', 'Bin', '01', 'B', '01', '04', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0104B', 'Bin', '01', 'B', '01', '04', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0104C', 'Bin', '01', 'B', '01', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0201A', 'Bin', '01', 'B', '02', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0201B', 'Bin', '01', 'B', '02', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0201C', 'Bin', '01', 'B', '02', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0202A', 'Bin', '01', 'B', '02', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0202B', 'Bin', '01', 'B', '02', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0202C', 'Bin', '01', 'B', '02', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0203A', 'Bin', '01', 'B', '02', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0203B', 'Bin', '01', 'B', '02', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0203C', 'Bin', '01', 'B', '02', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0204A', 'Bin', '01', 'B', '02', '04', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0204B', 'Bin', '01', 'B', '02', '04', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0204C', 'Bin', '01', 'B', '02', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0301A', 'Bin', '01', 'B', '03', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0301B', 'Bin', '01', 'B', '03', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0301C', 'Bin', '01', 'B', '03', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0302A', 'Bin', '01', 'B', '03', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0302B', 'Bin', '01', 'B', '03', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0302C', 'Bin', '01', 'B', '03', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0303A', 'Bin', '01', 'B', '03', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0303B', 'Bin', '01', 'B', '03', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0303C', 'Bin', '01', 'B', '03', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0304A', 'Bin', '01', 'B', '03', '04', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0304B', 'Bin', '01', 'B', '03', '04', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0304C', 'Bin', '01', 'B', '03', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0401A', 'Bin', '01', 'B', '04', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0401B', 'Bin', '01', 'B', '04', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0401C', 'Bin', '01', 'B', '04', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0402A', 'Bin', '01', 'B', '04', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0402B', 'Bin', '01', 'B', '04', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0402C', 'Bin', '01', 'B', '04', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0403A', 'Bin', '01', 'B', '04', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0403B', 'Bin', '01', 'B', '04', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0403C', 'Bin', '01', 'B', '04', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0404A', 'Bin', '01', 'B', '04', '04', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0404B', 'Bin', '01', 'B', '04', '04', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('01B0404C', 'Bin', '01', 'B', '04', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'ARDMP'),
('02A0101A', 'Bin', '02', 'A', '01', '01', 'A', 71, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0101B', 'Bin', '02', 'A', '01', '01', 'B', 62, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0101C', 'Bin', '02', 'A', '01', '01', 'C', 42, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0102A', 'Bin', '02', 'A', '01', '02', 'A', 118, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0102B', 'Bin', '02', 'A', '01', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0102C', 'Bin', '02', 'A', '01', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0103A', 'Bin', '02', 'A', '01', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0103B', 'Bin', '02', 'A', '01', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0103C', 'Bin', '02', 'A', '01', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0104A', 'Bin', '02', 'A', '01', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0104B', 'Bin', '02', 'A', '01', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0104C', 'Bin', '02', 'A', '01', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0201A', 'Bin', '02', 'A', '02', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0201B', 'Bin', '02', 'A', '02', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0201C', 'Bin', '02', 'A', '02', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0202A', 'Bin', '02', 'A', '02', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0202B', 'Bin', '02', 'A', '02', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0202C', 'Bin', '02', 'A', '02', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0203A', 'Bin', '02', 'A', '02', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0203B', 'Bin', '02', 'A', '02', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0203C', 'Bin', '02', 'A', '02', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0204A', 'Bin', '02', 'A', '02', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0204B', 'Bin', '02', 'A', '02', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0204C', 'Bin', '02', 'A', '02', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0301A', 'Bin', '02', 'A', '03', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0301B', 'Bin', '02', 'A', '03', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0301C', 'Bin', '02', 'A', '03', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0302A', 'Bin', '02', 'A', '03', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0302B', 'Bin', '02', 'A', '03', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0302C', 'Bin', '02', 'A', '03', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0303A', 'Bin', '02', 'A', '03', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0303B', 'Bin', '02', 'A', '03', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0303C', 'Bin', '02', 'A', '03', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0304A', 'Bin', '02', 'A', '03', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0304B', 'Bin', '02', 'A', '03', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0304C', 'Bin', '02', 'A', '03', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0401A', 'Bin', '02', 'A', '04', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0401B', 'Bin', '02', 'A', '04', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0401C', 'Bin', '02', 'A', '04', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0402A', 'Bin', '02', 'A', '04', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0402B', 'Bin', '02', 'A', '04', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0402C', 'Bin', '02', 'A', '04', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0403A', 'Bin', '02', 'A', '04', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0403B', 'Bin', '02', 'A', '04', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0403C', 'Bin', '02', 'A', '04', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0404A', 'Bin', '02', 'A', '04', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0404B', 'Bin', '02', 'A', '04', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02A0404C', 'Bin', '02', 'A', '04', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0101A', 'Bin', '02', 'B', '01', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0101B', 'Bin', '02', 'B', '01', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0101C', 'Bin', '02', 'B', '01', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0102A', 'Bin', '02', 'B', '01', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0102B', 'Bin', '02', 'B', '01', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0102C', 'Bin', '02', 'B', '01', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0103A', 'Bin', '02', 'B', '01', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0103B', 'Bin', '02', 'B', '01', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0103C', 'Bin', '02', 'B', '01', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0104A', 'Bin', '02', 'B', '01', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0104B', 'Bin', '02', 'B', '01', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0104C', 'Bin', '02', 'B', '01', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0201A', 'Bin', '02', 'B', '02', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0201B', 'Bin', '02', 'B', '02', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0201C', 'Bin', '02', 'B', '02', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0202A', 'Bin', '02', 'B', '02', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0202B', 'Bin', '02', 'B', '02', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0202C', 'Bin', '02', 'B', '02', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0203A', 'Bin', '02', 'B', '02', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0203B', 'Bin', '02', 'B', '02', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0203C', 'Bin', '02', 'B', '02', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0204A', 'Bin', '02', 'B', '02', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0204B', 'Bin', '02', 'B', '02', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0204C', 'Bin', '02', 'B', '02', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0301A', 'Bin', '02', 'B', '03', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0301B', 'Bin', '02', 'B', '03', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0301C', 'Bin', '02', 'B', '03', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0302A', 'Bin', '02', 'B', '03', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0302B', 'Bin', '02', 'B', '03', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0302C', 'Bin', '02', 'B', '03', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0303A', 'Bin', '02', 'B', '03', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0303B', 'Bin', '02', 'B', '03', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0303C', 'Bin', '02', 'B', '03', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0304A', 'Bin', '02', 'B', '03', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0304B', 'Bin', '02', 'B', '03', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0304C', 'Bin', '02', 'B', '03', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0401A', 'Bin', '02', 'B', '04', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0401B', 'Bin', '02', 'B', '04', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0401C', 'Bin', '02', 'B', '04', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0402A', 'Bin', '02', 'B', '04', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0402B', 'Bin', '02', 'B', '04', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0402C', 'Bin', '02', 'B', '04', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0403A', 'Bin', '02', 'B', '04', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0403B', 'Bin', '02', 'B', '04', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0403C', 'Bin', '02', 'B', '04', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0404A', 'Bin', '02', 'B', '04', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0404B', 'Bin', '02', 'B', '04', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT'),
('02B0404C', 'Bin', '02', 'B', '04', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'ARDPT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `num` int NOT NULL,
  `alias` varchar(12) NOT NULL,
  `contraseña` varchar(16) NOT NULL,
  `empleado` int DEFAULT NULL,
  `rol` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`num`, `alias`, `contraseña`, `empleado`, `rol`) VALUES
(1, 'Gbarrios', 'HT_Gbarrios', 1, 'ADMIN'),
(2, 'Bgonzalez', 'HT_Bgonzalez', 2, 'ADMIN'),
(3, 'Acuevas', 'HT_Acuevas', 3, 'ADMIN'),
(4, 'Ysalazar ', 'HT_Ysalazar ', 4, 'ADMIN'),
(5, 'Aperez', 'HT_Aperez', 5, 'ANAIN'),
(6, 'Ogonzalez', 'HT_Ogonzalez', 6, 'ANAIN'),
(7, 'Agonzalez', 'HT_Agonzalez', 7, 'ANAIN'),
(8, 'Hgonzalez', 'HT_Hgonzalez', 8, 'ANAIN'),
(9, 'Eruiz', 'HT_Eruiz', 9, 'ANAIN'),
(10, 'Cmartinez', 'HT_Cmartinez', 10, 'RECEP'),
(11, 'Esalazar ', 'HT_Esalazar ', 11, 'RECEP'),
(12, 'Csoto', 'HT_Csoto', 12, 'RECEP'),
(13, 'Kgarfias', 'HT_Kgarfias', 13, 'RECEP'),
(14, 'Csoto', 'HT_Csoto', 14, 'RECEP'),
(15, 'Gherrera', 'HT_Gherrera', 15, 'GRDMP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VERIFICACION`
--

CREATE TABLE `VERIFICACION` (
  `num` int NOT NULL,
  `cantRecibida` int NOT NULL,
  `cantDefectuosa` int NOT NULL,
  `cantAceptada` int NOT NULL,
  `observaciones` varchar(128) DEFAULT NULL,
  `edoVerificacion` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `VERIFICACION`
--

INSERT INTO `VERIFICACION` (`num`, `cantRecibida`, `cantDefectuosa`, `cantAceptada`, `observaciones`, `edoVerificacion`) VALUES
(1, 80, 0, 0, 'Pendiente por validar', 'ENPRO'),
(2, 80, 0, 80, 'Validacion con exito sin ninguna perdida', 'TERMI'),
(3, 80, 0, 80, 'Validacion con exito sin ninguna perdida', 'TERMI'),
(4, 80, 0, 80, 'Validacion con exito sin ninguna perdida', 'TERMI'),
(5, 80, 0, 80, 'Validacion con exito sin ninguna perdida', 'TERMI');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `AREA`
--
ALTER TABLE `AREA`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `COMPRA_MATERIA_PRIMA`
--
ALTER TABLE `COMPRA_MATERIA_PRIMA`
  ADD PRIMARY KEY (`materiaPrima`,`solicitudCompra`),
  ADD KEY `solicitudCompra` (`solicitudCompra`);

--
-- Indices de la tabla `EDO_LOTE`
--
ALTER TABLE `EDO_LOTE`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `EDO_PUESTO`
--
ALTER TABLE `EDO_PUESTO`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `EDO_REQUISICION`
--
ALTER TABLE `EDO_REQUISICION`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `EDO_SOLICITUD_COMPRA`
--
ALTER TABLE `EDO_SOLICITUD_COMPRA`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `EDO_VERIFICACION`
--
ALTER TABLE `EDO_VERIFICACION`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  ADD PRIMARY KEY (`num`),
  ADD KEY `puesto` (`puesto`),
  ADD KEY `edoEmpleado` (`edoEmpleado`);

--
-- Indices de la tabla `LINEA_DE_PROD`
--
ALTER TABLE `LINEA_DE_PROD`
  ADD PRIMARY KEY (`num`);

--
-- Indices de la tabla `LINEA_PROD_PROD_TERMINADO`
--
ALTER TABLE `LINEA_PROD_PROD_TERMINADO`
  ADD PRIMARY KEY (`num`,`lineaProd`,`prodTerminado`),
  ADD KEY `lineaProd` (`lineaProd`),
  ADD KEY `prodTerminado` (`prodTerminado`);

--
-- Indices de la tabla `LOTE`
--
ALTER TABLE `LOTE`
  ADD PRIMARY KEY (`num`),
  ADD KEY `edoLote` (`edoLote`);

--
-- Indices de la tabla `LOTE_VERIFICACION`
--
ALTER TABLE `LOTE_VERIFICACION`
  ADD PRIMARY KEY (`num`,`verificacion`,`lote`),
  ADD KEY `verificacion` (`verificacion`),
  ADD KEY `lote` (`lote`);

--
-- Indices de la tabla `MATERIA_PRIMA`
--
ALTER TABLE `MATERIA_PRIMA`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `MATERIA_PRIMA_LOTE`
--
ALTER TABLE `MATERIA_PRIMA_LOTE`
  ADD PRIMARY KEY (`num`,`materiaPrima`,`lote`),
  ADD KEY `materiaPrima` (`materiaPrima`),
  ADD KEY `lote` (`lote`);

--
-- Indices de la tabla `MATERIA_PRIMA_PROD_TERMINADO`
--
ALTER TABLE `MATERIA_PRIMA_PROD_TERMINADO`
  ADD PRIMARY KEY (`num`,`materiaPrima`,`prodTerminado`),
  ADD KEY `materiaPrima` (`materiaPrima`),
  ADD KEY `prodTerminado` (`prodTerminado`);

--
-- Indices de la tabla `MOVIMIENTO`
--
ALTER TABLE `MOVIMIENTO`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `tipoMovimiento` (`tipoMovimiento`);

--
-- Indices de la tabla `MOVIMIENTO_MATERIA_PRIMA`
--
ALTER TABLE `MOVIMIENTO_MATERIA_PRIMA`
  ADD PRIMARY KEY (`num`,`movimiento`,`materiaPrima`),
  ADD KEY `movimiento` (`movimiento`),
  ADD KEY `materiaPrima` (`materiaPrima`);

--
-- Indices de la tabla `MOVIMIENTO_PROD_TERMINADO`
--
ALTER TABLE `MOVIMIENTO_PROD_TERMINADO`
  ADD PRIMARY KEY (`num`,`movimiento`,`prodTerminado`),
  ADD KEY `movimiento` (`movimiento`),
  ADD KEY `prodTerminado` (`prodTerminado`);

--
-- Indices de la tabla `PROD_TERMINADO`
--
ALTER TABLE `PROD_TERMINADO`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `PUESTO`
--
ALTER TABLE `PUESTO`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `REQUISICION`
--
ALTER TABLE `REQUISICION`
  ADD PRIMARY KEY (`num`),
  ADD KEY `empleado` (`empleado`),
  ADD KEY `lineaProd` (`lineaProd`),
  ADD KEY `edoRequisicion` (`edoRequisicion`);

--
-- Indices de la tabla `REQUISICION_MATERIA_PRIMA`
--
ALTER TABLE `REQUISICION_MATERIA_PRIMA`
  ADD PRIMARY KEY (`num`,`requisicion`,`materiaPrima`),
  ADD KEY `requisicion` (`requisicion`),
  ADD KEY `materiaPrima` (`materiaPrima`);

--
-- Indices de la tabla `RESGUARDO`
--
ALTER TABLE `RESGUARDO`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `materiaPrima` (`materiaPrima`),
  ADD KEY `prodTerminado` (`prodTerminado`),
  ADD KEY `ubicacion` (`ubicacion`),
  ADD KEY `area` (`area`);

--
-- Indices de la tabla `ROL`
--
ALTER TABLE `ROL`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `SOLICITUD_COMPRA`
--
ALTER TABLE `SOLICITUD_COMPRA`
  ADD PRIMARY KEY (`num`),
  ADD KEY `edoSolicitudCompra` (`edoSolicitudCompra`),
  ADD KEY `empleado` (`empleado`);

--
-- Indices de la tabla `TIPO_MOVIMIENTO`
--
ALTER TABLE `TIPO_MOVIMIENTO`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `UBICACION`
--
ALTER TABLE `UBICACION`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `area` (`area`);

--
-- Indices de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD PRIMARY KEY (`num`),
  ADD KEY `empleado` (`empleado`),
  ADD KEY `rol` (`rol`);

--
-- Indices de la tabla `VERIFICACION`
--
ALTER TABLE `VERIFICACION`
  ADD PRIMARY KEY (`num`),
  ADD KEY `edoVerificacion` (`edoVerificacion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `LINEA_DE_PROD`
--
ALTER TABLE `LINEA_DE_PROD`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `LINEA_PROD_PROD_TERMINADO`
--
ALTER TABLE `LINEA_PROD_PROD_TERMINADO`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `LOTE`
--
ALTER TABLE `LOTE`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `LOTE_VERIFICACION`
--
ALTER TABLE `LOTE_VERIFICACION`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `MATERIA_PRIMA_LOTE`
--
ALTER TABLE `MATERIA_PRIMA_LOTE`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `MATERIA_PRIMA_PROD_TERMINADO`
--
ALTER TABLE `MATERIA_PRIMA_PROD_TERMINADO`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `MOVIMIENTO_MATERIA_PRIMA`
--
ALTER TABLE `MOVIMIENTO_MATERIA_PRIMA`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de la tabla `MOVIMIENTO_PROD_TERMINADO`
--
ALTER TABLE `MOVIMIENTO_PROD_TERMINADO`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `REQUISICION`
--
ALTER TABLE `REQUISICION`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `REQUISICION_MATERIA_PRIMA`
--
ALTER TABLE `REQUISICION_MATERIA_PRIMA`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `SOLICITUD_COMPRA`
--
ALTER TABLE `SOLICITUD_COMPRA`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `VERIFICACION`
--
ALTER TABLE `VERIFICACION`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `COMPRA_MATERIA_PRIMA`
--
ALTER TABLE `COMPRA_MATERIA_PRIMA`
  ADD CONSTRAINT `COMPRA_MATERIA_PRIMA_ibfk_1` FOREIGN KEY (`materiaPrima`) REFERENCES `MATERIA_PRIMA` (`codigo`),
  ADD CONSTRAINT `COMPRA_MATERIA_PRIMA_ibfk_2` FOREIGN KEY (`solicitudCompra`) REFERENCES `SOLICITUD_COMPRA` (`num`);

--
-- Filtros para la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  ADD CONSTRAINT `EMPLEADO_ibfk_1` FOREIGN KEY (`puesto`) REFERENCES `PUESTO` (`codigo`),
  ADD CONSTRAINT `EMPLEADO_ibfk_2` FOREIGN KEY (`edoEmpleado`) REFERENCES `EDO_PUESTO` (`codigo`);

--
-- Filtros para la tabla `LINEA_PROD_PROD_TERMINADO`
--
ALTER TABLE `LINEA_PROD_PROD_TERMINADO`
  ADD CONSTRAINT `LINEA_PROD_PROD_TERMINADO_ibfk_1` FOREIGN KEY (`lineaProd`) REFERENCES `LINEA_DE_PROD` (`num`),
  ADD CONSTRAINT `LINEA_PROD_PROD_TERMINADO_ibfk_2` FOREIGN KEY (`prodTerminado`) REFERENCES `PROD_TERMINADO` (`codigo`);

--
-- Filtros para la tabla `LOTE`
--
ALTER TABLE `LOTE`
  ADD CONSTRAINT `LOTE_ibfk_1` FOREIGN KEY (`edoLote`) REFERENCES `EDO_LOTE` (`codigo`);

--
-- Filtros para la tabla `LOTE_VERIFICACION`
--
ALTER TABLE `LOTE_VERIFICACION`
  ADD CONSTRAINT `LOTE_VERIFICACION_ibfk_1` FOREIGN KEY (`verificacion`) REFERENCES `VERIFICACION` (`num`),
  ADD CONSTRAINT `LOTE_VERIFICACION_ibfk_2` FOREIGN KEY (`lote`) REFERENCES `LOTE` (`num`);

--
-- Filtros para la tabla `MATERIA_PRIMA_LOTE`
--
ALTER TABLE `MATERIA_PRIMA_LOTE`
  ADD CONSTRAINT `MATERIA_PRIMA_LOTE_ibfk_1` FOREIGN KEY (`materiaPrima`) REFERENCES `MATERIA_PRIMA` (`codigo`),
  ADD CONSTRAINT `MATERIA_PRIMA_LOTE_ibfk_2` FOREIGN KEY (`lote`) REFERENCES `LOTE` (`num`);

--
-- Filtros para la tabla `MATERIA_PRIMA_PROD_TERMINADO`
--
ALTER TABLE `MATERIA_PRIMA_PROD_TERMINADO`
  ADD CONSTRAINT `MATERIA_PRIMA_PROD_TERMINADO_ibfk_1` FOREIGN KEY (`materiaPrima`) REFERENCES `MATERIA_PRIMA` (`codigo`),
  ADD CONSTRAINT `MATERIA_PRIMA_PROD_TERMINADO_ibfk_2` FOREIGN KEY (`prodTerminado`) REFERENCES `PROD_TERMINADO` (`codigo`);

--
-- Filtros para la tabla `MOVIMIENTO`
--
ALTER TABLE `MOVIMIENTO`
  ADD CONSTRAINT `MOVIMIENTO_ibfk_1` FOREIGN KEY (`tipoMovimiento`) REFERENCES `TIPO_MOVIMIENTO` (`codigo`);

--
-- Filtros para la tabla `MOVIMIENTO_MATERIA_PRIMA`
--
ALTER TABLE `MOVIMIENTO_MATERIA_PRIMA`
  ADD CONSTRAINT `MOVIMIENTO_MATERIA_PRIMA_ibfk_1` FOREIGN KEY (`movimiento`) REFERENCES `MOVIMIENTO` (`codigo`),
  ADD CONSTRAINT `MOVIMIENTO_MATERIA_PRIMA_ibfk_2` FOREIGN KEY (`materiaPrima`) REFERENCES `MATERIA_PRIMA` (`codigo`);

--
-- Filtros para la tabla `MOVIMIENTO_PROD_TERMINADO`
--
ALTER TABLE `MOVIMIENTO_PROD_TERMINADO`
  ADD CONSTRAINT `MOVIMIENTO_PROD_TERMINADO_ibfk_1` FOREIGN KEY (`movimiento`) REFERENCES `MOVIMIENTO` (`codigo`),
  ADD CONSTRAINT `MOVIMIENTO_PROD_TERMINADO_ibfk_2` FOREIGN KEY (`prodTerminado`) REFERENCES `PROD_TERMINADO` (`codigo`);

--
-- Filtros para la tabla `REQUISICION`
--
ALTER TABLE `REQUISICION`
  ADD CONSTRAINT `REQUISICION_ibfk_1` FOREIGN KEY (`empleado`) REFERENCES `EMPLEADO` (`num`),
  ADD CONSTRAINT `REQUISICION_ibfk_2` FOREIGN KEY (`lineaProd`) REFERENCES `LINEA_DE_PROD` (`num`),
  ADD CONSTRAINT `REQUISICION_ibfk_3` FOREIGN KEY (`edoRequisicion`) REFERENCES `EDO_REQUISICION` (`codigo`);

--
-- Filtros para la tabla `REQUISICION_MATERIA_PRIMA`
--
ALTER TABLE `REQUISICION_MATERIA_PRIMA`
  ADD CONSTRAINT `REQUISICION_MATERIA_PRIMA_ibfk_1` FOREIGN KEY (`requisicion`) REFERENCES `REQUISICION` (`num`),
  ADD CONSTRAINT `REQUISICION_MATERIA_PRIMA_ibfk_2` FOREIGN KEY (`materiaPrima`) REFERENCES `MATERIA_PRIMA` (`codigo`);

--
-- Filtros para la tabla `RESGUARDO`
--
ALTER TABLE `RESGUARDO`
  ADD CONSTRAINT `RESGUARDO_ibfk_1` FOREIGN KEY (`materiaPrima`) REFERENCES `MATERIA_PRIMA` (`codigo`),
  ADD CONSTRAINT `RESGUARDO_ibfk_2` FOREIGN KEY (`prodTerminado`) REFERENCES `PROD_TERMINADO` (`codigo`),
  ADD CONSTRAINT `RESGUARDO_ibfk_3` FOREIGN KEY (`ubicacion`) REFERENCES `UBICACION` (`codigo`),
  ADD CONSTRAINT `RESGUARDO_ibfk_4` FOREIGN KEY (`area`) REFERENCES `AREA` (`codigo`);

--
-- Filtros para la tabla `SOLICITUD_COMPRA`
--
ALTER TABLE `SOLICITUD_COMPRA`
  ADD CONSTRAINT `SOLICITUD_COMPRA_ibfk_1` FOREIGN KEY (`edoSolicitudCompra`) REFERENCES `EDO_SOLICITUD_COMPRA` (`codigo`),
  ADD CONSTRAINT `SOLICITUD_COMPRA_ibfk_2` FOREIGN KEY (`empleado`) REFERENCES `EMPLEADO` (`num`);

--
-- Filtros para la tabla `UBICACION`
--
ALTER TABLE `UBICACION`
  ADD CONSTRAINT `UBICACION_ibfk_1` FOREIGN KEY (`area`) REFERENCES `AREA` (`codigo`);

--
-- Filtros para la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  ADD CONSTRAINT `USUARIO_ibfk_1` FOREIGN KEY (`empleado`) REFERENCES `EMPLEADO` (`num`),
  ADD CONSTRAINT `USUARIO_ibfk_2` FOREIGN KEY (`rol`) REFERENCES `ROL` (`codigo`);

--
-- Filtros para la tabla `VERIFICACION`
--
ALTER TABLE `VERIFICACION`
  ADD CONSTRAINT `VERIFICACION_ibfk_1` FOREIGN KEY (`edoVerificacion`) REFERENCES `EDO_VERIFICACION` (`codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
