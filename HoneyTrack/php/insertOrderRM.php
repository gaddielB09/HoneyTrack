<?php
require_once "../php/connection.php";
session_start(); 
$db = connectdb();
$response = [];

if ($_POST) {
    $raw = $_POST["raw"];
    $quantity = $_POST["quantity"];
    $username = $_SESSION["user"];

    if (count($raw) !== count($quantity)) {
        $response['status'] = 'error';
        $response['msg'] = 'Select a Raw Material';
    } else {
        mysqli_begin_transaction($db);

        try {
            // Insertael primer material como el que abre la requisicion
            $firstRaw = $raw[0];
            $firstQuantity = $quantity[0];
            $query = "CALL insertOrderRM('$firstRaw', '$firstQuantity', '$username', @msg)";
            if (!mysqli_query($db, $query)) {
                throw new Exception("First insertion failed: " . mysqli_error($db));
            }

            // Obtén el ID de la solicitud recién creada
            $result = mysqli_query($db, "SELECT MAX(num) AS purchaseRequest FROM PURCHASE_REQUEST");
            if (!$result || !($row = mysqli_fetch_assoc($result))) {
                throw new Exception("Failed to retrieve purchase request ID.");
            }
            $currentPurchase = $row['purchaseRequest'];

            // Inserta los materiales restantes directamente en PURCHASE_RAW_MATERIAL
            for ($i = 1; $i < count($raw); $i++) {
                $itemRaw = $raw[$i];
                $itemQuantity = $quantity[$i];
                $query = "INSERT INTO PURCHASE_RAW_MATERIAL (rawMaterial, purchaseRequest, quantity, cost)
                          VALUES ('$itemRaw', $currentPurchase, $itemQuantity, 0)";
                if (!mysqli_query($db, $query)) {
                    throw new Exception("Insertion failed for raw material $itemRaw: " . mysqli_error($db));
                }
            }

            // Confirma la transacción
            mysqli_commit($db);
            $response['status'] = 'success';
            $response['msg'] = 'Purchase request and materials added successfully.';
        } catch (Exception $e) {
            // Si hay un error, deshace la transacción
            mysqli_rollback($db);
            $response['status'] = 'error';
            $response['msg'] = $e->getMessage();
        }
    }
} else {
    $response['status'] = 'error';
    $response['msg'] = 'No data received.';
}

// Retorna la respuesta como JSON
header('Content-Type: application/json');
echo json_encode($response);
?>
