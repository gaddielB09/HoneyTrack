<?php
    require "../php/connection.php";
    $msg = "";
    $db = connectdb();

    if ($_POST) {
        //Se obtienen los datos de la verificacion
        $num = $_POST["num"];
        $lot = $_POST["lot"];
        $received = $_POST["received"];
        $accepted = $_POST["accepted"];
        $defective = $_POST["defective"];
        $observations = $_POST["observations"];

        //Se actualiza la verificacion
        if ($received >= ($accepted+$defective)) {
            //Se actualiza la verificacion con los nuevos datos
            $query = "INSERT INTO LOT_VERIFICATION VALUES(NULL,'$lot','$num', CURRENT_TIMESTAMP())";
            mysqli_query($db, $query);

            if ($received == ($accepted+$defective)) {
                $query = "UPDATE VERIFICATION SET defectiveQuantity = '$defective', acceptedQuantity = '$accepted', observations = '$observations', verificationStatus = 'FINIS' WHERE num = '$num'";
            }
            else {
                $query = "UPDATE VERIFICATION SET defectiveQuantity = '$defective', acceptedQuantity = '$accepted', observations = '$observations' WHERE num = '$num'";
            }

            if (mysqli_query($db, $query)) {
                $msg = "Verification updated successfully";
            }
            else {
                $msg = "Can not update the verification";
            }
        }
        else {
            
            $msg = "Values out of range";
        }
        header("Location: ../html/verification.php?msg=$msg");
    }
?>