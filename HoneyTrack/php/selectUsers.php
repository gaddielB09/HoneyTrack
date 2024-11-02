<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    $query = "SELECT e.num AS num, CONCAT(nombrePila, ' ', primApell, ' ', segApell) as nombre, alias, contraseña, numCont, correoElectronico, rfc, descripcion FROM EMPLEADO AS e INNER JOIN USUARIO AS u ON e.num = u.empleado INNER JOIN ROL AS r ON r.codigo = u.rol ORDER BY e.num";
    
    $response = mysqli_query($db, $query);
?>