<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    
    // Consulta para el resguardo de la materia prima
    // $queryRM = "SELECT r.ubicacion, CONCAT(u.pasillo,'-',u.lado,'-',u.bahia,'-', u.nivel,'-', u.posicion) AS ubicacion, r.cantidad, mp.codigo, mp.nombre FROM RESGUARDO AS r INNER JOIN MATERIA_PRIMA AS mp ON r.materiaPrima = mp.codigo INNER JOIN UBICACION AS u ON r.ubicacion = u.codigo";
    // $responseRM = mysqli_query($db, $queryRM);

    $query = "SELECT r.codigo AS code, r.cantidad AS quantity, r.descripcion AS description, IF(materiaPrima IS NOT NULL, materiaPrima, prodTerminado) AS item, r.ubicacion AS location, r.area AS area FROM RESGUARDO AS r";

    $response = mysqli_query($db, $query);

    //$row = mysqli_fetch_row($response);
?>