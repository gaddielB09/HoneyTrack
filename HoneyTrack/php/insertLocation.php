<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos de la ubicacion
        $contenedor = $_POST["contenedor"];
        $pasillo = $_POST["pasillo"];
        $lado = $_POST["lado"];
        $bahia = $_POST["bahia"];
        $nivel = $_POST["nivel"];
        $posicion = $_POST["posicion"];
        $largo = $_POST["largo"];
        $alto = $_POST["alto"];
        $ancho = $_POST["ancho"];
        $area = $_POST["area"];

        //Se inserta la nueva ubicacion
        $query = "INSERT INTO UBICACION(codigo,contenedor,pasillo,lado,bahia,nivel,posicion,largo,alto,ancho,volumen,area) VALUES('0','$contenedor','$pasillo','$lado','$bahia','$nivel','$posicion','$largo','$alto','$ancho',0,'$area')";
        
        if (mysqli_query($db, $query)) {
            $msg = "Location created successfully";
        } else {
            $msg = "Location can not be created";
        }

        header("Location: ../html/locations.php?msg=$msg");
    }
?>