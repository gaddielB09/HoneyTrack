<?php
    require "../php/connection.php";
    $db = connectdb();

    $query = "SELECT * FROM vw_PurchaseXRaw";
    
    $response = mysqli_query($db, $query);

?>