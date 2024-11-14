<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    
    //Consulta para el resguardo de la materia prima
    $queryRM = "SELECT r.ubicacion, CONCAT(u.pasillo,'-',u.lado,'-',u.bahia,'-', u.nivel,'-', u.posicion) AS ubicacion, r.cantidad, mp.codigo, mp.nombre FROM RESGUARDO AS r INNER JOIN MATERIA_PRIMA AS mp ON r.materiaPrima = mp.codigo INNER JOIN UBICACION AS u ON r.ubicacion = u.codigo";
    $responseRM = mysqli_query($db, $queryRM);

    //Consulta para el resguardo de los productos terminados
    $queryP = "SELECT r.ubicacion, CONCAT(u.pasillo,'-',u.lado,'-',u.bahia,'-', u.nivel,'-', u.posicion) AS ubicacion, r.cantidad, pt.codigo, pt.nombre FROM RESGUARDO AS r INNER JOIN PROD_TERMINADO AS pt ON r.prodTerminado = pt.codigo INNER JOIN UBICACION AS u ON r.ubicacion = u.codigo";
    $responseRM = mysqli_query($db, $queryRM);

    //$row = mysqli_fetch_row($response);
?>