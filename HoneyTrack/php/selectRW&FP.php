<?php
    require "../php/connection.php";
    $db = connectdb();

    //Consultar todos los datos de la tabla RAW MATERIAL FINISHED PRODUCT
    $queryRWFP = "SELECT fp.name AS finishedProduct, rm.name AS rawMaterial, rmfp.quantity AS quantity, CONCAT('$',rmfp.totalMaterialCost) AS totalMaterialCost  FROM RAW_MATERIAL_FINISHED_PRODUCT AS rmfp
    INNER JOIN FINISHED_PRODUCT AS fp ON rmfp.finishedProduct = fp.code
    INNER JOIN RAW_MATERIAL AS rm ON rmfp.rawMaterial = rm.code";
    $responseRWFP = mysqli_query($db, $queryRWFP);
?>