<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    // Obtener el ID del usuario
    if (isset($_POST["num"])) {
        $num = $_POST["num"];

        // Cambiar el estado del usuario a INACT
        $query = "UPDATE EMPLOYEE SET employeeStatus = 'INACT' WHERE num = '$num'"; 

        if (mysqli_query($db, $query)) {
            $msg = "User's status changed successfully";
        } else {
            $msg = "Error when changing user status";
        }
    }

    // Devolver la respuesta en formato JSON
    echo json_encode(['msg' => $msg]);
?>
