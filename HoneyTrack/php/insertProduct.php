<?php
    require_once "../php/connection.php";
    $db = connectdb();
    $response = [];

    if ($_POST) {
        // Se obtienen los datos del producto
        $code = $_POST["code"];
        
        // Validar que el código no sea vacío ni la opción predeterminada
        if (empty($code) || $code == "default") {
            $response['status'] = 'error';
            $response['msg'] = 'Please select a valid Product Code';
        } else {
            // Se obtienen los demás datos del producto
            $name = $_POST["name"];
            $description = $_POST["description"];
            $length = $_POST["length"];
            $height = $_POST["height"];
            $width = $_POST["width"];
            $weight = $_POST["weight"];

            // Se ejecuta el procedimiento almacenado para insertar el producto
            $query = "CALL insertProduct('$code','$name','$description','$length','$height','$width','$weight',@msg)";
            $execute = mysqli_query($db, $query);

            // Se recupera el mensaje del procedimiento almacenado
            $query = "SELECT @msg AS msg";
            $msgResult = mysqli_query($db, $query);

            if ($msgResult) {
                $row = mysqli_fetch_assoc($msgResult);
                $msg = $row["msg"];
                
                // Asignar el tipo de respuesta (éxito o error)
                if ($msg == 'Product created successfully') {
                    $response['status'] = 'success';
                } else {
                    $response['status'] = 'error';
                }
                $response['msg'] = $msg;
            } else {
                $response['status'] = 'error';
                $response['msg'] = 'Failed to retrieve message from database';
            }
        }
    }

    // Enviar la respuesta en formato JSON
    echo json_encode($response);
?>
