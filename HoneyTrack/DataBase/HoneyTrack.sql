-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-10-2024 a las 16:49:52
-- Versión del servidor: 8.0.39-0ubuntu0.24.04.2
-- Versión de PHP: 8.3.12

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
  `descripcion` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `AREA`
--

INSERT INTO `AREA` (`codigo`, `descripcion`) VALUES
('MP', 'Materia Prima'),
('PT', 'Producto Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `COMPRA_MATERIA`
--

CREATE TABLE `COMPRA_MATERIA` (
  `cantidad` int NOT NULL,
  `importe` decimal(10,2) NOT NULL,
  `compra` int NOT NULL,
  `materia_prima` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `COMPRA_MATERIA`
--

INSERT INTO `COMPRA_MATERIA` (`cantidad`, `importe`, `compra`, `materia_prima`) VALUES
(50, 750.00, 1, 'PANTLA'),
(30, 600.00, 2, 'BATERIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_LOTE`
--

CREATE TABLE `EDO_LOTE` (
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EDO_LOTE`
--

INSERT INTO `EDO_LOTE` (`codigo`, `descripcion`) VALUES
('ACT', 'Activo'),
('BJA', 'Baja'),
('INA', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_PUESTO`
--

CREATE TABLE `EDO_PUESTO` (
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EDO_PUESTO`
--

INSERT INTO `EDO_PUESTO` (`codigo`, `descripcion`) VALUES
('ACT', 'Activo'),
('BTP', 'Baja Temporal'),
('INA', 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_REQUISICION`
--

CREATE TABLE `EDO_REQUISICION` (
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EDO_REQUISICION`
--

INSERT INTO `EDO_REQUISICION` (`codigo`, `descripcion`) VALUES
('APR', 'Aprobada'),
('CLO', 'Cerrada'),
('PEN', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_SOLICITUD_COMPRA`
--

CREATE TABLE `EDO_SOLICITUD_COMPRA` (
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EDO_SOLICITUD_COMPRA`
--

INSERT INTO `EDO_SOLICITUD_COMPRA` (`codigo`, `descripcion`) VALUES
('APR', 'Aprobada'),
('CLO', 'Cerrada'),
('PEN', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EDO_VERIFICACION`
--

CREATE TABLE `EDO_VERIFICACION` (
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EDO_VERIFICACION`
--

INSERT INTO `EDO_VERIFICACION` (`codigo`, `descripcion`) VALUES
('PRG', 'En Progreso'),
('TRM', 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLEADO`
--

CREATE TABLE `EMPLEADO` (
  `num` int NOT NULL,
  `nombrePila` varchar(12) NOT NULL,
  `primApell` varchar(24) NOT NULL,
  `segApell` varchar(24) DEFAULT NULL,
  `numCont` varchar(10) NOT NULL,
  `correoElectronico` varchar(32) NOT NULL,
  `rfc` varchar(13) NOT NULL,
  `puesto` varchar(5) DEFAULT NULL,
  `edo_puesto` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EMPLEADO`
--

INSERT INTO `EMPLEADO` (`num`, `nombrePila`, `primApell`, `segApell`, `numCont`, `correoElectronico`, `rfc`, `puesto`, `edo_puesto`) VALUES
(1, 'Juan', 'Pérez', 'García', '1234567890', 'juan@example.com', 'PEGA900101', 'ADMIN', 'ACT'),
(2, 'Ana', 'López', 'Martínez', '0987654321', 'ana@example.com', 'LOMA880202', 'ANAL', 'INA'),
(3, 'Luis', 'Gómez', 'Fernández', '1122334455', 'luis@example.com', 'GOFL960303', 'RECEP', 'BTP'),
(4, 'Carlos', 'Martín', 'Santos', '2233445566', 'carlos@example.com', 'MARS910404', 'ADMIN', 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LINEA_DE_PROD`
--

CREATE TABLE `LINEA_DE_PROD` (
  `num` int NOT NULL,
  `nombre` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LINEA_DE_PROD`
--

INSERT INTO `LINEA_DE_PROD` (`num`, `nombre`) VALUES
(1, 'Ensamble'),
(2, 'Pruebas'),
(3, 'Embalaje');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LINEA_PROD`
--

CREATE TABLE `LINEA_PROD` (
  `num` int NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL,
  `linea_prod` int NOT NULL,
  `prod_terminado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LINEA_PROD`
--

INSERT INTO `LINEA_PROD` (`num`, `fecha`, `cantidad`, `linea_prod`, `prod_terminado`) VALUES
(1, '2024-10-19 19:10:01', 10, 1, 'GALAXYS'),
(2, '2024-10-19 19:10:01', 5, 2, 'GALAXYS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOTE`
--

CREATE TABLE `LOTE` (
  `num` int NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `porcentaje` float DEFAULT NULL,
  `edo_lote` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LOTE`
--

INSERT INTO `LOTE` (`num`, `descripcion`, `porcentaje`, `edo_lote`) VALUES
(1, 'Lote de Pantallas', NULL, 'ACT'),
(2, 'Lote de Baterías', NULL, 'ACT');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOTE_SOLICITUD`
--

CREATE TABLE `LOTE_SOLICITUD` (
  `num` int NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `cantidad` int NOT NULL,
  `lote` int NOT NULL,
  `solicitud_compra` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LOTE_SOLICITUD`
--

INSERT INTO `LOTE_SOLICITUD` (`num`, `fecha`, `cantidad`, `lote`, `solicitud_compra`) VALUES
(1, '2024-10-19 19:17:55', 10, 1, 1),
(2, '2024-10-19 19:17:59', 5, 2, 2),
(3, NULL, 10, 1, 1),
(4, NULL, 5, 2, 2),
(5, NULL, 10, 1, 1),
(6, NULL, 5, 2, 2),
(7, NULL, 10, 1, 1),
(8, NULL, 5, 2, 2),
(9, NULL, 10, 1, 1),
(10, NULL, 5, 2, 2),
(11, NULL, 10, 1, 1),
(12, NULL, 5, 2, 2),
(13, NULL, 10, 1, 1),
(14, NULL, 5, 2, 2),
(15, NULL, 10, 1, 1),
(16, NULL, 5, 2, 2),
(17, NULL, 10, 1, 1),
(18, NULL, 5, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATERIA_LOTE`
--

CREATE TABLE `MATERIA_LOTE` (
  `num` int NOT NULL,
  `cantidad` int NOT NULL,
  `materia_prima` varchar(8) NOT NULL,
  `lote` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MATERIA_LOTE`
--

INSERT INTO `MATERIA_LOTE` (`num`, `cantidad`, `materia_prima`, `lote`) VALUES
(1, 10, 'PANTLA', 1),
(2, 5, 'BATERIA', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATERIA_PRIMA`
--

CREATE TABLE `MATERIA_PRIMA` (
  `codigo` varchar(8) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `costo` decimal(10,2) NOT NULL,
  `ancho` decimal(10,2) NOT NULL,
  `largo` decimal(10,2) NOT NULL,
  `alto` decimal(10,2) NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `volumen` decimal(10,2) NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MATERIA_PRIMA`
--

INSERT INTO `MATERIA_PRIMA` (`codigo`, `nombre`, `descripcion`, `costo`, `ancho`, `largo`, `alto`, `peso`, `volumen`, `stock`) VALUES
('BATERIA', 'Batería', 'Batería de polímero 4000mAh', 30.00, 0.10, 0.10, 0.01, 0.05, 0.00, 200),
('CAMARA', 'Cámara', 'Cámara principal 108MP', 80.00, 0.05, 0.05, 0.01, 0.02, 0.00, 120),
('CHIPSTT', 'Chipset', 'Exynos 2200', 50.00, 0.05, 0.05, 0.01, 0.01, 0.00, 150),
('PANTLA', 'Pantalla', 'Pantalla AMOLED 6.2\"', 150.00, 0.15, 0.12, 0.01, 0.20, 0.00, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MATERIA_PROD`
--

CREATE TABLE `MATERIA_PROD` (
  `num` int NOT NULL,
  `cantidad` int NOT NULL,
  `costoTotalPorMateria` decimal(10,2) DEFAULT NULL,
  `materia_prima` varchar(8) NOT NULL,
  `prod_terminado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MATERIA_PROD`
--

INSERT INTO `MATERIA_PROD` (`num`, `cantidad`, `costoTotalPorMateria`, `materia_prima`, `prod_terminado`) VALUES
(1, 5, 750.00, 'PANTLA', 'GALAXYS'),
(2, 3, 90.00, 'BATERIA', 'GALAXYS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVIMIENTO`
--

CREATE TABLE `MOVIMIENTO` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(16) NOT NULL,
  `cantidad` int NOT NULL,
  `tipo_movimiento` varchar(3) DEFAULT NULL,
  `verificacion` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MOVIMIENTO`
--

INSERT INTO `MOVIMIENTO` (`codigo`, `descripcion`, `cantidad`, `tipo_movimiento`, `verificacion`) VALUES
('MOV01', 'Ingreso materia', 50, 'ENT', 1),
('MOV02', 'Salida producto', 20, 'SAL', 2),
('MOV03', 'Transf stock', 30, 'TRA', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVIMIENTO_MATERIA`
--

CREATE TABLE `MOVIMIENTO_MATERIA` (
  `num` int NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL,
  `movimiento` varchar(5) NOT NULL,
  `materia_prima` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MOVIMIENTO_MATERIA`
--

INSERT INTO `MOVIMIENTO_MATERIA` (`num`, `fecha`, `cantidad`, `movimiento`, `materia_prima`) VALUES
(1, '2024-10-19 19:09:59', 20, 'MOV01', 'PANTLA'),
(2, '2024-10-19 19:09:59', 15, 'MOV02', 'BATERIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVIMIENTO_PROD`
--

CREATE TABLE `MOVIMIENTO_PROD` (
  `num` int NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL,
  `movimiento` varchar(5) NOT NULL,
  `prod_terminado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MOVIMIENTO_PROD`
--

INSERT INTO `MOVIMIENTO_PROD` (`num`, `fecha`, `cantidad`, `movimiento`, `prod_terminado`) VALUES
(1, '2024-10-19 19:10:00', 10, 'MOV01', 'GALAXYS'),
(2, '2024-10-19 19:10:00', 5, 'MOV02', 'GALAXYS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PROD_TERMINADO`
--

CREATE TABLE `PROD_TERMINADO` (
  `codigo` varchar(8) NOT NULL,
  `nombre` varchar(32) NOT NULL,
  `descripcion` varchar(256) NOT NULL,
  `costoNeto` decimal(10,2) NOT NULL,
  `ancho` decimal(10,2) NOT NULL,
  `largo` decimal(10,2) NOT NULL,
  `alto` decimal(10,2) NOT NULL,
  `peso` decimal(10,2) NOT NULL,
  `volumen` decimal(10,2) NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `PROD_TERMINADO`
--

INSERT INTO `PROD_TERMINADO` (`codigo`, `nombre`, `descripcion`, `costoNeto`, `ancho`, `largo`, `alto`, `peso`, `volumen`, `stock`) VALUES
('GALAXYS', 'Samsung Galaxy S24', 'Smartphone insignia de Samsung', 800.00, 0.15, 0.07, 0.01, 0.20, 0.00, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PUESTO`
--

CREATE TABLE `PUESTO` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `PUESTO`
--

INSERT INTO `PUESTO` (`codigo`, `descripcion`) VALUES
('ADMIN', 'Administrador'),
('ANAL', 'Analista'),
('RECEP', 'Recepcionista');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REQUISICION`
--

CREATE TABLE `REQUISICION` (
  `num` int NOT NULL,
  `descripcion` varchar(256) DEFAULT NULL,
  `empleado` int DEFAULT NULL,
  `edo_requisicion` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `REQUISICION`
--

INSERT INTO `REQUISICION` (`num`, `descripcion`, `empleado`, `edo_requisicion`) VALUES
(1, 'Requisición de materia prima para el ensamblaje', 1, 'PEN'),
(2, 'Requisición de materia prima para pruebas', 2, 'APR'),
(3, 'Requisición de materia prima para producción', 3, 'CLO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REQUISICION_MATERIA`
--

CREATE TABLE `REQUISICION_MATERIA` (
  `num` int NOT NULL,
  `fecha` datetime NOT NULL,
  `cantidad` int NOT NULL,
  `requisicion` int NOT NULL,
  `materia_prima` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `REQUISICION_MATERIA`
--

INSERT INTO `REQUISICION_MATERIA` (`num`, `fecha`, `cantidad`, `requisicion`, `materia_prima`) VALUES
(1, '2024-10-19 19:09:58', 5, 1, 'PANTLA'),
(2, '2024-10-19 19:09:58', 10, 2, 'BATERIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RESGUARDO`
--

CREATE TABLE `RESGUARDO` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(32) NOT NULL,
  `cantidad` int NOT NULL,
  `materia_prima` varchar(8) DEFAULT NULL,
  `prod_terminado` varchar(8) DEFAULT NULL,
  `ubicacion` varchar(12) DEFAULT NULL,
  `area` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `RESGUARDO`
--

INSERT INTO `RESGUARDO` (`codigo`, `descripcion`, `cantidad`, `materia_prima`, `prod_terminado`, `ubicacion`, `area`) VALUES
('R001', 'Resguardo de Pantallas', 20, 'PANTLA', NULL, '1-A-1-1', 'MP'),
('R002', 'Resguardo de Baterías', 30, 'BATERIA', NULL, '1-B-1-1', 'MP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROL`
--

CREATE TABLE `ROL` (
  `codigo` varchar(5) NOT NULL,
  `descripcion` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ROL`
--

INSERT INTO `ROL` (`codigo`, `descripcion`) VALUES
('ADMIN', 'Administrador'),
('ANAL', 'Analista'),
('RECEP', 'Recepcionista');

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
  `edo_solicitud_compra` varchar(3) DEFAULT NULL,
  `empleado` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `SOLICITUD_COMPRA`
--

INSERT INTO `SOLICITUD_COMPRA` (`num`, `fecha`, `canTotalPorMateria`, `subtotal`, `IVA`, `total`, `edo_solicitud_compra`, `empleado`) VALUES
(1, '2024-10-19 19:09:55', 10, 1500.00, 240.00, 1740.00, 'PEN', 1),
(2, '2024-10-19 19:09:55', 5, 300.00, 48.00, 348.00, 'APR', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TIPO_MOVIMIENTO`
--

CREATE TABLE `TIPO_MOVIMIENTO` (
  `codigo` varchar(3) NOT NULL,
  `descripcion` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `TIPO_MOVIMIENTO`
--

INSERT INTO `TIPO_MOVIMIENTO` (`codigo`, `descripcion`) VALUES
('AJS', 'Ajuste'),
('ENT', 'Entrada'),
('SAL', 'Salida'),
('TRA', 'Transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `UBICACION`
--

CREATE TABLE `UBICACION` (
  `codigo` varchar(12) NOT NULL,
  `nombreContenedor` varchar(12) NOT NULL,
  `pasillo` int NOT NULL,
  `lado` varchar(1) DEFAULT NULL,
  `bahia` int NOT NULL,
  `nivel` varchar(1) DEFAULT NULL,
  `posicion` int NOT NULL,
  `capacidad` int NOT NULL,
  `largo` decimal(10,2) NOT NULL,
  `alto` decimal(10,2) NOT NULL,
  `ancho` decimal(10,2) NOT NULL,
  `volumen` decimal(10,2) NOT NULL,
  `area` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `UBICACION`
--

INSERT INTO `UBICACION` (`codigo`, `nombreContenedor`, `pasillo`, `lado`, `bahia`, `nivel`, `posicion`, `capacidad`, `largo`, `alto`, `ancho`, `volumen`, `area`) VALUES
('1-A-1-1', 'Estante', 1, 'A', 1, 'A', 1, 100, 2.00, 1.00, 1.00, 2.00, 'MP'),
('1-B-1-1', 'Estante', 1, 'B', 1, 'A', 2, 100, 2.00, 1.00, 1.00, 2.00, 'MP');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USUARIO`
--

CREATE TABLE `USUARIO` (
  `num` int NOT NULL,
  `alias` varchar(12) NOT NULL,
  `contraseña` varchar(8) NOT NULL,
  `empleado` int DEFAULT NULL,
  `rol` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `USUARIO`
--

INSERT INTO `USUARIO` (`num`, `alias`, `contraseña`, `empleado`, `rol`) VALUES
(1, 'juanp', 'pass123', 1, 'ADMIN'),
(2, 'analp', 'pass456', 2, 'ANAL'),
(3, 'recep', 'pass789', 3, 'RECEP');

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
  `edo_verificacion` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `VERIFICACION`
--

INSERT INTO `VERIFICACION` (`num`, `cantRecibida`, `cantDefectuosa`, `cantAceptada`, `observaciones`, `edo_verificacion`) VALUES
(1, 100, 2, 98, 'Verificación completa', NULL),
(2, 200, 5, 195, 'Verificación parcial', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VERIFICACION_LOTE`
--

CREATE TABLE `VERIFICACION_LOTE` (
  `fecha` datetime NOT NULL,
  `verificacion` int NOT NULL,
  `lote` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `VERIFICACION_LOTE`
--

INSERT INTO `VERIFICACION_LOTE` (`fecha`, `verificacion`, `lote`) VALUES
('2024-10-19 19:10:06', 1, 1),
('2024-10-19 19:10:06', 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `AREA`
--
ALTER TABLE `AREA`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `COMPRA_MATERIA`
--
ALTER TABLE `COMPRA_MATERIA`
  ADD PRIMARY KEY (`compra`,`materia_prima`),
  ADD KEY `materia_prima` (`materia_prima`);

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
  ADD KEY `edo_puesto` (`edo_puesto`);

--
-- Indices de la tabla `LINEA_DE_PROD`
--
ALTER TABLE `LINEA_DE_PROD`
  ADD PRIMARY KEY (`num`);

--
-- Indices de la tabla `LINEA_PROD`
--
ALTER TABLE `LINEA_PROD`
  ADD PRIMARY KEY (`num`,`linea_prod`,`prod_terminado`),
  ADD KEY `linea_prod` (`linea_prod`),
  ADD KEY `prod_terminado` (`prod_terminado`);

--
-- Indices de la tabla `LOTE`
--
ALTER TABLE `LOTE`
  ADD PRIMARY KEY (`num`),
  ADD KEY `edo_lote` (`edo_lote`);

--
-- Indices de la tabla `LOTE_SOLICITUD`
--
ALTER TABLE `LOTE_SOLICITUD`
  ADD PRIMARY KEY (`num`,`lote`,`solicitud_compra`),
  ADD KEY `lote` (`lote`),
  ADD KEY `solicitud_compra` (`solicitud_compra`);

--
-- Indices de la tabla `MATERIA_LOTE`
--
ALTER TABLE `MATERIA_LOTE`
  ADD PRIMARY KEY (`num`,`materia_prima`,`lote`),
  ADD KEY `materia_prima` (`materia_prima`),
  ADD KEY `lote` (`lote`);

--
-- Indices de la tabla `MATERIA_PRIMA`
--
ALTER TABLE `MATERIA_PRIMA`
  ADD PRIMARY KEY (`codigo`);

--
-- Indices de la tabla `MATERIA_PROD`
--
ALTER TABLE `MATERIA_PROD`
  ADD PRIMARY KEY (`num`,`materia_prima`,`prod_terminado`),
  ADD KEY `materia_prima` (`materia_prima`),
  ADD KEY `prod_terminado` (`prod_terminado`);

--
-- Indices de la tabla `MOVIMIENTO`
--
ALTER TABLE `MOVIMIENTO`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `tipo_movimiento` (`tipo_movimiento`),
  ADD KEY `verificacion` (`verificacion`);

--
-- Indices de la tabla `MOVIMIENTO_MATERIA`
--
ALTER TABLE `MOVIMIENTO_MATERIA`
  ADD PRIMARY KEY (`num`,`movimiento`,`materia_prima`),
  ADD KEY `movimiento` (`movimiento`),
  ADD KEY `materia_prima` (`materia_prima`);

--
-- Indices de la tabla `MOVIMIENTO_PROD`
--
ALTER TABLE `MOVIMIENTO_PROD`
  ADD PRIMARY KEY (`num`,`movimiento`,`prod_terminado`),
  ADD KEY `movimiento` (`movimiento`),
  ADD KEY `prod_terminado` (`prod_terminado`);

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
  ADD KEY `edo_requisicion` (`edo_requisicion`);

--
-- Indices de la tabla `REQUISICION_MATERIA`
--
ALTER TABLE `REQUISICION_MATERIA`
  ADD PRIMARY KEY (`num`,`requisicion`,`materia_prima`),
  ADD KEY `requisicion` (`requisicion`),
  ADD KEY `materia_prima` (`materia_prima`);

--
-- Indices de la tabla `RESGUARDO`
--
ALTER TABLE `RESGUARDO`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `materia_prima` (`materia_prima`),
  ADD KEY `prod_terminado` (`prod_terminado`),
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
  ADD KEY `edo_solicitud_compra` (`edo_solicitud_compra`),
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
  ADD KEY `edo_verificacion` (`edo_verificacion`);

--
-- Indices de la tabla `VERIFICACION_LOTE`
--
ALTER TABLE `VERIFICACION_LOTE`
  ADD PRIMARY KEY (`verificacion`,`lote`),
  ADD KEY `lote` (`lote`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `LINEA_DE_PROD`
--
ALTER TABLE `LINEA_DE_PROD`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `LINEA_PROD`
--
ALTER TABLE `LINEA_PROD`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `LOTE`
--
ALTER TABLE `LOTE`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `LOTE_SOLICITUD`
--
ALTER TABLE `LOTE_SOLICITUD`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `MATERIA_LOTE`
--
ALTER TABLE `MATERIA_LOTE`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `MATERIA_PROD`
--
ALTER TABLE `MATERIA_PROD`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `MOVIMIENTO_MATERIA`
--
ALTER TABLE `MOVIMIENTO_MATERIA`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `MOVIMIENTO_PROD`
--
ALTER TABLE `MOVIMIENTO_PROD`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `REQUISICION`
--
ALTER TABLE `REQUISICION`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `REQUISICION_MATERIA`
--
ALTER TABLE `REQUISICION_MATERIA`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `SOLICITUD_COMPRA`
--
ALTER TABLE `SOLICITUD_COMPRA`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `USUARIO`
--
ALTER TABLE `USUARIO`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `VERIFICACION`
--
ALTER TABLE `VERIFICACION`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `COMPRA_MATERIA`
--
ALTER TABLE `COMPRA_MATERIA`
  ADD CONSTRAINT `COMPRA_MATERIA_ibfk_1` FOREIGN KEY (`compra`) REFERENCES `SOLICITUD_COMPRA` (`num`),
  ADD CONSTRAINT `COMPRA_MATERIA_ibfk_2` FOREIGN KEY (`materia_prima`) REFERENCES `MATERIA_PRIMA` (`codigo`);

--
-- Filtros para la tabla `EMPLEADO`
--
ALTER TABLE `EMPLEADO`
  ADD CONSTRAINT `EMPLEADO_ibfk_1` FOREIGN KEY (`puesto`) REFERENCES `PUESTO` (`codigo`),
  ADD CONSTRAINT `EMPLEADO_ibfk_2` FOREIGN KEY (`edo_puesto`) REFERENCES `EDO_PUESTO` (`codigo`);

--
-- Filtros para la tabla `LINEA_PROD`
--
ALTER TABLE `LINEA_PROD`
  ADD CONSTRAINT `LINEA_PROD_ibfk_1` FOREIGN KEY (`linea_prod`) REFERENCES `LINEA_DE_PROD` (`num`),
  ADD CONSTRAINT `LINEA_PROD_ibfk_2` FOREIGN KEY (`prod_terminado`) REFERENCES `PROD_TERMINADO` (`codigo`);

--
-- Filtros para la tabla `LOTE`
--
ALTER TABLE `LOTE`
  ADD CONSTRAINT `LOTE_ibfk_1` FOREIGN KEY (`edo_lote`) REFERENCES `EDO_LOTE` (`codigo`);

--
-- Filtros para la tabla `LOTE_SOLICITUD`
--
ALTER TABLE `LOTE_SOLICITUD`
  ADD CONSTRAINT `LOTE_SOLICITUD_ibfk_1` FOREIGN KEY (`lote`) REFERENCES `LOTE` (`num`),
  ADD CONSTRAINT `LOTE_SOLICITUD_ibfk_2` FOREIGN KEY (`solicitud_compra`) REFERENCES `SOLICITUD_COMPRA` (`num`);

--
-- Filtros para la tabla `MATERIA_LOTE`
--
ALTER TABLE `MATERIA_LOTE`
  ADD CONSTRAINT `MATERIA_LOTE_ibfk_1` FOREIGN KEY (`materia_prima`) REFERENCES `MATERIA_PRIMA` (`codigo`),
  ADD CONSTRAINT `MATERIA_LOTE_ibfk_2` FOREIGN KEY (`lote`) REFERENCES `LOTE` (`num`);

--
-- Filtros para la tabla `MATERIA_PROD`
--
ALTER TABLE `MATERIA_PROD`
  ADD CONSTRAINT `MATERIA_PROD_ibfk_1` FOREIGN KEY (`materia_prima`) REFERENCES `MATERIA_PRIMA` (`codigo`),
  ADD CONSTRAINT `MATERIA_PROD_ibfk_2` FOREIGN KEY (`prod_terminado`) REFERENCES `PROD_TERMINADO` (`codigo`);

--
-- Filtros para la tabla `MOVIMIENTO`
--
ALTER TABLE `MOVIMIENTO`
  ADD CONSTRAINT `MOVIMIENTO_ibfk_1` FOREIGN KEY (`tipo_movimiento`) REFERENCES `TIPO_MOVIMIENTO` (`codigo`),
  ADD CONSTRAINT `MOVIMIENTO_ibfk_2` FOREIGN KEY (`verificacion`) REFERENCES `VERIFICACION` (`num`);

--
-- Filtros para la tabla `MOVIMIENTO_MATERIA`
--
ALTER TABLE `MOVIMIENTO_MATERIA`
  ADD CONSTRAINT `MOVIMIENTO_MATERIA_ibfk_1` FOREIGN KEY (`movimiento`) REFERENCES `MOVIMIENTO` (`codigo`),
  ADD CONSTRAINT `MOVIMIENTO_MATERIA_ibfk_2` FOREIGN KEY (`materia_prima`) REFERENCES `MATERIA_PRIMA` (`codigo`);

--
-- Filtros para la tabla `MOVIMIENTO_PROD`
--
ALTER TABLE `MOVIMIENTO_PROD`
  ADD CONSTRAINT `MOVIMIENTO_PROD_ibfk_1` FOREIGN KEY (`movimiento`) REFERENCES `MOVIMIENTO` (`codigo`),
  ADD CONSTRAINT `MOVIMIENTO_PROD_ibfk_2` FOREIGN KEY (`prod_terminado`) REFERENCES `PROD_TERMINADO` (`codigo`);

--
-- Filtros para la tabla `REQUISICION`
--
ALTER TABLE `REQUISICION`
  ADD CONSTRAINT `REQUISICION_ibfk_1` FOREIGN KEY (`empleado`) REFERENCES `EMPLEADO` (`num`),
  ADD CONSTRAINT `REQUISICION_ibfk_2` FOREIGN KEY (`edo_requisicion`) REFERENCES `EDO_REQUISICION` (`codigo`);

--
-- Filtros para la tabla `REQUISICION_MATERIA`
--
ALTER TABLE `REQUISICION_MATERIA`
  ADD CONSTRAINT `REQUISICION_MATERIA_ibfk_1` FOREIGN KEY (`requisicion`) REFERENCES `REQUISICION` (`num`),
  ADD CONSTRAINT `REQUISICION_MATERIA_ibfk_2` FOREIGN KEY (`materia_prima`) REFERENCES `MATERIA_PRIMA` (`codigo`);

--
-- Filtros para la tabla `RESGUARDO`
--
ALTER TABLE `RESGUARDO`
  ADD CONSTRAINT `RESGUARDO_ibfk_1` FOREIGN KEY (`materia_prima`) REFERENCES `MATERIA_PRIMA` (`codigo`),
  ADD CONSTRAINT `RESGUARDO_ibfk_2` FOREIGN KEY (`prod_terminado`) REFERENCES `PROD_TERMINADO` (`codigo`),
  ADD CONSTRAINT `RESGUARDO_ibfk_3` FOREIGN KEY (`ubicacion`) REFERENCES `UBICACION` (`codigo`),
  ADD CONSTRAINT `RESGUARDO_ibfk_4` FOREIGN KEY (`area`) REFERENCES `AREA` (`codigo`);

--
-- Filtros para la tabla `SOLICITUD_COMPRA`
--
ALTER TABLE `SOLICITUD_COMPRA`
  ADD CONSTRAINT `SOLICITUD_COMPRA_ibfk_1` FOREIGN KEY (`edo_solicitud_compra`) REFERENCES `EDO_SOLICITUD_COMPRA` (`codigo`),
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
  ADD CONSTRAINT `VERIFICACION_ibfk_1` FOREIGN KEY (`edo_verificacion`) REFERENCES `EDO_VERIFICACION` (`codigo`);

--
-- Filtros para la tabla `VERIFICACION_LOTE`
--
ALTER TABLE `VERIFICACION_LOTE`
  ADD CONSTRAINT `VERIFICACION_LOTE_ibfk_1` FOREIGN KEY (`verificacion`) REFERENCES `VERIFICACION` (`num`),
  ADD CONSTRAINT `VERIFICACION_LOTE_ibfk_2` FOREIGN KEY (`lote`) REFERENCES `LOTE` (`num`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
