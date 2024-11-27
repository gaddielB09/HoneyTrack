<?php
    require_once "../php/connection.php";
    $db = connectdb();

    $query = "SELECT * FROM vw_Location";
    $response = mysqli_query($db, $query);

    $queryA = "SELECT * FROM vw_Area";
    $responseA = mysqli_query($db, $queryA);
?>