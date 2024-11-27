<?php
    require "../php/connection.php";
    $db = connectdb();

    $query = "SELECT * FROM vw_RawMaterial";
    $response = mysqli_query($db, $query);
?>