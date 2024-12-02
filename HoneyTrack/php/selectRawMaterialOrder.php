<?php
    require_once "../php/connection.php";
    $db = connectdb();

    $query = "SELECT * FROM vw_PurchaseXRaw where description = 'Accepted'";
    
    $response = mysqli_query($db, $query);

    $queryAc = "SELECT * FROM vw_PurchaseXRaw WHERE description = 'In Process'";

    $responseAc = mysqli_query($db, $queryAc);

?>