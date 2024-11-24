-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 16-11-2024 a las 05:31:43
-- Versión del servidor: 8.0.40-0ubuntu0.24.04.1
-- Versión de PHP: 8.2.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `En_HoneyTrack`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertArea` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(32))   BEGIN
    INSERT INTO AREA (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertEmployee` (IN `firstName` VARCHAR(16), IN `lastName` VARCHAR(24), IN `middleName` VARCHAR(24), IN `phoneNumber` VARCHAR(10), IN `email` VARCHAR(32), IN `taxId` VARCHAR(13), IN `jobPosition` VARCHAR(5), IN `employeeStatus` VARCHAR(5))   BEGIN

    INSERT INTO EMPLOYEE (firstName, lastName, middleName, phoneNumber, email, taxId, jobPosition, employeeStatus)
    VALUES (firstName, lastName, middleName, phoneNumber, email, taxId, jobPosition, employeeStatus)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertEmployeeStatus` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(32))   BEGIN
    INSERT INTO EMPLOYEE_STATUS (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertFinishedProduct` (IN `p_code` VARCHAR(8), IN `p_name` VARCHAR(32), IN `p_description` VARCHAR(256), IN `p_netCost` DECIMAL(10,2), IN `p_length` DECIMAL(10,2), IN `p_height` DECIMAL(10,2), IN `p_width` DECIMAL(10,2), IN `p_weight` DECIMAL(10,2), IN `p_volume` DECIMAL(10,2), IN `p_stock` INT)   BEGIN
    INSERT INTO FINISHED_PRODUCT (
        code, name, description, netCost, length, height, width, weight, volume, stock
    ) 
    VALUES (p_code, p_name, p_description, p_netCost, p_length, p_height, p_width, p_weight, p_volume, p_stock)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertJobPosition` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(32))   BEGIN
    INSERT INTO JOB_POSITION (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLocation` (IN `p_code` VARCHAR(8), IN `p_containerName` VARCHAR(12), IN `p_aisle` VARCHAR(2), IN `p_side` VARCHAR(2), IN `p_bay` VARCHAR(2), IN `p_level` VARCHAR(2), IN `p_position` VARCHAR(2), IN `p_capacity` INT, IN `p_length` DECIMAL(10,2), IN `p_height` DECIMAL(10,2), IN `p_width` DECIMAL(10,2), IN `p_volume` DECIMAL(10,2), IN `p_area` VARCHAR(5))   BEGIN
    INSERT INTO LOCATION (
        code, containerName, aisle, side, bay, level, position, capacity, length, height, width, volume, area
    ) 
    VALUES (
        p_code, p_containerName, p_aisle, p_side, p_bay, p_level, p_position, p_capacity, 
        p_length, p_height, p_width, p_volume, p_area
    )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLot` (IN `p_description` VARCHAR(256), IN `p_percentage` FLOAT, IN `p_lotStatus` VARCHAR(5), IN `p_purchaseRequest` INT)   BEGIN
    INSERT INTO LOT (description, percentage, lotStatus, purchaseRequest) 
    VALUES (p_description, p_percentage, p_lotStatus, p_purchaseRequest)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLotStatus` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(16))   BEGIN
    INSERT INTO LOT_STATUS (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertLotVerification` (IN `p_lot` INT, IN `p_verification` INT, IN `p_date` DATETIME)   BEGIN
    INSERT INTO LOT_VERIFICATION (lot, verification, date) 
    VALUES (p_lot, p_verification, p_date)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertMovement` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(128), IN `p_movementType` VARCHAR(5))   BEGIN
    INSERT INTO MOVEMENT (code, description, movementType) 
    VALUES (p_code, p_description, p_movementType)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertMovementFinishedProduct` (IN `p_movement` VARCHAR(5), IN `p_finishedProduct` VARCHAR(5), IN `p_date` DATETIME, IN `p_quantity` INT)   BEGIN
    INSERT INTO MOVEMENT_FINISHED_PRODUCT (movement, finishedProduct, date, quantity) 
    VALUES (p_movement, p_finishedProduct, p_date, p_quantity)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertMovementRawMaterial` (IN `p_movement` VARCHAR(5), IN `p_rawMaterial` VARCHAR(5), IN `p_date` DATETIME, IN `p_quantity` INT)   BEGIN
    INSERT INTO MOVEMENT_RAW_MATERIAL (movement, rawMaterial, date, quantity) 
    VALUES (p_movement, p_rawMaterial, p_date, p_quantity)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertMovementType` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(16))   BEGIN
    INSERT INTO MOVEMENT_TYPE (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertProductionLine` (IN `p_name` VARCHAR(24))   BEGIN
    INSERT INTO PRODUCTION_LINE (name) 
    VALUES (p_name)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertProductionLineFinishedProduct` (IN `p_productionLine` INT, IN `p_finishedProduct` VARCHAR(5), IN `p_date` DATETIME, IN `p_quantity` INT)   BEGIN
    INSERT INTO PRODUCTION_LINE_FINISHED_PRODUCT (productionLine, finishedProduct, date, quantity) 
    VALUES (p_productionLine, p_finishedProduct, p_date, p_quantity)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPurchaseRawMaterial` (IN `p_rawMaterial` VARCHAR(5), IN `p_purchaseRequest` INT, IN `p_quantity` INT, IN `p_cost` DECIMAL(10,2))   BEGIN
    INSERT INTO PURCHASE_RAW_MATERIAL (rawMaterial, purchaseRequest, quantity, cost) 
    VALUES (p_rawMaterial, p_purchaseRequest, p_quantity, p_cost)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPurchaseRequest` (IN `p_date` DATETIME, IN `p_totalQuantityPerMaterial` INT, IN `p_subtotal` DECIMAL(10,2), IN `p_VAT` DECIMAL(10,2), IN `p_total` DECIMAL(10,2), IN `p_purchaseRequestStatus` VARCHAR(5), IN `p_employee` INT)   BEGIN
    INSERT INTO PURCHASE_REQUEST (
        date, totalQuantityPerMaterial, subtotal, VAT, total, purchaseRequestStatus, employee
    ) 
    VALUES (p_date, p_totalQuantityPerMaterial, p_subtotal, p_VAT, p_total, p_purchaseRequestStatus, p_employee)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertPurchaseRequestStatus` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(16))   BEGIN
    INSERT INTO PURCHASE_REQUEST_STATUS (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertRawMaterial` (IN `code` VARCHAR(5), IN `name` VARCHAR(64), IN `description` VARCHAR(256), IN `cost` DECIMAL(10,2), IN `length` DECIMAL(10,2), IN `height` DECIMAL(10,2), IN `width` DECIMAL(10,2), IN `weight` DECIMAL(10,2), IN `volume` DECIMAL(10,2), IN `stock` INT)   BEGIN

    INSERT INTO RAW_MATERIAL (code, name, description, cost, length, height, width, weight, volume, stock)
    VALUES (code, name, description, cost, length, height, width, weight, volume, stock)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRawMaterialFinishedProduct` (IN `p_rawMaterial` VARCHAR(5), IN `p_finishedProduct` VARCHAR(5), IN `p_quantity` INT, IN `p_totalMaterialCost` DECIMAL(10,2))   BEGIN
    INSERT INTO RAW_MATERIAL_FINISHED_PRODUCT (rawMaterial, finishedProduct, quantity, totalMaterialCost) 
    VALUES (p_rawMaterial, p_finishedProduct, p_quantity, p_totalMaterialCost)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRawMaterialLot` (IN `p_rawMaterial` VARCHAR(5), IN `p_lot` INT, IN `p_quantity` INT)   BEGIN
    INSERT INTO RAW_MATERIAL_LOT (rawMaterial, lot, quantity) 
    VALUES (p_rawMaterial, p_lot, p_quantity)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRequisition` (IN `p_description` VARCHAR(256), IN `p_employee` INT, IN `p_productionLine` INT, IN `p_requisitionStatus` VARCHAR(5))   BEGIN
    INSERT INTO REQUISITION (description, employee, productionLine, requisitionStatus) 
    VALUES (p_description, p_employee, p_productionLine, p_requisitionStatus)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRequisitionRawMaterial` (IN `p_requisition` INT, IN `p_rawMaterial` VARCHAR(5), IN `p_date` DATETIME, IN `p_quantity` INT)   BEGIN
    INSERT INTO REQUISITION_RAW_MATERIAL (requisition, rawMaterial, date, quantity) 
    VALUES (p_requisition, p_rawMaterial, p_date, p_quantity)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRequisitionStatus` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(16))   BEGIN
    INSERT INTO REQUISITION_STATUS (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertRole` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(64))   BEGIN
    INSERT INTO ROLE (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertStorage` (IN `p_code` VARCHAR(5), IN `p_quantity` INT, IN `p_description` VARCHAR(48), IN `p_rawMaterial` VARCHAR(5), IN `p_finishedProduct` VARCHAR(5), IN `p_location` VARCHAR(8), IN `p_area` VARCHAR(5))   BEGIN
    INSERT INTO STORAGE (
        code, quantity, description, rawMaterial, finishedProduct, location, area
    ) 
    VALUES (p_code, p_quantity, p_description, p_rawMaterial, p_finishedProduct, p_location, p_area)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUser` (IN `p_username` VARCHAR(12), IN `p_password` VARCHAR(16), IN `p_employee` INT, IN `p_role` VARCHAR(5))   BEGIN
    INSERT INTO USER (username, password, employee, role) 
    VALUES (p_username, p_password, p_employee, p_role)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertVerification` (IN `p_receivedQuantity` INT, IN `p_defectiveQuantity` INT, IN `p_acceptedQuantity` INT, IN `p_observations` VARCHAR(128), IN `p_verificationStatus` VARCHAR(5))   BEGIN
    INSERT INTO VERIFICATION (receivedQuantity, defectiveQuantity, acceptedQuantity, observations, verificationStatus) 
    VALUES (p_receivedQuantity, p_defectiveQuantity, p_acceptedQuantity, p_observations, p_verificationStatus)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertVerificationStatus` (IN `p_code` VARCHAR(5), IN `p_description` VARCHAR(16))   BEGIN
    INSERT INTO VERIFICATION_STATUS (code, description) 
    VALUES (p_code, p_description)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updatePurchaseRequestStatus` (IN `requestNumber` INT, IN `newStatus` VARCHAR(5))   BEGIN
    DECLARE existingRequest INT$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateRequisitionStatus` (IN `requisitionNumber` INT, IN `newStatus` VARCHAR(5))   BEGIN
    DECLARE existingRequisition INT$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `validateUser` (IN `username` VARCHAR(12), IN `password` VARCHAR(16))   BEGIN
    DECLARE userRole VARCHAR(5)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `AREA`
--

CREATE TABLE `AREA` (
  `code` varchar(5) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `AREA`
--

INSERT INTO `AREA` (`code`, `description`) VALUES
('FPARE', 'Finished Products Area'),
('RMARE', 'Raw Material Area');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLOYEE`
--

CREATE TABLE `EMPLOYEE` (
  `num` int NOT NULL,
  `firstName` varchar(16) NOT NULL,
  `lastName` varchar(24) NOT NULL,
  `middleName` varchar(24) DEFAULT NULL,
  `contactNumber` varchar(10) NOT NULL,
  `email` varchar(32) NOT NULL,
  `taxId` varchar(13) NOT NULL,
  `jobPosition` varchar(5) DEFAULT NULL,
  `employeeStatus` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EMPLOYEE`
--

INSERT INTO `EMPLOYEE` (`num`, `firstName`, `lastName`, `middleName`, `contactNumber`, `email`, `taxId`, `jobPosition`, `employeeStatus`) VALUES
(1, 'Gaddiel', 'Barrios', 'Uriarte', '6641234567', 'Gaddiel@gmail.com', 'BAUG8007229H5', 'ADMIN', 'ACTIV'),
(2, 'Brandon', 'Gonzalez', 'Gonzalez', '6649876543', 'Brandon@gmail.com', 'GOGB9803024B7', 'ADMIN', 'ACTIV'),
(3, 'Andres', 'Cuevas', 'Zapata', '6644567890', 'Andres@gmail.com', 'CZAA9205103A6', 'ADMIN', 'ACTIV'),
(4, 'Yadira', 'Salazar', 'Urtuzuastegui', '6643456789', 'Yadira@gmail.com', 'SAUY7606113N6', 'ADMIN', 'ACTIV'),
(5, 'Alexa', 'Perez', 'Morales', '6648765432', 'Alexa@gmail.com', 'PEMA980503V7', 'INANA', 'INACT'),
(6, 'Omar', 'Gonzalez', 'Gonzalez', '6642345678', 'Omar@gmail.com', 'GOGO9208211M0', 'INANA', 'ACTIV'),
(7, 'Axl', 'Gonzalez', 'Penaloza', '6645678901', 'Axl@gmail.com', 'GOPA8906206L5', 'INANA', 'INACT'),
(8, 'Horus', 'Gonzalez', 'Penaloza', '6647654321', 'Horus@gmail.com', 'GOPH9403229J9', 'INANA', 'ACTIV'),
(9, 'Eduardo', 'Ruiz', 'Garcia', '6646543210', 'Eduardo@gmail.com', 'RUGE750711M9', 'INANA', 'ACTIV'),
(10, 'Carlos', 'Martinez', 'Gutierrez', '6648901234', 'Carlos@gmail.com', 'MAGC8905174M3', 'RECEP', 'ACTIV'),
(11, 'Esperanza', 'Salazar', 'Espinoza', '6643128907', 'Esperanza@gmail.com', 'SAEE6709226L0', 'RECEP', 'INACT'),
(12, 'Cathy', 'Soto', 'Garcia', '6647683410', 'Cathy@gmail.com', 'SOGC9212102V9', 'RECEP', 'ACTIV'),
(13, 'Kira', 'Garfias', 'Gonzalez', '6645392718', 'Kira@gmail.com', 'GAGK950512H1', 'RECEP', 'ACTIV'),
(14, 'Cesar', 'Soto', 'Quintana', '6642048756', 'Cesar@gmail.com', 'SOQC8807235A5', 'RECEP', 'INACT'),
(15, 'Gabriel', 'Herrera', 'Gonzalez', '6649435102', 'Gabriel@gmail.com', 'HEGG9509201B3', 'RAWMM', 'ACTIV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EMPLOYEE_STATUS`
--

CREATE TABLE `EMPLOYEE_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `EMPLOYEE_STATUS`
--

INSERT INTO `EMPLOYEE_STATUS` (`code`, `description`) VALUES
('ACTIV', 'Active'),
('INACT', 'Inactive'),
('TERMI', 'Terminated');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FINISHED_PRODUCT`
--

CREATE TABLE `FINISHED_PRODUCT` (
  `code` varchar(8) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(256) NOT NULL,
  `netCost` decimal(10,2) NOT NULL,
  `length` decimal(10,2) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `width` decimal(10,2) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `FINISHED_PRODUCT`
--

INSERT INTO `FINISHED_PRODUCT` (`code`, `name`, `description`, `netCost`, `length`, `height`, `width`, `weight`, `volume`, `stock`) VALUES
('GS24P', 'Galaxy S24+', 'High-end smartphone with large screen', 14940.00, 16.10, 7.80, 0.80, 200.00, 100.46, 20),
('GS24U', 'Galaxy S24 Ultra', 'Smartphone with advanced camera, 5G', 18810.00, 16.50, 7.80, 0.90, 228.00, 115.83, 16),
('GYS24', 'Galaxy S24', 'High-end smartphone, 5G', 12870.00, 15.60, 7.30, 0.80, 168.00, 91.10, 0),
('GZFL6', 'Galaxy Z Flip 6', 'Compact foldable smartphone', 16670.00, 8.50, 7.20, 1.00, 187.00, 61.20, 18),
('GZFO6', 'Galaxy Z Fold 6', 'Foldable smartphone with flexible screen', 21090.00, 16.70, 7.80, 1.30, 280.00, 169.34, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `JOB_POSITION`
--

CREATE TABLE `JOB_POSITION` (
  `code` varchar(5) NOT NULL,
  `description` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `JOB_POSITION`
--

INSERT INTO `JOB_POSITION` (`code`, `description`) VALUES
('ADMIN', 'Administrator'),
('INANA', 'Inventory Analyst'),
('RAWMM', 'Raw Material Manager'),
('RECEP', 'Receptionist');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOCATION`
--

CREATE TABLE `LOCATION` (
  `code` varchar(8) NOT NULL,
  `containerName` varchar(12) NOT NULL,
  `aisle` varchar(2) NOT NULL,
  `side` varchar(2) NOT NULL,
  `bay` varchar(2) NOT NULL,
  `level` varchar(2) NOT NULL,
  `position` varchar(2) NOT NULL,
  `capacity` int NOT NULL,
  `length` decimal(10,2) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `width` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `area` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LOCATION`
--

INSERT INTO `LOCATION` (`code`, `containerName`, `aisle`, `side`, `bay`, `level`, `position`, `capacity`, `length`, `height`, `width`, `volume`, `area`) VALUES
('01A0101A', 'Bin', '01', 'A', '01', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0101B', 'Bin', '01', 'A', '01', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0101C', 'Bin', '01', 'A', '01', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0102A', 'Bin', '01', 'A', '01', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0102B', 'Bin', '01', 'A', '01', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0102C', 'Bin', '01', 'A', '01', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0103A', 'Bin', '01', 'A', '01', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0103B', 'Bin', '01', 'A', '01', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0103C', 'Bin', '01', 'A', '01', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0104A', 'Bin', '01', 'A', '01', '04', 'A', 2064, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0104B', 'Bin', '01', 'A', '01', '04', 'B', 3687, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0104C', 'Bin', '01', 'A', '01', '04', 'C', 9635, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0201A', 'Bin', '01', 'A', '02', '01', 'A', 16424, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0201B', 'Bin', '01', 'A', '02', '01', 'B', 60222, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0201C', 'Bin', '01', 'A', '02', '01', 'C', 6882, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0202A', 'Bin', '01', 'A', '02', '02', 'A', 11470, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0202B', 'Bin', '01', 'A', '02', '02', 'B', 277, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0202C', 'Bin', '01', 'A', '02', '02', 'C', 657, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0203A', 'Bin', '01', 'A', '02', '03', 'A', 1642, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0203B', 'Bin', '01', 'A', '02', '03', 'B', 3226, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0203C', 'Bin', '01', 'A', '02', '03', 'C', 5275, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0204A', 'Bin', '01', 'A', '02', '04', 'A', 12459, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0204B', 'Bin', '01', 'A', '02', '04', 'B', 30111, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0204C', 'Bin', '01', 'A', '02', '04', 'C', 5161, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0301A', 'Bin', '01', 'A', '03', '01', 'A', 9899, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0301B', 'Bin', '01', 'A', '03', '01', 'B', 215, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0301C', 'Bin', '01', 'A', '03', '01', 'C', 555, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0302A', 'Bin', '01', 'A', '03', '02', 'A', 1313, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0302B', 'Bin', '01', 'A', '03', '02', 'B', 2890, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0302C', 'Bin', '01', 'A', '03', '02', 'C', 3226, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0303A', 'Bin', '01', 'A', '03', '03', 'A', 9635, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0303B', 'Bin', '01', 'A', '03', '03', 'B', 20647, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0303C', 'Bin', '01', 'A', '03', '03', 'C', 60222, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0304A', 'Bin', '01', 'A', '03', '04', 'A', 5161, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0304B', 'Bin', '01', 'A', '03', '04', 'B', 9899, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0304C', 'Bin', '01', 'A', '03', '04', 'C', 215, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0401A', 'Bin', '01', 'A', '04', '01', 'A', 36, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0401B', 'Bin', '01', 'A', '04', '01', 'B', 2064, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0401C', 'Bin', '01', 'A', '04', '01', 'C', 9033, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0402A', 'Bin', '01', 'A', '04', '02', 'A', 4301, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0402B', 'Bin', '01', 'A', '04', '02', 'B', 9635, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0402C', 'Bin', '01', 'A', '04', '02', 'C', 20647, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0403A', 'Bin', '01', 'A', '04', '03', 'A', 60222, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0403B', 'Bin', '01', 'A', '04', '03', 'B', 6882, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0403C', 'Bin', '01', 'A', '04', '03', 'C', 12248, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0404A', 'Bin', '01', 'A', '04', '04', 'A', 344, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0404B', 'Bin', '01', 'A', '04', '04', 'B', 71, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01A0404C', 'Bin', '01', 'A', '04', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0101A', 'Bin', '01', 'B', '01', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0101B', 'Bin', '01', 'B', '01', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0101C', 'Bin', '01', 'B', '01', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0102A', 'Bin', '01', 'B', '01', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0102B', 'Bin', '01', 'B', '01', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0102C', 'Bin', '01', 'B', '01', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0103A', 'Bin', '01', 'B', '01', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0103B', 'Bin', '01', 'B', '01', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0103C', 'Bin', '01', 'B', '01', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0104A', 'Bin', '01', 'B', '01', '04', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0104B', 'Bin', '01', 'B', '01', '04', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0104C', 'Bin', '01', 'B', '01', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0201A', 'Bin', '01', 'B', '02', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0201B', 'Bin', '01', 'B', '02', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0201C', 'Bin', '01', 'B', '02', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0202A', 'Bin', '01', 'B', '02', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0202B', 'Bin', '01', 'B', '02', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0202C', 'Bin', '01', 'B', '02', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0203A', 'Bin', '01', 'B', '02', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0203B', 'Bin', '01', 'B', '02', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0203C', 'Bin', '01', 'B', '02', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0204A', 'Bin', '01', 'B', '02', '04', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0204B', 'Bin', '01', 'B', '02', '04', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0204C', 'Bin', '01', 'B', '02', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0301A', 'Bin', '01', 'B', '03', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0301B', 'Bin', '01', 'B', '03', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0301C', 'Bin', '01', 'B', '03', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0302A', 'Bin', '01', 'B', '03', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0302B', 'Bin', '01', 'B', '03', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0302C', 'Bin', '01', 'B', '03', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0303A', 'Bin', '01', 'B', '03', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0303B', 'Bin', '01', 'B', '03', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0303C', 'Bin', '01', 'B', '03', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0304A', 'Bin', '01', 'B', '03', '04', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0304B', 'Bin', '01', 'B', '03', '04', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0304C', 'Bin', '01', 'B', '03', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0401A', 'Bin', '01', 'B', '04', '01', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0401B', 'Bin', '01', 'B', '04', '01', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0401C', 'Bin', '01', 'B', '04', '01', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0402A', 'Bin', '01', 'B', '04', '02', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0402B', 'Bin', '01', 'B', '04', '02', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0402C', 'Bin', '01', 'B', '04', '02', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0403A', 'Bin', '01', 'B', '04', '03', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0403B', 'Bin', '01', 'B', '04', '03', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0403C', 'Bin', '01', 'B', '04', '03', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0404A', 'Bin', '01', 'B', '04', '04', 'A', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0404B', 'Bin', '01', 'B', '04', '04', 'B', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('01B0404C', 'Bin', '01', 'B', '04', '04', 'C', 200, 17.78, 22.86, 17.78, 7226.69, 'RMARE'),
('02A0101A', 'Bin', '02', 'A', '01', '01', 'A', 71, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0101B', 'Bin', '02', 'A', '01', '01', 'B', 62, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0101C', 'Bin', '02', 'A', '01', '01', 'C', 42, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0102A', 'Bin', '02', 'A', '01', '02', 'A', 118, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0102B', 'Bin', '02', 'A', '01', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0102C', 'Bin', '02', 'A', '01', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0103A', 'Bin', '02', 'A', '01', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0103B', 'Bin', '02', 'A', '01', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0103C', 'Bin', '02', 'A', '01', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0104A', 'Bin', '02', 'A', '01', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0104B', 'Bin', '02', 'A', '01', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0104C', 'Bin', '02', 'A', '01', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0201A', 'Bin', '02', 'A', '02', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0201B', 'Bin', '02', 'A', '02', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0201C', 'Bin', '02', 'A', '02', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0202A', 'Bin', '02', 'A', '02', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0202B', 'Bin', '02', 'A', '02', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0202C', 'Bin', '02', 'A', '02', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0203A', 'Bin', '02', 'A', '02', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0203B', 'Bin', '02', 'A', '02', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0203C', 'Bin', '02', 'A', '02', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0204A', 'Bin', '02', 'A', '02', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0204B', 'Bin', '02', 'A', '02', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0204C', 'Bin', '02', 'A', '02', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0301A', 'Bin', '02', 'A', '03', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0301B', 'Bin', '02', 'A', '03', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0301C', 'Bin', '02', 'A', '03', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0302A', 'Bin', '02', 'A', '03', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0302B', 'Bin', '02', 'A', '03', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0302C', 'Bin', '02', 'A', '03', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0303A', 'Bin', '02', 'A', '03', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0303B', 'Bin', '02', 'A', '03', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0303C', 'Bin', '02', 'A', '03', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0304A', 'Bin', '02', 'A', '03', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0304B', 'Bin', '02', 'A', '03', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0304C', 'Bin', '02', 'A', '03', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0401A', 'Bin', '02', 'A', '04', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0401B', 'Bin', '02', 'A', '04', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0401C', 'Bin', '02', 'A', '04', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0402A', 'Bin', '02', 'A', '04', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0402B', 'Bin', '02', 'A', '04', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0402C', 'Bin', '02', 'A', '04', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0403A', 'Bin', '02', 'A', '04', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0403B', 'Bin', '02', 'A', '04', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0403C', 'Bin', '02', 'A', '04', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0404A', 'Bin', '02', 'A', '04', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0404B', 'Bin', '02', 'A', '04', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02A0404C', 'Bin', '02', 'A', '04', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0101A', 'Bin', '02', 'B', '01', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0101B', 'Bin', '02', 'B', '01', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0101C', 'Bin', '02', 'B', '01', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0102A', 'Bin', '02', 'B', '01', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0102B', 'Bin', '02', 'B', '01', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0102C', 'Bin', '02', 'B', '01', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0103A', 'Bin', '02', 'B', '01', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0103B', 'Bin', '02', 'B', '01', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0103C', 'Bin', '02', 'B', '01', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0104A', 'Bin', '02', 'B', '01', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0104B', 'Bin', '02', 'B', '01', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0104C', 'Bin', '02', 'B', '01', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0201A', 'Bin', '02', 'B', '02', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0201B', 'Bin', '02', 'B', '02', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0201C', 'Bin', '02', 'B', '02', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0202A', 'Bin', '02', 'B', '02', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0202B', 'Bin', '02', 'B', '02', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0202C', 'Bin', '02', 'B', '02', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0203A', 'Bin', '02', 'B', '02', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0203B', 'Bin', '02', 'B', '02', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0203C', 'Bin', '02', 'B', '02', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0204A', 'Bin', '02', 'B', '02', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0204B', 'Bin', '02', 'B', '02', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0204C', 'Bin', '02', 'B', '02', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0301A', 'Bin', '02', 'B', '03', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0301B', 'Bin', '02', 'B', '03', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0301C', 'Bin', '02', 'B', '03', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0302A', 'Bin', '02', 'B', '03', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0302B', 'Bin', '02', 'B', '03', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0302C', 'Bin', '02', 'B', '03', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0303A', 'Bin', '02', 'B', '03', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0303B', 'Bin', '02', 'B', '03', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0303C', 'Bin', '02', 'B', '03', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0304A', 'Bin', '02', 'B', '03', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0304B', 'Bin', '02', 'B', '03', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0304C', 'Bin', '02', 'B', '03', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0401A', 'Bin', '02', 'B', '04', '01', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0401B', 'Bin', '02', 'B', '04', '01', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0401C', 'Bin', '02', 'B', '04', '01', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0402A', 'Bin', '02', 'B', '04', '02', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0402B', 'Bin', '02', 'B', '04', '02', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0402C', 'Bin', '02', 'B', '04', '02', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0403A', 'Bin', '02', 'B', '04', '03', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0403B', 'Bin', '02', 'B', '04', '03', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0403C', 'Bin', '02', 'B', '04', '03', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0404A', 'Bin', '02', 'B', '04', '04', 'A', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0404B', 'Bin', '02', 'B', '04', '04', 'B', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE'),
('02B0404C', 'Bin', '02', 'B', '04', '04', 'C', 20, 17.78, 22.86, 17.78, 7226.69, 'FPARE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOT`
--

CREATE TABLE `LOT` (
  `num` int NOT NULL,
  `description` varchar(256) NOT NULL,
  `percentage` float DEFAULT NULL,
  `lotStatus` varchar(5) DEFAULT NULL,
  `purchaseRequest` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LOT`
--

INSERT INTO `LOT` (`num`, `description`, `percentage`, `lotStatus`, `purchaseRequest`) VALUES
(1, 'Raw material batch for product GYS24', 0, 'PENDI', 1),
(2, 'Raw material batch for product GS24P', 100, 'VALID', 2),
(3, 'Raw material batch for product GS24U', 100, 'VALID', 2),
(4, 'Raw material batch for product GZF06', 100, 'VALID', 3),
(5, 'Raw material batch for product GZFL6', 100, 'VALID', 3);

--
-- Disparadores `LOT`
--
DELIMITER $$
CREATE TRIGGER `updateLotStatus` AFTER UPDATE ON `LOT` FOR EACH ROW BEGIN
    IF NEW.percentage = 100 THEN
        UPDATE LOT
        SET lotStatus = 'VALID'
        WHERE num = NEW.num$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOT_STATUS`
--

CREATE TABLE `LOT_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LOT_STATUS`
--

INSERT INTO `LOT_STATUS` (`code`, `description`) VALUES
('PENDI', 'Pending'),
('VALID', 'Validated');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `LOT_VERIFICATION`
--

CREATE TABLE `LOT_VERIFICATION` (
  `num` int NOT NULL,
  `lot` int NOT NULL,
  `verification` int NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `LOT_VERIFICATION`
--

INSERT INTO `LOT_VERIFICATION` (`num`, `lot`, `verification`, `date`) VALUES
(1, 1, 1, '2024-11-05 12:57:25'),
(2, 2, 2, '2024-11-05 13:00:25'),
(3, 3, 3, '2024-11-05 13:02:25'),
(4, 4, 4, '2024-11-05 18:10:51'),
(5, 5, 5, '2024-11-05 18:15:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVEMENT`
--

CREATE TABLE `MOVEMENT` (
  `code` varchar(5) NOT NULL,
  `description` varchar(128) NOT NULL,
  `movementType` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MOVEMENT`
--

INSERT INTO `MOVEMENT` (`code`, `description`, `movementType`) VALUES
('MV001', 'Raw Material Entry: PMA4S', 'ENTRY'),
('MV002', 'Raw Material Entry: BLA4S', 'ENTRY'),
('MV003', 'Raw Material Entry: CPS4P', 'ENTRY'),
('MV004', 'Raw Material Entry: CFS4P', 'ENTRY'),
('MV005', 'Raw Material Entry: PE4SP', 'ENTRY'),
('MV006', 'Raw Material Entry: MR8SP', 'ENTRY'),
('MV007', 'Raw Material Entry: AIS4P', 'ENTRY'),
('MV008', 'Raw Material Entry: PB4S4', 'ENTRY'),
('MV009', 'Raw Material Entry: CCS4P', 'ENTRY'),
('MV010', 'Raw Material Entry: PAUM5', 'ENTRY'),
('MV011', 'Raw Material Entry: BLUM5', 'ENTRY'),
('MV012', 'Raw Material Entry: CPU5S', 'ENTRY'),
('MV013', 'Raw Material Entry: CFUM5', 'ENTRY'),
('MV014', 'Raw Material Entry: PEUM5', 'ENTRY'),
('MV015', 'Raw Material Entry: MRUM5', 'ENTRY'),
('MV016', 'Raw Material Entry: AIUM5', 'ENTRY'),
('MV017', 'Raw Material Entry: PBU5S', 'ENTRY'),
('MV018', 'Raw Material Entry: CCUM5', 'ENTRY'),
('MV019', 'Raw Material Entry: PFOL6', 'ENTRY'),
('MV020', 'Raw Material Entry: PEF6L', 'ENTRY'),
('MV021', 'Raw Material Entry: BAZF6', 'ENTRY'),
('MV022', 'Raw Material Entry: CPZF6', 'ENTRY'),
('MV023', 'Raw Material Entry: CFZ6F', 'ENTRY'),
('MV024', 'Raw Material Entry: PSZF6', 'ENTRY'),
('MV025', 'Raw Material Entry: MRZ6F', 'ENTRY'),
('MV026', 'Raw Material Entry: AIZF6', 'ENTRY'),
('MV027', 'Raw Material Entry: PBZF6', 'ENTRY'),
('MV028', 'Raw Material Entry: CCZF6', 'ENTRY'),
('MV029', 'Raw Material Entry: PFLP6', 'ENTRY'),
('MV030', 'Raw Material Entry: PEF6P', 'ENTRY'),
('MV031', 'Raw Material Entry: BFLP6', 'ENTRY'),
('MV032', 'Raw Material Entry: CZF6P', 'ENTRY'),
('MV033', 'Raw Material Entry: CFZ6F', 'ENTRY'),
('MV034', 'Raw Material Entry: PSZ6F', 'ENTRY'),
('MV035', 'Raw Material Entry: MRZ6F', 'ENTRY'),
('MV036', 'Raw Material Entry: AIF6P', 'ENTRY'),
('MV037', 'Raw Material Entry: PBZ6F', 'ENTRY'),
('MV038', 'Raw Material Entry: CCZ6P', 'ENTRY'),
('MV039', 'Raw Material Transfer: PMA4S', 'TRANS'),
('MV040', 'Raw Material Transfer: BLA4S', 'TRANS'),
('MV041', 'Raw Material Transfer: CPS4P', 'TRANS'),
('MV042', 'Raw Material Transfer: CFS4P', 'TRANS'),
('MV043', 'Raw Material Transfer: PE4SP', 'TRANS'),
('MV044', 'Raw Material Transfer: MR8SP', 'TRANS'),
('MV045', 'Raw Material Transfer: AIS4P', 'TRANS'),
('MV046', 'Raw Material Transfer: PB4S4', 'TRANS'),
('MV047', 'Raw Material Transfer: CCS4P', 'TRANS'),
('MV048', 'Raw Material Transfer: PAUM5', 'TRANS'),
('MV049', 'Raw Material Transfer: BLUM5', 'TRANS'),
('MV050', 'Raw Material Transfer: CPU5S', 'TRANS'),
('MV051', 'Raw Material Transfer: CFUM5', 'TRANS'),
('MV052', 'Raw Material Transfer: PEUM5', 'TRANS'),
('MV053', 'Raw Material Transfer: MRUM5', 'TRANS'),
('MV054', 'Raw Material Transfer: AIUM5', 'TRANS'),
('MV055', 'Raw Material Transfer: PBU5S', 'TRANS'),
('MV056', 'Raw Material Transfer: CCUM5', 'TRANS'),
('MV057', 'Raw Material Transfer: PFOL6', 'TRANS'),
('MV058', 'Raw Material Transfer: PEF6L', 'TRANS'),
('MV059', 'Raw Material Transfer: BAZF6', 'TRANS'),
('MV060', 'Raw Material Transfer: CPZF6', 'TRANS'),
('MV061', 'Raw Material Transfer: CFZ6F', 'TRANS'),
('MV062', 'Raw Material Transfer: PSZF6', 'TRANS'),
('MV063', 'Raw Material Transfer: MRZ6F', 'TRANS'),
('MV064', 'Raw Material Transfer: AIZF6', 'TRANS'),
('MV065', 'Raw Material Transfer: PBZF6', 'TRANS'),
('MV066', 'Raw Material Transfer: CCZF6', 'TRANS'),
('MV067', 'Raw Material Transfer: PFLP6', 'TRANS'),
('MV068', 'Raw Material Transfer: PEF6P', 'TRANS'),
('MV069', 'Raw Material Transfer: BFLP6', 'TRANS'),
('MV070', 'Raw Material Transfer: CZF6P', 'TRANS'),
('MV071', 'Raw Material Transfer: CFZ6F', 'TRANS'),
('MV072', 'Raw Material Transfer: PSZ6F', 'TRANS'),
('MV073', 'Raw Material Transfer: MRZ6F', 'TRANS'),
('MV074', 'Raw Material Transfer: AIF6P', 'TRANS'),
('MV075', 'Raw Material Transfer: PBZ6F', 'TRANS'),
('MV076', 'Raw Material Transfer: CCZ6P', 'TRANS'),
('MV077', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV078', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV079', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV080', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV081', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV082', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV083', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV084', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV085', 'Raw Material Outflow for Galaxy S24+ Assembly.', 'EXIT'),
('MV086', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV087', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV088', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV089', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV090', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV091', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV092', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV093', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV094', 'Raw Material Outflow for Galaxy S24 Ultra Assembly.', 'EXIT'),
('MV095', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV096', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV097', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV098', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV099', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV100', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV101', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV102', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV103', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV104', 'Raw Material Outflow for Galaxy Z Fold 6 Assembly.', 'EXIT'),
('MV105', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV106', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV107', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV108', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV109', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV110', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV111', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV112', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV113', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV114', 'Raw Material Outflow for Galaxy Z Flip 6 Assembly.', 'EXIT'),
('MV115', 'Finished Product Entry: GS24P', 'ENTRY'),
('MV116', 'Finished Product Entry: GS24U', 'ENTRY'),
('MV117', 'Finished Product Entry: GZFO6', 'ENTRY'),
('MV118', 'Finished Product Entry: GZFL6', 'ENTRY'),
('MV119', 'Finished Product Transfer: GS24P', 'TRANS'),
('MV120', 'Finished Product Transfer: GS24U', 'TRANS'),
('MV121', 'Finished Product Transfer: GZFO6', 'TRANS'),
('MV122', 'Finished Product Transfer: GZFL6', 'TRANS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `MOVEMENT_FINISHED_PRODUCT`
--

CREATE TABLE `MOVEMENT_FINISHED_PRODUCT` (
  `num` int NOT NULL,
  `movement` varchar(5) NOT NULL,
  `finishedProduct` varchar(5) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MOVEMENT_FINISHED_PRODUCT`
--

INSERT INTO `MOVEMENT_FINISHED_PRODUCT` (`num`, `movement`, `finishedProduct`, `date`, `quantity`) VALUES
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
-- Estructura de tabla para la tabla `MOVEMENT_RAW_MATERIAL`
--

CREATE TABLE `MOVEMENT_RAW_MATERIAL` (
  `num` int NOT NULL,
  `movement` varchar(5) NOT NULL,
  `rawMaterial` varchar(5) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MOVEMENT_RAW_MATERIAL`
--

INSERT INTO `MOVEMENT_RAW_MATERIAL` (`num`, `movement`, `rawMaterial`, `date`, `quantity`) VALUES
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
-- Estructura de tabla para la tabla `MOVEMENT_TYPE`
--

CREATE TABLE `MOVEMENT_TYPE` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `MOVEMENT_TYPE`
--

INSERT INTO `MOVEMENT_TYPE` (`code`, `description`) VALUES
('AJUST', 'Adjustment'),
('ENTRY', 'Entry'),
('EXIT', 'Exit'),
('TRANS', 'Transfer');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRODUCTION_LINE`
--

CREATE TABLE `PRODUCTION_LINE` (
  `num` int NOT NULL,
  `name` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `PRODUCTION_LINE`
--

INSERT INTO `PRODUCTION_LINE` (`num`, `name`) VALUES
(1, 'Complete Assembly'),
(2, 'Complete Assembly'),
(3, 'Complete Assembly');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PRODUCTION_LINE_FINISHED_PRODUCT`
--

CREATE TABLE `PRODUCTION_LINE_FINISHED_PRODUCT` (
  `num` int NOT NULL,
  `productionLine` int NOT NULL,
  `finishedProduct` varchar(5) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `PRODUCTION_LINE_FINISHED_PRODUCT`
--

INSERT INTO `PRODUCTION_LINE_FINISHED_PRODUCT` (`num`, `productionLine`, `finishedProduct`, `date`, `quantity`) VALUES
(1, 1, 'GS24P', '2024-11-06 12:28:49', 20),
(2, 1, 'GS24U', '2024-11-06 12:58:49', 16),
(3, 2, 'GZFO6', '2024-11-06 13:28:49', 12),
(4, 3, 'GZFL6', '2024-11-06 13:58:49', 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PURCHASE_RAW_MATERIAL`
--

CREATE TABLE `PURCHASE_RAW_MATERIAL` (
  `rawMaterial` varchar(5) NOT NULL,
  `purchaseRequest` int NOT NULL,
  `quantity` int NOT NULL,
  `cost` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `PURCHASE_RAW_MATERIAL`
--

INSERT INTO `PURCHASE_RAW_MATERIAL` (`rawMaterial`, `purchaseRequest`, `quantity`, `cost`) VALUES
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
-- Estructura de tabla para la tabla `PURCHASE_REQUEST`
--

CREATE TABLE `PURCHASE_REQUEST` (
  `num` int NOT NULL,
  `date` datetime NOT NULL,
  `totalQuantityPerMaterial` int NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `VAT` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `purchaseRequestStatus` varchar(5) DEFAULT NULL,
  `employee` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `PURCHASE_REQUEST`
--

INSERT INTO `PURCHASE_REQUEST` (`num`, `date`, `totalQuantityPerMaterial`, `subtotal`, `VAT`, `total`, `purchaseRequestStatus`, `employee`) VALUES
(1, '2024-11-04 13:00:00', 80, 1029600.00, 164736.00, 1194336.00, 'INPRO', 15),
(2, '2024-11-04 14:15:22', 80, 2700000.00, 432000.00, 3132000.00, 'ACCEP', 15),
(3, '2024-11-04 15:02:40', 80, 3020800.00, 483328.00, 3504128.00, 'ACCEP', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PURCHASE_REQUEST_STATUS`
--

CREATE TABLE `PURCHASE_REQUEST_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `PURCHASE_REQUEST_STATUS`
--

INSERT INTO `PURCHASE_REQUEST_STATUS` (`code`, `description`) VALUES
('ACCEP', 'Accepted'),
('CANCE', 'Canceled'),
('INPRO', 'In Process');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RAW_MATERIAL`
--

CREATE TABLE `RAW_MATERIAL` (
  `code` varchar(5) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(256) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `length` decimal(10,2) NOT NULL,
  `height` decimal(10,2) NOT NULL,
  `width` decimal(10,2) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `volume` decimal(10,2) NOT NULL,
  `stock` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `RAW_MATERIAL`
--

INSERT INTO `RAW_MATERIAL` (`code`, `name`, `description`, `cost`, `length`, `height`, `width`, `weight`, `volume`, `stock`) VALUES
('AIF6P', 'Internal Storage Z Flip 6', '128 GB UFS 3.1 Storage', 900.00, 0.60, 0.65, 0.15, 20.00, 0.59, 62),
('AIS24', 'Internal Storage S24', '128 GB UFS 3.1 Storage', 900.00, 0.60, 0.65, 0.15, 20.00, 0.59, 0),
('AIS4P', 'Internal Storage S24+', '256 GB UFS 3.1 Storage', 1260.00, 0.65, 0.65, 0.15, 30.00, 0.63, 60),
('AIUM5', 'Internal Storage S24 Ultra', '256 GB UFS 3.1 Storage', 1440.00, 0.70, 0.70, 0.15, 30.00, 0.73, 64),
('AIZF6', 'Internal Storage Z Fold 6', '256 GB UFS 3.1 Storage', 1620.00, 0.70, 0.70, 0.15, 30.00, 0.73, 68),
('BALS2', 'Li-ion Battery S24', '3900 mAh Battery', 270.00, 0.60, 7.50, 0.30, 45.00, 1.35, 0),
('BAZF6', 'Li-ion Battery Z Fold 6', '4500 mAh Battery', 450.00, 0.70, 8.00, 0.40, 60.00, 2.24, 68),
('BFLP6', 'Li-ion Battery Z Flip 6', '3500 mAh Battery', 360.00, 0.70, 8.00, 0.30, 50.00, 1.68, 62),
('BLA4S', 'Li-ion Battery S24+', '4900 mAh Battery', 360.00, 0.70, 8.00, 0.35, 55.00, 1.96, 60),
('BLUM5', 'Li-ion Battery S24 Ultra', '5000 mAh Battery', 450.00, 0.75, 8.00, 0.40, 65.00, 2.24, 64),
('CAZ6F', 'Front Camera Z Flip 6', '10 MP Camera', 450.00, 0.50, 3.50, 0.20, 8.00, 0.35, 62),
('CCS24', 'Chassis S24', 'Aluminum Chassis with Gorilla Glass Victus 2', 1080.00, 7.50, 16.00, 0.80, 100.00, 9.60, 0),
('CCS4P', 'Chassis S24+', 'Aluminum Chassis with Gorilla Glass Victus 2', 1170.00, 8.00, 16.50, 0.85, 120.00, 11.00, 60),
('CCUM5', 'Chassis S24 Ultra', 'Aluminum Chassis with Gorilla Glass Victus 2', 1620.00, 8.50, 17.00, 0.90, 150.00, 13.00, 64),
('CCZ6P', 'Chassis Z Flip 6', 'Samsung Galaxy Z Flip 6 Outer Chassis', 740.00, 8.60, 7.40, 1.60, 50.00, 101.10, 62),
('CCZF6', 'Chassis Z Fold 6', 'Samsung Galaxy Z Fold 6 Outer Chassis', 1200.00, 16.20, 7.60, 1.60, 75.00, 198.72, 68),
('CFS24', 'Front Camera S24', '12 MP Camera', 360.00, 0.50, 3.50, 0.20, 8.00, 0.35, 0),
('CFS4P', 'Front Camera S24+', '12 MP Camera', 450.00, 0.50, 3.50, 0.25, 10.00, 0.44, 60),
('CFUM5', 'Front Camera S24 Ultra', '12 MP Camera', 540.00, 0.55, 3.50, 0.30, 12.00, 0.58, 64),
('CFZ6F', 'Front Camera Z Fold 6', '10 MP Camera', 540.00, 0.50, 3.50, 0.20, 8.00, 0.35, 68),
('CPS24', 'Main Camera S24', '50 MP Wide-angle Camera', 540.00, 0.50, 6.00, 0.25, 12.00, 0.75, 0),
('CPS4P', 'Main Camera S24+', '50 MP Wide-angle Camera', 630.00, 0.50, 6.00, 0.25, 15.00, 0.75, 60),
('CPU5S', 'Main Camera S24 Ultra', '200 MP Wide-angle Camera', 1080.00, 0.70, 6.50, 0.30, 20.00, 1.37, 64),
('CPZF6', 'Main Camera Z Fold 6', '50 MP Wide-angle Camera', 720.00, 0.50, 6.00, 0.25, 15.00, 0.75, 68),
('CZF6P', 'Main Camera Z Flip 6', '50 MP Wide-angle Camera', 720.00, 0.50, 6.00, 0.25, 12.00, 0.75, 62),
('MAZ6F', 'RAM Memory Z Flip 6', '8 GB LPDDR5 RAM', 720.00, 0.70, 1.00, 0.15, 25.00, 1.05, 62),
('MR8SP', 'RAM Memory 8GB S24+', '8 GB LPDDR5 RAM', 810.00, 0.70, 1.00, 0.15, 30.00, 1.05, 60),
('MRS24', 'RAM Memory S24', '8 GB LPDDR5 RAM', 720.00, 0.70, 1.00, 0.15, 25.00, 1.05, 0),
('MRUM5', 'RAM Memory S24 Ultra', '12 GB LPDDR5 RAM', 1080.00, 0.75, 1.00, 0.20, 35.00, 1.40, 64),
('MRZ6F', 'RAM Memory Z Fold 6', '12 GB LPDDR5 RAM', 1260.00, 0.70, 1.00, 0.20, 40.00, 1.40, 68),
('PAMS2', 'AMOLED Screen S24', 'Dynamic AMOLED 2X Screen 6.1 120 Hz HDR10+', 3600.00, 6.10, 13.06, 0.07, 35.00, 2.60, 0),
('PAUM5', 'AMOLED Screen S24 Ultra', 'Dynamic AMOLED 2X Screen 6.8 120 Hz HDR10+', 5400.00, 6.80, 15.50, 0.09, 70.00, 4.40, 64),
('PB4S4', 'Motherboard S24+', 'Motherboard with All Integrated Components', 1980.00, 7.50, 11.50, 0.30, 130.00, 26.00, 60),
('PBBS2', 'Motherboard S24', 'Motherboard with All Integrated Components', 1800.00, 7.00, 10.00, 0.30, 120.00, 21.00, 0),
('PBU5S', 'Motherboard S24 Ultra', 'Motherboard with All Integrated Components', 2700.00, 8.00, 12.00, 0.35, 150.00, 33.60, 64),
('PBZ6F', 'Motherboard Z Flip 6', 'Motherboard with All Integrated Components', 1800.00, 7.00, 10.00, 0.30, 120.00, 21.00, 62),
('PBZF6', 'Motherboard Z Fold 6', 'Motherboard with All Integrated Components', 2700.00, 8.00, 12.00, 0.35, 150.00, 33.60, 68),
('PE4SP', 'Processor Exynos S24+', 'Qualcomm Snapdragon 8 Gen 3', 3780.00, 0.70, 0.70, 0.25, 12.00, 0.12, 60),
('PEF6L', 'Exterior Screen Super AMOLED Z Fold 6', 'Dynamic AMOLED 2X Screen 6.2', 2700.00, 6.20, 13.00, 0.70, 35.00, 2.50, 68),
('PEF6P', 'Exterior Screen Super AMOLED Z Flip 6', 'Super AMOLED Screen 1.9', 1800.00, 1.90, 6.00, 0.70, 15.00, 0.80, 62),
('PES24', 'Processor Exynos S24', 'Qualcomm Snapdragon 8 Gen 3', 3600.00, 0.70, 0.70, 0.25, 10.00, 0.12, 0),
('PEUM5', 'Processor Exynos S24 Ultra', 'Qualcomm Snapdragon 8 Gen 3', 4500.00, 0.80, 0.80, 0.30, 15.00, 0.24, 64),
('PFLP6', 'Main Screen Flex AMOLED Z Flip 6', 'Dynamic AMOLED 2X Foldable Screen 6.7', 5400.00, 6.70, 15.00, 0.80, 55.00, 3.50, 62),
('PFOL6', 'Main Screen Flex AMOLED Z Fold 6', 'Dynamic AMOLED 2X Foldable Screen 7.6', 6300.00, 7.60, 16.00, 0.80, 70.00, 5.50, 68),
('PMA4S', 'AMOLED Screen S24+', 'Dynamic AMOLED 2X Screen 6.7 120 Hz HDR10+', 4500.00, 6.70, 14.50, 0.08, 55.00, 3.50, 60),
('PSZ6F', 'Processor Snapdragon Z Flip 6', 'Qualcomm Snapdragon 8 Gen 3', 3780.00, 0.70, 0.70, 0.25, 10.00, 0.12, 62),
('PSZF6', 'Processor Snapdragon Z Fold 6', 'Qualcomm Snapdragon 8 Gen 3', 3600.00, 0.70, 0.70, 0.25, 10.00, 0.12, 68);

--
-- Disparadores `RAW_MATERIAL`
--
DELIMITER $$
CREATE TRIGGER `calculateRawMaterialVolume` BEFORE INSERT ON `RAW_MATERIAL` FOR EACH ROW BEGIN
    SET NEW.volume = NEW.length * NEW.height * NEW.width$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RAW_MATERIAL_FINISHED_PRODUCT`
--

CREATE TABLE `RAW_MATERIAL_FINISHED_PRODUCT` (
  `num` int NOT NULL,
  `rawMaterial` varchar(5) NOT NULL,
  `finishedProduct` varchar(5) NOT NULL,
  `quantity` int NOT NULL,
  `totalMaterialCost` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `RAW_MATERIAL_FINISHED_PRODUCT`
--

INSERT INTO `RAW_MATERIAL_FINISHED_PRODUCT` (`num`, `rawMaterial`, `finishedProduct`, `quantity`, `totalMaterialCost`) VALUES
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

--
-- Disparadores `RAW_MATERIAL_FINISHED_PRODUCT`
--
DELIMITER $$
CREATE TRIGGER `calculateTotalMaterialCost` BEFORE INSERT ON `RAW_MATERIAL_FINISHED_PRODUCT` FOR EACH ROW BEGIN
    DECLARE materialCost DECIMAL(10,2)$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updateNetCostFinishedProduct` AFTER INSERT ON `RAW_MATERIAL_FINISHED_PRODUCT` FOR EACH ROW BEGIN
    DECLARE totalCost DECIMAL(10,2)$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `RAW_MATERIAL_LOT`
--

CREATE TABLE `RAW_MATERIAL_LOT` (
  `num` int NOT NULL,
  `rawMaterial` varchar(5) NOT NULL,
  `lot` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `RAW_MATERIAL_LOT`
--

INSERT INTO `RAW_MATERIAL_LOT` (`num`, `rawMaterial`, `lot`, `quantity`) VALUES
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
-- Estructura de tabla para la tabla `REQUISITION`
--

CREATE TABLE `REQUISITION` (
  `num` int NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `employee` int DEFAULT NULL,
  `productionLine` int DEFAULT NULL,
  `requisitionStatus` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `REQUISITION`
--

INSERT INTO `REQUISITION` (`num`, `description`, `employee`, `productionLine`, `requisitionStatus`) VALUES
(1, 'Requisition for the product GYS24', 15, 1, 'PENDI'),
(2, 'Requisition for the products GS24P and GS24U', 15, 2, 'APPRO'),
(3, 'Requisition for the products GZFO6 and GZFL6', 15, 3, 'APPRO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REQUISITION_RAW_MATERIAL`
--

CREATE TABLE `REQUISITION_RAW_MATERIAL` (
  `num` int NOT NULL,
  `requisition` int NOT NULL,
  `rawMaterial` varchar(5) NOT NULL,
  `date` datetime NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `REQUISITION_RAW_MATERIAL`
--

INSERT INTO `REQUISITION_RAW_MATERIAL` (`num`, `requisition`, `rawMaterial`, `date`, `quantity`) VALUES
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

--
-- Disparadores `REQUISITION_RAW_MATERIAL`
--
DELIMITER $$
CREATE TRIGGER `updateRawMaterialStock` BEFORE INSERT ON `REQUISITION_RAW_MATERIAL` FOR EACH ROW BEGIN
    DECLARE currentStock INT$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `validateEstadoRequisicion` BEFORE INSERT ON `REQUISITION_RAW_MATERIAL` FOR EACH ROW BEGIN
    DECLARE requisitionSts VARCHAR(5)$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `REQUISITION_STATUS`
--

CREATE TABLE `REQUISITION_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `REQUISITION_STATUS`
--

INSERT INTO `REQUISITION_STATUS` (`code`, `description`) VALUES
('APPRO', 'Approved'),
('CANCE', 'Canceled'),
('PENDI', 'Pending');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ROLE`
--

CREATE TABLE `ROLE` (
  `code` varchar(5) NOT NULL,
  `description` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `ROLE`
--

INSERT INTO `ROLE` (`code`, `description`) VALUES
('PARRM', 'Purchase and requisition raw materials'),
('RRVIN', 'Register, receive, and verify inventory'),
('UMINV', 'Update and manage inventories'),
('USCSC', 'User creation and system configuration');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `STORAGE`
--

CREATE TABLE `STORAGE` (
  `code` varchar(5) NOT NULL,
  `quantity` int NOT NULL,
  `description` varchar(48) NOT NULL,
  `rawMaterial` varchar(5) DEFAULT NULL,
  `finishedProduct` varchar(5) DEFAULT NULL,
  `location` varchar(8) DEFAULT NULL,
  `area` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `STORAGE`
--

INSERT INTO `STORAGE` (`code`, `quantity`, `description`, `rawMaterial`, `finishedProduct`, `location`, `area`) VALUES
('RG001', 60, 'Storage of PMA4S inside the warehouse', 'PMA4S', NULL, '01A0104A', 'RMARE'),
('RG002', 60, 'Storage of BLA4S inside the warehouse', 'BLA4S', NULL, '01A0104B', 'RMARE'),
('RG003', 60, 'Storage of CPS4P inside the warehouse', 'CPS4P', NULL, '01A0104C', 'RMARE'),
('RG004', 60, 'Storage of CFS4P inside the warehouse', 'CFS4P', NULL, '01A0201A', 'RMARE'),
('RG005', 60, 'Storage of PE4SP inside the warehouse', 'PE4SP', NULL, '01A0201B', 'RMARE'),
('RG006', 60, 'Storage of MR8SP inside the warehouse', 'MR8SP', NULL, '01A0201C', 'RMARE'),
('RG007', 60, 'Storage of AIS4P inside the warehouse', 'AIS4P', NULL, '01A0202A', 'RMARE'),
('RG008', 60, 'Storage of PB4S4 inside the warehouse', 'PB4S4', NULL, '01A0202B', 'RMARE'),
('RG009', 60, 'Storage of CCS4P inside the warehouse', 'CCS4P', NULL, '01A0202C', 'RMARE'),
('RG010', 64, 'Storage of PAUM5 inside the warehouse', 'PAUM5', NULL, '01A0203A', 'RMARE'),
('RG011', 64, 'Storage of BLUM5 inside the warehouse', 'BLUM5', NULL, '01A0203B', 'RMARE'),
('RG012', 64, 'Storage of CPU5S inside the warehouse', 'CPU5S', NULL, '01A0203C', 'RMARE'),
('RG013', 64, 'Storage of CFUM5 inside the warehouse', 'CFUM5', NULL, '01A0204A', 'RMARE'),
('RG014', 64, 'Storage of PEUM5 inside the warehouse', 'PEUM5', NULL, '01A0204B', 'RMARE'),
('RG015', 64, 'Storage of MRUM5 inside the warehouse', 'MRUM5', NULL, '01A0204C', 'RMARE'),
('RG016', 64, 'Storage of AIUM5 inside the warehouse', 'AIUM5', NULL, '01A0301A', 'RMARE'),
('RG017', 64, 'Storage of PBU5S inside the warehouse', 'PBU5S', NULL, '01A0301B', 'RMARE'),
('RG018', 64, 'Storage of CCUM5 inside the warehouse', 'CCUM5', NULL, '01A0301C', 'RMARE'),
('RG019', 68, 'Storage of PFOL6 inside the warehouse', 'PFOL6', NULL, '01A0302A', 'RMARE'),
('RG020', 68, 'Storage of PEF6L inside the warehouse', 'PEF6L', NULL, '01A0302B', 'RMARE'),
('RG021', 68, 'Storage of BAZF6 inside the warehouse', 'BAZF6', NULL, '01A0302C', 'RMARE'),
('RG022', 68, 'Storage of CPZF6 inside the warehouse', 'CPZF6', NULL, '01A0303A', 'RMARE'),
('RG023', 68, 'Storage of CFZ6F inside the warehouse', 'CFZ6F', NULL, '01A0303B', 'RMARE'),
('RG024', 68, 'Storage of PSZF6 inside the warehouse', 'PSZF6', NULL, '01A0303C', 'RMARE'),
('RG025', 68, 'Storage of MRZ6F inside the warehouse', 'MRZ6F', NULL, '01A0304A', 'RMARE'),
('RG026', 68, 'Storage of AIZF6 inside the warehouse', 'AIZF6', NULL, '01A0304B', 'RMARE'),
('RG027', 68, 'Storage of PBZF6 inside the warehouse', 'PBZF6', NULL, '01A0304C', 'RMARE'),
('RG028', 68, 'Storage of CCZF6 inside the warehouse', 'CCZF6', NULL, '01A0401A', 'RMARE'),
('RG029', 62, 'Storage of PFLP6 inside the warehouse', 'PFLP6', NULL, '01A0401B', 'RMARE'),
('RG030', 62, 'Storage of PEF6P inside the warehouse', 'PEF6P', NULL, '01A0401C', 'RMARE'),
('RG031', 62, 'Storage of BFLP6 inside the warehouse', 'BFLP6', NULL, '01A0402A', 'RMARE'),
('RG032', 62, 'Storage of CZF6P inside the warehouse', 'CZF6P', NULL, '01A0402B', 'RMARE'),
('RG033', 62, 'Storage of CFZ6F inside the warehouse', 'CAZ6F', NULL, '01A0402C', 'RMARE'),
('RG034', 62, 'Storage of PSZ6F inside the warehouse', 'PSZ6F', NULL, '01A0403A', 'RMARE'),
('RG035', 62, 'Storage of MRZ6F inside the warehouse', 'MAZ6F', NULL, '01A0403B', 'RMARE'),
('RG036', 62, 'Storage of AIF6P inside the warehouse', 'AIF6P', NULL, '01A0403C', 'RMARE'),
('RG037', 62, 'Storage of PBZ6F inside the warehouse', 'PBZ6F', NULL, '01A0404A', 'RMARE'),
('RG038', 62, 'Storage of CCZ6P inside the warehouse', 'CCZ6P', NULL, '01A0404B', 'RMARE'),
('RG039', 20, 'Storage of GS24P inside the warehouse', NULL, 'GS24P', '02A0101A', 'FPARE'),
('RG040', 16, 'Storage of GS24U inside the warehouse', NULL, 'GS24U', '02A0101B', 'FPARE'),
('RG041', 12, 'Storage of GZFO6 inside the warehouse', NULL, 'GZFO6', '02A0101C', 'FPARE'),
('RG042', 18, 'Storage of GZFL6 inside the warehouse', NULL, 'GZFL6', '02A0102A', 'FPARE');

--
-- Disparadores `STORAGE`
--
DELIMITER $$
CREATE TRIGGER `validateStockCapacity` BEFORE INSERT ON `STORAGE` FOR EACH ROW BEGIN
    DECLARE maxCapacity INT$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `USER`
--

CREATE TABLE `USER` (
  `num` int NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(16) NOT NULL,
  `employee` int DEFAULT NULL,
  `role` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `USER`
--

INSERT INTO `USER` (`num`, `username`, `password`, `employee`, `role`) VALUES
(1, 'Gbarrios', 'HT_Gbarrios', 1, 'USCSC'),
(2, 'Bgonzalez', 'HT_Bgonzalez', 2, 'USCSC'),
(3, 'Acuevas', 'HT_Acuevas', 3, 'USCSC'),
(4, 'Ysalazar', 'HT_Ysalazar', 4, 'USCSC'),
(5, 'Aperez', 'HT_Aperez', 5, 'UMINV'),
(6, 'Ogonzalez', 'HT_Ogonzalez', 6, 'UMINV'),
(7, 'Agonzalez', 'HT_Agonzalez', 7, 'UMINV'),
(8, 'Hgonzalez', 'HT_Hgonzalez', 8, 'UMINV'),
(9, 'Eruiz', 'HT_Eruiz', 9, 'UMINV'),
(10, 'Cmartinez', 'HT_Cmartinez', 10, 'RRVIN'),
(11, 'Esalazar', 'HT_Esalazar', 11, 'RRVIN'),
(12, 'Csoto', 'HT_Csoto', 12, 'RRVIN'),
(13, 'Kgarfias', 'HT_Kgarfias', 13, 'RRVIN'),
(14, 'Cquintana', 'HT_Cquintana', 14, 'RRVIN'),
(15, 'Gherrera', 'HT_Gherrera', 15, 'PARRM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VERIFICATION`
--

CREATE TABLE `VERIFICATION` (
  `num` int NOT NULL,
  `receivedQuantity` int NOT NULL,
  `defectiveQuantity` int NOT NULL,
  `acceptedQuantity` int NOT NULL,
  `observations` varchar(128) DEFAULT NULL,
  `verificationStatus` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `VERIFICATION`
--

INSERT INTO `VERIFICATION` (`num`, `receivedQuantity`, `defectiveQuantity`, `acceptedQuantity`, `observations`, `verificationStatus`) VALUES
(1, 80, 0, 0, 'Pending validation', 'INPRO'),
(2, 80, 0, 80, 'Validation successful with no loss', 'FINIS'),
(3, 80, 0, 80, 'Validation successful with no loss', 'FINIS'),
(4, 80, 0, 80, 'Validation successful with no loss', 'FINIS'),
(5, 80, 0, 80, 'Validation successful with no loss', 'FINIS');

--
-- Disparadores `VERIFICATION`
--
DELIMITER $$
CREATE TRIGGER `updateLotPercentage` AFTER UPDATE ON `VERIFICATION` FOR EACH ROW BEGIN
    DECLARE lot INT$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `VERIFICATION_STATUS`
--

CREATE TABLE `VERIFICATION_STATUS` (
  `code` varchar(5) NOT NULL,
  `description` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `VERIFICATION_STATUS`
--

INSERT INTO `VERIFICATION_STATUS` (`code`, `description`) VALUES
('FINIS', 'Finished'),
('INPRO', 'In progress');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `AREA`
--
ALTER TABLE `AREA`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD PRIMARY KEY (`num`),
  ADD KEY `jobPosition` (`jobPosition`),
  ADD KEY `employeeStatus` (`employeeStatus`);

--
-- Indices de la tabla `EMPLOYEE_STATUS`
--
ALTER TABLE `EMPLOYEE_STATUS`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `FINISHED_PRODUCT`
--
ALTER TABLE `FINISHED_PRODUCT`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `JOB_POSITION`
--
ALTER TABLE `JOB_POSITION`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `LOCATION`
--
ALTER TABLE `LOCATION`
  ADD PRIMARY KEY (`code`),
  ADD KEY `area` (`area`);

--
-- Indices de la tabla `LOT`
--
ALTER TABLE `LOT`
  ADD PRIMARY KEY (`num`),
  ADD KEY `lotStatus` (`lotStatus`),
  ADD KEY `purchaseRequest` (`purchaseRequest`);

--
-- Indices de la tabla `LOT_STATUS`
--
ALTER TABLE `LOT_STATUS`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `LOT_VERIFICATION`
--
ALTER TABLE `LOT_VERIFICATION`
  ADD PRIMARY KEY (`num`,`verification`,`lot`),
  ADD KEY `verification` (`verification`),
  ADD KEY `lot` (`lot`);

--
-- Indices de la tabla `MOVEMENT`
--
ALTER TABLE `MOVEMENT`
  ADD PRIMARY KEY (`code`),
  ADD KEY `movementType` (`movementType`);

--
-- Indices de la tabla `MOVEMENT_FINISHED_PRODUCT`
--
ALTER TABLE `MOVEMENT_FINISHED_PRODUCT`
  ADD PRIMARY KEY (`num`,`movement`,`finishedProduct`),
  ADD KEY `movement` (`movement`),
  ADD KEY `finishedProduct` (`finishedProduct`);

--
-- Indices de la tabla `MOVEMENT_RAW_MATERIAL`
--
ALTER TABLE `MOVEMENT_RAW_MATERIAL`
  ADD PRIMARY KEY (`num`,`movement`,`rawMaterial`),
  ADD KEY `movement` (`movement`),
  ADD KEY `rawMaterial` (`rawMaterial`);

--
-- Indices de la tabla `MOVEMENT_TYPE`
--
ALTER TABLE `MOVEMENT_TYPE`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `PRODUCTION_LINE`
--
ALTER TABLE `PRODUCTION_LINE`
  ADD PRIMARY KEY (`num`);

--
-- Indices de la tabla `PRODUCTION_LINE_FINISHED_PRODUCT`
--
ALTER TABLE `PRODUCTION_LINE_FINISHED_PRODUCT`
  ADD PRIMARY KEY (`num`,`productionLine`,`finishedProduct`),
  ADD KEY `productionLine` (`productionLine`),
  ADD KEY `finishedProduct` (`finishedProduct`);

--
-- Indices de la tabla `PURCHASE_RAW_MATERIAL`
--
ALTER TABLE `PURCHASE_RAW_MATERIAL`
  ADD PRIMARY KEY (`rawMaterial`,`purchaseRequest`),
  ADD KEY `purchaseRequest` (`purchaseRequest`);

--
-- Indices de la tabla `PURCHASE_REQUEST`
--
ALTER TABLE `PURCHASE_REQUEST`
  ADD PRIMARY KEY (`num`),
  ADD KEY `purchaseRequestStatus` (`purchaseRequestStatus`),
  ADD KEY `employee` (`employee`);

--
-- Indices de la tabla `PURCHASE_REQUEST_STATUS`
--
ALTER TABLE `PURCHASE_REQUEST_STATUS`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `RAW_MATERIAL`
--
ALTER TABLE `RAW_MATERIAL`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `RAW_MATERIAL_FINISHED_PRODUCT`
--
ALTER TABLE `RAW_MATERIAL_FINISHED_PRODUCT`
  ADD PRIMARY KEY (`num`,`rawMaterial`,`finishedProduct`),
  ADD KEY `rawMaterial` (`rawMaterial`),
  ADD KEY `finishedProduct` (`finishedProduct`);

--
-- Indices de la tabla `RAW_MATERIAL_LOT`
--
ALTER TABLE `RAW_MATERIAL_LOT`
  ADD PRIMARY KEY (`num`,`rawMaterial`,`lot`),
  ADD KEY `rawMaterial` (`rawMaterial`),
  ADD KEY `lot` (`lot`);

--
-- Indices de la tabla `REQUISITION`
--
ALTER TABLE `REQUISITION`
  ADD PRIMARY KEY (`num`),
  ADD KEY `employee` (`employee`),
  ADD KEY `productionLine` (`productionLine`),
  ADD KEY `requisitionStatus` (`requisitionStatus`);

--
-- Indices de la tabla `REQUISITION_RAW_MATERIAL`
--
ALTER TABLE `REQUISITION_RAW_MATERIAL`
  ADD PRIMARY KEY (`num`,`requisition`,`rawMaterial`),
  ADD KEY `requisition` (`requisition`),
  ADD KEY `rawMaterial` (`rawMaterial`);

--
-- Indices de la tabla `REQUISITION_STATUS`
--
ALTER TABLE `REQUISITION_STATUS`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `ROLE`
--
ALTER TABLE `ROLE`
  ADD PRIMARY KEY (`code`);

--
-- Indices de la tabla `STORAGE`
--
ALTER TABLE `STORAGE`
  ADD PRIMARY KEY (`code`),
  ADD KEY `rawMaterial` (`rawMaterial`),
  ADD KEY `finishedProduct` (`finishedProduct`),
  ADD KEY `location` (`location`),
  ADD KEY `area` (`area`);

--
-- Indices de la tabla `USER`
--
ALTER TABLE `USER`
  ADD PRIMARY KEY (`num`),
  ADD KEY `employee` (`employee`),
  ADD KEY `role` (`role`);

--
-- Indices de la tabla `VERIFICATION`
--
ALTER TABLE `VERIFICATION`
  ADD PRIMARY KEY (`num`),
  ADD KEY `verificationStatus` (`verificationStatus`);

--
-- Indices de la tabla `VERIFICATION_STATUS`
--
ALTER TABLE `VERIFICATION_STATUS`
  ADD PRIMARY KEY (`code`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `LOT`
--
ALTER TABLE `LOT`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `LOT_VERIFICATION`
--
ALTER TABLE `LOT_VERIFICATION`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `MOVEMENT_FINISHED_PRODUCT`
--
ALTER TABLE `MOVEMENT_FINISHED_PRODUCT`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `MOVEMENT_RAW_MATERIAL`
--
ALTER TABLE `MOVEMENT_RAW_MATERIAL`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT de la tabla `PRODUCTION_LINE`
--
ALTER TABLE `PRODUCTION_LINE`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `PRODUCTION_LINE_FINISHED_PRODUCT`
--
ALTER TABLE `PRODUCTION_LINE_FINISHED_PRODUCT`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `PURCHASE_REQUEST`
--
ALTER TABLE `PURCHASE_REQUEST`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `RAW_MATERIAL_FINISHED_PRODUCT`
--
ALTER TABLE `RAW_MATERIAL_FINISHED_PRODUCT`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `RAW_MATERIAL_LOT`
--
ALTER TABLE `RAW_MATERIAL_LOT`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `REQUISITION`
--
ALTER TABLE `REQUISITION`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `REQUISITION_RAW_MATERIAL`
--
ALTER TABLE `REQUISITION_RAW_MATERIAL`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `USER`
--
ALTER TABLE `USER`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `VERIFICATION`
--
ALTER TABLE `VERIFICATION`
  MODIFY `num` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `EMPLOYEE`
--
ALTER TABLE `EMPLOYEE`
  ADD CONSTRAINT `EMPLOYEE_ibfk_1` FOREIGN KEY (`jobPosition`) REFERENCES `JOB_POSITION` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `EMPLOYEE_ibfk_2` FOREIGN KEY (`employeeStatus`) REFERENCES `EMPLOYEE_STATUS` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `LOCATION`
--
ALTER TABLE `LOCATION`
  ADD CONSTRAINT `LOCATION_ibfk_1` FOREIGN KEY (`area`) REFERENCES `AREA` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `LOT`
--
ALTER TABLE `LOT`
  ADD CONSTRAINT `LOT_ibfk_1` FOREIGN KEY (`lotStatus`) REFERENCES `LOT_STATUS` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `LOT_ibfk_2` FOREIGN KEY (`purchaseRequest`) REFERENCES `PURCHASE_REQUEST` (`num`) ON DELETE CASCADE;

--
-- Filtros para la tabla `LOT_VERIFICATION`
--
ALTER TABLE `LOT_VERIFICATION`
  ADD CONSTRAINT `LOT_VERIFICATION_ibfk_1` FOREIGN KEY (`verification`) REFERENCES `VERIFICATION` (`num`) ON DELETE CASCADE,
  ADD CONSTRAINT `LOT_VERIFICATION_ibfk_2` FOREIGN KEY (`lot`) REFERENCES `LOT` (`num`) ON DELETE CASCADE;

--
-- Filtros para la tabla `MOVEMENT`
--
ALTER TABLE `MOVEMENT`
  ADD CONSTRAINT `MOVEMENT_ibfk_1` FOREIGN KEY (`movementType`) REFERENCES `MOVEMENT_TYPE` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `MOVEMENT_FINISHED_PRODUCT`
--
ALTER TABLE `MOVEMENT_FINISHED_PRODUCT`
  ADD CONSTRAINT `MOVEMENT_FINISHED_PRODUCT_ibfk_1` FOREIGN KEY (`movement`) REFERENCES `MOVEMENT` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `MOVEMENT_FINISHED_PRODUCT_ibfk_2` FOREIGN KEY (`finishedProduct`) REFERENCES `FINISHED_PRODUCT` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `MOVEMENT_RAW_MATERIAL`
--
ALTER TABLE `MOVEMENT_RAW_MATERIAL`
  ADD CONSTRAINT `MOVEMENT_RAW_MATERIAL_ibfk_1` FOREIGN KEY (`movement`) REFERENCES `MOVEMENT` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `MOVEMENT_RAW_MATERIAL_ibfk_2` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `PRODUCTION_LINE_FINISHED_PRODUCT`
--
ALTER TABLE `PRODUCTION_LINE_FINISHED_PRODUCT`
  ADD CONSTRAINT `PRODUCTION_LINE_FINISHED_PRODUCT_ibfk_1` FOREIGN KEY (`productionLine`) REFERENCES `PRODUCTION_LINE` (`num`) ON DELETE CASCADE,
  ADD CONSTRAINT `PRODUCTION_LINE_FINISHED_PRODUCT_ibfk_2` FOREIGN KEY (`finishedProduct`) REFERENCES `FINISHED_PRODUCT` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `PURCHASE_RAW_MATERIAL`
--
ALTER TABLE `PURCHASE_RAW_MATERIAL`
  ADD CONSTRAINT `PURCHASE_RAW_MATERIAL_ibfk_1` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `PURCHASE_RAW_MATERIAL_ibfk_2` FOREIGN KEY (`purchaseRequest`) REFERENCES `PURCHASE_REQUEST` (`num`) ON DELETE CASCADE;

--
-- Filtros para la tabla `PURCHASE_REQUEST`
--
ALTER TABLE `PURCHASE_REQUEST`
  ADD CONSTRAINT `PURCHASE_REQUEST_ibfk_1` FOREIGN KEY (`purchaseRequestStatus`) REFERENCES `PURCHASE_REQUEST_STATUS` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `PURCHASE_REQUEST_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `EMPLOYEE` (`num`) ON DELETE CASCADE;

--
-- Filtros para la tabla `RAW_MATERIAL_FINISHED_PRODUCT`
--
ALTER TABLE `RAW_MATERIAL_FINISHED_PRODUCT`
  ADD CONSTRAINT `RAW_MATERIAL_FINISHED_PRODUCT_ibfk_1` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `RAW_MATERIAL_FINISHED_PRODUCT_ibfk_2` FOREIGN KEY (`finishedProduct`) REFERENCES `FINISHED_PRODUCT` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `RAW_MATERIAL_LOT`
--
ALTER TABLE `RAW_MATERIAL_LOT`
  ADD CONSTRAINT `RAW_MATERIAL_LOT_ibfk_1` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `RAW_MATERIAL_LOT_ibfk_2` FOREIGN KEY (`lot`) REFERENCES `LOT` (`num`) ON DELETE CASCADE;

--
-- Filtros para la tabla `REQUISITION`
--
ALTER TABLE `REQUISITION`
  ADD CONSTRAINT `REQUISITION_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `EMPLOYEE` (`num`) ON DELETE CASCADE,
  ADD CONSTRAINT `REQUISITION_ibfk_2` FOREIGN KEY (`productionLine`) REFERENCES `PRODUCTION_LINE` (`num`) ON DELETE CASCADE,
  ADD CONSTRAINT `REQUISITION_ibfk_3` FOREIGN KEY (`requisitionStatus`) REFERENCES `REQUISITION_STATUS` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `REQUISITION_RAW_MATERIAL`
--
ALTER TABLE `REQUISITION_RAW_MATERIAL`
  ADD CONSTRAINT `REQUISITION_RAW_MATERIAL_ibfk_1` FOREIGN KEY (`requisition`) REFERENCES `REQUISITION` (`num`) ON DELETE CASCADE,
  ADD CONSTRAINT `REQUISITION_RAW_MATERIAL_ibfk_2` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `STORAGE`
--
ALTER TABLE `STORAGE`
  ADD CONSTRAINT `STORAGE_ibfk_1` FOREIGN KEY (`rawMaterial`) REFERENCES `RAW_MATERIAL` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `STORAGE_ibfk_2` FOREIGN KEY (`finishedProduct`) REFERENCES `FINISHED_PRODUCT` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `STORAGE_ibfk_3` FOREIGN KEY (`location`) REFERENCES `LOCATION` (`code`) ON DELETE CASCADE,
  ADD CONSTRAINT `STORAGE_ibfk_4` FOREIGN KEY (`area`) REFERENCES `AREA` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `USER`
--
ALTER TABLE `USER`
  ADD CONSTRAINT `USER_ibfk_1` FOREIGN KEY (`employee`) REFERENCES `EMPLOYEE` (`num`) ON DELETE CASCADE,
  ADD CONSTRAINT `USER_ibfk_2` FOREIGN KEY (`role`) REFERENCES `ROLE` (`code`) ON DELETE CASCADE;

--
-- Filtros para la tabla `VERIFICATION`
--
ALTER TABLE `VERIFICATION`
  ADD CONSTRAINT `VERIFICATION_ibfk_1` FOREIGN KEY (`verificationStatus`) REFERENCES `VERIFICATION_STATUS` (`code`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
