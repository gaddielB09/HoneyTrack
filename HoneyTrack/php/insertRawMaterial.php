<?php
    require "../php/connection.php";
    $db = connectdb();
    $response = [];

    if ($_POST) {
        // Se obtiene el código de la materia prima desde el formulario
        $code = $_POST["code"];
        // Validar que el código no sea vacío ni la opción predeterminada
        if (empty($code) || $code == "default") {
            $response['status'] = 'error';
            $response['msg'] = 'Please select a valid Raw Material Code';
        } else {
            // Se obtienen los datos de la materia prima
            $name = $_POST["name"];
            $description = $_POST["description"];
            $cost = $_POST["cost"];
            $length = $_POST["length"];
            $height = $_POST["height"];
            $width = $_POST["width"];
            $weight = $_POST["weight"];

            // Se inserta la nueva materia prima
            $query = "CALL insertRawMaterial('$code','$name','$description','$cost','$length','$height','$width','$weight',@msg)";
            $execute = mysqli_query($db, $query);

            // Se recupera el mensaje
            $query = "SELECT @msg AS msg";
            $msgResult = mysqli_query($db, $query);

            // Asegurarse de que siempre se asigna un mensaje
            if ($msgResult) {
                $row = mysqli_fetch_assoc($msgResult);
                $msg = $row["msg"];
                if ($msg == 'Raw Material created successfully') {
                    $response['status'] = 'success'; // El tipo de respuesta
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

    // Se envía la respuesta en formato JSON
    echo json_encode($response);
?>
