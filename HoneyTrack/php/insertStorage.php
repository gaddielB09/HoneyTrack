<?php
    require "../php/connection.php";
    $db = connectdb();
    $response = [];

    if ($_POST) {
        // Se obtienen los datos de la ubicación
        $item = $_POST["item"];
        $location = $_POST["location"];
        $quantity = $_POST["quantity"];
        
        // Validar que exista la ubicación, el artículo y que haya suficiente stock

        // Validar ubicación
        $query = "SELECT COUNT(*) FROM LOCATION WHERE code='$location'";
        $responseDB = mysqli_query($db, $query);
        
        while ($row = mysqli_fetch_row($responseDB)) {
            if ($row[0] > 0) {
                // Validar materia prima
                $query = "SELECT COUNT(*) FROM RAW_MATERIAL WHERE code='$item'";
                $responseDB = mysqli_query($db, $query);
        
                while ($row = mysqli_fetch_row($responseDB)) {
                    if ($row[0] > 0) {
                        // Validar stock suficiente
                        $query = "SELECT stock-(SELECT IFNULL(SUM(quantity),0) FROM STORAGE WHERE rawMaterial='$item') FROM RAW_MATERIAL WHERE code='$item'";
                        $responseDB = mysqli_query($db, $query);
                        while ($row = mysqli_fetch_row($responseDB)) {
                            if ($row[0] > $quantity) {
                                // Validar si el item ya está en esa ubicación
                                
                                $query = "INSERT INTO STORAGE(quantity, description, rawMaterial, finishedProduct, location, area) 
                                          VALUES('$quantity','$item', '$item',NULL,'$location','RMARE')";
                                if (mysqli_query($db, $query)) {
                                    $response['status'] = 'success';
                                    $response['msg'] = "Storage created successfully";
                                } else {
                                    $response['status'] = 'error';
                                    $response['msg'] = "Storage can not be created";
                                }
                            } else {
                                $response['status'] = 'error';
                                $response['msg'] = "Insufficient quantity";
                            }
                        }
                    } else {
                        // Item no se encontró en materia prima, buscar en producto terminado
                        $query = "SELECT COUNT(*) FROM FINISHED_PRODUCT WHERE code='$item'";
                        $responseDB = mysqli_query($db, $query);
        
                        while ($row = mysqli_fetch_row($responseDB)) {
                            if ($row[0] > 0) {
                                // Validar stock suficiente
                                $query = "SELECT stock-(SELECT IFNULL(SUM(quantity),0) FROM STORAGE WHERE finishedProduct='$item') FROM FINISHED_PRODUCT WHERE code='$item'";
                                $responseDB = mysqli_query($db, $query);
                                while ($row = mysqli_fetch_row($responseDB)) {
                                    if ($row[0] > $quantity) {
                                        // Validar si el item ya está en esa ubicación
                                        $query = "INSERT INTO STORAGE(quantity, description, rawMaterial, finishedProduct, location, area) 
                                                  VALUES('$quantity','$item',NULL,'$item','$location','FPARE')";
                                        if (mysqli_query($db, $query)) {
                                            $response['status'] = 'success';
                                            $response['msg'] = "Storage created successfully";
                                        } else {
                                            $response['status'] = 'error';
                                            $response['msg'] = "Storage can not be created";
                                        }
                                    } else {
                                        $response['status'] = 'error';
                                        $response['msg'] = "Insufficient quantity";
                                    }
                                }
                            } else {
                                // Item no se encontró en producto terminado, item inválido
                                $response['status'] = 'error';
                                $response['msg'] = "Invalid item";
                            }
                        }
                    }
                }
            } else {
                $response['status'] = 'error';
                $response['msg'] = "Invalid location";
            }
        }
    }

    // Se envía la respuesta en formato JSON
    echo json_encode($response);
?>
