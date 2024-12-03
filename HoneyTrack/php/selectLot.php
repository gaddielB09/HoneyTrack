<?php
    require "../php/connection.php";
    $db = connectdb();

    //Consulta todos los usuarios con su información
    $query = "SELECT num, l.description, percentage, ls.description AS status, purchaseRequest AS purchase
        FROM LOT AS l
        INNER JOIN LOT_STATUS AS ls ON l.lotStatus = ls.code
        ORDER BY purchase ASC";
    $response = mysqli_query($db, $query);
?>