<?php
    require "../php/connection.php";
    $db = connectdb();

    //Consulta todos los usuarios con su información
    /*$query = "SELECT v.num AS num, v.receivedQuantity AS received, v.defectiveQuantity AS defective, v.acceptedQuantity AS accepted, v.observations AS observations, v.verificationStatus AS status, lv.date AS date, lv.lot AS lot, rml.rawMaterial AS raw
    FROM VERIFICATION AS v
    INNER JOIN LOT_VERIFICATION AS lv ON lv.verification = v.num
    INNER JOIN RAW_MATERIAL_LOT AS rml ON v.rawMaterialLot = rml.num";*/

    $query = "SELECT v.num AS num, v.receivedQuantity AS received, v.defectiveQuantity AS defective, v.acceptedQuantity AS accepted, v.observations AS observations, vs.description AS status, rml.lot AS lot, rm.name AS raw
    FROM VERIFICATION AS v
    INNER JOIN RAW_MATERIAL_LOT AS rml ON v.rawMaterialLot = rml.num
    INNER JOIN RAW_MATERIAL AS rm ON rml.rawMaterial = rm.code
    INNER JOIN VERIFICATION_STATUS AS vs ON v.verificationStatus = vs.code
    ORDER BY status DESC, lot DESC, num ASC";
    $response = mysqli_query($db, $query);
?>