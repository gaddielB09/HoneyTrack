<?php
    require "../php/connection.php";
    $msg = "";
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
            $query = "SELECT u.rol AS rol, e.edoEmpleado AS estado FROM USUARIO AS u INNER JOIN EMPLEADO AS e ON e.num = u.empleado WHERE alias = '$username'";
            $responseU = mysqli_query($db, $query);
            //Validación si está activo y el tipo de rol
            while ($row = mysqli_fetch_assoc($responseU)) {
                if ($row["estado"] == "ACTIV") {

                    if ($row["rol"] == "ADMIN") {
                        session_start();
                        $_SESSION['user'] = $username;
                        header("Location: ../html/adminMain.php");
                    }
                    elseif ($row["rol"] == "ANAIN") {
                        session_start();
                        $_SESSION['user'] = $username;
                        header("Location: ../html/analystMain.html");
                    }
                    elseif ($row["rol"] == "RECEP") {
                        session_start();
                        $_SESSION['user'] = $username;
                        header("Location: ../html/receptionistMain.html");
                    }
                    elseif ($row["rol"] == "GRDMP") {
                        session_start();
                        $_SESSION['user'] = $username;
                        header("Location: ../html/managerMain.html");
                    }
                    else {
                        $msg = "User Rol not found";
                        header("Location: ../html/login.php?msg=$msg");
                    }
                }
                else {
                    $msg = "Disabled user";
                    header("Location: ../html/login.php?msg=$msg");
                }
            } 
        }
        else {
            $msg = "Unvalid user";
            header("Location: ../html/login.php?msg=$msg");
        }
    }
?>