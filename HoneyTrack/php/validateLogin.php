<?php
    require "../php/connection.php";
    session_start();
    $msg = "";
    $db = connectdb();

    if ($_POST) {
        //Se obtienen los datos del usuario
        $username = $_POST["username"];
        $password = $_POST["password"];
        //Se ejecuta el procedimiento almacenado
        $query = "CALL validateUser('$username', '$password',@role, @msg)";
        $response = mysqli_query($db, $query);
        //Se recuperan los valores de las variables
        $query = "SELECT @role AS role, @msg AS msg";
        $response = mysqli_query($db, $query);
        //Se leen las variables
        while($row = mysqli_fetch_assoc($response)) {
            //Condicionales para redireccionar a la página adecuada
            if ($row["msg"] == "Login Successfully") {
                $_SESSION['user'] = $username;
                $_SESSION['role'] = $row["role"];
                $msg = $row["msg"];
                switch ($row["role"]) {
                    case 'USCSC':
                        header("Location: ../html/adminMain.php");
                        break;
                    case 'UMINV':
                        header("Location: ../html/analystMain.php");
                        break;
                    case 'RRVIN':
                        header("Location: ../html/managerMain.php");
                        break;
                    case 'PARRM':
                        header("Location: ../html/receptionistMain.php");
                        break;
                    
                    default:
                        $msg = "error";
                        header("Location: ../html/login.php?msg=$msg");
                        break;
                }
            }
            else {
                $msg = $row["msg"];
                header("Location: ../html/login.php?msg=$msg");
            }
        }
    } 
?>