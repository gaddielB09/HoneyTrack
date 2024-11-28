<?php
    require_once "../php/connection.php";
    session_start(); 
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos del producto
        $product = $_POST["product"];
        $quantity = $_POST["quantity"];
        $line = $_POST["line"];
        $username = $_SESSION["user"];

        //Saber qué articulos les falta stock
        $query = "SELECT rawMaterial, stock-(quantity*'$quantity') AS newStock FROM RAW_MATERIAL_FINISHED_PRODUCT INNER JOIN RAW_MATERIAL ON rawMaterial = code WHERE finishedProduct = '$product' AND stock-(quantity*'$quantity')<0";
        $response = mysqli_query($db, $query);
        while ($row = mysqli_fetch_assoc($response)) {
            if ($row['rawMaterial'] != NULL) {
                $msg = $msg. " ". $row['rawMaterial'];
            }
        }

        //Comparar si hace falta stock
        if ($msg == "") {
            //Se inserta el nuevo producto
            $query = "INSERT INTO REQUISITION VALUES(NULL,
            CONCAT('Requisition for the product ','$product'), (SELECT employee FROM USER WHERE username = '$username'), '$line', 'PENDI')";
            
            if (mysqli_query($db, $query)) {
                $msg = "Requisition created successfully";

                //Recuperar el numero de requisicion recien insertado
                $query = "SELECT MAX(num) FROM REQUISITION";
                $response = mysqli_query($db, $query);
                while ($row = mysqli_fetch_row($response)) {
                    $requisition = $row[0];
                }

                //Se insertan las materias primas necesarias para un producto en REQUISITION_RAW_MATERIAL
                $query = "INSERT INTO REQUISITION_RAW_MATERIAL(requisition, rawMaterial, date, quantity) 
                        SELECT '$requisition',rawMaterial, CURRENT_TIMESTAMP(), '$quantity'*quantity
                        FROM RAW_MATERIAL_FINISHED_PRODUCT
                        WHERE finishedProduct = '$product'";
                
                if (mysqli_query($db, $query)) {
                    $msg = "Requisition created successfully";
                }
                else {
                    $msg = "Can not create the Requisition";
                }
            }
            else {
                $msg = "Can not create the Requisition";
            }
        }
        else {
            $msg = "Insuficient stock of ". $msg;
        }

    header("Location: ../html/orderFP.php?msg=$msg");    
    }
?>