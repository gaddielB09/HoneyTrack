<?php
    require "../php/connection.php";
    $db = connectdb();

    if ($_POST) {
        //Se obtienen los datos del usuario
        $username = $_POST["username"];
        $password = $_POST["password"];

        //Se busca la contraseña del usuario ingresado
        $query = "SELECT contraseña FROM USUARIO WHERE alias = '$username'";

        $response = mysqli_query($db, $query);

        $row = mysqli_fetch_row($response);
        //Se valida que sea la misma contraseña
        if ($password == $row[0]) {
            //Ahora se busca el rol para saber a qué Main enviarlo
            $query = "SELECT rol FROM USUARIO WHERE alias = '$username'";
            $response = mysqli_query($db, $query);
            $row = mysqli_fetch_row($response);
            if ($row[0] == "ADMIN") {
                header("Location: ../html/adminMain.html");
            }
            elseif ($row[0] == "ANA") {
                header("Location: ../html/analystMain.html");
            }
            else {
                header("Location: ../html/verificatorMain.html");
            }
        }
        else {
            header("Location: ../html/login.html");
        }
    }
?>