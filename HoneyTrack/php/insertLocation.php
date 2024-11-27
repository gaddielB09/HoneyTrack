<?php
require "../php/connection.php";
header('Content-Type: application/json'); // Indicar que la respuesta será JSON
$db = connectdb();
$response = [];

if ($_POST) {
    // Obtener los datos de la ubicación
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

    // Llamar al procedimiento almacenado
    $query = "CALL insertLocation('$container','$aisle','$side','$bay','$level',
                                    '$position','$length','$height','$width','$area',@msg)";
    if (mysqli_query($db, $query)) {
        // Recuperar el mensaje del procedimiento almacenado
        $result = mysqli_query($db, "SELECT @msg AS msg");
        if ($row = mysqli_fetch_assoc($result)) {
            $response['status'] = 'success';
            $response['msg'] = $row['msg'];
        } else {
            $response['status'] = 'error';
            $response['msg'] = 'Failed to retrieve message from database.';
        }
    } else {
        $response['status'] = 'error';
        $response['msg'] = 'Database query failed: ' . mysqli_error($db);
    }
} else {
    $response['status'] = 'error';
    $response['msg'] = 'No data received.';
}

// Devolver la respuesta como JSON
echo json_encode($response);
?>
