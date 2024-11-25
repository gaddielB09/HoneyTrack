<?php
    require "../php/connection.php";
    $db = connectdb();

    //Consulta todos los usuarios con su información
    $query = "SELECT v.num, v.receivedQuantity AS received, v.defectiveQuantity AS defective, v.acceptedQuantity AS accepted, v.observations, v.verificationStatus AS status, lv.date AS date, lv.lot AS lot
    FROM VERIFICATION AS v
    INNER JOIN LOT_VERIFICATION AS lv ON lv.verification = v.num";
    $response = mysqli_query($db, $query);
?>