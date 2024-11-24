<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos de la materia prima
        $code = $_POST["code"];
        $name = $_POST["name"];
        $description = $_POST["description"];
        $cost = $_POST["cost"];
        $length = $_POST["length"];
        $height = $_POST["height"];
        $width = $_POST["width"];
        $weight = $_POST["weight"];

        //Se inserta la nueva materia prima
        $query = "CALL insertRawMaterial('$code','$name','$description','$cost','$length','$height','$width','$weight',@msg)";
        $response = mysqli_query($db, $query);

        //Se recupera el mensaje
        $query = "SELECT @msg AS msg";
        $response = mysqli_query($db, $query);
        while ($row = mysqli_fetch_assoc($response)) {
            //Se asigna el mensaje a una variable para desplegarla en pantalla
            $msg = $row["msg"];
            header("Location: ../html/rawMaterials.php?msg=$msg");
        }
    }
?>