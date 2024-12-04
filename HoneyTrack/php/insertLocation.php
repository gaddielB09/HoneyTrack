<?php
require "../php/connection.php";
$db = connectdb();
$response = [];

if ($_POST) {
    // Obtener los datos de la ubicación desde el formulario
    $container = $_POST["container"];
    $aisle = $_POST["aisle"];
    $side = $_POST["side"];
    $bay = $_POST["bay"];
    $level = $_POST["level"];
    $position = $_POST["position"];
    $length = $_POST["length"];
    $height = $_POST["height"];
    $width = $_POST["width"];
    $area = $_POST["area"];

    // Validar que los campos obligatorios no estén vacíos
    if (empty($container) || empty($aisle) || empty($side)) {
        $response['status'] = 'error';
        $response['msg'] = 'Please fill in all required fields.';
    } else {
        // Llamar al procedimiento almacenado para insertar la ubicación
        $query = "CALL insertLocation('$container','$aisle','$side','$bay','$level',
                                        '$position','$length','$height','$width','$area', @msg)";
        $execute = mysqli_query($db, $query);

        // Verificar si la consulta se ejecutó correctamente
        if ($execute) {
            // Recuperar el mensaje generado por el procedimiento almacenado
            $msgQuery = "SELECT @msg AS msg";
            $msgResult = mysqli_query($db, $msgQuery);

            if ($msgResult) {
                $row = mysqli_fetch_assoc($msgResult);
                $msg = $row["msg"];

                // Asignar el tipo de respuesta basado en el mensaje devuelto
                if ($msg === 'Location created successfully') {
                    $response['status'] = 'success';
                } else {
                    $response['status'] = 'error';
                }
                $response['msg'] = $msg;
            } else {
                $response['status'] = 'error';
                $response['msg'] = 'Failed to retrieve message from database.';
            }
        } else {
            $response['status'] = 'error';
            $response['msg'] = 'Database query failed: ' . mysqli_error($db);
        }
    }
} else {
    $response['status'] = 'error';
    $response['msg'] = 'No data received.';
}

// Enviar la respuesta como JSON
echo json_encode($response);
?>
