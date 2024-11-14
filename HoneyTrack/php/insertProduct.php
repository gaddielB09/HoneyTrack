<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos del producto
        $codigo = $_POST["codigo"];
        $nombre = $_POST["nombre"];
        $descripcion = $_POST["descripcion"];
        $largo = $_POST["largo"];
        $alto = $_POST["alto"];
        $ancho = $_POST["ancho"];
        $peso = $_POST["peso"];


        //Se inserta el nuevo producto
        $query = "INSERT INTO PROD_TERMINADO(codigo,nombre,descripcion,costo,largo,alto,ancho,peso,volumen,stock) VALUES('$codigo','$nombre','$descripcion',0,'$largo','$alto','$ancho','$peso',0,0)";
        
        if (mysqli_query($db, $query)) {
            $msg = "Product created successfully";
        } else {
            $msg = "Product can not be created";
        }

        header("Location: ../html/products.php?msg=$msg");
    }
?>