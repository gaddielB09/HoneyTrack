<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos del producto
        $code = $_POST["code"];
        $name = $_POST["name"];
        $description = $_POST["description"];
        $length = $_POST["lenght"];
        $height = $_POST["height"];
        $width = $_POST["width"];
        $weight = $_POST["weight"];


        //Se inserta el nuevo producto
        $query = "CALL insertProduct('$code','$name','$description','$length',
                                        '$height','$width','$weight',@msg)";
        $response = mysqli_query($db, $query);

        //Se recupera el mensaje
        $query = "SELECT @msg AS msg";
        $response = mysqli_query($db, $query);
        while ($row = mysqli_fetch_assoc($response)) {
            //Se asigna el mensaje a una variable para desplegarla en pantalla
            $msg = $row["msg"];
            header("Location: ../html/products.php?msg=$msg");
        }
    }
?>