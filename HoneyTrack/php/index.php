<?php

/*
require "../php/connection.php";
$db = connectdb();

$item = "GZFL6";
$location = "1";
$quantity = 1;

//Validar que exista la ubicacion, el articulo y que haya suficiente stock

//Validar ubicacion
$query = "SELECT COUNT(*) AS count FROM UBICACION WHERE codigo='$location'";
$response = mysqli_query($db, $query);

while ($row = mysqli_fetch_row($response)) {
    if ($row[0] > 0) {
        echo "Ubicacion correcta";
        //Validar materia prima
        $query = "SELECT COUNT(*) AS count FROM MATERIA_PRIMA WHERE codigo='$item'";
        $response = mysqli_query($db, $query);

        while ($row = mysqli_fetch_row($response)) {
            if ($row[0] > 0) {
                echo "MP correcta";
                //Validar stock suficiente
                $query = "SELECT stock-(SELECT SUM(cantidad) FROM RESGUARDO WHERE materiaPrima='$item') FROM MATERIA_PRIMA WHERE codigo='$item'";
                $response = mysqli_query($db, $query);
                while ($row = mysqli_fetch_row($response)) {
                    if ($row[0] > 0) {
                        echo "Sufficient quantity";
                        //Validar si el item ya esta en esa ubicacion

                        $query = "INSERT INTO RESGUARDO(codigo, cantidad, descripcion, materiaPrima, prodTerminado, ubicacion, area) VALUES('RG046','$quantity','Resguardo de $item', '$item',NULL,'$location','ARDMP')";
                        if (mysqli_query($db, $query)) {
                            $msg = "Storage created successfully";
                        } else {
                            $msg = "Storage can not be created";
                        }
                
                        header("Location: ../html/storage.php?msg=$msg");
                    }
                    else {
                        echo "Insufficient quantity";
                    }
                }
            }
            else {
                //item no se encontro en materia prima, buscar en prod terminado
                $query = "SELECT COUNT(*) AS count FROM PROD_TERMINADO WHERE codigo='$item'";
                $response = mysqli_query($db, $query);

                while ($row = mysqli_fetch_row($response)) {
                    if ($row[0] > 0) {
                        //
                        echo "PT correcto";
                        //Validar stock suficiente
                        $query = "SELECT stock-(SELECT SUM(cantidad) FROM RESGUARDO WHERE prodTerminado='$item') FROM PROD_TERMINADO WHERE codigo='$item'";
                        $response = mysqli_query($db, $query);
                        while ($row = mysqli_fetch_row($response)) {
                            if ($row[0] > 0) {
                                echo "Sufficient quantity";
                                //Validar si el item ya esta en esa ubicacion
        
                                $query = "INSERT INTO RESGUARDO(codigo, cantidad, descripcion, materiaPrima, prodTerminado, ubicacion, area) VALUES('RG047','$quantity','Resguardo de $item',NULL,'$item','$location','ARDPT')";
                                if (mysqli_query($db, $query)) {
                                    $msg = "Storage created successfully";
                                } else {
                                    $msg = "Storage can not be created";
                                }
                        
                                header("Location: ../html/storage.php?msg=$msg");
                            }
                            else {
                                echo "Insufficient quantity";
                            }
                        }

                    }
                    else {
                        //item no se encontro en producto terminado, item invalido
                        echo "Invalid item";
                    }
                }
            }
        }
    }
    else {
        echo "Invalid location";
    }
}
    */
?>