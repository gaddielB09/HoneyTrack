<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    $query = "SELECT codigo, nombre, descripcion, CONCAT('$',costoNeto) AS costoNeto, CONCAT(largo,' cm') AS largo, CONCAT(alto,' cm') AS alto, CONCAT(ancho,' cm') AS ancho, CONCAT(volumen,' cm³') AS volumen, CONCAT(peso,' gr') AS peso, stock FROM PROD_TERMINADO";
    
    $response = mysqli_query($db, $query);
    
    //$row = mysqli_fetch_row($response);
?>