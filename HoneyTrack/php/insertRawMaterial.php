<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos de la materia prima
        $codigo = $_POST["codigo"];
        $nombre = $_POST["nombre"];
        $descripcion = $_POST["descripcion"];
        $costo = $_POST["costo"];
        $largo = $_POST["largo"];
        $alto = $_POST["alto"];
        $ancho = $_POST["ancho"];
        $peso = $_POST["peso"];


        //Se inserta la nueva materia prima
        $query = "INSERT INTO MATERIA_PRIMA(codigo,nombre,descripcion,costo,largo,alto,ancho,peso,volumen,stock) VALUES('$codigo','$nombre','$descripcion','$costo','$largo','$alto','$ancho','$peso',0,0)";
        
        if (mysqli_query($db, $query)) {
            $msg = "Raw Material created successfully";
        } else {
            $msg = "Raw Material can not be created";
        }

        header("Location: ../html/rawMaterials.php?msg=$msg");
    }
?>