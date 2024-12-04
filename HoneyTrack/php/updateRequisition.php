<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    if ($_GET) {
        //Se obtienen los datos de la compra
        $num = $_GET["num"];

        //Se actualiza la compra
        $query = "UPDATE REQUISITION SET requisitionStatus = 'APPRO' WHERE num = '$num'";
        
        if (mysqli_query($db, $query)) {
            $msg = "Requisition Approved successfully";
            $query = "UPDATE FINISHED_PRODUCT SET stock = stock + (SELECT MIN(quantity) FROM REQUISITION_RAW_MATERIAL WHERE requisition = '$num') WHERE code = (SELECT RIGHT(description,5) FROM REQUISITION WHERE num = '$num')";
            if (mysqli_query($db,$query)) {
                echo "Finished Product stock updated successfully";
            }
            else {
                echo "Finished Product stock updated successfully";
            }
        }
        else {
            $msg = "Can not approve the requisition";
        }
        header("Location: ../html/orderFP.php?msg=$msg");
    }
?>