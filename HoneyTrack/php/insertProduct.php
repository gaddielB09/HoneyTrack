<?php
    require_once "../php/connection.php";
    $response = [];
    $db = connectdb();

    if ($_POST) {
        // Se obtienen los datos del producto
        $code = $_POST["code"];
        $name = $_POST["name"];
        $description = $_POST["description"];
        $length = $_POST["length"];
        $height = $_POST["height"];
        $width = $_POST["width"];
        $weight = $_POST["weight"];

        // Se inserta el nuevo producto
        $query = "CALL insertProduct('$code', '$name', '$description', '$length', '$height', '$width', '$weight', @msg)";
        $execute = mysqli_query($db, $query);

        // Se recupera el mensaje
        $query = "SELECT @msg AS msg";
        $msgResult = mysqli_query($db, $query);
        
        if ($msgResult) {
            $row = mysqli_fetch_assoc($msgResult);
                $msg = $row["msg"];
                if ($msg == 'Product created successfully') {
                    $response['status'] = 'success'; // Respuesta exitosa
                } else {
                    $response['status'] = 'error'; // Error, por ejemplo, código duplicado
                }
                $response['msg'] = $msg;
            }
        } else {
            $response['status'] = 'error';
            $response['msg'] = 'Failed to retrieve message from database';
        }
    

    // Se envía la respuesta en formato JSON (sin redirección)
    echo json_encode($response);
?>
