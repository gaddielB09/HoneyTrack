<?php
require "../php/connection.php";
session_start(); 
$db = connectdb();
$response = []; // Array para construir la respuesta JSON

if ($_POST) {
    // Se obtienen los datos del formulario y del usuario en sesión
    $raw = $_POST["raw"];
    $quantity = $_POST["quantity"];
    $username = $_SESSION["user"];

    // Llama al procedimiento almacenado
    $query = "CALL insertOrderRM('$raw', '$quantity', '$username', @msg)";
    if (mysqli_query($db, $query)) {
        // Recupera el mensaje de salida del procedimiento almacenado
        $query = "SELECT @msg AS msg";
        $result = mysqli_query($db, $query);
        if ($row = mysqli_fetch_assoc($result)) {
            // Verifica si el mensaje contiene indicios de error
            if (strpos($row['msg'], 'Wrong') !== false || strpos($row['msg'], 'Error') !== false) {
                $response['status'] = 'error'; // Estado de error
            } else {
                $response['status'] = 'success'; // Estado de éxito
            }
            $response['msg'] = $row['msg']; // Mensaje del SP
        } else {
            $response['status'] = 'error';
            $response['msg'] = 'Error fetching message from procedure.';
        }
    } else {
        $response['status'] = 'error';
        $response['msg'] = 'Procedure execution failed: ' . mysqli_error($db);
    }
} else {
    $response['status'] = 'error';
    $response['msg'] = 'No data received.';
}

// Retorna la respuesta como JSON
header('Content-Type: application/json');
echo json_encode($response);
?>
