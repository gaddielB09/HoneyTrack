<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos de la materia prima
        $codigo = $_POST["code"];
        $nombre = $_POST["name"];
        $descripcion = $_POST["description"];
        $costo = $_POST["cost"];
        $largo = $_POST["lenght"];
        $alto = $_POST["height"];
        $ancho = $_POST["width"];
        $peso = $_POST["weight"];


        //Se inserta la nueva materia prima
        $query = "INSERT INTO MATERIA_PRIMA(codigo,nombre,descripcion,costo,largo,alto,ancho,peso,volumen,stock)
            VALUES('$codigo','$nombre','$descripcion','$costo','$largo','$alto','$ancho','$peso',0,0)";
        
        if (mysqli_query($db, $query)) {
            $msg = "Raw Material created successfully";
        } else {
            $msg = "Raw Material can not be created";
        }

        header("Location: ../html/rawMaterials.php?msg=$msg");
    }
?>