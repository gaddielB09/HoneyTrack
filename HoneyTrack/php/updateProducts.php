<?php
// Recibe los datos del formulario
$code = $_POST['code']; // Este es el código que no cambiarás, solo es usado para identificar la fila
$name = $_POST['name'];
$description = $_POST['description'];
$length = $_POST['length'];
$height = $_POST['height'];
$width = $_POST['width'];
$weight = $_POST['weight'];

// Conexión a la base de datos
include_once 'connection.php'; // Asegúrate de que tu archivo de conexión esté correctamente incluido
$db = connectdb();
// Consulta SQL para actualizar los datos (sin actualizar stock)
$query = "UPDATE FINISHED_PRODUCT SET 
          name = ?, 
          description = ?, 
          length = ?, 
          height = ?, 
          width = ?, 
          weight = ? 
          WHERE code = ?";

// Preparar la consulta para evitar inyecciones SQL
$stmt = mysqli_prepare($db, $query);

// Vincula los parámetros de la consulta (sin stock)
mysqli_stmt_bind_param($stmt, "sssddds", $name, $description, $length, $height, $width, $weight, $code);

// Ejecutar la consulta
if (mysqli_stmt_execute($stmt)) {
    echo "Record updated successfully";
    header("Location: ../html/products.php");
} else {
    echo "Error updating record: " . mysqli_error($db);
}

// Cerrar la conexión
mysqli_stmt_close($stmt);
mysqli_close($db);
?>
