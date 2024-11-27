<?php
    require_once "../php/connection.php";  // Asegúrate de tener la conexión correcta
    $db = connectdb();

    // Consulta para obtener los códigos de la vista
    $query = "SELECT code FROM vw_RawMaterial";
    $response = mysqli_query($db, $query);

    // Verificar si la consulta devolvió resultados
    if ($response) {
        // Iterar sobre los resultados y generar las opciones
        while ($row = mysqli_fetch_assoc($response)) {
            echo "<option value=\"" . htmlspecialchars($row['code']) . "\">" . htmlspecialchars($row['code']) . "</option>";
        }

        // Liberar los recursos de la consulta
        mysqli_free_result($response);
    } else {
        echo "<option value=\"\">No codes available</option>";
    }

    // Cerrar la conexión a la base de datos
    mysqli_close($db);
?>
