<?php
    require "../php/connection.php";
    $db = connectdb();

    $query = "SELECT sc.num AS num, sc.fecha AS fecha, sc.canTotalPorMateria AS cant, CONCAT('$',sc.subtotal) AS subtotal, 
                CONCAT('$',sc.IVA) AS IVA, CONCAT('$',sc.total) AS total, esc.descripcion AS descripcion
            FROM SOLICITUD_COMPRA AS sc
            INNER JOIN EDO_SOLICITUD_COMPRA AS esc ON sc.edoSolicitudCompra = esc.codigo
            ORDER BY descripcion DESC";
    
    $response = mysqli_query($db, $query);

?>