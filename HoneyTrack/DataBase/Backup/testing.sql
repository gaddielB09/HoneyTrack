-- Active: 1732452796884@@127.0.0.1@3306@En_HoneyTrack
USE En_HoneyTrack;

--View para selectUsers
CREATE VIEW vw_EmployeeXUser AS(
    SELECT e.num AS num,
        CONCAT(firstName, ' ', lastName, ' ', middleName) AS name,
        username, password,
        phone, email, taxId, description, employeeStatus AS status
        FROM EMPLOYEE AS e
        INNER JOIN USER AS u ON e.num = u.employee
        INNER JOIN JOB_POSITION AS j ON j.code = e.jobPosition
        ORDER BY e.num
);

--View para selectUsers
CREATE VIEW vw_JobPosition AS(
    SELECT code, description FROM JOB_POSITION
);

--View para selectStorage
CREATE VIEW vw_Storage AS(
    SELECT num, quantity, description,
    IF(rawMAterial IS NOT NULL, rawMAterial, finishedProduct) AS item,
    location, area
    FROM STORAGE
);

--View para selectRawMaterials
CREATE VIEW vw_RawMaterial AS(
    SELECT code, name, description, CONCAT('$',cost) AS cost, CONCAT(length,' cm') AS length,
    CONCAT(height,' cm') AS height, CONCAT(width,' cm') AS width, CONCAT(volume,' cm³') AS volume, CONCAT(weight,' gr') AS weight, stock
    FROM RAW_MATERIAL
    INNER JOIN 
);

CREATE VIEW vw_Product AS(
    SELECT code, name, description, CONCAT('$',netCost) AS netCost, CONCAT(length,' cm') AS length, CONCAT(height,' cm') AS height, CONCAT(width,' cm') AS width, CONCAT(volume,' cm³') AS volume, CONCAT(weight,' gr') AS weight, stock
    FROM FINISHED_PRODUCT
);

CREATE VIEW vw_Location AS(
    SELECT u.code AS code, u.containerName AS container, u.aisle AS aisle, u.side AS side, u.bay AS bay, u.level AS level, u.position AS position, u.capacity AS capacity, CONCAT(u.length,' cm') AS length, CONCAT(u.height,' cm') AS height, CONCAT(u.width,' cm') AS width, CONCAT(u.volume,' cm³') AS volume, a.description AS area
    FROM LOCATION AS u
    INNER JOIN AREA AS a ON u.area = a.code
    ORDER BY u.code ASC
);

CREATE VIEW vw_Area AS(
    SELECT code, description FROM AREA
);

CREATE VIEW vw_ActivityXRaw AS(
    SELECT date, mt.description AS type, m.description AS movement, rm.name AS item, mr.quantity AS quantity
    FROM MOVEMENT AS m
    INNER JOIN MOVEMENT_RAW_MATERIAL AS mr ON mr.movement = m.code
    INNER JOIN MOVEMENT_TYPE AS mt ON m.movementType = mt.code
    INNER JOIN RAW_MATERIAL AS rm ON mr.rawMaterial = rm.code
    ORDER BY date DESC
);

CREATE VIEW vw_ActivityXProduct AS(
    SELECT date, mt.description AS type, m.description AS movement, fp.name AS item, mf.quantity AS quantity
    FROM MOVEMENT AS m
    INNER JOIN MOVEMENT_FINISHED_PRODUCT AS mf ON mf.movement = m.code
    INNER JOIN MOVEMENT_TYPE AS mt ON m.movementType = mt.code
    INNER JOIN FINISHED_PRODUCT AS fp ON mf.finishedProduct = fp.code
    ORDER BY date DESC
);

CREATE VIEW vw_PurchaseXRaw AS(
    SELECT pr.num AS num, pr.date AS date, pr.totalQuantityPerMaterial AS quantity, CONCAT('$',pr.subtotal) AS subtotal, 
                CONCAT('$',pr.VAT) AS VAT, CONCAT('$',pr.total) AS total, prs.description AS description, u.username AS username
            FROM PURCHASE_REQUEST AS pr
            INNER JOIN PURCHASE_REQUEST_STATUS AS prs ON pr.purchaseRequestStatus = prs.code
            INNER JOIN EMPLOYEE AS e ON pr.employee = e.num
            INNER JOIN USER AS u ON u.employee = e.num
            ORDER BY description DESC, date ASC
);

CREATE VIEW vw_Requisition AS(
    SELECT r.num AS num, r.description AS description, u.username AS username, r.productionLine AS productionLine, rs.description AS status,
    (SELECT SUM(quantity) FROM REQUISITION_RAW_MATERIAL WHERE requisition = r.num) AS quantity,
    (SELECT MIN(date) FROM REQUISITION_RAW_MATERIAL WHERE requisition = r.num) AS date 
    FROM REQUISITION AS r
    INNER JOIN REQUISITION_STATUS AS rs ON r.requisitionStatus = rs.code
    INNER JOIN EMPLOYEE AS e ON r.employee = e.num
    INNER JOIN USER AS u ON u.employee = e.num
    ORDER BY status DESC
);
