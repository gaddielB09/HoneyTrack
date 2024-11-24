<?php
    require "../php/connection.php";
    $db = connectdb();

    $query = "SELECT * FROM vw_Storage";
    $response = mysqli_query($db, $query);
?>