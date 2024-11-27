<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    $num = $_POST["num"];

    // Cambiar el estado del usuario a INACT
    $query = "UPDATE EMPLOYEE SET employeeStatus = 'INACT' WHERE num = '$num'"; 

    $response = mysqli_query($db, $query);
    
    if ($response) {
        $msg = "User's status changed succesfully";
    } else {
        $msg = "Error when changing user status";
    }

    header("Location: ../html/users.php?msg=$msg");
    ?>
