<?php
    require "../php/connection.php";
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
        $query = "INSERT INTO EMPLEADO(nombrePila,primApell,segApell,numCont,correoElectronico,rfc, puesto,edo_puesto) VALUES('$name','$ap','$am','$phone','$email','$rfc','$role','ACT')";
        
        if (mysqli_query($db, $query)) {
            echo "Employee created successfully";
        } else {
            echo "Error: " . $query . "<br>" . mysqli_error($db);
        }
        //Se solicita el num del nuevo empleado para insertarlo con el usuario
        $query = "SELECT num FROM EMPLEADO ORDER BY num DESC";
        $response = mysqli_query($db, $query);
        $row = mysqli_fetch_row($response);

        //Se inserta el nuevo usuario
        $query = "INSERT INTO USUARIO(alias, contraseña, empleado, rol) VALUES('$username','$password','$row[0]','$role')";
        
        if (mysqli_query($db, $query)) {
            echo "User created successfully";
        } else {
            echo "Error: " . $query . "<br>" . mysqli_error($db);
        }
        header("Location: ../html/users.php");    
    }
?>