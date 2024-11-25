<?php
    require "../php/connection.php";
    session_start(); 
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos del producto
        $raw = $_POST["raw"];
        $quantity = $_POST["quantity"];
        $username = $_SESSION["user"];

        //Se inserta el nuevo producto
        $query = "CALL insertOrderRM('$raw','$quantity','$username',@msg)";
        $response = mysqli_query($db, $query);

        //Se recupera el mensaje
        $query = "SELECT @msg AS msg";
        $response = mysqli_query($db, $query);
        while ($row = mysqli_fetch_assoc($response)) {
            //Se asigna el mensaje a una variable para desplegarla en pantalla
            $msg = $row["msg"];
            header("Location: ../html/orderRW.php?msg=$msg");
        }
    }
?>