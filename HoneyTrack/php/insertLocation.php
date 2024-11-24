<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos de la ubicacion
        $container = $_POST["container"];
        $aisle = $_POST["aisle"];
        $side = $_POST["side"];
        $bay = $_POST["bay"];
        $level = $_POST["level"];
        $position = $_POST["position"];
        $lenght = $_POST["lenght"];
        $height = $_POST["height"];
        $width = $_POST["width"];
        $area = $_POST["area"];

        //Se inserta la nueva ubicación
        $query = "CALL insertLocation('$container','$aisle','$side','$bay','$level','$position','$length','$height','$width','$area',@msg)";
        $response = mysqli_query($db, $query);

        //Se recupera el mensaje
        $query = "SELECT @msg AS msg";
        $response = mysqli_query($db, $query);
        while ($row = mysqli_fetch_assoc($response)) {
        //Se asigna el mensaje a una variable para desplegarla en pantalla
        $msg = $row["msg"];
        header("Location: ../html/locations.php?msg=$msg");
        }
    }
?>