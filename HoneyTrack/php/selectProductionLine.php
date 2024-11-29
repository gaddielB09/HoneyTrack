<?php
    require_once "../php/connection.php";
    $db = connectdb();

    //Consulta todos los usuarios con su información
    $query = "SELECT num, name FROM PRODUCTION_LINE";
    $response = mysqli_query($db, $query);
?>