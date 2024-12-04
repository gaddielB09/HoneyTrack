<?php
require "../php/connection.php";
$response = [];
$db = connectdb();

if ($_POST) {
    // Obtener los datos del formulario
    $product = $_POST["product"];
    $rawMaterials = $_POST["raw"];
    $quantities = $_POST["quantity"];

    if (count($rawMaterials) !== count($quantities)) {
        $response['status'] = 'error';
        $response['msg'] = 'Select a Raw Material';
    } else {
        // Iniciar una transacción
        mysqli_begin_transaction($db);

        try {
            // Recorrer los materiales y cantidades para insertar cada registro
            foreach ($rawMaterials as $index => $rawMaterial) {
                $quantity = $quantities[$index];
                $query = "INSERT INTO RAW_MATERIAL_FINISHED_PRODUCT VALUES(NULL, '$rawMaterial', '$product', '$quantity', NULL)";

                if (!mysqli_query($db, $query)) {
                    throw new Exception("Error inserting raw material $rawMaterial: " . mysqli_error($db));
                }
            }

            // Confirmar la transacción
            mysqli_commit($db);
            $response['status'] = 'success';
            $response['msg'] = 'Raw materials added successfully.';
        } catch (Exception $e) {
            // Revertir la transacción si ocurre un error
            mysqli_rollback($db);
            $response['status'] = 'error';
            $response['msg'] = $e->getMessage();
        }
    }
} else {
    $response['status'] = 'error';
    $response['msg'] = "No data received.";
}

// Enviar la respuesta en formato JSON
header('Content-Type: application/json');
echo json_encode($response);
?>
