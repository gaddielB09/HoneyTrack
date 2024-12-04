<?php
require_once "../php/connection.php";
session_start(); 
$db = connectdb();
$response = [];

if ($_POST) {
    $product = $_POST["product"];
    $quantity = $_POST["quantity"];
    $line = $_POST["line"];
    $username = $_SESSION["user"];

    // Saber qué artículos les falta stock
    $query = "SELECT rawMaterial, stock-(quantity*'$quantity') AS newStock 
              FROM RAW_MATERIAL_FINISHED_PRODUCT 
              INNER JOIN RAW_MATERIAL ON rawMaterial = code 
              WHERE finishedProduct = '$product' AND stock-(quantity*'$quantity') < 0";
    $responseDB = mysqli_query($db, $query);
    $missingMaterials = [];

    while ($row = mysqli_fetch_assoc($responseDB)) {
        if ($row['rawMaterial'] != null) {
            $missingMaterials[] = $row['rawMaterial'];
        }
    }

    if (empty($missingMaterials)) {
        // Insertar el nuevo producto
        $query = "INSERT INTO REQUISITION 
                  VALUES (NULL, CONCAT('Requisition for the product ', '$product'), 
                          (SELECT employee FROM USER WHERE username = '$username'), 
                          '$line', 'PENDI')";
        
        if (mysqli_query($db, $query)) {
            // Obtener el ID de la requisición recién creada
            $requisitionID = mysqli_insert_id($db);

            // Insertar las materias primas necesarias en REQUISITION_RAW_MATERIAL
            $query = "INSERT INTO REQUISITION_RAW_MATERIAL(requisition, rawMaterial, date, quantity) 
                      SELECT '$requisitionID', rawMaterial, CURRENT_TIMESTAMP(), '$quantity' * quantity 
                      FROM RAW_MATERIAL_FINISHED_PRODUCT 
                      WHERE finishedProduct = '$product'";
            
            if (mysqli_query($db, $query)) {
                $response['status'] = 'success';
                $response['msg'] = 'Requisition created successfully.';
            } else {
                $response['status'] = 'error';
                $response['msg'] = 'Failed to add raw materials to the requisition.';
            }
        } else {
            $response['status'] = 'error';
            $response['msg'] = 'Failed to create requisition.';
        }
    } else {
        $response['status'] = 'error';
        $response['msg'] = 'Insufficient stock of: ' . implode(', ', $missingMaterials);
    }
} else {
    $response['status'] = 'error';
    $response['msg'] = 'No data received.';
}

header('Content-Type: application/json');
echo json_encode($response);
?>
