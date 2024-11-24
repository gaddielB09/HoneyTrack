<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos de la ubicacion
        $container = $_POST["container"];
        $aisle = $_POST["aisle"];
        $side = $_POST["side"];
        $bay = $_POST["bay"];
        $level = $_POST["level"];
        $position = $_POST["position"];
        $lenght = $_POST["lenght"];
        $height = $_POST["height"];
        $width = $_POST["width"];
        $area = $_POST["area"];

        //Se inserta la nueva ubicacion
        $query = "INSERT INTO UBICACION(codigo,nombreContenedor,pasillo,lado,bahia,nivel,posicion,capacidad,largo,alto,ancho,volumen,area) VALUES('0','$container','$aisle','$side','$bay','$level','$position',0,'$lenght','$height','$width',0,'$area')";
        
        if (mysqli_query($db, $query)) {
            $msg = "Location created successfully";
        } else {
            $msg = "Location can not be created";
        }

        header("Location: ../html/locations.php?msg=$msg");
    }
?>