<?php
    require "../php/connection.php";
    $db = connectdb();

    //Cambiar por una View
    //Solicita los movimientos de materia prima
    $queryM = "SELECT fecha, tm.descripcion AS tipo, m.descripcion AS movimiento, mp.nombre AS articulo, mm.cantidad AS cantidad FROM MOVIMIENTO AS m INNER JOIN MOVIMIENTO_MATERIA AS mm  ON mm.movimiento = m.codigo INNER JOIN TIPO_MOVIMIENTO AS tm ON m.tipo_movimiento = tm.codigo INNER JOIN MATERIA_PRIMA AS mp ON mm.materia_prima = mp.codigo";
    
    $responseM = mysqli_query($db, $queryM);

    //Solicita los movimientos de productos terminados
    $queryP = "SELECT fecha, tm.descripcion AS tipo, m.descripcion AS movimiento, pt.nombre AS articulo, mp.cantidad AS cantidad FROM MOVIMIENTO AS m INNER JOIN MOVIMIENTO_PROD AS mp ON mp.movimiento = m.codigo INNER JOIN TIPO_MOVIMIENTO AS tm ON m.tipo_movimiento = tm.codigo INNER JOIN PROD_TERMINADO AS pt ON mp.prod_terminado = pt.codigo";
    
    $responseP = mysqli_query($db, $queryP);
?>