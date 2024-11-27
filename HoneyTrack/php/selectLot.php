<?php
    require "../php/connection.php";
    $db = connectdb();

    //Consulta todos los usuarios con su información
    $query = "SELECT num, description, percentage, lotStatus AS status, purchaseRequest AS purchase FROM LOT ORDER BY purchase ASC";
    $response = mysqli_query($db, $query);
?>