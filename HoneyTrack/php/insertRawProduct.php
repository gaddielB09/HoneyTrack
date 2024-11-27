<?php
    require "../php/connection.php";
    $response = [];
    $db = connectdb();

    if ($_POST) {
        // Se obtienen los datos del usuario
        $product = $_POST["product"];
        $raw = $_POST["raw"];
        $quantity = $_POST["quantity"];

        // Se inserta el nuevo registro en RAW_MATERIAL_FINISHED_PRODUCT
        $query = "INSERT INTO RAW_MATERIAL_FINISHED_PRODUCT VALUES(NULL, '$raw', '$product', '$quantity', NULL)";
        
        if (mysqli_query($db, $query)) {
            $response['status'] = 'success';
            $response['msg'] = "Raw material added successfully";
        } else {
            $response['status'] = 'error';
            $response['msg'] = "Error trying to add the raw material";
        }
    } else {
        $response['status'] = 'error';
        $response['msg'] = "No data received";
    }

    // Se envía la respuesta en formato JSON
    echo json_encode($response);
?>
