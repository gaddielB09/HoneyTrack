<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    if ($_POST) {
        //Se obtienen los datos del usuario
        $num = $_POST["num"];
        $raw = $_POST["raw"];
        $quantity = $_POST["quantity"];


        $query = "SELECT COUNT(*) FROM RAW_MATERIAL WHERE code = '$raw'";
        $response = mysqli_query($db, $query);
        while ($row = mysqli_fetch_row($response)) {
            if ($row[0] > 0) {
                //Se inserta el nuevo empleado
                $query = "INSERT INTO PURCHASE_RAW_MATERIAL VALUES('$raw','$num','$quantity',NULL)";
                
                if (mysqli_query($db, $query)) {
                    $msg = "Raw material added successfully";
                }
                else {
                    $msg = "Error trying to add the raw material";
                }
            }
            else {
                $msg = "Invalid Raw Material code";
            }
            header("Location: ../html/orderRW.php?msg=$msg");
            
        }

    }
?>