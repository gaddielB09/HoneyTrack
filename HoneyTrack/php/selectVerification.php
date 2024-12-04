<?php
    require_once "../php/connection.php";
    $db = connectdb();

    // Query para Verificaciones en progreso
    $query = "SELECT v.num AS num, v.receivedQuantity AS received, v.defectiveQuantity AS defective, v.acceptedQuantity AS accepted, v.observations AS observations, vs.description AS status, rml.lot AS lot, rm.name AS raw
    FROM VERIFICATION AS v
    INNER JOIN RAW_MATERIAL_LOT AS rml ON v.rawMaterialLot = rml.num
    INNER JOIN RAW_MATERIAL AS rm ON rml.rawMaterial = rm.code
    INNER JOIN VERIFICATION_STATUS AS vs ON v.verificationStatus = vs.code
    where vs.description = 'In progress'
    ORDER BY status DESC, lot DESC, num ASC";
    $response = mysqli_query($db, $query);


    //Query para Verificaciones Finalizadas
    $queryF = "SELECT v.num AS num, v.receivedQuantity AS received, v.defectiveQuantity AS defective, v.acceptedQuantity AS accepted, v.observations AS observations, vs.description AS status, rml.lot AS lot, rm.name AS raw
    FROM VERIFICATION AS v
    INNER JOIN RAW_MATERIAL_LOT AS rml ON v.rawMaterialLot = rml.num
    INNER JOIN RAW_MATERIAL AS rm ON rml.rawMaterial = rm.code
    INNER JOIN VERIFICATION_STATUS AS vs ON v.verificationStatus = vs.code
    where vs.description = 'Finished'
    ORDER BY status DESC, lot DESC, num ASC";
    $responseF = mysqli_query($db, $queryF);

?>