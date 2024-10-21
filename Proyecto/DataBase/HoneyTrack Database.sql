CREATE DATABASE HoneyTrack

USE HoneyTrack

/---------------------------------
    TABLAS SIN FOREIGN KEY        
---------------------------------/

/--- 1. TIPO_MOVIMIENTO ---/

CREATE TABLE TIPO_MOVIMIENTO (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(16) NOT NULL
)

/--- 2. LINEA_DE_PROD ---/

CREATE TABLE LINEA_DE_PROD (
    num INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(12) NOT NULL
)

/--- 3. EDO_REQUISICION ---/

CREATE TABLE EDO_REQUISICION (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(16) NOT NULL
)

/--- 4. EDO_SOLICITUD_COMPRA ---/

CREATE TABLE EDO_SOLICITUD_COMPRA (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(16) NOT NULL
)

/--- 5. MATERIA_PRIMA ---/

CREATE TABLE MATERIA_PRIMA (
    codigo VARCHAR(5) PRIMARY KEY NOT NULL,
    nombre VARCHAR(32) NOT NULL,
    descripcion VARCHAR(256) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    ancho DECIMAL(10, 2) NOT NULL,
    largo DECIMAL(10, 2) NOT NULL,
    alto DECIMAL(10, 2) NOT NULL,
    peso DECIMAL(10, 2) NOT NULL,
    volumen DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
)

/--- 6. PROD_TERMINADO ---/

CREATE TABLE PROD_TERMINADO (
    codigo VARCHAR(5) PRIMARY KEY NOT NULL,
    nombre VARCHAR(32) NOT NULL,
    descripcion VARCHAR(256) NOT NULL,
    costoNeto DECIMAL(10, 2) NOT NULL,
    ancho DECIMAL(10, 2) NOT NULL,
    largo DECIMAL(10, 2) NOT NULL,
    alto DECIMAL(10, 2) NOT NULL,
    peso DECIMAL(10, 2) NOT NULL,
    volumen DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
)

/--- 7. PUESTO ---/

CREATE TABLE PUESTO (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(16) NOT NULL
)

/--- 8. EDO_PUESTO ---/

CREATE TABLE EDO_PUESTO (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(16) NOT NULL
)

/--- 9. AREA ---/

CREATE TABLE AREA (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(24) NOT NULL
)

/--- 10. ROL ---/

CREATE TABLE ROL (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(24) NOT NULL
)

/--- 11. EDO_LOTE ---/

CREATE TABLE EDO_LOTE (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(16) NOT NULL
)

/--- 12. VERIFICACION ---/

CREATE TABLE VERIFICACION (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    cantRecibida INT NOT NULL,
    cantDefectuosa INT NOT NULL,
    cantAceptada INT NOT NULL,
    observaciones VARCHAR(128)
)

/--- 13. EDO_VERIFICACION ---/

CREATE TABLE EDO_VERIFICACION (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(16) NOT NULL
)

/---------------------------------
    TABLAS CON FOREIGN KEY 
---------------------------------/

/--- 14. MOVIMIENTO ---/

CREATE TABLE MOVIMIENTO (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(16),
    CANTIDAD INT NOT NULL,
    tipo_movimiento VARCHAR(3),
    verificacion VARCHAR(3),
    FOREIGN KEY (tipo_movimiento) REFERENCES TIPO_MOVIMIENTO(codigo),
    FOREIGN KEY (verificacion) REFERENCES VERIFICACION(codigo)
)

/--- 15. REQUISICION ---/ PONER DESPUES DE EMPLEADO

CREATE TABLE REQUISICION (
    num INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    descripcion VARCHAR(256),
    empleado INT,
    edo_requisicion VARCHAR(3),
    FOREIGN KEY (empleado) REFERENCES EMPLEADO(num),
    FOREIGN KEY (edo_requisicion) REFERENCES EDO_REQUISICION(codigo)
)

/--- 16. EMPLEADO ---/

CREATE TABLE EMPLEADO (
    num INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nombrePila VARCHAR(12) NOT NULL,
    primApell VARCHAR(24) NOT NULL,
    segApell VARCHAR(24),
    numCont VARCHAR(10) NOT NULL,
    correoElectronico VARCHAR(32) NOT NULL,
    rfc VARCHAR(13) NOT NULL,
    puesto VARCHAR(3),
    edo_puesto VARCHAR(3),
    FOREIGN KEY (puesto) REFERENCES PUESTO(codigo),
    FOREIGN KEY (edo_puesto) REFERENCES EDO_PUESTO(codigo)
)

/--- 17. RESGUARDO ---/ PONER DESPUES DE UBICACION

CREATE TABLE RESGUARDO (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    descripcion VARCHAR(32) NOT NULL,
    materia_prima VARCHAR(5),
    prod_terminado VARCHAR(5),
    ubicacion VARCHAR(12),
    area VARCHAR(3),
    FOREIGN KEY (materia_prima) REFERENCES MATERIA_PRIMA(codigo),
    FOREIGN KEY (prod_terminado) REFERENCES PROD_TERMINADO(codigo),
    FOREIGN KEY (ubicacion) REFERENCES UBICACION(codigo),
    FOREIGN KEY (area) REFERENCES AREA(codigo)
)

/--- 18. USUARIO ---/

CREATE TABLE USUARIO (
    num INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    alias VARCHAR(12) NOT NULL,
    contraseña VARCHAR(8) NOT NULL,
    empleado INT,
    rol VARCHAR(3),
    FOREIGN KEY (empleado) REFERENCES EMPLEADO(num),
    FOREIGN KEY (rol) REFERENCES ROL(codigo)
)

/--- 19. SOLICITUD_COMPRA ---/ 

CREATE TABLE SOLICITUD_COMPRA (
    num INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    fecha DATETIME NOT NULL,
    canTotalPorMateria INT NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    IVA DECIMAL(10,2) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    edo_solicitud_compra VARCHAR(3),
    empleado INT,
    FOREIGN KEY (edo_solicitud_compra) REFERENCES EDO_SOLICITUD_COMPRA(codigo),
    FOREIGN KEY (empleado) REFERENCES EMPLEADO(num)
)

/--- 20. LOTE ---/

CREATE TABLE LOTE (
    codigo VARCHAR(3) PRIMARY KEY NOT NULL,
    numLote INT NOT NULL,
    descripcion VARCHAR(256) NOT NULL,
    edo_lote VARCHAR(3),
    FOREIGN KEY (edo_lote) REFERENCES EDO_LOTE(codigo)
)

/--- 21. UBICACION ---/

CREATE TABLE UBICACION (
    codigo VARCHAR(12) PRIMARY KEY NOT NULL,
    pasillo INT NOT NULL,
    lado VARCHAR(1),
    bahia INT NOT NULL, 
    nivel VARCHAR(1),
    posicion INT NOT NULL,
    capacidad INT NOT NULL,
    largo DECIMAL(10,2) NOT NULL,
    alto DECIMAL(10,2) NOT NULL,
    ancho DECIMAL(10,2) NOT NULL,
    volumen DECIMAL(10,2) NOT NULL,
    area VARCHAR(3),
    FOREIGN KEY (area) REFERENCES AREA(codigo)
)

/---------------------------------
    TABLAS CON RELACION M:M
---------------------------------/

/--- 22. REQUISICION_MATERIA ---/

CREATE TABLE REQUISICION_MATERIA (
    fecha DATETIME NOT NULL,
    cantidad INT NOT NULL,
    requisicion INT,
    materia_prima VARCHAR(5),
    PRIMARY KEY (requisicion, materia_prima),
    FOREIGN KEY (requisicion) REFERENCES REQUISICION(num),
    FOREIGN KEY (materia_prima) REFERENCES MATERIA_PRIMA(codigo)
)

/--- 23. MOVIMIENTO_MATERIA ---/

CREATE TABLE MOVIMIENTO_MATERIA (
    fecha DATETIME NOT NULL,
    cantidad INT NOT NULL,
    movimiento VARCHAR(3),
    materia_prima VARCHAR(5),
    PRIMARY KEY (movimiento, materia_prima),
    FOREIGN KEY (movimiento) REFERENCES MOVIMIENTO(codigo),
    FOREIGN KEY (materia_prima) REFERENCES MATERIA_PRIMA(codigo)
)

/--- 24. MOVIMIENTO_PROD ---/

CREATE TABLE MOVIMIENTO_PROD (
    fecha DATETIME NOT NULL,
    cantidad INT NOT NULL,
    movimiento VARCHAR(3),
    prod_terminado VARCHAR(5),
    PRIMARY KEY (movimiento, prod_terminado),
    FOREIGN KEY (movimiento) REFERENCES MOVIMIENTO(codigo),
    FOREIGN KEY (prod_terminado) REFERENCES PROD_TERMINADO(codigo)
)

/--- 25. LINEA_PROD ---/

CREATE TABLE LINEA_PROD (
    fecha DATETIME NOT NULL,
    cantidad INT NOT NULL,
    linea_prod INT,
    prod_terminado VARCHAR(5),
    PRIMARY KEY (linea_prod, prod_terminado),
    FOREIGN KEY (linea_prod) REFERENCES LINEA_DE_PROD(num),
    FOREIGN KEY (prod_terminado) REFERENCES PROD_TERMINADO(codigo)
)

/--- 26. COMPRA_MATERIA ---/

CREATE TABLE COMPRA_MATERIA (
    cantidad INT NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    compra INT,
    materia_prima VARCHAR(5),
    PRIMARY KEY (compra, materia_prima),
    FOREIGN KEY (compra) REFERENCES SOLICITUD_COMPRA(num),
    FOREIGN KEY (materia_prima) REFERENCES MATERIA_PRIMA(codigo)
)

/--- 27. MATERIA_PROD ---/

CREATE TABLE MATERIA_PROD (
    cantidad INT NOT NULL,
    costoTotalPorMateria DECIMAL (10,2),
    materia_prima VARCHAR (3),
    prod_terminado VARCHAR (3),
    PRIMARY KEY (materia_prima, prod_terminado),
    Foreign Key (materia_prima) REFERENCES MATERIA_PRIMA (codigo),
    Foreign Key (prod_terminado) REFERENCES PROD_TERMINADO (codigo) 
)

/--- 28. MATERIA_LOTE ---/

CREATE TABLE MATERIA_LOTE (
    cantidad INT NOT NULL,
    materia_prima VARCHAR (3),
    lote VARCHAR (3),
    PRIMARY KEY (materia_prima, lote),
    Foreign Key (materia_prima) REFERENCES MATERIA_PRIMA (codigo),
    Foreign Key (lote) REFERENCES LOTE (codigo) 
)

/--- 29. LOTE_SOLICITUD ---/

CREATE TABLE LOTE_SOLICITUD (
    cantidad INT NOT NULL,
    lote VARCHAR (3),
    solicitud_compra INT,
    PRIMARY KEY (lote, solicitud_compra),
    Foreign Key (lote) REFERENCES LOTE (codigo), 
    Foreign Key (solicitud_compra) REFERENCES SOLICITUD_COMPRA (num)
    
)

/--- 30. VERIFICACION_LOTE ---/

CREATE TABLE VERIFICACION_LOTE (
    fecha DATETIME NOT NULL,
    cantidad INT NOT NULL,
    verificacion VARCHAR (3),
    lote VARCHAR (3),
    PRIMARY KEY (verificacion, lote),
    Foreign Key (verificacion) REFERENCES VERIFICACION (codigo),
    Foreign Key (lote) REFERENCES LOTE (codigo) 
)

/--- 31. VERIFICACION_EDO ---/

CREATE TABLE VERIFICACION_EDO (
    fecha DATETIME,
    verificacion VARCHAR (3),
    edo_verificacion VARCHAR (3),
    PRIMARY KEY (verificacion, edo_verificacion),
    Foreign Key (verificacion) REFERENCES VERIFICACION (codigo),
    Foreign Key (edo_verificacion) REFERENCES EDO_VERIFICACION (codigo)
)

/---------------------------------
    INSERTOS DE PRUEBA
---------------------------------/

/---------------------------------
    TABLAS SIN FOREIGN KEY        
---------------------------------/

-- 1. TIPO_MOVIMIENTO
INSERT INTO TIPO_MOVIMIENTO (codigo, descripcion) VALUES
('ENT', 'Entrada'),
('SAL', 'Salida'),
('TRN', 'Transferencia');

-- 2. LINEA_DE_PROD
INSERT INTO LINEA_DE_PROD (num, nombre) VALUES
(1, 'Línea A'),
(2, 'Línea B'),
(3, 'Línea C');

-- 3. EDO_REQUISICION
INSERT INTO EDO_REQUISICION (codigo, descripcion) VALUES
('PEN', 'Pendiente'),
('APR', 'Aprobada'),
('CAN', 'Cancelada');

-- 4. EDO_SOLICITUD_COMPRA
INSERT INTO EDO_SOLICITUD_COMPRA (codigo, descripcion) VALUES
('PEN', 'Pendiente'),
('APR', 'Aprobada'),
('CAN', 'Cancelada');

-- 4. MATERIA_PRIMA
INSERT INTO MATERIA_PRIMA (codigo, nombre, descripcion, costo, ancho, largo, alto, peso, volumen, stock) VALUES
('MP1', 'Pantalla', 'Pantalla de celular', 150.00, 6.0, 12.0, 0.5, 0.2, 1.0, 100),
('MP2', 'Batería', 'Batería de 4000 mAh', 200.00, 5.0, 10.0, 1.0, 0.3, 0.5, 50),
('MP3', 'Cuerpo', 'Cuerpo de plástico', 100.00, 8.0, 15.0, 0.5, 0.4, 1.2, 200);

-- 5. PROD_TERMINADO
INSERT INTO PROD_TERMINADO (codigo, nombre, descripcion, costoNeto, ancho, largo, alto, peso, volumen, stock) VALUES
('PT1', 'Celular A', 'Celular de gama alta', 800.00, 7.0, 15.0, 0.7, 0.2, 1.5, 50),
('PT2', 'Celular B', 'Celular de gama media', 500.00, 7.0, 14.0, 0.7, 0.2, 1.4, 100),
('PT3', 'Celular C', 'Celular básico', 200.00, 7.0, 13.0, 0.6, 0.2, 1.2, 200);

-- 6. PUESTO
INSERT INTO PUESTO (codigo, descripcion) VALUES
('ADM', 'AdminProd'),
('ANA', 'Analista'),
('VER', 'Verificante');

-- 7. EDO_PUESTO
INSERT INTO EDO_PUESTO (codigo, descripcion) VALUES
('ACT', 'Activo'),
('INA', 'Inactivo'),
('BAJ', 'Baja');

-- 8. AREA
INSERT INTO AREA (codigo, descripcion) VALUES
('MP', 'Materia Prima'),
('PT', 'Productos Terminados');

-- 9. ROL
INSERT INTO ROL (codigo, descripcion) VALUES
('ADM', 'Adminprod'),
('VER', 'Verificador'),
('ANA', 'Analista');

-- 10. EDO_LOTE
INSERT INTO EDO_LOTE (codigo, descripcion) VALUES
('ENP', 'En Progreso'),
('TER', 'Terminado');

-- 11. VERIFICACION
INSERT INTO VERIFICACION (codigo, cantRecibida, cantDefectuosa, cantAceptada, observaciones) VALUES
('VE1', 100, 5, 95, 'Verificación satisfactoria'),
('VE2', 200, 10, 190, 'Verificación con observaciones'),
('VE3', 150, 0, 150, 'Sin defectos');

-- 12. EDO_VERIFICACION
INSERT INTO EDO_VERIFICACION (codigo, descripcion) VALUES
('PEN', 'Pendiente'),
('APR', 'Aprobada'),
('CAN', 'Cancelada');

/---------------------------------
    TABLAS CON FOREIGN KEY 
---------------------------------/

-- 13. MOVIMIENTO
INSERT INTO MOVIMIENTO (codigo, descripcion, CANTIDAD, tipo_movimiento, verificacion) VALUES
('MO1', 'Ingreso', 100, 'ENT', 'VE1'),
('MO2', 'Salida', 50, 'SAL', 'VE2'),
('MO3', 'Transferencia', 30, 'TRN', 'VE3');

-- 14. REQUISICION
INSERT INTO REQUISICION (num, descripcion, empleado, edo_requisicion) VALUES 
(1, 'Compra de celulares', 1, 'PEN'),
(2, 'Compra de accesorios', 2, 'APR'),
(3, 'Reemplazo de celulares defectuosos', 1, 'CAN');

-- 15. EMPLEADO
INSERT INTO EMPLEADO (num, nombrePila, primApell, segApell, numCont, correoElectronico, rfc, puesto, edo_puesto) VALUES
(1, 'Juan', 'Pérez', 'García', '1234567890', 'juan.perez@example.com', 'PEJG800101123', 'ADM', 'ACT'),
(2, 'Ana', 'López', 'Martínez', '0987654321', 'ana.lopez@example.com', 'LOMA800202456', 'ANA', 'INA'),
(3, 'Luis', 'Gómez', 'Hernández', '1122334455', 'luis.gomez@example.com', 'GOHL800303789', 'VER', 'BAJ');

-- 16. RESGUARDO
INSERT INTO RESGUARDO (codigo, descripcion, materia_prima, prod_terminado, ubicacion, area) VALUES
('RE1', 'Resguardo de materia prima', 'MP1', NULL, 'UB1', 'MP'),
('RE2', 'Resguardo de producto terminado', NULL, 'PT1', 'UB2', 'PT'),
('RE3', 'Resguardo temporal', 'MP2', NULL, 'UB3', 'MP');

-- 17. USUARIO
INSERT INTO USUARIO (num, alias, contraseña, empleado, rol) VALUES
(1, 'juang', 'pass1234', 1, 'ADM'),
(2, 'ana', 'pass5678', 2, 'ANA'),
(3, 'luisg', 'pass9101', 3, 'VER');

-- 18. SOLICITUD_COMPRA
INSERT INTO SOLICITUD_COMPRA (num, fecha, canTotalPorMateria, subtotal, IVA, total, edo_solicitud_compra, empleado) VALUES
(1, '2024-10-01 10:00:00', 100, 15000.00, 2400.00, 17400.00, 'PEN', 1),
(2, '2024-10-02 11:30:00', 50, 10000.00, 1600.00, 11600.00, 'APR', 2),
(3, '2024-10-03 14:00:00', 30, 3000.00, 480.00, 3480.00, 'CAN', 1);

-- 19. LOTE
INSERT INTO LOTE (codigo, numLote, descripcion, edo_lote) VALUES
('LO1', 1, 'Lote de pantallas', 'ENP'),
('LO2', 2, 'Lote de baterías', 'TER'),
('LO3', 3, 'Lote de cuerpos', 'ENP');

-- 20. UBICACION
INSERT INTO UBICACION (codigo, pasillo, lado, bahia, nivel, posicion, capacidad, largo, alto, ancho, volumen, area) VALUES
('UB1', 1, 'A', 1, '1', 1, 100, 6.0, 0.5, 12.0, 36.0, 'MP'),  
('UB2', 1, 'B', 2, '1', 1, 200, 7.0, 0.7, 15.0, 73.5, 'PT'), 
('UB3', 2, 'A', 1, '1', 1, 150, 5.0, 1.0, 10.0, 50.0, 'MP');  

/--------------------------
   Ubicacion 1: Pantalla
   Ubicacion 2: Celular A
   Ubicacion 3: Bateria 
--------------------------/


/---------------------------------
    TABLAS CON RELACION M:M
---------------------------------/

-- 21. REQUISICION_MATERIA
INSERT INTO REQUISICION_MATERIA (fecha, cantidad, requisicion, materia_prima) VALUES
('2024-10-01 09:00:00', 50, 1, 'MP1'),
('2024-10-02 10:30:00', 20, 2, 'MP2'),
('2024-10-03 14:00:00', 30, 3, 'MP3');

-- 22. MOVIMIENTO_MATERIA
INSERT INTO MOVIMIENTO_MATERIA (fecha, cantidad, movimiento, materia_prima) VALUES
('2024-10-01 09:00:00', 50, 'MO1', 'MP1'),
('2024-10-02 10:30:00', 20, 'MO2', 'MP2'),
('2024-10-03 14:00:00', 30, 'MO3', 'MP3');

-- 23. MOVIMIENTO_PRODUCTO
INSERT INTO MOVIMIENTO_PROD (fecha, cantidad, movimiento, prod_terminado) VALUES
('2024-10-01 09:00:00', 50, 'MO1', 'PT1'),
('2024-10-02 10:30:00', 20, 'MO2', 'PT2'),
('2024-10-03 14:00:00', 30, 'MO3', 'PT3');

-- 24. LINEA_PROD
INSERT INTO LINEA_PROD (fecha, cantidad, linea_prod, prod_terminado) VALUES
('2024-10-01 09:00:00', 20, 1, 'PT1'),
('2024-10-02 10:30:00', 15, 1, 'PT2'),
('2024-10-03 11:15:00', 10, 2, 'PT3');

-- 25. COMPRA_MATERIA
INSERT INTO COMPRA_MATERIA (cantidad, importe, compra, materia_prima) VALUES
(50, 7500.00, 1, 'MP1'),
(20, 4000.00, 2, 'MP2'),
(30, 3000.00, 3, 'MP3');

-- 26. MATERIA_PROD
INSERT INTO MATERIA_PROD (cantidad, costoTotalPorMateria, materia_prima, prod_terminado) VALUES
(5, 750.00, 'MP1', 'PT1'),
(3, 600.00, 'MP2', 'PT2'),
(4, 400.00, 'MP3', 'PT3');

-- 28. MATERIA_LOTE
INSERT INTO MATERIA_LOTE (cantidad, materia_prima, lote) VALUES
(100, 'MP1', 'LO1'),
(150, 'MP2', 'LO2'),
(200, 'MP3', 'LO3');

-- 29. LOTE_SOLICITUD
INSERT INTO LOTE_SOLICITUD (cantidad, lote, solicitud_compra) VALUES
(50, 'LO1', 1),
(30, 'LO2', 2),
(20, 'LO3', 3);

-- 30. VERIFICACION_LOTE
INSERT INTO VERIFICACION_LOTE (fecha, cantidad, verificacion, lote) VALUES
('2024-10-05 12:00:00', 50, 'VE1', 'LO1'),
('2024-10-06 14:00:00', 30, 'VE2', 'LO2'),
('2024-10-07 16:00:00', 20, 'VE3', 'LO3');

-- 31. VERIFICACION_EDO
INSERT INTO VERIFICACION_EDO (fecha, verificacion, edo_verificacion) VALUES
('2024-10-05 12:00:00', 'VE1', 'PEN'),
('2024-10-06 14:00:00', 'VE2', 'APR'),
('2024-10-07 16:00:00','VE3','CAN');