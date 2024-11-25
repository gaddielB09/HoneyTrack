<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    //$query = "SELECT u.codigo, u.nombreContenedor AS contenedor, CONCAT(u.pasillo,'-',u.lado,'-',u.bahia,'-', u.nivel,'-', u.posicion) AS ubicacion,u.capacidad, u.volumen, a.descripcion FROM UBICACION AS u INNER JOIN AREA AS a ON u.area = a.codigo";
    
    $query = "SELECT u.codigo AS code, u.nombreContenedor AS container, u.pasillo AS aisle, u.lado AS side, u.bahia AS bay, u.nivel AS level, u.posicion AS position, u.capacidad AS capacity, u.largo AS lenght, u.alto AS height, u.ancho AS witdh, u.volumen AS volume, a.descripcion AS area FROM UBICACION AS u INNER JOIN AREA AS a ON u.area = a.codigo";
    
    $response = mysqli_query($db, $query);
    
    //$row = mysqli_fetch_row($response);
?>