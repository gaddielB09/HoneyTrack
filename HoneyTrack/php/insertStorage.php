<?php
    require "../php/connection.php";
    $db = connectdb();
    $msg = "";

    if ($_POST) {
        //Se obtienen los datos de la ubicacion
        $item = $_POST["item"];
        $location = $_POST["location"];
        $quantity = $_POST["quantity"];
        
        //Validar que exista la ubicacion, el articulo y que haya suficiente stock

        //Validar ubicacion
        $query = "SELECT COUNT(*) FROM LOCATION WHERE code='$location'";
        $response = mysqli_query($db, $query);
        
        while ($row = mysqli_fetch_row($response)) {
            if ($row[0] > 0) {
                //Validar materia prima
                $query = "SELECT COUNT(*) FROM RAW_MATERIAL WHERE code='$item'";
                $response = mysqli_query($db, $query);
        
                while ($row = mysqli_fetch_row($response)) {
                    if ($row[0] > 0) {
                        //Validar stock suficiente
                        $query = "SELECT stock-(SELECT SUM(quantity) FROM STORAGE WHERE rawMaterial='$item') FROM RAW_MATERIAL WHERE code='$item'";
                        $response = mysqli_query($db, $query);
                        while ($row = mysqli_fetch_row($response)) {
                            if ($row[0] > 0) {
                                //Validar si el item ya esta en esa ubicacion
        
                                $query = "INSERT INTO STORAGE(code, quantity, description, rawMaterial, finishedProduct, location, area) VALUES('RG046','$quantity','Storage of $item', '$item',NULL,'$location','RMARE')";
                                if (mysqli_query($db, $query)) {
                                    $msg = "Storage created successfully";
                                } else {
                                    $msg = "Storage can not be created";
                                }
                        
                                header("Location: ../html/storage.php?msg=$msg");
                            }
                            else {
                                $msg = "Insufficient quantity";
                            }
                        }
                    }
                    else {
                        //item no se encontro en materia prima, buscar en prod terminado
                        $query = "SELECT COUNT(*) FROM FINISHED_PRODUCT WHERE code='$item'";
                        $response = mysqli_query($db, $query);
        
                        while ($row = mysqli_fetch_row($response)) {
                            if ($row[0] > 0) {
                                //Validar stock suficiente
                                $query = "SELECT stock-(SELECT SUM(quantity) FROM STORAGE WHERE finishedProduct='$item') FROM FINISHED_PRODUCT WHERE code='$item'";
                                $response = mysqli_query($db, $query);
                                while ($row = mysqli_fetch_row($response)) {
                                    if ($row[0] > 0) {
                                        //Validar si el item ya esta en esa ubicacion
                
                                        $query = "INSERT INTO STORAGE(code, quantity, description, rawMaterial, finishedProduct, location, area) VALUES('RG047','$quantity','Storage of $item',NULL,'$item','$location','FPARE')";
                                        if (mysqli_query($db, $query)) {
                                            $msg = "Storage created successfully";
                                        } else {
                                            $msg = "Storage can not be created";
                                        }
                                
                                        header("Location: ../html/storage.php?msg=$msg");
                                    }
                                    else {
                                        $msg = "Insufficient quantity";
                                    }
                                }
        
                            }
                            else {
                                //item no se encontro en producto terminado, item invalido
                                $msg = "Invalid item";
                            }
                        }
                    }
                }
            }
            else {
                $msg = "Invalid location";
            }

            header("Location: ../html/storage.php?msg=$msg");
        }

    }
?>