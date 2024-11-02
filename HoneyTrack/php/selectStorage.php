<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    $queryRM = "SELECT a.descripcion, ubicacion, mp.nombre, cantidad FROM RESGUARDO AS r INNER JOIN MATERIA_PRIMA AS mp ON r.materia_prima = mp.codigo INNER JOIN AREA AS a ON r.area = a.codigo";

    $responseRM = mysqli_query($db, $queryRM);

    $queryP = "SELECT a.descripcion, ubicacion, pt.nombre, cantidad FROM RESGUARDO AS r INNER JOIN PROD_TERMINADO AS pt ON r.prod_terminado = pt.codigo INNER JOIN AREA AS a ON r.area = a.codigo";

    $responseRM = mysqli_query($db, $queryRM);


    
    //$row = mysqli_fetch_row($response);
?>