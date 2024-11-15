<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    $query = "SELECT u.codigo, u.nombreContenedor AS contenedor, CONCAT(u.pasillo,'-',u.lado,'-',u.bahia,'-', u.nivel,'-', u.posicion) AS ubicacion,u.capacidad, u.volumen, a.descripcion FROM UBICACION AS u INNER JOIN AREA AS a ON u.area = a.codigo";
    
    $response = mysqli_query($db, $query);
    
    //$row = mysqli_fetch_row($response);
?>