<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos del producto
        $codigo = $_POST["code"];
        $nombre = $_POST["name"];
        $descripcion = $_POST["description"];
        $largo = $_POST["lenght"];
        $alto = $_POST["height"];
        $ancho = $_POST["width"];
        $peso = $_POST["weight"];


        //Se inserta el nuevo producto
        $query = "INSERT INTO PROD_TERMINADO(codigo,nombre,descripcion,costoNeto,largo,alto,ancho,peso,volumen,stock)
                VALUES('$codigo','$nombre','$descripcion',0,'$largo','$alto','$ancho','$peso',0,0)";
        
        if (mysqli_query($db, $query)) {
            $msg = "Product created successfully";
        } else {
            $msg = "Product can not be created";
        }

        header("Location: ../html/products.php?msg=$msg");
    }
?>