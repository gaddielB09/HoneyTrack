<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    $query = "SELECT codigo, nombre, descripcion, costoNeto,peso, volumen, stock FROM PROD_TERMINADO";
    
    $response = mysqli_query($db, $query);
    
    //$row = mysqli_fetch_row($response);
?>