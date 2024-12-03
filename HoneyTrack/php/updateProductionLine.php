<?php
// Recibe los datos del formulario
$code = $_POST['code']; // Este es el código que no cambiarás, solo es usado para identificar la fila
$name = $_POST['name'];

// Conexión a la base de datos
include 'connection.php'; // Asegúrate de que tu archivo de conexión esté correctamente incluido
$db = connectdb();
// Consulta SQL para actualizar los datos (sin actualizar stock)
$query = "UPDATE PRODUCTION_LINE SET 
          name = ?
          WHERE code = ?";

// Preparar la consulta para evitar inyecciones SQL
$stmt = mysqli_prepare($db, $query);

// Vincula los parámetros de la consulta (sin stock)
mysqli_stmt_bind_param($stmt, "ss", $name, $code);

// Ejecutar la consulta
if (mysqli_stmt_execute($stmt)) {
    echo "Record updated successfully";
    header("Location: ../html/productionLine.php");
} else {
    echo "Error updating record: " . mysqli_error($db);
}

// Cerrar la conexión
mysqli_stmt_close($stmt);
mysqli_close($db);
?>
