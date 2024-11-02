<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    $query = "SELECT codigo, nombreContenedor, capacidad, volumen, a.descripcion FROM UBICACION AS u INNER JOIN AREA AS a ON u.area = a.codigo";
    
    $response = mysqli_query($db, $query);
    
    //$row = mysqli_fetch_row($response);
?>