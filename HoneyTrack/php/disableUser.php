<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    $num = $_POST["num"];

    //Cambiar por una View
    $query = "UPDATE EMPLEADO SET edoEmpleado = 'INACT' WHERE num = '$num'"; 

    $response = mysqli_query($db, $query);
    
    if ($response) {
        $msg = "User disabled successfully";
    } else {
        $msg = "Error disabling user";
    }

    header("Location: ../html/users.php?msg=$msg");

?>