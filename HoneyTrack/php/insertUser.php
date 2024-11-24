<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    if ($_POST) {
        //Se obtienen los datos del usuario
        $name = $_POST["name"];
        $ap = $_POST["ap"];
        $am = $_POST["am"];
        $rfc = $_POST["rfc"];
        $email = $_POST["email"];
        $phone = $_POST["phone"];
        $username = $_POST["username"];
        $password = $_POST["password"];
        $role = $_POST["role"];

        //Se inserta el nuevo empleado
        $query = "CALL insertEmployee('$name','$ap','$am','$phone','$email','$rfc','$role','$username','$password',@msg)";
        $response = mysqli_query($db, $query);

        //Se recupera el mensaje
        $query = "SELECT @msg AS msg";
        $response = mysqli_query($db, $query);
        while ($row = mysqli_fetch_assoc($response)) {
            //Se asigna el mensaje a una variable para desplegarla en pantalla
            $msg = $row["msg"];
            header("Location: ../html/users.php?msg=$msg");  
        }
    }
?>