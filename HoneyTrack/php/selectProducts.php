<?php
    require_once "../php/connection.php";
    $db = connectdb();

    $query = "SELECT * FROM vw_Product";
    $response = mysqli_query($db, $query);
?>