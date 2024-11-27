<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    if ($_POST) {
        //Se obtienen los datos del usuario
        $product = $_POST["product"];
        $raw = $_POST["raw"];
        $quantity = $_POST["quantity"];

        //Se inserta el nuevo empleado
        $query = "INSERT INTO RAW_MATERIAL_FINISHED_PRODUCT VALUES(NULL,'$raw','$product','$quantity',NULL)";
        
        if (mysqli_query($db, $query)) {
            $msg = "Raw material added successfully";
        }
        else {
            $msg = "Error trying to add the raw material";
        }
        header("Location: ../html/products.php?msg=$msg");
    }
?>