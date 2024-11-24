<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    //Solicita los movimientos de materia prima
    $queryM = "SELECT * FROM vw_ActivityXRaw";
    $responseM = mysqli_query($db, $queryM);

    //Solicita los movimientos de productos terminados
    $queryP = "SELECT * FROM vw_ActivityXProduct";
    $responseP = mysqli_query($db, $queryP);
?>