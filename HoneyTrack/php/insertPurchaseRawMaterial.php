<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    if ($_POST) {
        //Se obtienen los datos de la materia prima
        $num = $_POST["num"];
        $raw = $_POST["raw"];
        $quantity = $_POST["quantity"];

        //Se consulta si el código existe en la tabla
        $query = "SELECT COUNT(*) FROM RAW_MATERIAL WHERE code = '$raw'";
        $response = mysqli_query($db, $query);
        while ($row = mysqli_fetch_row($response)) {
            if ($row[0] > 0) {
                //Se inserta el registro en la tabla
                $query = "INSERT INTO PURCHASE_RAW_MATERIAL VALUES('$raw','$num','$quantity',NULL)";
                
                //Se definen los mensajes de exito o error
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
            //Se reenvía a la página orderRW
            header("Location: ../html/orderRW.php?msg=$msg");
        }
    }
?>