<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    $query = "SELECT codigo, nombre, descripcion, CONCAT('$',costo) AS costo, volumen, peso, stock FROM MATERIA_PRIMA";
    
    $response = mysqli_query($db, $query);
    
    //$row = mysqli_fetch_row($response);
?>