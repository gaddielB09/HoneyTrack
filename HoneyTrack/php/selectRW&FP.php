<?php
    require "../php/connection.php";
    $db = connectdb();

    //Consultar todos los datos de la tabla RAW MATERIAL FINISHED PRODUCT
    $queryRWFP = "SELECT * FROM RAW_MATERIAL_FINISHED_PRODUCT";
    $responseRWFP = mysqli_query($db, $queryRWFP);
?>