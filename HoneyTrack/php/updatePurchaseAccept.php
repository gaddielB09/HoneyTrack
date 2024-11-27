<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    if ($_GET) {
        //Se obtienen los datos de la compra
        $num = $_GET["num"];

        //Se actualiza la compra
        $query = "UPDATE PURCHASE_REQUEST SET purchaseRequestStatus = 'ACCEP' WHERE num = '$num'";
        
        if (mysqli_query($db, $query)) {
            $msg = "Purchase Request Accepted successfully";
        }
        else {
            $msg = "Can not accept the purchase request";
        }
        header("Location: ../html/orderRW.php?msg=$msg");
    }
?>